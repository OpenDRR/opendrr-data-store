-- script to generate Canada exposure table

DROP TABLE IF EXISTS vs30.vs30_can_site_model CASCADE;


-- create table
CREATE TABLE vs30.vs30_can_site_model(
    lon float,
    lat float,
    vs30 float,
    z1pt0 float,
    z2pt5 float
    
);

-- import exposure from csv
COPY vs30.vs30_can_site_model (lon, lat, vs30, z1pt0, z2pt5)
    FROM 'D:\Workspace\GitHub\openquake-inputs\earthquake\sites\regions\site-vgrid_CA.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;


-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE vs30.vs30_can_site_model ADD COLUMN geom geometry(Point,4326);
UPDATE vs30.vs30_can_site_model SET geom = st_setsrid(st_makepoint(lon,lat),4326);

-- create spatial index
CREATE INDEX vs30_can_site_model_idx
ON vs30.vs30_can_site_model using GIST (geom);


-- add missing columns that does not exist in source sample data but should be included in future datasets.
--ALTER TABLE vs30.vs30_can_site_model ADD COLUMN IF NOT EXISTS z1pt0 float DEFAULT 0;
--ALTER TABLE vs30.vs30_can_site_model ADD COLUMN IF NOT EXISTS z2pt5 float DEFAULT 0;

ALTER TABLE vs30.vs30_can_site_model ADD COLUMN IF NOT EXISTS z1pt0 float DEFAULT NULL;
ALTER TABLE vs30.vs30_can_site_model ADD COLUMN IF NOT EXISTS z2pt5 float DEFAULT NULL;