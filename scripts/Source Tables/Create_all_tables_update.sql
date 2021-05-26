-- update tables in one script

/* Create_table_canada_exposure.psql */
-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE exposure.canada_exposure ADD COLUMN geom geometry(Point,4326);
UPDATE exposure.canada_exposure SET geom = st_setsrid(st_makepoint(SauidLon,SauidLat),4326);

-- create spatial index
CREATE INDEX canada_exposure_idx
ON exposure.canada_exposure using GIST (geom);

--remove trailing space from 'manufactured ' in gentype
UPDATE exposure.canada_exposure 
SET gentype = REPLACE(gentype,'Manufactured ','Manufactured')
WHERE gentype = 'Manufactured '



/*Create_table_canada_site_exposure_ste.sql */
-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE exposure.metrovan_site_exposure ADD COLUMN geom_site geometry(Point,4326);
UPDATE exposure.metrovan_site_exposure SET geom_site = st_setsrid(st_makepoint(sitelon,sitelat),4326);

-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE exposure.metrovan_site_exposure ADD COLUMN geom_sauid geometry(Point,4326);
UPDATE exposure.metrovan_site_exposure SET geom_sauid = st_setsrid(st_makepoint(sauidlon,sauidlat),4326);

-- create spatial index
CREATE INDEX metrovan_site_exposure_idx
ON exposure.metrovan_site_exposure using GIST (geom_site,geom_sauid);

-- drop columns that are not needed
ALTER TABLE exposure.metrovan_site_exposure
DROP COLUMN objectid_1,
DROP COLUMN objectid_12,
DROP COLUMN sauidt,
DROP COLUMN sauidi,
DROP COLUMN lon,
DROP COLUMN lat,
DROP COLUMN area_km2,
DROP COLUMN area_ha,
DROP COLUMN dauidt,
DROP COLUMN dauidi,
DROP COLUMN adauid_1,
DROP COLUMN cfsauid,
DROP COLUMN pruid_1,
DROP COLUMN prname_1,
DROP COLUMN csduid_1,
DROP COLUMN csdname_1,
DROP COLUMN csdtype,
DROP COLUMN cduid_1,
DROP COLUMN cdname_1,
DROP COLUMN cdtype,
DROP COLUMN ccsuid,
DROP COLUMN ccsname,
DROP COLUMN eruid_1,
DROP COLUMN ername_1,
DROP COLUMN saccode,
DROP COLUMN sactype,
DROP COLUMN cmauid,
DROP COLUMN cmapuid,
DROP COLUMN cmaname,
DROP COLUMN cmatype,
DROP COLUMN shape_leng,
DROP COLUMN shape_length,
DROP COLUMN shape_area;



/* Create_site_exposure_to_building_and_sauid.sql */
-- script to generate building level exposure from site level
DROP TABLE IF EXISTS exposure.metrovan_building_exposure,exposure.metrovan_site_exposure_id_building,exposure.metrovan_building_exposure_temp,exposure.metrovan_sauid_exposure CASCADE;

CREATE TABLE exposure.metrovan_building_exposure AS (
SELECT sauid,
sauidid,
sauidlat,
sauidlon,
sauid_km2,
sauid_ha,
landuse,
taxonomy,
SUM(number) AS "number",
SUM(structural) AS "structural",
SUM(nonstructural) AS "nonstructural",
SUM(contents) AS "contents",
business,
"limit",
deductible,
AVG(retrofitting) AS "retrofitting",
SUM(day) AS "day",
SUM(night) AS "night",
SUM(transit) AS "transit",
genocc,
occclass1,
occclass2,
AVG(popdu) AS "popdu",
gentype,
bldgtype,
ROUND(AVG(numfloors)) AS "numfloors",
SUM(bldg_ft2) AS "bldg_ft2",
ROUND(AVG(bldyear)) AS "bldyear",
bldepoch,
ssc_zone,
eqdeslev,
dauid,
adauid,
fsauid,
csduid,
csdname,
cduid,
cdname,
sac,
eruid,
ername,
pruid,
prname,
st_centroid(st_union(geom_site)) AS "geom_site"

FROM exposure.metrovan_site_exposure
GROUP BY sauid,sauidid,sauidlat,sauidlon,sauid_km2,sauid_ha,landuse,taxonomy,business,"limit",deductible,genocc,occclass1,occclass2,gentype,bldgtype,bldepoch,ssc_zone,
eqdeslev,dauid,adauid,fsauid,csduid,csdname,cduid,cdname,sac,eruid,ername,pruid,prname
ORDER BY sauid,taxonomy ASC);

-- create spatial index
CREATE INDEX metrovan_building_exposure_idx
ON exposure.metrovan_building_exposure USING GIST (geom_site);

-- add missing columns
ALTER TABLE exposure.metrovan_building_exposure
ADD COLUMN id varchar,
ADD COLUMN rowid int,
ADD COLUMN objid serial;

-- create new id from rowid / taxonomy
UPDATE exposure.metrovan_building_exposure
SET id = sauid||'-'||taxonomy;

-- create temp table to create partition by id
SELECT id,
objid,
ROW_NUMBER() OVER(PARTITION BY id) as rowid

INTO exposure.metrovan_building_exposure_temp

FROM exposure.metrovan_building_exposure;

-- update rowid to site level aggegrate table
UPDATE exposure.metrovan_building_exposure t1
SET  rowid = t2.rowid
FROM exposure.metrovan_building_exposure_temp t2
WHERE t1.id = t2.id AND t1.objid = t2.objid;

DROP TABLE IF EXISTS exposure.metrovan_building_exposure_temp;

-- update id to incorporate rowid
UPDATE exposure.metrovan_building_exposure
SET id = rowid||'-'||id;

-- add PK
ALTER TABLE exposure.metrovan_building_exposure ADD PRIMARY KEY(id);

-- create temp table to reference newly generated id at the building level exposure to site level exposure for aggregation
CREATE TABLE exposure.metrovan_site_exposure_id_building AS (
SELECT a.id,
b.id AS "id_building",
a.sauid,
a.landuse,
a.taxonomy,
--a.business,
--a."limit",
--a.deductable
a.genocc,
a.occclass1,
a.occclass2,
a.gentype,
a.bldgtype,
a.bldepoch,
a.ssc_zone,
a.eqdeslev,
a.dauid,
a.adauid,
a.fsauid,
a.csduid,
a.csdname,
a.cduid,
a.cdname,
a.sac,
a.eruid,
a.ername,
a.pruid,
a.prname
from exposure.metrovan_site_exposure a
LEFT JOIN exposure.metrovan_building_exposure b ON a.sauid = b.sauid 
AND a.sauidid = b.sauidid 
AND a.sauidlat = b.sauidlat 
AND a.sauidlon = b.sauidlon
AND a.sauid_km2 = b.sauid_km2 
AND a.sauid_ha = b.sauid_ha 
AND a.landuse = b.landuse 
AND a.taxonomy = b.taxonomy 
--AND a.business = b.business 
--AND a."limit" = b."limit"
--AND a.deductible = b.deductible 
AND a.genocc = b.genocc 
AND a.occclass1 = b.occclass1
AND a.occclass2 = b.occclass2
AND a.gentype = b.gentype
AND a.bldgtype = b.bldgtype
AND a.bldepoch = b.bldepoch
AND a.ssc_zone = b.ssc_zone
AND a.eqdeslev = b.eqdeslev
AND a.dauid = b.dauid
AND a.adauid = b.adauid
AND a.fsauid = b.fsauid
AND a.csduid = b.csduid
AND a.cduid = b.cduid
AND a.sac = b.sac
AND a.eruid = b.eruid
AND a.pruid = b.pruid

ORDER BY a.sauid ASC);

-- add id_building column to site level for aggregation to building level
ALTER TABLE exposure.metrovan_site_exposure
ADD COLUMN IF NOT EXISTS id_building varchar;

-- update id_building column
UPDATE exposure.metrovan_site_exposure t1
SET id_building = t2.id_building
FROM exposure.metrovan_site_exposure_id_building t2
WHERE t1.id = t2.id;

DROP TABLE IF EXISTS exposure.metrovan_site_exposure_id_building CASCADE;

-- aggregate exposure to sauid level
CREATE TABLE exposure.metrovan_sauid_exposure AS (
SELECT sauid,
sauidlat,
sauidlon,
SUM(number) AS "number",
SUM(structural) AS "structural",
SUM(nonstructural) AS "nonstructural",
SUM(contents) AS "contents",
AVG(retrofitting) AS "retrofitting",
SUM(day) AS "day",
SUM(night) AS "night",
SUM(transit) AS "transit",
AVG(popdu) AS "popdu",
ROUND(AVG(numfloors)) AS "numfloors",
SUM(bldg_ft2) AS "bldg_ft2",
ROUND(AVG(bldyear)) AS "bldyear",
st_centroid(st_union(geom_site)) AS "geom_site"

FROM exposure.metrovan_building_exposure
GROUP BY sauid,sauidlat,sauidlon);



/* Create_table_vs_30_CAN_site_model.sql */
-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE vs30.vs30_can_site_model ADD COLUMN geom geometry(Point,4326);
UPDATE vs30.vs30_can_site_model SET geom = st_setsrid(st_makepoint(lon,lat),4326);

-- create spatial index
CREATE INDEX vs30_can_site_model_idx
ON vs30.vs30_can_site_model using GIST (geom);`



/* Create_table_vs_30_BC_CAN_model_update_site_exposure.sql */
DROP TABLE IF EXISTS vs30.vs30_can_site_model_metrovan_site_exposure_xref,vs30.vs30_can_site_model_metrovan_building_exposure_xref,vs30.vs30_can_site_model_metrovan_sauid_exposure_xref CASCADE;

-- attach vs30 value to assetid based on closest location site level exposure
CREATE TABLE vs30.vs30_can_site_model_metrovan_site_exposure_xref AS
SELECT
a.id,
a.sitelon AS "asset_lon",
a.sitelat AS "asset_lat",
b.vs30,
b.z1pt0,
b.z2pt5,
b.lon AS "vs_lon",
b.lat AS "vs_lat",
ST_Distance(a.geom_site,b.geom) AS "distance"

FROM exposure.metrovan_site_exposure a
CROSS JOIN LATERAL 
(
SELECT vs30,
	z1pt0,
	z2pt5,
	geom,
	lon,
	lat
FROM vs30.vs30_can_site_model
ORDER BY a.geom_site <-> geom
LIMIT 1
) AS b;

-- attach vs30 value to assetid based on closest location building level exposure
CREATE TABLE vs30.vs30_can_site_model_metrovan_building_exposure_xref AS
SELECT
a.id,
a.sauidlon AS "asset_lon",
a.sauidlat AS "asset_lat",
b.vs30,
b.z1pt0,
b.z2pt5,
b.lon AS "vs_lon",
b.lat AS "vs_lat",
ST_Distance(a.geom_site,b.geom) AS "distance"

FROM exposure.metrovan_building_exposure a
CROSS JOIN LATERAL 
(
SELECT vs30,
	z1pt0,
	z2pt5,
	geom,
	lon,
	lat
FROM vs30.vs30_can_site_model
ORDER BY a.geom_site <-> geom
LIMIT 1
) AS b;

-- attach vs30 value to assetid based on closest location building level exposure
CREATE TABLE vs30.vs30_can_site_model_metrovan_sauid_exposure_xref AS
SELECT
a.sauid,
a.sauidlon AS "asset_lon",
a.sauidlat AS "asset_lat",
b.vs30,
b.z1pt0,
b.z2pt5,
b.lon AS "vs_lon",
b.lat AS "vs_lat",
ST_Distance(a.geom_site,b.geom) AS "distance"

FROM exposure.metrovan_sauid_exposure a
CROSS JOIN LATERAL 
(
SELECT vs30,
	z1pt0,
	z2pt5,
	geom,
	lon,
	lat
FROM vs30.vs30_can_site_model
ORDER BY a.geom_site <-> geom
LIMIT 1
) AS b;


/* Create_table_shakemap_update.sql */


/* Create_table_shakemap_update_ste.sql */



/* Create_table_2016_census_v3.sql */
-- create index
CREATE INDEX census_2016_canada_idx ON census.census_2016_canada (sauidt);



/* Create_table_sovi_index_canada_v2.sql */
-- create index
CREATE INDEX sovi_index_canada_idx ON sovi.sovi_index_canada(sauidt);



/* Create_table_sovi_census_canada.sql */
CREATE INDEX sovi_census_canada_idx ON sovi.sovi_census_canada(sauidt);



/* placeholder for Create_table_sovi_thresholds.psql */
