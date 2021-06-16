-- create schema for new scenario
CREATE SCHEMA IF NOT EXISTS results_nhsl_physical_exposure;

-- test aggregation to hexbin grids v1
--5km
DROP TABLE IF EXISTS results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_5km CASCADE;
CREATE TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_5km AS 

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.1 Settled Area
SELECT 
b.gridid_5,
CAST(CAST(ROUND(CAST(SUM(a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaKm2",
CAST(CAST(ROUND(CAST(SUM(a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaHa",
CAST(CAST(ROUND(CAST(SUM(a.bldg_ft2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgArea",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc IN ('Residential-LD','Residential-MD','Residential-HD') THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaRes",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Commercial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaComm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Industrial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaInd",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Civic' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaCivic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Agricultural' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaAgr",
CAST(CAST(ROUND(CAST(SUM(a.number) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgNum",
CAST(CAST(ROUND(CAST(COALESCE(SUM(c.censusbldg),0) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusBldg",
CAST(CAST(ROUND(CAST(SUM(c.censuspop) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusPop",
CAST(CAST(ROUND(CAST(SUM(c.censusdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusDU",
CAST(CAST(ROUND(CAST(AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_People_DU",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Pop_Km2",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PPH",
CAST(CAST(ROUND(CAST(AVG(a.number/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) as "Et_Bldg_Km2",
CAST(CAST(ROUND(CAST(AVG((a.structural + a.nonstructural + a.contents)/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Value_Km2",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.2 Building Function
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResLD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResMD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RESHD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Commercial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Comm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Industrial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Ind",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Civic' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Civic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Agricultural' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Agr",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_SFHshld",
CAST(CAST(ROUND(CAST((SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) + SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END)) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "ET_MFHshld",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.3 Building Type
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Wood' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Wood",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Concrete' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Concrete",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Precast' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCast",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='RMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='URMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_URMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Steel' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Steel",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Manufactured' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Manufacture",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='PC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='LC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_LowCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='MC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ModCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='HC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_HiCode",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.4 People
CAST(CAST(ROUND(CAST(SUM(a.day) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopDay",
CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopNight",
CAST(CAST(ROUND(CAST(SUM(a.transit) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopTransit",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.5 Assets
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural + a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_AssetValue",
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgValue",
CAST(CAST(ROUND(CAST(SUM(a.structural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_StrValue",
CAST(CAST(ROUND(CAST(SUM(a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_NStrValue",
CAST(CAST(ROUND(CAST(SUM(a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ContValue",

d.geom AS "geom_poly"
--d.geompoint AS "geom_point"

FROM exposure.canada_exposure a
LEFT JOIN boundaries."SAUID_HexGrid" b ON a.sauid = b.sauid
LEFT JOIN census.census_2016_canada c ON a.sauid = c.sauidt
LEFT JOIN boundaries."HexGrid_5km" d ON b.gridid_5 = d.gridid_5
GROUP BY b.gridid_5,d.geom;


--10km
DROP TABLE IF EXISTS results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_10km CASCADE;
CREATE TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_10km AS 

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.1 Settled Area
SELECT 
b.gridid_10,
CAST(CAST(ROUND(CAST(SUM(a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaKm2",
CAST(CAST(ROUND(CAST(SUM(a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaHa",
CAST(CAST(ROUND(CAST(SUM(a.bldg_ft2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgArea",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc IN ('Residential-LD','Residential-MD','Residential-HD') THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaRes",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Commercial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaComm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Industrial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaInd",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Civic' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaCivic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Agricultural' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaAgr",
CAST(CAST(ROUND(CAST(SUM(a.number) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgNum",
CAST(CAST(ROUND(CAST(COALESCE(SUM(c.censusbldg),0) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusBldg",
CAST(CAST(ROUND(CAST(SUM(c.censuspop) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusPop",
CAST(CAST(ROUND(CAST(SUM(c.censusdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusDU",
CAST(CAST(ROUND(CAST(AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_People_DU",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Pop_Km2",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PPH",
CAST(CAST(ROUND(CAST(AVG(a.number/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) as "Et_Bldg_Km2",
CAST(CAST(ROUND(CAST(AVG((a.structural + a.nonstructural + a.contents)/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Value_Km2",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.2 Building Function
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResLD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResMD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RESHD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Commercial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Comm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Industrial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Ind",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Civic' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Civic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Agricultural' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Agr",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_SFHshld",
CAST(CAST(ROUND(CAST((SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) + SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END)) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "ET_MFHshld",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.3 Building Type
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Wood' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Wood",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Concrete' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Concrete",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Precast' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCast",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='RMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='URMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_URMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Steel' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Steel",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Manufactured' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Manufacture",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='PC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='LC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_LowCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='MC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ModCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='HC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_HiCode",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.4 People
CAST(CAST(ROUND(CAST(SUM(a.day) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopDay",
CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopNight",
CAST(CAST(ROUND(CAST(SUM(a.transit) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopTransit",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.5 Assets
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural + a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_AssetValue",
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgValue",
CAST(CAST(ROUND(CAST(SUM(a.structural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_StrValue",
CAST(CAST(ROUND(CAST(SUM(a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_NStrValue",
CAST(CAST(ROUND(CAST(SUM(a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ContValue",

d.geom AS "geom_poly"
--d.geompoint AS "geom_point"

FROM exposure.canada_exposure a
LEFT JOIN boundaries."SAUID_HexGrid" b ON a.sauid = b.sauid
LEFT JOIN census.census_2016_canada c ON a.sauid = c.sauidt
LEFT JOIN boundaries."HexGrid_10km" d ON b.gridid_10 = d.gridid_10
GROUP BY b.gridid_10,d.geom;


--25km
DROP TABLE IF EXISTS results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_25km CASCADE;
CREATE TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_25km AS 

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.1 Settled Area
SELECT 
b.gridid_25,
CAST(CAST(ROUND(CAST(SUM(a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaKm2",
CAST(CAST(ROUND(CAST(SUM(a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaHa",
CAST(CAST(ROUND(CAST(SUM(a.bldg_ft2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgArea",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc IN ('Residential-LD','Residential-MD','Residential-HD') THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaRes",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Commercial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaComm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Industrial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaInd",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Civic' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaCivic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Agricultural' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaAgr",
CAST(CAST(ROUND(CAST(SUM(a.number) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgNum",
CAST(CAST(ROUND(CAST(COALESCE(SUM(c.censusbldg),0) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusBldg",
CAST(CAST(ROUND(CAST(SUM(c.censuspop) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusPop",
CAST(CAST(ROUND(CAST(SUM(c.censusdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusDU",
CAST(CAST(ROUND(CAST(AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_People_DU",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Pop_Km2",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PPH",
CAST(CAST(ROUND(CAST(AVG(a.number/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) as "Et_Bldg_Km2",
CAST(CAST(ROUND(CAST(AVG((a.structural + a.nonstructural + a.contents)/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Value_Km2",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.2 Building Function
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResLD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResMD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RESHD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Commercial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Comm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Industrial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Ind",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Civic' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Civic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Agricultural' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Agr",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_SFHshld",
CAST(CAST(ROUND(CAST((SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) + SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END)) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "ET_MFHshld",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.3 Building Type
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Wood' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Wood",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Concrete' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Concrete",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Precast' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCast",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='RMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='URMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_URMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Steel' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Steel",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Manufactured' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Manufacture",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='PC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='LC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_LowCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='MC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ModCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='HC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_HiCode",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.4 People
CAST(CAST(ROUND(CAST(SUM(a.day) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopDay",
CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopNight",
CAST(CAST(ROUND(CAST(SUM(a.transit) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopTransit",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.5 Assets
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural + a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_AssetValue",
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgValue",
CAST(CAST(ROUND(CAST(SUM(a.structural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_StrValue",
CAST(CAST(ROUND(CAST(SUM(a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_NStrValue",
CAST(CAST(ROUND(CAST(SUM(a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ContValue",

d.geom AS "geom_poly"
--d.geompoint AS "geom_point"

FROM exposure.canada_exposure a
LEFT JOIN boundaries."SAUID_HexGrid" b ON a.sauid = b.sauid
LEFT JOIN census.census_2016_canada c ON a.sauid = c.sauidt
LEFT JOIN boundaries."HexGrid_25km" d ON b.gridid_25 = d.gridid_25
GROUP BY b.gridid_25,d.geom;


--50km
DROP TABLE IF EXISTS results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_50km CASCADE;
CREATE TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_50km AS 

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.1 Settled Area
SELECT 
b.gridid_50,
CAST(CAST(ROUND(CAST(SUM(a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaKm2",
CAST(CAST(ROUND(CAST(SUM(a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaHa",
CAST(CAST(ROUND(CAST(SUM(a.bldg_ft2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgArea",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc IN ('Residential-LD','Residential-MD','Residential-HD') THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaRes",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Commercial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaComm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Industrial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaInd",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Civic' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaCivic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Agricultural' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaAgr",
CAST(CAST(ROUND(CAST(SUM(a.number) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgNum",
CAST(CAST(ROUND(CAST(COALESCE(SUM(c.censusbldg),0) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusBldg",
CAST(CAST(ROUND(CAST(SUM(c.censuspop) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusPop",
CAST(CAST(ROUND(CAST(SUM(c.censusdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusDU",
CAST(CAST(ROUND(CAST(AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_People_DU",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Pop_Km2",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PPH",
CAST(CAST(ROUND(CAST(AVG(a.number/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) as "Et_Bldg_Km2",
CAST(CAST(ROUND(CAST(AVG((a.structural + a.nonstructural + a.contents)/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Value_Km2",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.2 Building Function
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResLD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResMD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RESHD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Commercial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Comm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Industrial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Ind",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Civic' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Civic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Agricultural' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Agr",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_SFHshld",
CAST(CAST(ROUND(CAST((SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) + SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END)) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "ET_MFHshld",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.3 Building Type
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Wood' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Wood",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Concrete' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Concrete",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Precast' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCast",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='RMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='URMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_URMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Steel' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Steel",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Manufactured' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Manufacture",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='PC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='LC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_LowCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='MC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ModCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='HC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_HiCode",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.4 People
CAST(CAST(ROUND(CAST(SUM(a.day) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopDay",
CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopNight",
CAST(CAST(ROUND(CAST(SUM(a.transit) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopTransit",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.5 Assets
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural + a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_AssetValue",
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgValue",
CAST(CAST(ROUND(CAST(SUM(a.structural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_StrValue",
CAST(CAST(ROUND(CAST(SUM(a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_NStrValue",
CAST(CAST(ROUND(CAST(SUM(a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ContValue",

d.geom AS "geom_poly"
--d.geompoint AS "geom_point"

FROM exposure.canada_exposure a
LEFT JOIN boundaries."SAUID_HexGrid" b ON a.sauid = b.sauid
LEFT JOIN census.census_2016_canada c ON a.sauid = c.sauidt
LEFT JOIN boundaries."HexGrid_50km" d ON b.gridid_50 = d.gridid_50
GROUP BY b.gridid_50,d.geom;


--50km
DROP TABLE IF EXISTS results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_100km CASCADE;
CREATE TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_100km AS 

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.1 Settled Area
SELECT 
b.gridid_100,
CAST(CAST(ROUND(CAST(SUM(a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaKm2",
CAST(CAST(ROUND(CAST(SUM(a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaHa",
CAST(CAST(ROUND(CAST(SUM(a.bldg_ft2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgArea",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc IN ('Residential-LD','Residential-MD','Residential-HD') THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaRes",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Commercial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaComm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Industrial' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaInd",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Civic' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaCivic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc = 'Agricultural' THEN a.bldg_ft2 ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgAreaAgr",
CAST(CAST(ROUND(CAST(SUM(a.number) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgNum",
CAST(CAST(ROUND(CAST(COALESCE(SUM(c.censusbldg),0) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusBldg",
CAST(CAST(ROUND(CAST(SUM(c.censuspop) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusPop",
CAST(CAST(ROUND(CAST(SUM(c.censusdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusDU",
CAST(CAST(ROUND(CAST(AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_People_DU",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Pop_Km2",
CAST(CAST(ROUND(CAST(AVG(a.day/a.sauid_ha) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PPH",
CAST(CAST(ROUND(CAST(AVG(a.number/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) as "Et_Bldg_Km2",
CAST(CAST(ROUND(CAST(AVG((a.structural + a.nonstructural + a.contents)/a.sauid_km2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Value_Km2",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.2 Building Function
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResLD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ResMD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RESHD",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Commercial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Comm",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Industrial' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Ind",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Civic' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Civic",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Agricultural' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Agr",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.genocc ='Residential-LD' THEN a.number ELSE 0 END) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_SFHshld",
CAST(CAST(ROUND(CAST((SUM(CASE WHEN a.genocc ='Residential-MD' THEN a.number ELSE 0 END) + SUM(CASE WHEN a.genocc ='Residential-HD' THEN a.number ELSE 0 END)) / AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "ET_MFHshld",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.3 Building Type
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Wood' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Wood",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Concrete' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Concrete",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Precast' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCast",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='RMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_RMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='URMasonry' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_URMasonry",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Steel' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Steel",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.gentype ='Manufactured' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_Manufacture",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='PC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PreCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='LC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_LowCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='MC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ModCode",
CAST(CAST(ROUND(CAST(SUM(CASE WHEN a.eqdeslev ='HC' THEN a.number ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_HiCode",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.4 People
CAST(CAST(ROUND(CAST(SUM(a.day) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopDay",
CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopNight",
CAST(CAST(ROUND(CAST(SUM(a.transit) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopTransit",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.5 Assets
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural + a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_AssetValue",
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgValue",
CAST(CAST(ROUND(CAST(SUM(a.structural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_StrValue",
CAST(CAST(ROUND(CAST(SUM(a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_NStrValue",
CAST(CAST(ROUND(CAST(SUM(a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_ContValue",

d.geom AS "geom_poly"
--d.geompoint AS "geom_point"

FROM exposure.canada_exposure a
LEFT JOIN boundaries."SAUID_HexGrid" b ON a.sauid = b.sauid
LEFT JOIN census.census_2016_canada c ON a.sauid = c.sauidt
LEFT JOIN boundaries."HexGrid_100km" d ON b.gridid_100 = d.gridid_100
GROUP BY b.gridid_100,d.geom;