-- script to generate hazard map mean
CREATE SCHEMA IF NOT EXISTS psra_{prov};

DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_uhs CASCADE;

-- create table
CREATE TABLE psra_{prov}.psra_{prov}_uhs(
lon float,
lat float,
"0.02_PGA" float,
"0.02_SA(0.1)" float,
"0.02_SA(0.2)" float,
"0.02_SA(0.3)" float,
"0.02_SA(0.5)" float,
"0.02_SA(0.6)" float,
"0.02_SA(1.0)" float,
"0.02_SA(10.0)" float,
"0.02_SA(2.0)" float,
"0.02_SA(5.0)" float,
"0.1_PGA" float,
"0.1_SA(0.1)" float,
"0.1_SA(0.2)" float,
"0.1_SA(0.3)" float,
"0.1_SA(0.5)" float,
"0.1_SA(0.6)" float,
"0.1_SA(1.0)" float,
"0.1_SA(10.0)" float,
"0.1_SA(2.0)" float,
"0.1_SA(5.0)" float

);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_uhs(lon,lat,"0.02_PGA","0.02_SA(0.1)","0.02_SA(0.2)","0.02_SA(0.3)","0.02_SA(0.5)","0.02_SA(0.6)","0.02_SA(1.0)","0.02_SA(10.0)",
"0.02_SA(2.0)","0.02_SA(5.0)","0.1_PGA","0.1_SA(0.1)","0.1_SA(0.2)","0.1_SA(0.3)","0.1_SA(0.5)","0.1_SA(0.6)","0.1_SA(1.0)","0.1_SA(10.0)","0.1_SA(2.0)",
"0.1_SA(5.0)" )
    FROM '/usr/src/app/cHazard/{prov}/cH_{prov}_uhs.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;