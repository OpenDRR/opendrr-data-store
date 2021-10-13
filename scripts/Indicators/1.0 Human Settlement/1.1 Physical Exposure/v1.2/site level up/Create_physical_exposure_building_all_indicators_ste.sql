-- create schema for new scenario
CREATE SCHEMA IF NOT EXISTS results_nhsl_metrovan_physical_exposure;

-- create physical exposure indicators
DROP VIEW IF EXISTS results_nhsl_metrovan_physical_exposure.nhsl_metrovan_physical_exposure_indicators_b CASCADE;
CREATE VIEW results_nhsl_metrovan_physical_exposure.nhsl_metrovan_physical_exposure_indicators_b AS 

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.1 Buildings
SELECT 
a.id AS "BldgID",
CAST(CAST(ROUND(CAST(a.sauidlon AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "BldgLon",
CAST(CAST(ROUND(CAST(a.sauidlat AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "BldgLat",
a.sauid AS "Sauid",
CAST(CAST(ROUND(CAST(a.number AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_BldgNum",
a.taxonomy AS "E_BldgTaxon",
CAST(CAST(ROUND(CAST(a.bldg_ft2 * a.number AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_BldgArea",
--CAST(CAST(ROUND(CAST(CASE WHEN a.genocc IN ('Residential-LD','Residential-MD','Residential-HD') THEN a.bldg_ft2 ELSE 0 END AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_BldgAreaRes",
--CAST(CAST(ROUND(CAST(CASE WHEN a.genocc = 'Commercial' THEN a.bldg_ft2 ELSE 0 END AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_BldgAreaComm",
--CAST(CAST(ROUND(CAST(CASE WHEN a.genocc = 'Industrial' THEN a.bldg_ft2 ELSE 0 END AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_BldgAreaInd",
--CAST(CAST(ROUND(CAST(CASE WHEN a.genocc = 'Civic' THEN a.bldg_ft2 ELSE 0 END AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_BldgAreaCivic",
--CAST(CAST(ROUND(CAST(CASE WHEN a.genocc = 'Agricultural' THEN a.bldg_ft2 ELSE 0 END AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_BldgAreaAgr",
a.landuse AS "E_LandUse",
a.genocc AS "E_BldgOccG",
a.occclass1 AS "E_BldgOccS1",
a.occclass2 AS "E_BldgOccS2",
a.gentype AS "E_BldgTypeG",
a.bldgtype AS "E_BldgTypeS",
CAST(CAST(ROUND(CAST(a.numfloors AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_NumFloors",
a.bldepoch AS "E_BldgEpoch",
a.ssc_zone AS "SSC_Zone",
a.eqdeslev AS "E_BldgDesLev",

-- single family household, res units for RES1, RES2 = 1
CAST(CAST(ROUND(CAST((CASE 
					  WHEN a.occclass1 = 'RES1' THEN a.number * 1
					  WHEN a.occclass1 = 'RES2' THEN a.number * 1 
					  ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_SFHshld",

-- multi family household, res units for RES3A = 2, RES3B = 4, RES3C = 9, RES3D = 17, RES3E = 32, RES3F = 110, RES4 = 68, RES5 = 50, RES6 = 65
CAST(CAST(ROUND(CAST((CASE 
					  WHEN a.occclass1 = 'RES3A' THEN a.number * 2
					  WHEN a.occclass1 = 'RES3B' THEN a.number * 4
					  WHEN a.occclass1 = 'RES3C' THEN a.number * 9
					  WHEN a.occclass1 = 'RES3D' THEN a.number * 17
					  WHEN a.occclass1 = 'RES3E' THEN a.number * 32
					  WHEN a.occclass1 = 'RES3F' THEN a.number * 110
					  WHEN a.occclass1 = 'RES4' THEN a.number * 68
					  WHEN a.occclass1 = 'RES5' THEN a.number * 50
					  WHEN a.occclass1 = 'RES6' THEN a.number * 65
					  ELSE 0 END) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_MFHshld",


-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.2 People
CAST(CAST(ROUND(CAST(a.day AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_PopDay",
CAST(CAST(ROUND(CAST(a.night AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_PopNight",
CAST(CAST(ROUND(CAST(a.transit AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_PopTransit",

-- 1.0 Human Settlement
-- 1.1 Physical Exposure
-- 1.1.2 Assets
CAST(CAST(ROUND(CAST(a.structural + a.nonstructural + a.contents AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AssetValue",
CAST(CAST(ROUND(CAST(a.structural + a.nonstructural AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_BldgValue",
CAST(CAST(ROUND(CAST(a.structural AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_StrValue",
CAST(CAST(ROUND(CAST(a.nonstructural AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_NStrValue",
CAST(CAST(ROUND(CAST(a.contents AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_ContValue",
CAST(CAST(ROUND(CAST(a.retrofitting AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_RetrofitCost",

b."PRUID" AS "pruid",
b."PRNAME" AS "prname",
b."ERUID" AS "eruid",
b."ERNAME" AS "ername",
b."CDUID" AS "cduid",
b."CDNAME" AS "cdname",
b."CSDUID" AS "csduid",
b."CSDNAME" AS "csdname",
b."CFSAUID" AS "fsauid",
b."DAUIDt" AS "dauid",
b."SACCODE" AS "saccode",
b."SACTYPE" AS "sactype",
a.geom_site AS "geom_point"

FROM exposure.metrovan_building_exposure a
LEFT JOIN boundaries."Geometry_SAUID" b on a.sauid = b."SAUIDt";