-- create source oqbldgexp_p/t table
DROP TABLE IF EXISTS exposure.oqbldgexp_CA CASCADE;
CREATE TABLE exposure.oqbldgexp_CA(
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
"LandUse" varchar,
"GenOcc" varchar,
"OccClass" varchar,
"GenType" varchar,
"BldgType" varchar,
"BldEpoch" varchar,
"SSC_Zone" varchar,
"EqDesLev" varchar,
"SauidID" varchar,
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
COPY exposure.oqbldgexp_CA (id,lon,lat,taxonomy,number,structural,nonstructural,contents,retrofitting,day,night,transit,"LandUse","GenOcc","OccClass","GenType","BldgType","BldEpoch","SSC_Zone","EqDesLev","SauidID",sauid,dauid,adauid,fsauid,csduid,csdname,cduid,cdname,sac,eruid,ername,pruid,prname,ss_region,nation)
    FROM 'D:\Workspace\GitHub\openquake-inputs\exposure\general-building-stock\oqBldgExp_CA.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;

-- create temp file of incorrect ids with new fsauid
DROP TABLE IF EXISTS exposure.oqbldgexp_CA_update_fsa;
CREATE TABLE exposure.oqbldgexp_CA_update_fsa AS
(
SELECT  
a.id,
a.fsauid AS "fsauid_old",
b."CFSAUID" AS "fsauid_new"

FROM exposure.oqbldgexp_CA a
LEFT JOIN boundaries."Geometry_SAUID" b on a.sauid = b."SAUIDt"
WHERE a.fsauid <> b."CFSAUID"
);


-- update oqbldgexp_p/t table with correct fsauid values
UPDATE exposure.oqbldgexp_CA
SET fsauid = fsauid_new
FROM exposure.oqbldgexp_CA_update_fsa WHERE exposure.oqbldgexp_CA.id = exposure.oqbldgexp_CA_update_fsa.id;


-- drop temp file
DROP TABLE IF EXISTS exposure.oqbldgexp_CA_update_fsa;


-- export update to csv output
COPY (SELECT * FROM exposure.oqbldgexp_CA) TO 'D:\Workspace\GitHub\update_oqbldexp_pt\oqBldgExp_CA.csv' DELIMITER ',' CSV HEADER;