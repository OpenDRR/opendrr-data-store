-- script to generate hazard map mean
CREATE SCHEMA IF NOT EXISTS psra_yt;

DROP TABLE IF EXISTS psra_yt.psra_yt_hmaps CASCADE;

-- create table
CREATE TABLE psra_yt.psra_yt_hmaps(
lon float,
lat float,
"PGA_0.02" float,
"PGA_0.1" float,
"SA(0.1)_0.02" float,
"SA(0.1)_0.1" float,
"SA(0.2)_0.02" float,
"SA(0.2)_0.1" float,
"SA(0.3)_0.02" float,
"SA(0.3)_0.1" float,
"SA(0.5)_0.02" float,
"SA(0.5)_0.1" float,
"SA(0.6)_0.02" float,
"SA(0.6)_0.1" float,
"SA(1.0)_0.02" float,
"SA(1.0)_0.1" float,
"SA(10.0)_0.02" float,
"SA(10.0)_0.1" float,
"SA(2.0)_0.02" float,
"SA(2.0)_0.1" float,
"SA(5.0)_0.02" float,
"SA(5.0)_0.1" float
);

-- import exposure from csv
COPY psra_yt.psra_yt_hmaps(lon,lat,"PGA_0.02","PGA_0.1","SA(0.1)_0.02","SA(0.1)_0.1","SA(0.2)_0.02","SA(0.2)_0.1","SA(0.3)_0.02","SA(0.3)_0.1","SA(0.5)_0.02","SA(0.5)_0.1","SA(0.6)_0.02","SA(0.6)_0.1","SA(1.0)_0.02","SA(1.0)_0.1","SA(2.0)_0.02","SA(2.0)_0.1")
    FROM 'D:\Workspace\data\psra_new_datasets\1_cHazard\yt\cH_yt_hmaps.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;

-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE psra_yt.psra_yt_hmaps ADD COLUMN geom geometry(Point,4326);
UPDATE psra_yt.psra_yt_hmaps SET geom = st_setsrid(st_makepoint(lon,lat),4326);

-- create spatial index
CREATE INDEX yt_hmaps_idx
ON psra_yt.psra_yt_hmaps using GIST (geom);


-- removed for automation purposes, reintroduce after finalized chazard maps and generate xref create tables.

DROP TABLE IF EXISTS psra_yt.exposure_yt CASCADE;

CREATE TABLE psra_yt.exposure_yt AS
(
SELECT id,
sauid,
sauidlon,
sauidlat,
geom

FROM exposure.canada_exposure 
WHERE PRUID = '60'
);


-- attach assetID to hazard mean map based on closest location
DROP TABLE IF EXISTS psra_yt.psra_yt_hmaps_xref CASCADE;

CREATE TABLE psra_yt.psra_yt_hmaps_xref AS
SELECT
a.id,
a.sauid,
a.sauidlon AS "asset_lon",
a.sauidlat AS "asset_lat",
b.lon,
b.lat,
ST_Distance(a.geom,b.geom) AS "distance",
b."PGA_0.02",
b."PGA_0.1",
b."SA(0.1)_0.02",
b."SA(0.1)_0.1",
b."SA(0.2)_0.02",
b."SA(0.2)_0.1",
b."SA(0.3)_0.02",
b."SA(0.3)_0.1",
b."SA(0.5)_0.02",
b."SA(0.5)_0.1",
b."SA(0.6)_0.02",
b."SA(0.6)_0.1",
b."SA(1.0)_0.02",
b."SA(1.0)_0.1",
b."SA(10.0)_0.02",
b."SA(10.0)_0.1",
b."SA(2.0)_0.02",
b."SA(2.0)_0.1",
b."SA(5.0)_0.02",
b."SA(5.0)_0.1"

FROM psra_yt.exposure_yt a
CROSS JOIN LATERAL 
(
SELECT 
lon,
lat,
"PGA_0.02",
"PGA_0.1",
"SA(0.1)_0.02",
"SA(0.1)_0.1",
"SA(0.2)_0.02",
"SA(0.2)_0.1",
"SA(0.3)_0.02",
"SA(0.3)_0.1",
"SA(0.5)_0.02",
"SA(0.5)_0.1",
"SA(0.6)_0.02",
"SA(0.6)_0.1",
"SA(1.0)_0.02",
"SA(1.0)_0.1",
"SA(10.0)_0.02",
"SA(10.0)_0.1",
"SA(2.0)_0.02",
"SA(2.0)_0.1",
"SA(5.0)_0.02",
"SA(5.0)_0.1",
geom

FROM psra_yt.psra_yt_hmaps
ORDER BY a.geom <-> geom
LIMIT 1
) AS b;

DROP TABLE IF EXISTS psra_yt.exposure_yt;


-- script to export vs30_can_site_model_xref
COPY psra_yt.psra_yt_hmaps_xref TO 'D:\Workspace\data\source datasets\processed for upload\chazard\psra_yt_hmaps_xref.csv' DELIMITER ',' CSV HEADER;



-- script to create xref table
DROP TABLE IF EXISTS psra_yt.psra_yt_hmaps_xref;


-- create table
CREATE TABLE psra_yt.psra_yt_hmaps_xref(
PRIMARY KEY(id),
id varchar,
sauid varchar,
asset_lon float,
asset_lat float,
lon float,
lat float,
distance float,
"PGA_0.02" float,
"PGA_0.1" float,
"SA(0.1)_0.02" float,
"SA(0.1)_0.1" float,
"SA(0.2)_0.02" float,
"SA(0.2)_0.1" float,
"SA(0.3)_0.02" float,
"SA(0.3)_0.1" float,
"SA(0.5)_0.02" float,
"SA(0.5)_0.1" float,
"SA(0.6)_0.02" float,
"SA(0.6)_0.1" float,
"SA(1.0)_0.02" float,
"SA(1.0)_0.1" float,
"SA(10.0)_0.02" float,
"SA(10.0)_0.1" float,
"SA(2.0)_0.02" float,
"SA(2.0)_0.1" float,
"SA(5.0)_0.02" float,
"SA(5.0)_0.1" float
);

-- import exposure from csv
COPY psra_yt.psra_yt_hmaps_xref (id,sauid,asset_lon,asset_lat,lon,lat,distance,"PGA_0.02","PGA_0.1","SA(0.1)_0.02","SA(0.1)_0.1","SA(0.2)_0.02","SA(0.2)_0.1","SA(0.3)_0.02","SA(0.3)_0.1","SA(0.5)_0.02","SA(0.5)_0.1","SA(0.6)_0.02",
"SA(0.6)_0.1","SA(1.0)_0.02","SA(1.0)_0.1","SA(10.0)_0.02","SA(10.0)_0.1","SA(2.0)_0.02","SA(2.0)_0.1","SA(5.0)_0.02","SA(5.0)_0.1")
    FROM 'D:\Workspace\data\source datasets\processed for upload\chazard\psra_yt_hmaps_xref.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;

-- create index
CREATE INDEX psra_yt_hmaps_xref_idx ON psra_yt.psra_yt_hmaps_xref(id);