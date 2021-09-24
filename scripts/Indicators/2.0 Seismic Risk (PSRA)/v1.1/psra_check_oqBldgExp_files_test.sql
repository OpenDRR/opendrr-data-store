-- create source oqbldgexp_p/t table
DROP TABLE IF EXISTS exposure.oqbldgexp_ON3530B CASCADE;
CREATE TABLE exposure.oqbldgexp_ON3530B(
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
"SAC" varchar,
eruid varchar,
ername varchar,
pruid varchar,
prname varchar
);

-- import exposure from csv
COPY exposure.oqbldgexp_ON3530B (id,lon,lat,taxonomy,number,structural,nonstructural,contents,retrofitting,day,night,transit,"LandUse","GenOcc","OccClass","GenType","BldgType","BldEpoch","SSC_Zone","EqDesLev","SauidID",sauid,dauid,adauid,fsauid,csduid,csdname,cduid,cdname,"SAC",eruid,ername,pruid,prname)
    FROM 'D:\Workspace\GitHub\openquake-inputs\exposure\general-building-stock\oqBldgExp_ON3530B.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;


DROP VIEW IF EXISTS exposure.oqbldgexp_bc5920a_csd CASCADE;
CREATE VIEW exposure.oqbldgexp_bc5920a_csd AS
(
SELECT 
a.csduid,
SUM(day) AS "day",
b.geom
FROM exposure.oqbldgexp_bc5920a a
LEFT JOIN boundaries."Geometry_CSDUID" b ON a.csduid = b."CSDUID"
GROUP BY a.csduid,b.geom
);


DROP VIEW IF EXISTS exposure.oqbldgexp_bc5920b_csd CASCADE;
CREATE VIEW exposure.oqbldgexp_bc5920b_csd AS
(
SELECT 
a.csduid,
SUM(day) AS "day",
b.geom
FROM exposure.oqbldgexp_bc5920b a
LEFT JOIN boundaries."Geometry_CSDUID" b ON a.csduid = b."CSDUID"
GROUP BY a.csduid,b.geom
);

DROP VIEW IF EXISTS exposure.oqbldgexp_on3530a_csd CASCADE;
CREATE VIEW exposure.oqbldgexp_on3530a_csd AS
(
SELECT 
a.csduid,
SUM(day) AS "day",
b.geom
FROM exposure.oqbldgexp_on3530a a
LEFT JOIN boundaries."Geometry_CSDUID" b ON a.csduid = b."CSDUID"
GROUP BY a.csduid,b.geom
);


DROP VIEW IF EXISTS exposure.oqbldgexp_on3530b_csd CASCADE;
CREATE VIEW exposure.oqbldgexp_on3530b_csd AS
(
SELECT 
a.csduid,
SUM(day) AS "day",
b.geom
FROM exposure.oqbldgexp_on3530b a
LEFT JOIN boundaries."Geometry_CSDUID" b ON a.csduid = b."CSDUID"
GROUP BY a.csduid,b.geom
);
