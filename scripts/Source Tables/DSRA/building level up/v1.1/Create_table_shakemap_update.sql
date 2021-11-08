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



-- create shakemap table and view
DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shakemap_tbl CASCADE;
CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shakemap_tbl AS
SELECT 
DISTINCT(a.site_id) AS "SiteID",
a.lon AS "Lon",
a.lat AS "Lat",
c."Rupture_Abbr" AS "sH_RupName",
d.magnitude AS "sH_Mag",
c."gmpe_Model" AS "sH_GMPE",
a.gmv_pga AS "sH_PGA",
a."gmv_SA(0.1)" AS "sH_Sa0p1",
a."gmv_SA(0.2)" AS "sH_Sa0p2",
a."gmv_SA(0.3)" AS "sH_Sa0p3",
a."gmv_SA(0.5)" AS "sH_Sa0p5",
a."gmv_SA(0.6)" AS "sH_Sa0p6",
a."gmv_SA(1.0)" AS "sH_Sa1p0",
a."gmv_SA(2.0)" AS "sH_Sa2p0",
a.geom

FROM gmf.shakemap_{eqScenario} a
LEFT JOIN gmf.shakemap_{eqScenario}_xref b ON a.site_id = b.site_id
LEFT JOIN dsra.dsra_{eqScenario} c ON b.id = c."AssetID"
LEFT JOIN ruptures.rupture_table d ON d.rupture_name = c."Rupture_Abbr"
WHERE a."gmv_SA(0.3)" >= 0.02;


-- update rupture, mag, gmpe information
DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shakemap_temp CASCADE;
CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shakemap_temp AS
SELECT
DISTINCT(a."Rupture_Abbr"),
b.magnitude,
a."gmpe_Model"

FROM dsra.dsra_{eqScenario} a
LEFT JOIN ruptures.rupture_table b ON a."Rupture_Abbr" = b.rupture_name;



UPDATE results_dsra_{eqScenario}.{eqScenario}_shakemap_tbl
SET "sH_RupName" = (SELECT "Rupture_Abbr" FROM results_dsra_{eqScenario}.{eqScenario}_shakemap_temp),
    "sH_Mag" = (SELECT magnitude FROM results_dsra_{eqScenario}.{eqScenario}_shakemap_temp),
    "sH_GMPE" = (SELECT "gmpe_Model" FROM results_dsra_{eqScenario}.{eqScenario}_shakemap_temp);


-- create indexes
CREATE INDEX IF NOT EXISTS dsra_{eqScenario}_siteid_idx ON results_dsra_{eqScenario}.{eqScenario}_shakemap_tbl("SiteID");
CREATE INDEX IF NOT EXISTS dsra_{eqScenario}_geom_dx ON results_dsra_{eqScenario}.{eqScenario}_shakemap_tbl USING GIST(geom);

DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shakemap_temp;

DROP VIEW IF EXISTS  results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap;
CREATE VIEW results_dsra_{eqScenario}.dsra_{eqScenario}_shakemap AS SELECT * FROM results_dsra_{eqScenario}.{eqScenario}_shakemap_tbl;
