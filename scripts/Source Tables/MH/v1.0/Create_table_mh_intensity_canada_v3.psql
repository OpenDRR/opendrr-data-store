
-- version 3 replaces previous version, methodology and data changes.  Name kept the same to keep scripts from running.
DROP TABLE IF EXISTS mh.mh_intensity_canada CASCADE;
/*
-- create table
CREATE TABLE mh.mh_intensity_canada(
    PRIMARY KEY(sauidt),
    sauidt varchar,
    lon float,
    lat float,
    pgv2500 float,
    pgv500 float,
    pga2500 float,
    pga500 float,
    vs30 float,
    mmi6 float,
    mmi7 float,
    mmi8 float,
    tsun500 float,
    fld200 float,
    fld500 float,
    fld1000 float,
    wildfire float,
    lndsus float,
    cy100 float,
    cy250 float,
    cy500 float,
    cy1000 float
);

-- import exposure from csv
COPY mh.mh_intensity_canada(sauidt,lon,lat,pgv2500,pgv500,pga2500,pga500,vs30,mmi6,mmi7,mmi8,tsun500,fld200,fld500,fld1000,wildfire,lndsus,cy100,cy250,cy500,cy1000)
    FROM 'D:\Workspace\data\source datasets\mh\hazard-intensity_sauid.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;
*/

-- create table
CREATE TABLE mh.mh_intensity_canada(
PRIMARY KEY(sauidt),
sauidt varchar,
sauidi integer,
lon float,
lat float,
pgv2500 float,
pgv500 float,
pga2500 float,
pga500 float,
vs30 float,
mmi6 float,
mmi7 float,
mmi8 float,
tsun500 float,
fld50_jrc float,
fld100_jrc float,
fld200_jrc float,
fld500_jrc float,
fld200_unep float,
fld500_unep float,
fld1000_unep float,
wildfire float,
wui_type varchar,
lndsus float,
cy100 float,
cy250 float,
cy500 float,
cy1000 float,
svlt_score integer

);

-- import exposure from csv
COPY mh.mh_intensity_canada(sauidt,sauidi,lon,lat,pgv2500,pgv500,pga2500,pga500,vs30,mmi6,mmi7,mmi8,tsun500,fld50_jrc,fld100_jrc,fld200_jrc,fld500_jrc,fld200_unep,fld500_unep,fld1000_unep,wildfire,wui_type,lndsus,cy100,cy250,
cy500,cy1000,svlt_score)
    FROM 'D:\Workspace\data\source datasets\mh\HTi_sauid_2021.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;

-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE mh.mh_intensity_canada ADD COLUMN geom geometry(Point,4326);
UPDATE mh.mh_intensity_canada SET geom = st_setsrid(st_makepoint(lon,lat),4326);

-- create index
CREATE INDEX IF NOT EXISTS mh_intensity_canada_idx ON mh.mh_intensity_canada using GIST(geom);
CREATE INDEX IF NOT EXISTS mh_intensity_canada_sauid_idx ON mh.mh_intensity_canada(sauidt);


/*
-- create table
CREATE TABLE mh.mh_intensity_canada(
    PRIMARY KEY(SAUIDt),
    OBJECTID float,
    SAUIDt varchar,
    lon float,
    lat float,
    PGV float,
    PGA float,
    Sa0p1 float,
    Sa0p3 float,
    Sa1p0 float,
    Sa2p0 float,
    Vs30 float,
    MMI6 float,
    MMI7 float,
    MMI8 float,
    Tsun_ha float,
    Fl200 float,
    Fl500 float,
    Fl1000 float,
    Fire float,
    Lndsus float,
    Cy100 float,
    Cy250 float,
    Cy500 float,
    Cy1000 float,
    PGVn float,
    MMI7n float,
    Tsun_n float,
    Fl500n float,
    Firen float,
    Lndn float,
    Cy500n float,
    MHn_TPGV float,
    MHn_TMMI7 float,
    MHIn_PGV float,
    MHIn_MMI7 float
);

-- import exposure from csv
COPY mh.mh_intensity_canada (OBJECTID, SAUIDt, lon, lat, PGV, PGA, Sa0p1, Sa0p3, Sa1p0, Sa2p0, Vs30, MMI6, MMI7, MMI8, Tsun_ha, Fl200, Fl500, Fl1000, Fire, Lndsus, Cy100, Cy250, Cy500, Cy1000, PGVn, MMI7n, Tsun_n, Fl500n, Firen, Lndn, Cy500n, MHn_TPGV, MHn_TMMI7, MHIn_PGV, MHIn_MMI7)

    FROM 'D:\workspace\data\human-settlement-national\mh_intensity_canada_04202020.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;

-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE mh.mh_intensity_canada ADD COLUMN geom geometry(Point,4326);
UPDATE mh.mh_intensity_canada SET geom = st_setsrid(st_makepoint(lon,lat),4326);

-- create spatial index
CREATE INDEX mh_intensity_canada_idx
ON mh.mh_intensity_canada using GIST (geom);



-- this table contains 460170 rows.  Reduce the empty sauid to 359129 by using physical exposure table.
SELECT sauid
INTO mh.valid_sauid_temp
FROM exposure.canada_exposure
GROUP BY sauid;


-- update table by deleting empty sauid values

DELETE FROM mh.mh_intensity_canada 
WHERE NOT EXISTS (SELECT NULL from mh.valid_sauid_temp a WHERE a.sauid = sauidt);


-- obtain min/max values FOR mh intensity calculations
DROP TABLE IF EXISTS mh.mh_intensity_canada_minmax CASCADE;

SELECT
MIN(pgv) AS "pgv_min",
MAX(pgv) AS "pgv_max",
MIN(pga) AS "pga_min",
MAX(pga) AS "pga_max",
MIN(mmi6) AS "mmi6_min",
MAX(mmi6) AS "mmi6_max",
MIN(mmi7) AS "mmi7_min",
MAX(mmi7) AS "mmi7_max",
MIN(mmi8) AS "mmi8_min",
MAX(mmi8) AS "mmi8_max",
MIN(tsun_ha) AS "tsun_min",
MAX(tsun_ha) AS "tsun_max",
MIN(fl200) AS "fl200_min",
MAX(fl200) AS "fl200_max",
MIN(fl500) AS "fl500_min",
MAX(fl500) AS "fl500_max",
MIN(fl1000) AS "fl1000_min",
MAX(fl1000) AS "fl1000_max",
MIN(lndsus) AS "lndsus_min",
MAX(lndsus) AS "lndsus_max",
MIN(fire) AS "fire_min",
MAX(fire) AS "fire_max",
MIN(cy100) AS "cy100_min",
MAX(cy100) AS "cy100_max",
MIN(cy250) AS "cy250_min",
MAX(cy250) AS "cy250_max",
MIN(cy500) AS "cy500_min",
MAX(cy500) AS "cy500_max",
MIN(cy1000) AS "cy1000_min",
MAX(cy1000) AS "cy1000_max"

INTO mh.mh_intensity_canada_minmax

FROM mh.mh_intensity_canada;


-- calculate mh_sum variable needed for mh threat tables
DROP TABLE IF EXISTS mh.mh_intensity_canada_mhsum;

SELECT 
a.sauidt,

COALESCE((a.pgv - (SELECT pgv_min FROM mh.mh_intensity_canada_minmax))/NULLIF((SELECT pgv_max FROM mh.mh_intensity_canada_minmax) - (SELECT pgv_min FROM mh.mh_intensity_canada_minmax),0),0) +
COALESCE((a.tsun_ha - (SELECT tsun_min FROM mh.mh_intensity_canada_minmax))/NULLIF((SELECT tsun_max FROM mh.mh_intensity_canada_minmax) - (SELECT tsun_min FROM mh.mh_intensity_canada_minmax),0),0) + 
COALESCE((a.fl500 - (SELECT fl500_min FROM mh.mh_intensity_canada_minmax))/NULLIF((SELECT fl500_max FROM mh.mh_intensity_canada_minmax) - (SELECT fl500_min FROM mh.mh_intensity_canada_minmax),0),0) +
COALESCE((a.fire - (SELECT fire_min FROM mh.mh_intensity_canada_minmax))/NULLIF((SELECT fire_max FROM mh.mh_intensity_canada_minmax) - (SELECT fire_min FROM mh.mh_intensity_canada_minmax),0),0) +
COALESCE((a.lndsus - (SELECT lndsus_min FROM mh.mh_intensity_canada_minmax))/NULLIF((SELECT lndsus_max FROM mh.mh_intensity_canada_minmax) - (SELECT lndsus_min FROM mh.mh_intensity_canada_minmax),0),0) +
COALESCE((a.cy500 - (SELECT cy500_min FROM mh.mh_intensity_canada_minmax))/NULLIF((SELECT cy500_max FROM mh.mh_intensity_canada_minmax) - (SELECT cy500_min FROM mh.mh_intensity_canada_minmax),0),0) AS "mh_sum"

INTO mh.mh_intensity_canada_mhsum

FROM mh.mh_intensity_canada a;


-- update min/max value table with mh_sum values
DROP TABLE IF EXISTS mh.mh_intensity_canada_mhsum_temp;
SELECT
MIN(mh_sum) AS "mhsum_min",
MAX(mh_sum) AS "mhsum_max"

INTO mh.mh_intensity_canada_mhsum_temp

FROM mh.mh_intensity_canada_mhsum;


ALTER TABLE mh.mh_intensity_canada_minmax 
ADD COLUMN mhsum_min float,
ADD COLUMN mhsum_max float;

UPDATE mh.mh_intensity_canada_minmax SET mhsum_min = (SELECT mhsum_min FROM mh.mh_intensity_canada_mhsum_temp);
UPDATE mh.mh_intensity_canada_minmax SET mhsum_max = (SELECT mhsum_max FROM mh.mh_intensity_canada_mhsum_temp);

DROP TABLE IF EXISTS mh.mh_intensity_canada_mhsum_temp, mh.valid_sauid_temp;
*/