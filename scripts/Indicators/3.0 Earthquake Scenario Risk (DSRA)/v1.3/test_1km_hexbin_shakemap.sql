-- create shakemap in hexbin for display - 1km

/*
-- create full extent of dsra scenario 1km hexbin - using shakemap extents
DROP TABLE IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_full CASCADE;
CREATE TABLE results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_full AS
SELECT 
a.gridid_1,
a.geom

FROM boundaries."HexGrid_1km" a
JOIN gmf.shakemap_scenario_extents b ON ST_INTERSECTS(a.geom,b.geom) WHERE b.scenario = '{eqScenario}';
*/

-- create shakemap in hexbin for display - 1km
-- create full extent of dsra scenario 1km hexbin - using 5km shakemap hexbin
DROP TABLE IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_full CASCADE;
CREATE TABLE results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_full AS
SELECT 
a.gridid_1,
a.geom

FROM boundaries."HexGrid_1km" a
JOIN results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_5km b ON ST_INTERSECTS(a.geom,b.geom);


-- calculate avg, min, max pga of shakemap points within 1km hexbin
DROP TABLE IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_temp CASCADE;
CREATE TABLE results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_temp AS

SELECT
b.gridid_1,
AVG("sH_PGA") AS "sH_PGA_avg",
MIN("sH_PGA") as "sH_PGA_min",
MAX("sH_PGA") as "sH_PGA_max",
b.geom

FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap a
JOIN boundaries."HexGrid_1km" b ON ST_INTERSECTS(a.geom,b.geom)
GROUP BY b.gridid_1,b.geom;


-- create dsra scenario shakemap 1km hexbin and assign PGA value based on nearest shakemap ID
DROP TABLE IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_temp1 CASCADE;
CREATE TABLE results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_temp1 AS
SELECT
a.gridid_1,
0.00 AS "sH_PGA_avg",
0.00 AS "sH_PGA_min",
b."sH_PGA" AS "sH_PGA_max",
a.geom

FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_full a
CROSS JOIN LATERAL 
(
SELECT
"sH_PGA",
geom
	
FROM results_dsra_{eqScenario}.{eqScenario}_shakemap_tbl
ORDER BY a.geom <-> geom
LIMIT 1
) AS b;


-- update dsra shakeap 1km hexbin with calculated max PGA values
UPDATE results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_temp1 b
SET "sH_PGA_max" = a."sH_PGA_max",
"sH_PGA_min" = a."sH_PGA_min",
"sH_PGA_avg" = a."sH_PGA_avg"
FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_temp a
WHERE a.gridid_1 = b.gridid_1;


-- remove duplicate gridid_1 values from selection
DROP TABLE IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_tbl CASCADE;
CREATE TABLE results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_tbl AS
SELECT
DISTINCT(gridid_1),
"sH_PGA_avg",
"sH_PGA_min",
"sH_PGA_max",
geom

FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_temp1;


-- update assigned 0.00 to null
UPDATE results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_tbl
SET "sH_PGA_avg" = NULL WHERE "sH_PGA_avg" = 0.00;
UPDATE results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_tbl
SET "sH_PGA_min" = NULL WHERE "sH_PGA_min" = 0.00;


-- drop temp
DROP TABLE IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_temp,
results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_temp1,
results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_full CASCADE;


-- create view
DROP VIEW IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km;
CREATE VIEW results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km AS SELECT * FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_1km_tbl;