-- create intersection geometry between sauid polygon, and hexgrids, calculate area and area ratios between both polygons
-- 5km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_5km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_5km_intersect AS
(SELECT 
gridid_5,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio"
--ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_5km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_5,"SAUIDt");
--GROUP BY gridid_5,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_5km_intersect ADD PRIMARY KEY (gridid_5,sauid);

-- create indexes
--CREATE INDEX IF NOT EXISTS sauid_hexgrid_5km_intersect_geom_idx ON boundaries.SAUID_HexGrid_5km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_5km_intersect_idx ON boundaries.SAUID_HexGrid_5km_intersect (gridid_5,sauid);



-- 10km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_10km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_10km_intersect AS
(SELECT 
gridid_10,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio"
--ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_10km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_10,"SAUIDt");
--GROUP BY gridid_10,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_10km_intersect ADD PRIMARY KEY (gridid_10,sauid);

-- create indexes
--CREATE INDEX IF NOT EXISTS sauid_hexgrid_10km_intersect_geom_idx ON boundaries.SAUID_HexGrid_10km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_10km_intersect_idx ON boundaries.SAUID_HexGrid_10km_intersect (gridid_10,sauid);



-- 25km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_25km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_25km_intersect AS
(SELECT 
gridid_25,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio"
--ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_25km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_25,"SAUIDt");
--GROUP BY gridid_25,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_25km_intersect ADD PRIMARY KEY (gridid_25,sauid);

-- create indexes
--CREATE INDEX IF NOT EXISTS sauid_hexgrid_25km_intersect_geom_idx ON boundaries.SAUID_HexGrid_25km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_25km_intersect_idx ON boundaries.SAUID_HexGrid_25km_intersect (gridid_25,sauid);



-- 50km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_50km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_50km_intersect AS
(SELECT 
gridid_50,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio"
--ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_50km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_50,"SAUIDt");
--GROUP BY gridid_50,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_50km_intersect ADD PRIMARY KEY (gridid_50,sauid);

-- create indexes
--CREATE INDEX IF NOT EXISTS sauid_hexgrid_50km_intersect_geom_idx ON boundaries.SAUID_HexGrid_50km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_50km_intersect_idx ON boundaries.SAUID_HexGrid_50km_intersect (gridid_50,sauid);



-- 100km
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_100km_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_100km_intersect AS
(SELECT 
gridid_100,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio"
--ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_100km" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid_100,"SAUIDt");
--GROUP BY gridid_100,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_100km_intersect ADD PRIMARY KEY (gridid_100,sauid);

-- create indexes
--CREATE INDEX IF NOT EXISTS sauid_hexgrid_100km_intersect_geom_idx ON boundaries.SAUID_HexGrid_100km_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_100km_intersect_idx ON boundaries.SAUID_HexGrid_100km_intersect (gridid_100,sauid);



-- create intersection geometry between sauid polygon, and hexgrids, calculate area and area ratios between both polygons
-- global fabric
DROP TABLE IF EXISTS boundaries.SAUID_HexGrid_Global_Fabric_intersect;
CREATE TABLE boundaries.SAUID_HexGrid_Global_Fabric_intersect AS
(SELECT 
gridid,
"SAUIDt" AS sauid,
SUM(ST_AREA(b.geom)) AS "sauid_area",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))) AS "area_intersect",
SUM(ST_AREA(ST_INTERSECTION(a.geom,b.geom))/ST_AREA(b.geom)) AS "area_ratio"
--ST_INTERSECTION(a.geom,b.geom) AS "geom"
FROM boundaries."HexGrid_global_fabric" a,boundaries."Geometry_SAUID" b
WHERE ST_INTERSECTS(a.geom,b.geom)
GROUP BY gridid,"SAUIDt");
--GROUP BY gridid,"SAUIDt",ST_INTERSECTION(a.geom,b.geom));

-- add PK
ALTER TABLE boundaries.SAUID_HexGrid_Global_Fabric_intersect ADD PRIMARY KEY (gridid,sauid);

-- create indexes
--CREATE INDEX IF NOT EXISTS sauid_hexgrid_global_fabric_intersect_geom_idx ON boundaries.SAUID_HexGrid_Global_Fabric_intersect using GIST (geom);
CREATE INDEX IF NOT EXISTS sauid_hexgrid_global_fabric_intersect_idx ON boundaries.SAUID_HexGrid_Global_Fabric_intersect (gridid,sauid);



/*
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
*/