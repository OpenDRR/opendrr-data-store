-- create shakemap in hexbin for display - 5km
DROP VIEW IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_5km CASCADE;
CREATE VIEW results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_5km AS

SELECT
b.gridid_5,
AVG("sH_PGA") AS "sH_PGA_avg",
MIN("sH_PGA") as "sH_PGA_min",
MAX("sH_PGA") as "sH_PGA_max",
b.geom

FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap a
JOIN boundaries."HexGrid_5km" b ON ST_INTERSECTS(a.geom,b.geom)
GROUP BY b.gridid_5;

-- create shakemap in hexbin for display - 10km
DROP VIEW IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_10km CASCADE;
CREATE VIEW results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_10km AS

SELECT
b.gridid_10,
AVG("sH_PGA") AS "sH_PGA_avg",
MIN("sH_PGA") as "sH_PGA_min",
MAX("sH_PGA") as "sH_PGA_max",
b.geom

FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap a
JOIN boundaries."HexGrid_10km" b ON ST_INTERSECTS(a.geom,b.geom)
GROUP BY b.gridid_10;

-- create shakemap in hexbin for display - 25km
DROP VIEW IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_25km CASCADE;
CREATE VIEW results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_25km AS

SELECT
b.gridid_25,
AVG("sH_PGA") AS "sH_PGA_avg",
MIN("sH_PGA") as "sH_PGA_min",
MAX("sH_PGA") as "sH_PGA_max",
b.geom

FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap a
JOIN boundaries."HexGrid_25km" b ON ST_INTERSECTS(a.geom,b.geom)
GROUP BY b.gridid_25;

-- create shakemap in hexbin for display - 50km
DROP VIEW IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_50km CASCADE;
CREATE VIEW results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_50km AS

SELECT
b.gridid_50,
AVG("sH_PGA") AS "sH_PGA_avg",
MIN("sH_PGA") as "sH_PGA_min",
MAX("sH_PGA") as "sH_PGA_max",
b.geom

FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap a
JOIN boundaries."HexGrid_50km" b ON ST_INTERSECTS(a.geom,b.geom)
GROUP BY b.gridid_50;

-- create shakemap in hexbin for display - 100km
DROP VIEW IF EXISTS results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_100km CASCADE;
CREATE VIEW results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap_hexbin_100km AS

SELECT
b.gridid_100,
AVG("sH_PGA") AS "sH_PGA_avg",
MIN("sH_PGA") as "sH_PGA_min",
MAX("sH_PGA") as "sH_PGA_max",
b.geom

FROM results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap a
JOIN boundaries."HexGrid_100km" b ON ST_INTERSECTS(a.geom,b.geom)
GROUP BY b.gridid_100;