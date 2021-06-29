-- create schema for new scenario
CREATE SCHEMA IF NOT EXISTS results_nhsl_physical_exposure;


-- create intersection geometry between sauid polygon, and hexgrids, calculate area and area ratios between both polygons
-- 5km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_5km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_5km_intersect AS
(SELECT 
gridid_5,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio",
ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_5km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_5,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_5km_intersect ADD PRIMARY KEY (gridid_5,sauid);

-- create indexes
CREATE INDEX IF NOT EXISTS sauid_hexgrid_5km_intersect_geom_idx ON boundaries.SAUID_HexGrid_5km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_5km_intersect_idx ON boundaries.SAUID_HexGrid_5km_intersect (gridid_5,sauid);


-- test aggregation to hexbin grids v1 via area proxy
--5km
DROP TABLE IF EXISTS results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_5km_area CASCADE;
CREATE TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_5km_area AS 

SELECT
c.gridid_5,
SUM(a."Et_BldgArea" * b.area_ratio) AS "ET_BldgArea",
SUM(a."Et_BldgAreaRes" * b.area_ratio) AS "Et_BldgAreaRes",
SUM(a."Et_BldgAreaComm" * b.area_ratio) AS "Et_BldgAreaComm",
SUM(a."Et_BldgAreaInd" * b.area_ratio) AS "Et_BldgAreaInd",
SUM(a."Et_BldgAreaCivic" * b.area_ratio) AS "Et_BldgAreaCivic",
SUM(a."Et_BldgAreaAgr" * b.area_ratio) AS "Et_BldgAreaAgr",
SUM(a."Et_BldgNum" * b.area_ratio) AS "Et_BldgNum",
SUM(a."E_CensusBldg"* b.area_ratio) AS "E_CensusBldg",
SUM(a."E_CensusPop" * b.area_ratio) AS "E_CensusPop",
SUM(a."E_CensusDU" * b.area_ratio) AS "E_CensusDU",
SUM(a."E_People_DU" * b.area_ratio) AS "E_People_DU",
AVG(a."Et_Pop_Km2" * b.area_ratio) AS "Et_Pop_Km2",
AVG(a."Et_PPH" * b.area_ratio) AS "Et_PPH",
AVG(a."Et_Bldg_Km2" * b.area_ratio) AS "Et_Bldg_Km2",
AVG(a."Et_Value_Km2" * b.area_ratio) AS "Et_Value_Km2",
SUM(a."Et_ResLD" * b.area_ratio) AS "Et_ResLD",
SUM(a."Et_ResMD" * b.area_ratio) AS "Et_ResMD",
SUM(a."Et_RESHD" * b.area_ratio) AS "Et_RESHD",
SUM(a."Et_Comm" * b.area_ratio) AS "Et_Comm",
SUM(a."Et_Ind" * b.area_ratio) AS "Et_Ind",
SUM(a."Et_Civic" * b.area_ratio) AS "Et_Civic",
SUM(a."Et_Agr" * b.area_ratio) AS "Et_Agr",
SUM(a."Et_SFHshld" * b.area_ratio) AS "Et_SFHshld",
SUM(a."ET_MFHshld" * b.area_ratio) AS "ET_MFHshld",
SUM(a."Et_Wood" * b.area_ratio) AS "Et_Wood",
SUM(a."Et_Concrete" * b.area_ratio) AS "Et_Concrete",
SUM(a."Et_PreCast" * b.area_ratio) AS "Et_PreCast",
SUM(a."Et_RMasonry" * b.area_ratio) AS "Et_RMasonry",
SUM(a."Et_URMasonry" * b.area_ratio) AS "Et_URMasonry",
SUM(a."Et_Steel" * b.area_ratio) AS "Et_Steel",
SUM(a."Et_Manufacture" * b.area_ratio) AS "Et_Manufacture",
SUM(a."Et_PreCode" * b.area_ratio) AS "Et_PreCode",
SUM(a."Et_LowCode" * b.area_ratio) AS "Et_LowCode",
SUM(a."Et_ModCode" * b.area_ratio) AS "Et_ModCode",
SUM(a."Et_HiCode" * b.area_ratio) AS "Et_HiCode",
SUM(a."Et_PopDay" * b.area_ratio) AS "Et_PopDay",
SUM(a."Et_PopNight" * b.area_ratio) AS "Et_PopNight",
SUM(a."Et_PopTransit" * b.area_ratio) AS "Et_PopTransit",
SUM(a."Et_AssetValue" * b.area_ratio) AS "Et_AssetValue",
SUM(a."Et_BldgValue" * b.area_ratio) AS "Et_BldgValue",
SUM(a."Et_StrValue" * b.area_ratio) AS "Et_StrValue",
SUM(a."Et_NStrValue" * b.area_ratio) AS "Et_NStrValue",
SUM(a."Et_ContValue" * b.area_ratio) AS "Et_ContValue",

c.geom

FROM results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_s_tbl a
LEFT JOIN boundaries.sauid_hexgrid_5km_intersect b ON a."Sauid" = b.sauid
LEFT JOIN boundaries."HexGrid_5km" c ON b.gridid_5 = c.gridid_5
GROUP BY c.gridid_5,c.geom;

-- add PK
ALTER TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_5km_area ADD PRIMARY KEY (gridid_5);

-- create indexes
CREATE INDEX IF NOT EXISTS physical_exposure_indicators_hexbin_5km_geom_idx ON results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_5km_area using GIST (geom);
CREATE INDEX IF NOT EXISTS physical_exposure_indicators_hexbin_5km_idx ON results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_5km_area (gridid_5);



-- 10km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_10km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_10km_intersect AS
(SELECT 
gridid_10,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio",
ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_10km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_10,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_10km_intersect ADD PRIMARY KEY (gridid_10,sauid);

-- create indexes
CREATE INDEX IF NOT EXISTS sauid_hexgrid_10km_intersect_geom_idx ON boundaries.SAUID_HexGrid_10km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_10km_intersect_idx ON boundaries.SAUID_HexGrid_10km_intersect (gridid_10,sauid);



--10km
DROP TABLE IF EXISTS results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_10km_area CASCADE;
CREATE TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_10km_area AS 

SELECT
c.gridid_10,
SUM(a."Et_BldgArea" * b.area_ratio) AS "ET_BldgArea",
SUM(a."Et_BldgAreaRes" * b.area_ratio) AS "Et_BldgAreaRes",
SUM(a."Et_BldgAreaComm" * b.area_ratio) AS "Et_BldgAreaComm",
SUM(a."Et_BldgAreaInd" * b.area_ratio) AS "Et_BldgAreaInd",
SUM(a."Et_BldgAreaCivic" * b.area_ratio) AS "Et_BldgAreaCivic",
SUM(a."Et_BldgAreaAgr" * b.area_ratio) AS "Et_BldgAreaAgr",
SUM(a."Et_BldgNum" * b.area_ratio) AS "Et_BldgNum",
SUM(a."E_CensusBldg"* b.area_ratio) AS "E_CensusBldg",
SUM(a."E_CensusPop" * b.area_ratio) AS "E_CensusPop",
SUM(a."E_CensusDU" * b.area_ratio) AS "E_CensusDU",
SUM(a."E_People_DU" * b.area_ratio) AS "E_People_DU",
AVG(a."Et_Pop_Km2" * b.area_ratio) AS "Et_Pop_Km2",
AVG(a."Et_PPH" * b.area_ratio) AS "Et_PPH",
AVG(a."Et_Bldg_Km2" * b.area_ratio) AS "Et_Bldg_Km2",
AVG(a."Et_Value_Km2" * b.area_ratio) AS "Et_Value_Km2",
SUM(a."Et_ResLD" * b.area_ratio) AS "Et_ResLD",
SUM(a."Et_ResMD" * b.area_ratio) AS "Et_ResMD",
SUM(a."Et_RESHD" * b.area_ratio) AS "Et_RESHD",
SUM(a."Et_Comm" * b.area_ratio) AS "Et_Comm",
SUM(a."Et_Ind" * b.area_ratio) AS "Et_Ind",
SUM(a."Et_Civic" * b.area_ratio) AS "Et_Civic",
SUM(a."Et_Agr" * b.area_ratio) AS "Et_Agr",
SUM(a."Et_SFHshld" * b.area_ratio) AS "Et_SFHshld",
SUM(a."ET_MFHshld" * b.area_ratio) AS "ET_MFHshld",
SUM(a."Et_Wood" * b.area_ratio) AS "Et_Wood",
SUM(a."Et_Concrete" * b.area_ratio) AS "Et_Concrete",
SUM(a."Et_PreCast" * b.area_ratio) AS "Et_PreCast",
SUM(a."Et_RMasonry" * b.area_ratio) AS "Et_RMasonry",
SUM(a."Et_URMasonry" * b.area_ratio) AS "Et_URMasonry",
SUM(a."Et_Steel" * b.area_ratio) AS "Et_Steel",
SUM(a."Et_Manufacture" * b.area_ratio) AS "Et_Manufacture",
SUM(a."Et_PreCode" * b.area_ratio) AS "Et_PreCode",
SUM(a."Et_LowCode" * b.area_ratio) AS "Et_LowCode",
SUM(a."Et_ModCode" * b.area_ratio) AS "Et_ModCode",
SUM(a."Et_HiCode" * b.area_ratio) AS "Et_HiCode",
SUM(a."Et_PopDay" * b.area_ratio) AS "Et_PopDay",
SUM(a."Et_PopNight" * b.area_ratio) AS "Et_PopNight",
SUM(a."Et_PopTransit" * b.area_ratio) AS "Et_PopTransit",
SUM(a."Et_AssetValue" * b.area_ratio) AS "Et_AssetValue",
SUM(a."Et_BldgValue" * b.area_ratio) AS "Et_BldgValue",
SUM(a."Et_StrValue" * b.area_ratio) AS "Et_StrValue",
SUM(a."Et_NStrValue" * b.area_ratio) AS "Et_NStrValue",
SUM(a."Et_ContValue" * b.area_ratio) AS "Et_ContValue",

c.geom

FROM results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_s_tbl a
LEFT JOIN boundaries.sauid_hexgrid_10km_intersect b ON a."Sauid" = b.sauid
LEFT JOIN boundaries."HexGrid_10km" c ON b.gridid_10 = c.gridid_10
GROUP BY c.gridid_10,c.geom;

-- add PK
ALTER TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_10km_area ADD PRIMARY KEY (gridid_10);

-- create indexes
CREATE INDEX IF NOT EXISTS physical_exposure_indicators_hexbin_10km_geom_idx ON results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_10km_area using GIST (geom);
CREATE INDEX IF NOT EXISTS physical_exposure_indicators_hexbin_10km_idx ON results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_10km_area (gridid_10);



-- 25km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_25km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_25km_intersect AS
(SELECT 
gridid_25,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio",
ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_25km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_25,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_25km_intersect ADD PRIMARY KEY (gridid_25,sauid);

-- create indexes
CREATE INDEX IF NOT EXISTS sauid_hexgrid_25km_intersect_geom_idx ON boundaries.SAUID_HexGrid_25km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_25km_intersect_idx ON boundaries.SAUID_HexGrid_25km_intersect (gridid_25,sauid);


--25km
DROP TABLE IF EXISTS results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_25km_area CASCADE;
CREATE TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_25km_area AS 

SELECT
c.gridid_25,
SUM(a."Et_BldgArea" * b.area_ratio) AS "ET_BldgArea",
SUM(a."Et_BldgAreaRes" * b.area_ratio) AS "Et_BldgAreaRes",
SUM(a."Et_BldgAreaComm" * b.area_ratio) AS "Et_BldgAreaComm",
SUM(a."Et_BldgAreaInd" * b.area_ratio) AS "Et_BldgAreaInd",
SUM(a."Et_BldgAreaCivic" * b.area_ratio) AS "Et_BldgAreaCivic",
SUM(a."Et_BldgAreaAgr" * b.area_ratio) AS "Et_BldgAreaAgr",
SUM(a."Et_BldgNum" * b.area_ratio) AS "Et_BldgNum",
SUM(a."E_CensusBldg"* b.area_ratio) AS "E_CensusBldg",
SUM(a."E_CensusPop" * b.area_ratio) AS "E_CensusPop",
SUM(a."E_CensusDU" * b.area_ratio) AS "E_CensusDU",
SUM(a."E_People_DU" * b.area_ratio) AS "E_People_DU",
AVG(a."Et_Pop_Km2" * b.area_ratio) AS "Et_Pop_Km2",
AVG(a."Et_PPH" * b.area_ratio) AS "Et_PPH",
AVG(a."Et_Bldg_Km2" * b.area_ratio) AS "Et_Bldg_Km2",
AVG(a."Et_Value_Km2" * b.area_ratio) AS "Et_Value_Km2",
SUM(a."Et_ResLD" * b.area_ratio) AS "Et_ResLD",
SUM(a."Et_ResMD" * b.area_ratio) AS "Et_ResMD",
SUM(a."Et_RESHD" * b.area_ratio) AS "Et_RESHD",
SUM(a."Et_Comm" * b.area_ratio) AS "Et_Comm",
SUM(a."Et_Ind" * b.area_ratio) AS "Et_Ind",
SUM(a."Et_Civic" * b.area_ratio) AS "Et_Civic",
SUM(a."Et_Agr" * b.area_ratio) AS "Et_Agr",
SUM(a."Et_SFHshld" * b.area_ratio) AS "Et_SFHshld",
SUM(a."ET_MFHshld" * b.area_ratio) AS "ET_MFHshld",
SUM(a."Et_Wood" * b.area_ratio) AS "Et_Wood",
SUM(a."Et_Concrete" * b.area_ratio) AS "Et_Concrete",
SUM(a."Et_PreCast" * b.area_ratio) AS "Et_PreCast",
SUM(a."Et_RMasonry" * b.area_ratio) AS "Et_RMasonry",
SUM(a."Et_URMasonry" * b.area_ratio) AS "Et_URMasonry",
SUM(a."Et_Steel" * b.area_ratio) AS "Et_Steel",
SUM(a."Et_Manufacture" * b.area_ratio) AS "Et_Manufacture",
SUM(a."Et_PreCode" * b.area_ratio) AS "Et_PreCode",
SUM(a."Et_LowCode" * b.area_ratio) AS "Et_LowCode",
SUM(a."Et_ModCode" * b.area_ratio) AS "Et_ModCode",
SUM(a."Et_HiCode" * b.area_ratio) AS "Et_HiCode",
SUM(a."Et_PopDay" * b.area_ratio) AS "Et_PopDay",
SUM(a."Et_PopNight" * b.area_ratio) AS "Et_PopNight",
SUM(a."Et_PopTransit" * b.area_ratio) AS "Et_PopTransit",
SUM(a."Et_AssetValue" * b.area_ratio) AS "Et_AssetValue",
SUM(a."Et_BldgValue" * b.area_ratio) AS "Et_BldgValue",
SUM(a."Et_StrValue" * b.area_ratio) AS "Et_StrValue",
SUM(a."Et_NStrValue" * b.area_ratio) AS "Et_NStrValue",
SUM(a."Et_ContValue" * b.area_ratio) AS "Et_ContValue",

c.geom

FROM results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_s_tbl a
LEFT JOIN boundaries.sauid_hexgrid_25km_intersect b ON a."Sauid" = b.sauid
LEFT JOIN boundaries."HexGrid_25km" c ON b.gridid_25 = c.gridid_25
GROUP BY c.gridid_25,c.geom;

-- add PK
ALTER TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_25km_area ADD PRIMARY KEY (gridid_25);

-- create indexes
CREATE INDEX IF NOT EXISTS physical_exposure_indicators_hexbin_25km_geom_idx ON results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_25km_area using GIST (geom);
CREATE INDEX IF NOT EXISTS physical_exposure_indicators_hexbin_25km_idx ON results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_25km_area (gridid_25);



-- 50km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_50km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_50km_intersect AS
(SELECT 
gridid_50,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio",
ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_50km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_50,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_50km_intersect ADD PRIMARY KEY (gridid_50,sauid);

-- create indexes
CREATE INDEX IF NOT EXISTS sauid_hexgrid_50km_intersect_geom_idx ON boundaries.SAUID_HexGrid_50km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_50km_intersect_idx ON boundaries.SAUID_HexGrid_50km_intersect (gridid_50,sauid);



-- 100km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_100km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_100km_intersect AS
(SELECT 
gridid_100,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio",
ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_100km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_100,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_100km_intersect ADD PRIMARY KEY (gridid_100,sauid);

-- create indexes
CREATE INDEX IF NOT EXISTS sauid_hexgrid_100km_intersect_geom_idx ON boundaries.SAUID_HexGrid_100km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_100km_intersect_idx ON boundaries.SAUID_HexGrid_100km_intersect (gridid_100,sauid);


--100km
DROP TABLE IF EXISTS results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_100km_area CASCADE;
CREATE TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_100km_area AS 

SELECT
c.gridid_100,
SUM(a."Et_BldgArea" * b.area_ratio) AS "ET_BldgArea",
SUM(a."Et_BldgAreaRes" * b.area_ratio) AS "Et_BldgAreaRes",
SUM(a."Et_BldgAreaComm" * b.area_ratio) AS "Et_BldgAreaComm",
SUM(a."Et_BldgAreaInd" * b.area_ratio) AS "Et_BldgAreaInd",
SUM(a."Et_BldgAreaCivic" * b.area_ratio) AS "Et_BldgAreaCivic",
SUM(a."Et_BldgAreaAgr" * b.area_ratio) AS "Et_BldgAreaAgr",
SUM(a."Et_BldgNum" * b.area_ratio) AS "Et_BldgNum",
SUM(a."E_CensusBldg"* b.area_ratio) AS "E_CensusBldg",
SUM(a."E_CensusPop" * b.area_ratio) AS "E_CensusPop",
SUM(a."E_CensusDU" * b.area_ratio) AS "E_CensusDU",
SUM(a."E_People_DU" * b.area_ratio) AS "E_People_DU",
AVG(a."Et_Pop_Km2" * b.area_ratio) AS "Et_Pop_Km2",
AVG(a."Et_PPH" * b.area_ratio) AS "Et_PPH",
AVG(a."Et_Bldg_Km2" * b.area_ratio) AS "Et_Bldg_Km2",
AVG(a."Et_Value_Km2" * b.area_ratio) AS "Et_Value_Km2",
SUM(a."Et_ResLD" * b.area_ratio) AS "Et_ResLD",
SUM(a."Et_ResMD" * b.area_ratio) AS "Et_ResMD",
SUM(a."Et_RESHD" * b.area_ratio) AS "Et_RESHD",
SUM(a."Et_Comm" * b.area_ratio) AS "Et_Comm",
SUM(a."Et_Ind" * b.area_ratio) AS "Et_Ind",
SUM(a."Et_Civic" * b.area_ratio) AS "Et_Civic",
SUM(a."Et_Agr" * b.area_ratio) AS "Et_Agr",
SUM(a."Et_SFHshld" * b.area_ratio) AS "Et_SFHshld",
SUM(a."ET_MFHshld" * b.area_ratio) AS "ET_MFHshld",
SUM(a."Et_Wood" * b.area_ratio) AS "Et_Wood",
SUM(a."Et_Concrete" * b.area_ratio) AS "Et_Concrete",
SUM(a."Et_PreCast" * b.area_ratio) AS "Et_PreCast",
SUM(a."Et_RMasonry" * b.area_ratio) AS "Et_RMasonry",
SUM(a."Et_URMasonry" * b.area_ratio) AS "Et_URMasonry",
SUM(a."Et_Steel" * b.area_ratio) AS "Et_Steel",
SUM(a."Et_Manufacture" * b.area_ratio) AS "Et_Manufacture",
SUM(a."Et_PreCode" * b.area_ratio) AS "Et_PreCode",
SUM(a."Et_LowCode" * b.area_ratio) AS "Et_LowCode",
SUM(a."Et_ModCode" * b.area_ratio) AS "Et_ModCode",
SUM(a."Et_HiCode" * b.area_ratio) AS "Et_HiCode",
SUM(a."Et_PopDay" * b.area_ratio) AS "Et_PopDay",
SUM(a."Et_PopNight" * b.area_ratio) AS "Et_PopNight",
SUM(a."Et_PopTransit" * b.area_ratio) AS "Et_PopTransit",
SUM(a."Et_AssetValue" * b.area_ratio) AS "Et_AssetValue",
SUM(a."Et_BldgValue" * b.area_ratio) AS "Et_BldgValue",
SUM(a."Et_StrValue" * b.area_ratio) AS "Et_StrValue",
SUM(a."Et_NStrValue" * b.area_ratio) AS "Et_NStrValue",
SUM(a."Et_ContValue" * b.area_ratio) AS "Et_ContValue",

c.geom

FROM results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_s_tbl a
LEFT JOIN boundaries.sauid_hexgrid_100km_intersect b ON a."Sauid" = b.sauid
LEFT JOIN boundaries."HexGrid_100km" c ON b.gridid_100 = c.gridid_100
GROUP BY c.gridid_100,c.geom;

-- add PK
ALTER TABLE results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_100km_area ADD PRIMARY KEY (gridid_100);

-- create indexes
CREATE INDEX IF NOT EXISTS physical_exposure_indicators_hexbin_100km_geom_idx ON results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_100km_area using GIST (geom);
CREATE INDEX IF NOT EXISTS physical_exposure_indicators_hexbin_100km_idx ON results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_hexbin_100km_area (gridid_100);