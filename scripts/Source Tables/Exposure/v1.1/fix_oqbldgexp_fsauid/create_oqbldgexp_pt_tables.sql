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
COPY exposure.oqbldgexp_ca (id,lon,lat,taxonomy,number,structural,nonstructural,contents,retrofitting,day,night,transit,"LandUse","GenOcc","OccClass","GenType","BldgType","BldEpoch","SSC_Zone","EqDesLev","SauidID",sauid,dauid,adauid,fsauid,csduid,csdname,cduid,cdname,sac,eruid,ername,pruid,prname,ss_region,nation)
    FROM 'D:\Workspace\GitHub\openquake-inputs\exposure\general-building-stock\oqBldgExp_CA.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;


-- create source oqbldgexp_ab table
DROP TABLE IF EXISTS exposure.oqbldgexp_ab CASCADE;
CREATE TABLE exposure.oqbldgexp_ab(
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
);

-- import exposure from csv
COPY exposure.oqbldgexp_ab (id,lon,lat,taxonomy,number,structural,nonstructural,contents,retrofitting,day,night,transit,"LandUse","GenOcc","OccClass","GenType","BldgType","BldEpoch","SSC_Zone","EqDesLev","SauidID",sauid,dauid,adauid,fsauid,csduid,csdname,cduid,cdname,sac,eruid,ername,pruid,prname,ss_region,nation)
    FROM 'D:\Workspace\GitHub\openquake-inputs\exposure\general-building-stock\oqBldgExp_AB.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;


-- create source oqbldgexp_ab4810_20 table
DROP TABLE IF EXISTS exposure.oqbldgexp_ab4810_20 CASCADE;
CREATE TABLE exposure.oqbldgexp_ab4810_20(
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
);

-- import exposure from csv
COPY exposure.oqbldgexp_ab4810_20 (id,lon,lat,taxonomy,number,structural,nonstructural,contents,retrofitting,day,night,transit,"LandUse","GenOcc","OccClass","GenType","BldgType","BldEpoch","SSC_Zone","EqDesLev","SauidID",sauid,dauid,adauid,fsauid,csduid,csdname,cduid,cdname,sac,eruid,ername,pruid,prname,ss_region,nation)
    FROM 'D:\Workspace\GitHub\openquake-inputs\exposure\general-building-stock\oqBldgExp_AB4810-20.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;