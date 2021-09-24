-- create table
CREATE TABLE psra_ns.psra_ns_avg_losses_stats_b0(
PRIMARY KEY(asset_id),
asset_id varchar,
"BldEpoch" varchar,
"BldgType" varchar,
"EqDesLev" varchar,
"GenOcc" varchar,
"GenType" varchar,
"LandUse" varchar,
"OccClass" varchar,
"SAC" varchar,
"SSC_Zone" varchar,
"SauidID" varchar,
adauid varchar,
cdname varchar,
cduid varchar,
csdname varchar,
csduid varchar,
dauid varchar,
ername varchar,
eruid varchar,
fsauid varchar,
prname varchar,
pruid varchar,
sauid varchar,
taxonomy varchar,
lon float,
lat float,
contents float,
nonstructural float,
occupants float,
structural float
);

-- import exposure from csv
COPY psra_ns.psra_ns_avg_losses_stats_b0(asset_id,"BldEpoch","BldgType","EqDesLev","GenOcc","GenType","LandUse","OccClass","SAC","SSC_Zone","SauidID",adauid,cdname,cduid,csdname,csduid,dauid,ername,eruid,fsauid,prname,pruid,sauid,taxonomy,lon,lat,contents,nonstructural,occupants,structural)
    FROM 'D:\Workspace\GitHub\canada-srm2-NS-only\ebRisk\NS\ebR_ns_avg_losses-stats_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;



-- create table
CREATE TABLE psra_ns.psra_ns_avg_losses_stats_r1(
PRIMARY KEY(asset_id),
asset_id varchar,
"BldEpoch" varchar,
"BldgType" varchar,
"EqDesLev" varchar,
"GenOcc" varchar,
"GenType" varchar,
"LandUse" varchar,
"OccClass" varchar,
"SAC" varchar,
"SSC_Zone" varchar,
"SauidID" varchar,
adauid varchar,
cdname varchar,
cduid varchar,
csdname varchar,
csduid varchar,
dauid varchar,
ername varchar,
eruid varchar,
fsauid varchar,
prname varchar,
pruid varchar,
sauid varchar,
taxonomy varchar,
lon float,
lat float,
contents float,
nonstructural float,
occupants float,
structural float
);

-- import exposure from csv
COPY psra_ns.psra_ns_avg_losses_stats_r1(asset_id,"BldEpoch","BldgType","EqDesLev","GenOcc","GenType","LandUse","OccClass","SAC","SSC_Zone","SauidID",adauid,cdname,cduid,csdname,csduid,dauid,ername,eruid,fsauid,prname,pruid,sauid,taxonomy,lon,lat,contents,nonstructural,occupants,structural)
    FROM 'D:\Workspace\GitHub\canada-srm2-NS-only\ebRisk\NS\ebR_ns_avg_losses-stats_r1.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;



-- combine b0 and r1 table
CREATE TABLE psra_ns.psra_ns_avg_losses_stats AS
(SELECT
a.asset_id,
a."BldEpoch",
a."BldgType",
a."EqDesLev",
a."GenOcc",
a."GenType",
a."LandUse",
a."OccClass",
a."SAC",
a."SSC_Zone",
a."SauidID",
a.adauid,
a.cdname,
a.cduid,
a.csdname,
a.csduid,
a.dauid,
a.ername,
a.eruid,
a.fsauid,
a.prname,
a.pruid,
a.sauid,
a.taxonomy,
a.lon,
a.lat,
a.contents AS "contents_b0",
a.nonstructural AS "nonstructural_b0",
a.structural AS "structural_b0",
a.occupants AS "occupants_b0",
b.contents AS "contents_r1",
b.nonstructural AS "nonstructural_r1",
b.structural AS "structural_r1",
b.occupants AS "occupants_r1"

FROM psra_ns.psra_ns_avg_losses_stats_b0 a
INNER JOIN psra_ns.psra_ns_avg_losses_stats_r1 b ON a.asset_id = b.asset_id);

DROP TABLE IF EXISTS psra_ns.psra_ns_avg_losses_stats_b0, psra_ns.psra_ns_avg_losses_stats_r1;