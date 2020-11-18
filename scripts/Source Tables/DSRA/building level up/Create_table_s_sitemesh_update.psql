-- add columns to s_gmfdata if missing
ALTER TABLE gmf.s_gmfdata_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_pga" float DEFAULT NULL;
ALTER TABLE gmf.s_gmfdata_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_pgv" float DEFAULT NULL;
ALTER TABLE gmf.s_gmfdata_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.1)" float DEFAULT NULL;
ALTER TABLE gmf.s_gmfdata_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.2)" float DEFAULT NULL;
ALTER TABLE gmf.s_gmfdata_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.3)" float DEFAULT NULL;
ALTER TABLE gmf.s_gmfdata_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.5)" float DEFAULT NULL;
ALTER TABLE gmf.s_gmfdata_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(0.6)" float DEFAULT NULL;
ALTER TABLE gmf.s_gmfdata_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(1.0)" float DEFAULT NULL;
ALTER TABLE gmf.s_gmfdata_sim9p0_cszlockedtrans ADD COLUMN IF NOT EXISTS "gmv_SA(2.0)" float DEFAULT NULL;

-- update gmf data and sitemesh data into 1 table incorporating assetID
DROP TABLE IF EXISTS gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans, gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans_xref CASCADE;

SELECT 
a."site_id",
a."gmv_pga",
a."gmv_pgv",
a."gmv_SA(0.1)",
a."gmv_SA(0.2)",
a."gmv_SA(0.3)",
a."gmv_SA(0.5)",
a."gmv_SA(0.6)",
a."gmv_SA(1.0)",
a."gmv_SA(2.0)",
b.lon,
b.lat

INTO gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans

FROM gmf.s_gmfdata_sim9p0_cszlockedtrans a
INNER JOIN sitemesh.s_sitemesh_sim9p0_cszlockedtrans b on a.site_id = b.site_id;

-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans ADD COLUMN geom geometry(Point,4326);
UPDATE gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans SET geom = st_setsrid(st_makepoint(lon,lat),4326);


-- create spatial index
CREATE INDEX gmfdata_sitemesh_sim9p0_cszlockedtrans_idx
ON gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans using GIST (geom);


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

-- attach assetID to gmfdata_sitemesh based on closest location -event 0
CREATE TABLE gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans_xref AS

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
--FROM exposure.canada_exposure a
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
	
FROM gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans
ORDER BY a.geom <-> geom
LIMIT 1
) AS b;

DROP TABLE IF EXISTS dsra.exposure_sim9p0_cszlockedtrans CASCADE;


-- add pkey
ALTER TABLE gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans_xref DROP CONSTRAINT IF EXISTS gmfdata_sitemesh_sim9p0_cszlockedtrans_xref_pkey;
ALTER TABLE gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans_xref ADD PRIMARY KEY("id");

-- create index
CREATE INDEX gmfdata_sitemesh_sim9p0_cszlockedtrans_xref_idx ON gmf.gmfdata_sitemesh_sim9p0_cszlockedtrans_xref (id);