-- sql to support finance, aggregate building number values to agg_curves_stats_ca_2015 table
-- create table
DROP TABLE IF EXISTS finance.agg_curves_stats_ca_2015 CASCADE;
CREATE TABLE finance.agg_curves_stats_ca_2015(
return_period varchar,
stat varchar,
loss_type varchar,
csduid varchar,
"GenOcc" varchar,
"EqBldgType" varchar,
loss_value float,
loss_ratio float,
annual_frequency_of_exceedence float,
"CSDNAME" varchar,
"PRNAME" varchar,
"CDNAME" varchar,
"CCSNAME" varchar,
"ERNAME" varchar,
"SACCODE" varchar,
"SACTYPE" varchar
);

-- import exposure from csv
COPY finance.agg_curves_stats_ca_2015(return_period,stat,loss_type,csduid,"GenOcc","EqBldgType",loss_value,loss_ratio,annual_frequency_of_exceedence,"CSDNAME","PRNAME",
									 "CDNAME","CCSNAME","ERNAME","SACCODE","SACTYPE")
    FROM 'D:\Workspace\data\agg_curves_stats_ca_2015.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER;


-- create agg table from exposure, group by csduid, genocc, bldgtype
DROP TABLE IF EXISTS finance.exposure_agg_csd CASCADE;
CREATE TABLE finance.exposure_agg_csd AS
(
SELECT
csduid,
genocc,
bldgtype,
SUM(number) AS "building_total"
from exposure.canada_exposure
GROUP BY csduid,genocc,bldgtype
);


-- create new table
DROP TABLE IF EXISTS finance.agg_curves_stats_ca_2015_bldgnum CASCADE;
CREATE TABLE finance.agg_curves_stats_ca_2015_bldgnum AS
(
SELECT 
a.return_period,
a.stat,
a.loss_type,
a.csduid,
a."GenOcc",
a."EqBldgType",
b.building_total,
a.loss_value,
a.loss_ratio,
a.annual_frequency_of_exceedence,
a."CSDNAME",
a."PRNAME",
a."CDNAME",
a."CCSNAME",
a."ERNAME",
a."SACCODE",
a."SACTYPE"

FROM finance.agg_curves_stats_ca_2015 a
LEFT JOIN finance.exposure_agg_csd b ON a.csduid = b.csduid AND a."GenOcc" = b.genocc AND a."EqBldgType" = b.bldgtype
);

-- update null building values to 0
UPDATE finance.agg_curves_stats_ca_2015_bldgnum
SET building_total = 0 WHERE building_total IS NULL;

