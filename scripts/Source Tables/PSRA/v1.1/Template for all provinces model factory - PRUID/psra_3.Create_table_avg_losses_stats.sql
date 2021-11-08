-- script to agg losses stats
DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_avg_losses_stats_b0, psra_{prov}.psra_{prov}_avg_losses_stats_r1, psra_{prov}.psra_{prov}_avg_losses_stats CASCADE;

-- create table
CREATE TABLE psra_{prov}.psra_{prov}_avg_losses_stats_b0(
PRIMARY KEY(asset_id),
asset_id varchar,
"BldEpoch" varchar,
"BldgType" varchar,
"EqDesLev" varchar,
"GenOcc" varchar,
"GenType" varchar,
"LandUse" varchar,
"OccClass" varchar,
"OccType" varchar,
"SAC" varchar,
"SSC_Zone" varchar,
--"SauidID" varchar,
"SS_Region" varchar,
"Sauid_km2" float,
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
COPY psra_{prov}.psra_{prov}_avg_losses_stats_b0(asset_id,"BldEpoch","BldgType","EqDesLev","GenOcc","GenType","LandUse","OccClass","OccType","SAC","SSC_Zone","SS_Region","Sauid_km2",adauid,cdname,cduid,csdname,csduid,dauid,ername,eruid,fsauid,prname,pruid,sauid,taxonomy,lon,lat,contents,nonstructural,occupants,structural)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_avg_losses-stats_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV ;



-- create table
CREATE TABLE psra_{prov}.psra_{prov}_avg_losses_stats_r1(
PRIMARY KEY(asset_id),
asset_id varchar,
"BldEpoch" varchar,
"BldgType" varchar,
"EqDesLev" varchar,
"GenOcc" varchar,
"GenType" varchar,
"LandUse" varchar,
"OccClass" varchar,
"OccType" varchar,
"SAC" varchar,
"SSC_Zone" varchar,
--"SauidID" varchar,
"SS_Region" varchar,
"Sauid_km2" float,
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
COPY psra_{prov}.psra_{prov}_avg_losses_stats_r1(asset_id,"BldEpoch","BldgType","EqDesLev","GenOcc","GenType","LandUse","OccClass","OccType","SAC","SSC_Zone","SS_Region","Sauid_km2",adauid,cdname,cduid,csdname,csduid,dauid,ername,eruid,fsauid,prname,pruid,sauid,taxonomy,lon,lat,contents,nonstructural,occupants,structural)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_avg_losses-stats_r1.csv'
        WITH 
          DELIMITER AS ','
          CSV ;


-- combine b0 and r1 table
CREATE TABLE psra_{prov}.psra_{prov}_avg_losses_stats AS
(SELECT
a.asset_id,
a."BldEpoch",
a."BldgType",
a."EqDesLev",
a."GenOcc",
a."GenType",
a."LandUse",
a."OccClass",
a."OccType",
a."SAC",
a."SSC_Zone",
--a."SauidID",
a."SS_Region",
a."Sauid_km2",
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
b.occupants AS "occupants_b0"

FROM psra_{prov}.psra_{prov}_avg_losses_stats_b0 a
INNER JOIN psra_{prov}.psra_{prov}_avg_losses_stats_r1 b ON a.asset_id = b.asset_id);

DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_avg_losses_stats_b0, psra_{prov}.psra_{prov}_avg_losses_stats_r1;