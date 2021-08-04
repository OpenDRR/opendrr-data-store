/*
-- script to generate source bldgexpref_ca_master_v3px table

DROP TABLE IF EXISTS exposure.bldgexpref_ca_master_v3p2 CASCADE;

-- create table
CREATE TABLE exposure.bldgexpref_ca_master_v3p2(
    PRIMARY KEY (id),
    objectid varchar,
    id varchar,
    SauidLat float,
    SauidLon float,
    Sauid_km2 float,
    Sauid_ha float,
    LandUse varchar,
    taxonomy varchar,
    number float,
    structural float,
    nonstructural float,
    contents float,
    retrofitting float,
    day float,
    night float,
    transit float,
    GenOcc varchar,
    OccClass1 varchar,
    OccClass2 varchar,
    PopDU float,
    GenType varchar,
    BldgType varchar,
    NumFloors float,
    Bldg_ft2 float,
    BldYear float,
    BldEpoch varchar,
    SSC_Zone varchar,
    EqDesLev varchar,
    sauid varchar,
    dauid varchar,
    adauid varchar,
    fsauid varchar,
    csduid varchar,
    csdname varchar,
    cduid varchar,
    cdname varchar,
    SAC varchar,
    eruid varchar,
    ername varchar,
    pruid varchar,
    prname varchar,
    ss_region varchar,
    nation varchar
);

-- import exposure from csv (v3p1 data)
COPY exposure.bldgexpref_ca_master_v3p2 (objectid,id,SauidLat,SauidLon,Sauid_km2,Sauid_ha,LandUse,taxonomy,number,structural,nonstructural,contents,retrofitting,day,night,transit,GenOcc,OccClass1,OccClass2,PopDU,GenType,BldgType,NumFloors,Bldg_ft2,BldYear,BldEpoch,SSC_Zone,EqDesLev,sauid,dauid,adauid,fsauid,csduid,csdname,cduid,cdname,SAC,eruid,ername,pruid,prname)
    FROM 'D:\workspace\data\source datasets\exposure\BldgExpRef_CA_master_v3p1_04282021.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;



-- add geometries field to enable PostGIS (WGS1984 SRID = 4326)
ALTER TABLE exposure.canada_exposure ADD COLUMN geom geometry(Point,4326);
UPDATE exposure.canada_exposure SET geom = st_setsrid(st_makepoint(SauidLon,SauidLat),4326);

-- create spatial index
CREATE INDEX canada_exposure_idx
ON exposure.canada_exposure using GIST (geom);


--remove trailing space from 'manufactured ' in gentype
UPDATE exposure.bldgexpref_ca_master_v3p2 
SET gentype = REPLACE(gentype,'Manufactured ','Manufactured')
WHERE gentype = 'Manufactured ';

-- create source oqbldgexp_ca table
DROP TABLE IF EXISTS exposure.oqbldgexp_ca CASCADE;
CREATE TABLE exposure.oqbldgexp_ca(
id varchar,
lon float,
lat float,
taxonomy varchar,
number float,
structural float,
nonstructural float,
contents float,
retrofitting float,
day float,
night float,
transit float,
landuse varchar,
genocc varchar,
occclass varchar,
gentype varchar,
bldgtype varchar,
bldepoch varchar,
ssc_zone varchar,
eqdeslev varchar,
sauidid varchar,
sauid varchar,
dauid varchar,
adauid varchar,
fsauid varchar,
csduid varchar,
csdname varchar,
cduid varchar,
cdname varchar,
sac varchar,
eruid varchar,
ername varchar,
pruid varchar,
prname varchar,
ss_region varchar,
nation varchar
);

-- import exposure from csv
COPY exposure.oqbldgexp_ca (id,lon,lat,taxonomy,number,structural,nonstructural,contents,retrofitting,day,night,transit,landuse,genocc,occclass,gentype,bldgtype,bldepoch,ssc_zone,eqdeslev,sauidid,sauid,dauid,adauid,fsauid,csduid,csdname,cduid,cdname,sac,eruid,ername,pruid,prname,ss_region,nation)
    FROM 'D:\workspace\data\source datasets\exposure\oqBldgExp_CA_04282021.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;


-- create view to join new columns / exposure values from oqbldgexp_ca to bldgexpref_ca_master_v3px view
DROP VIEW IF EXISTS exposure.bldgexpref_ca_master_v3p2_view;
CREATE VIEW exposure.bldgexpref_ca_master_v3p2_view AS
SELECT 
a.objectid,
a.id,
a.sauidlat AS "SauidLat",
a.sauidlon AS "SauidLon",
a.sauid_km2 AS "Sauid_km2",
a.sauid_ha AS "Sauid_ha",
b.landuse AS "LandUse",
b.taxonomy AS "taxonomy",
b.number,
b.structural,
b.nonstructural,
b.contents,
b.retrofitting,
b.day,
b.night,
b.transit,
b.genocc AS "GenOcc",
a.occclass1 AS "OccClass1",
a.occclass2 AS "OccClass2",
a.popdu AS "PopDU",
b.gentype AS "GenType",
b.bldgtype AS "BldgType",
a.numfloors AS "NumFloors",
a.Bldg_ft2 AS "Bldg_ft2",
a.bldyear AS "BldYear",
b.bldepoch AS "BldEpoch",
b.ssc_zone AS "SSC_Zone",
b.eqdeslev AS "EqDesLev",
b.sauid,
b.dauid,
b.adauid,
b.fsauid,
b.csduid,
b.csdname,
b.cduid,
b.cdname,
b.sac AS "SAC",
b.eruid,
b.ername,
b.pruid,
b.prname,
b.ss_region AS "SS_Region",
b.nation

FROM exposure.bldgexpref_ca_master_v3p2 a
INNER JOIN exposure.oqbldgexp_ca b ON a.id = b.id;


-- copy to csv
COPY (SELECT * FROM exposure.bldgexpref_ca_master_v3p2_view) TO 'D:\Workspace\data\source datasets\exposure\BldgExpRef_CA_master_v3p2.csv' DELIMITER ',' CSV HEADER;
*/





-- update sauid_km2, sauid_ha from geometry sauid
-- script to generate source bldgexpref_ca_master_v3px table
DROP TABLE IF EXISTS exposure.bldgexpref_ca_master_v3p2 CASCADE;

-- create table
CREATE TABLE exposure.bldgexpref_ca_master_v3p2(
    PRIMARY KEY (id),
    objectid varchar,
    id varchar,
    SauidLat float,
    SauidLon float,
    Sauid_km2 float,
    Sauid_ha float,
    LandUse varchar,
    taxonomy varchar,
    number float,
    structural float,
    nonstructural float,
    contents float,
    retrofitting float,
    day float,
    night float,
    transit float,
    GenOcc varchar,
	OccType varchar,
    OccClass1 varchar,
    OccClass2 varchar,
    PopDU float,
    GenType varchar,
    BldgType varchar,
    NumFloors float,
    Bldg_ft2 float,
    BldYear float,
    BldEpoch varchar,
    SSC_Zone varchar,
    EqDesLev varchar,
    sauid varchar,
    dauid varchar,
    adauid varchar,
    fsauid varchar,
    csduid varchar,
    csdname varchar,
    cduid varchar,
    cdname varchar,
    SAC varchar,
    eruid varchar,
    ername varchar,
    pruid varchar,
    prname varchar,
    ss_region varchar,
    nation varchar
);

-- import exposure from csv (v3p2 data)
COPY exposure.bldgexpref_ca_master_v3p2 (objectid,id,SauidLat,SauidLon,Sauid_km2,Sauid_ha,LandUse,taxonomy,number,structural,nonstructural,contents,retrofitting,day,night,transit,GenOcc,OccType,OccClass1,OccClass2,PopDU,GenType,BldgType,NumFloors,Bldg_ft2,BldYear,BldEpoch,SSC_Zone,EqDesLev,sauid,dauid,adauid,fsauid,csduid,csdname,cduid,cdname,SAC,eruid,ername,pruid,prname,ss_region,nation)
    FROM 'D:\Workspace\GitHub\openquake-inputs\exposure\general-building-stock\BldgExpRef_CA_master_v3p2.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;


DROP VIEW IF EXISTS exposure.bldgexpref_ca_master_v3p2_view;
CREATE VIEW exposure.bldgexpref_ca_master_v3p2_view AS
SELECT 
a.objectid,
a.id,
a.sauidlat AS "SauidLat",
a.sauidlon AS "SauidLon",
b."Area_km2" AS "Sauid_km2",
b."Area_ha" AS "Sauid_ha",
a.landuse AS "LandUse",
a.taxonomy AS "taxonomy",
a.number,
a.structural,
a.nonstructural,
a.contents,
a.retrofitting,
a.day,
a.night,
a.transit,
a.genocc AS "GenOcc",
a.OccType AS "OccType",
a.occclass1 AS "OccClass1",
a.occclass2 AS "OccClass2",
a.popdu AS "PopDU",
a.gentype AS "GenType",
a.bldgtype AS "BldgType",
a.numfloors AS "NumFloors",
a.Bldg_ft2 AS "Bldg_ft2",
a.bldyear AS "BldYear",
a.bldepoch AS "BldEpoch",
a.ssc_zone AS "SSC_Zone",
a.eqdeslev AS "EqDesLev",
a.sauid,
a.dauid,
a.adauid,
a.fsauid,
a.csduid,
a.csdname,
a.cduid,
a.cdname,
a.sac AS "SAC",
a.eruid,
a.ername,
a.pruid,
a.prname,
a.ss_region AS "SS_Region",
a.nation

FROM exposure.bldgexpref_ca_master_v3p2 a
LEFT JOIN boundaries."Geometry_SAUID" b ON a.sauid = b."SAUIDt";

-- copy to csv
COPY (SELECT * FROM exposure.bldgexpref_ca_master_v3p2_view) TO 'D:\Workspace\data\source datasets\exposure\BldgExpRef_CA_master_v3p2.csv' DELIMITER ',' CSV HEADER;