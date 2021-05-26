-- update shakemap table to add geometry and spatial index
-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN geom geometry(Point,4326);
UPDATE gmf.shakemap_sim9p0_cszlockedtrans SET geom = st_setsrid(st_makepoint(lon,lat),4326);

-- create spatial index
CREATE INDEX shakemap_sim9p0_cszlockedtrans_idx
ON gmf.shakemap_sim9p0_cszlockedtrans using GIST (geom);

-- add columns to shakemap if missing
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_pga" float DEFAULT NULL;
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_pgv" float DEFAULT NULL;
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.1)" float DEFAULT NULL;
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.2)" float DEFAULT NULL;
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.3)" float DEFAULT NULL;
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.5)" float DEFAULT NULL;
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.6)" float DEFAULT NULL;
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(1.0)" float DEFAULT NULL;
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(2.0)" float DEFAULT NULL;


-- create temp table for xref only on ids matching scenario
DROP TABLE IF EXISTS dsra.exposure_sim9p0_cszlockedtrans CASCADE;

CREATE TABLE dsra.exposure_sim9p0_cszlockedtrans AS 
(
SELECT
a.id,
a.sauidlon,
a.sauidlat,
a.geom
FROM exposure.canada_exposure a
RIGHT JOIN dsra.dsra_sim9p0_cszlockedtrans b ON a.id = b."AssetID"
);



DROP TABLE IF EXISTS gmf.shakemap_sim9p0_cszlockedtrans_xref CASCADE;

-- attach assetID to gmfdata_sitemesh based on closest location
CREATE TABLE gmf.shakemap_sim9p0_cszlockedtrans_xref AS

SELECT
a."id",
b."site_id",
b."gmv_pga",
b."gmv_pgv",
b."gmv_SA(0.1)",
b."gmv_SA(0.2)",
b."gmv_SA(0.3)",
b."gmv_SA(0.5)",
b."gmv_SA(0.6)",
b."gmv_SA(1.0)",
b."gmv_SA(2.0)",
b.lon,
b.lat,
a.sauidlon AS "asset_lon",
a.sauidlat AS "asset_lat",
ST_Distance(a.geom,b.geom) AS "distance"

FROM dsra.exposure_sim9p0_cszlockedtrans a
CROSS JOIN LATERAL 
(
SELECT
	site_id,
	gmv_pga,
	gmv_pgv,
	"gmv_SA(0.1)",
	"gmv_SA(0.2)",
	"gmv_SA(0.3)",
	"gmv_SA(0.5)",
	"gmv_SA(0.6)",
	"gmv_SA(1.0)",
	"gmv_SA(2.0)",
	lon,
	lat,
	geom
	
FROM gmf.shakemap_sim9p0_cszlockedtrans
ORDER BY a.geom <-> geom
LIMIT 1
) AS b;

DROP TABLE IF EXISTS dsra.exposure_sim9p0_cszlockedtrans CASCADE;

-- add pkey
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans_xref DROP CONSTRAINT IF EXISTS shakemap_sim9p0_cszlockedtrans_xref_pkey;
ALTER TABLE gmf.shakemap_sim9p0_cszlockedtrans_xref ADD PRIMARY KEY("id");

-- create index
CREATE INDEX shakemap_sim9p0_cszlockedtrans_xref_idx ON gmf.shakemap_sim9p0_cszlockedtrans_xref (id);