-- script to generate hazard map mean

DROP TABLE IF EXISTS psra_pe.psra_pe_hmaps CASCADE;

-- create table
CREATE TABLE psra_pe.psra_pe_hmaps(
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
COPY psra_pe.psra_pe_hmaps(lon,lat,"PGA_0.02","PGA_0.1","SA(0.1)_0.02","SA(0.1)_0.1","SA(0.2)_0.02","SA(0.2)_0.1","SA(0.3)_0.02","SA(0.3)_0.1","SA(0.5)_0.02","SA(0.5)_0.1","SA(0.6)_0.02","SA(0.6)_0.1","SA(1.0)_0.02","SA(1.0)_0.1","SA(10.0)_0.02","SA(10.0)_0.1","SA(2.0)_0.02","SA(2.0)_0.1","SA(5.0)_0.02","SA(5.0)_0.1")
    FROM 'D:\workspace\data\psra_new_datasets\1_cHazard\cH_pe_hmaps.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;

-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE psra_pe.psra_pe_hmaps ADD COLUMN geom geometry(Point,4326);
UPDATE psra_pe.psra_pe_hmaps SET geom = st_setsrid(st_makepoint(lon,lat),4326);

-- create spatial index
CREATE INDEX pe_hmaps_idx
ON psra_pe.psra_pe_hmaps using GIST (geom);


DROP TABLE IF EXISTS psra_pe.exposure_pe CASCADE;

CREATE TABLE psra_pe.exposure_pe AS
(
SELECT id,
sauid,
sauidlon,
sauidlat,
geom

FROM exposure.canada_exposure 
WHERE PRUID = '11'
);

-- attach assetID to hazard mean map based on closest location
DROP TABLE IF EXISTS psra_pe.psra_pe_hmaps_xref CASCADE;

CREATE TABLE psra_pe.psra_pe_hmaps_xref AS
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

FROM psra_pe.exposure_pe a
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

FROM psra_pe.psra_pe_hmaps
ORDER BY a.geom <-> geom
LIMIT 1
) AS b;

DROP TABLE IF EXISTS psra_pe.exposure_pe;