-- script to agg curves stats

DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_curves_q05_b0, psra_{prov}.psra_{prov}_agg_curves_q05_r1, psra_{prov}.psra_{prov}_agg_curves_q05 CASCADE;
-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_curves_q05_b0(
return_period varchar,
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
loss_ratio float,
annual_frequency_of_exceedence float
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_curves_q05_b0(return_period,loss_type,fsauid,"GenOcc","GenType",loss_value,loss_ratio,annual_frequency_of_exceedence)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_curves-q05_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV ;

-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_curves_q05_r1(
return_period varchar,
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
loss_ratio float,
annual_frequency_of_exceedence float
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_curves_q05_r1(return_period,loss_type,fsauid,"GenOcc","GenType",loss_value,loss_ratio,annual_frequency_of_exceedence)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_curves-q05_r1.csv'
        WITH 
          DELIMITER AS ','
          CSV ;


-- combine b0 and r1 tables - q05
CREATE TABLE psra_{prov}.psra_{prov}_agg_curves_q05 AS
(SELECT
a.return_period,
a.loss_type,
a.fsauid,
a."GenOcc",
a."GenType",
a.loss_value AS "loss_value_b0",
a.loss_ratio AS "loss_ratio_b0",
b.loss_value AS "loss_value_r1",
b.loss_ratio AS "loss_ratio_r1",
a.annual_frequency_of_exceedence
FROM psra_{prov}.psra_{prov}_agg_curves_q05_b0 a
LEFT JOIN psra_{prov}.psra_{prov}_agg_curves_q05_r1 b ON a.return_period = b.return_period AND a.loss_type = b.loss_type AND a.fsauid = b.fsauid AND a."GenOcc" = b."GenOcc" AND
a."GenType" = b."GenType" and a.annual_frequency_of_exceedence = b.annual_frequency_of_exceedence);

-- delete *total* rows from table
DELETE FROM psra_{prov}.psra_{prov}_agg_curves_q05 WHERE fsauid = '*total*';


DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_curves_q95_b0, psra_{prov}.psra_{prov}_agg_curves_q95_r1, psra_{prov}.psra_{prov}_agg_curves_q95 CASCADE;
-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_curves_q95_b0(
return_period varchar,
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
loss_ratio float,
annual_frequency_of_exceedence float
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_curves_q95_b0(return_period,loss_type,fsauid,"GenOcc","GenType",loss_value,loss_ratio,annual_frequency_of_exceedence)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_curves-q95_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV ;

-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_curves_q95_r1(
return_period varchar,
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
loss_ratio float,
annual_frequency_of_exceedence float
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_curves_q95_b0(return_period,loss_type,fsauid,"GenOcc","GenType",loss_value,loss_ratio,annual_frequency_of_exceedence)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_curves-q95_r1.csv'
        WITH 
          DELIMITER AS ','
          CSV ;


-- combine b0 and r1 tables - q95
CREATE TABLE psra_{prov}.psra_{prov}_agg_curves_q95 AS
(SELECT
a.return_period,
a.loss_type,
a.fsauid,
a."GenOcc",
a."GenType",
a.loss_value AS "loss_value_b0",
a.loss_ratio AS "loss_ratio_b0",
b.loss_value AS "loss_value_r1",
b.loss_ratio AS "loss_ratio_r1",
a.annual_frequency_of_exceedence
FROM psra_{prov}.psra_{prov}_agg_curves_q95_b0 a
LEFT JOIN psra_{prov}.psra_{prov}_agg_curves_q95_r1 b ON a.return_period = b.return_period AND a.loss_type = b.loss_type AND a.fsauid = b.fsauid AND a."GenOcc" = b."GenOcc" AND
a."GenType" = b."GenType" and a.annual_frequency_of_exceedence = b.annual_frequency_of_exceedence);

-- delete *total* rows from table
DELETE FROM psra_{prov}.psra_{prov}_agg_curves_q95 WHERE fsauid = '*total*';



DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_curves_stats_b0, psra_{prov}.psra_{prov}_agg_curves_stats_r1, psra_{prov}.psra_{prov}_agg_curves_stats CASCADE;
-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_curves_stats_b0(
return_period varchar,
stat varchar,
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
loss_ratio float,
annual_frequency_of_exceedence float,
region varchar
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_curves_stats_b0(return_period,loss_type,fsauid,"GenOcc","GenType",loss_value,loss_ratio,annual_frequency_of_exceedence,region)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_curves-stats_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV ;



-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_curves_stats_r1(
return_period varchar,
stat varchar,
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
loss_ratio float,
annual_frequency_of_exceedence float,
region varchar
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_curves_stats_r1(return_period,loss_type,fsauid,"GenOcc","GenType",loss_value,loss_ratio,annual_frequency_of_exceedence)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_curves-stats_r1.csv'
        WITH 
          DELIMITER AS ','
          CSV ;



-- combine b0 and r1 tables
CREATE TABLE psra_{prov}.psra_{prov}_agg_curves_stats AS
(SELECT
a.return_period,
a.stat,
a.loss_type,
a.fsauid,
a."GenOcc",
a."GenType",
a.region
a.loss_value AS "loss_value_b0",
a.loss_ratio AS "loss_ratio_b0",
b.loss_value AS "loss_value_r1",
b.loss_ratio AS "loss_ratio_r1",
a.annual_frequency_of_exceedence
FROM psra_{prov}.psra_{prov}_agg_curves_stats_b0 a
LEFT JOIN psra_{prov}.psra_{prov}_agg_curves_stats_r1 b ON a.return_period = b.return_period AND a.stat = b.stat AND a.loss_type = b.loss_type AND a.fsauid = b.fsauid AND a."GenOcc" = b."GenOcc" AND
a."GenType" = b."GenType" and a.annual_frequency_of_exceedence = b.annual_frequency_of_exceedence);

-- delete *total* rows from table
DELETE FROM psra_{prov}.psra_{prov}_agg_curves_stats WHERE fsauid = '*total*';

DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_curves_stats_b0, psra_{prov}.psra_{prov}_agg_curves_stats_r1;



-- add agg_losses tables
DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_losses_q05_b0, psra_{prov}.psra_{prov}_agg_losses_q05_r1, psra_{prov}.psra_{prov}_agg_losses_q05 CASCADE;
-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_losses_q05_b0(
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
exposed_value float,
loss_ratio float
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_losses_q05_b0(return_period,loss_type,fsauid,"GenOcc","GenType",loss_value,loss_ratio,annual_frequency_of_exceedence)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_losses-q05_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV ;


-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_losses_q05_r1(
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
exposed_value float,
loss_ratio float
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_losses_q05_r1(return_period,loss_type,fsauid,"GenOcc","GenType",loss_value,loss_ratio,annual_frequency_of_exceedence)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_losses-q05_r1.csv'
        WITH 
          DELIMITER AS ','
          CSV ;

CREATE TABLE psra_{prov}.psra_{prov}_agg_losses_q05 AS
SELECT
a.loss_type,
a.fsauid,
a."GenOcc",
a."GenType",
a.loss_value_b0,
a.exposured_value_b0,
a.loss_ratio_b0,
b.loss_value_r1,
b.exposured_value_r1,
b.loss_ratio_r1

FROM psra_{prov}.psra_{prov}_agg_losses_q05_b0 a
LEFT JOIN psra_{prov}.psra_{prov}_agg_losses_q05_r1 b ON a.loss_type = b.loss_type AND a.fsauid = b.fsauid AND a."GenOcc" = b."GenOcc" AND a."GenType" = b."GenType";

-- delete *total* rows from table
DELETE FROM psra_{prov}.psra_{prov}_agg_losses_q05 WHERE fsauid = '*total*';

DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_losses_q95_b0, psra_{prov}.psra_{prov}_agg_losses_q95_r1 CASCADE;



-- add agg_losses tables
DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_losses_q95_b0, psra_{prov}.psra_{prov}_agg_losses_q95_r1, psra_{prov}.psra_{prov}_agg_losses_q95 CASCADE;
-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_losses_q95_b0(
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
exposed_value float,
loss_ratio float
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_losses_q95_b0(loss_type,fsauid,"GenOcc","GenType",loss_value,exposured_value,loss_ratio)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_losses-q95_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV ;


-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_losses_q95_r1(
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
exposed_value float,
loss_ratio float
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_losses_q95_r1(loss_type,fsauid,"GenOcc","GenType",loss_value,exposured_value,loss_ratio)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_losses-q95_r1.csv'
        WITH 
          DELIMITER AS ','
          CSV ;



CREATE TABLE psra_{prov}.psra_{prov}_agg_losses_q95 AS
SELECT
a.loss_type,
a.fsauid,
a."GenOcc",
a."GenType",
a.loss_value_b0,
a.exposured_value_b0,
a.loss_ratio_b0,
b.loss_value_r1,
b.exposured_value_r1,
b.loss_ratio_r1

FROM psra_{prov}.psra_{prov}_agg_losses_q95_b0 a
LEFT JOIN psra_{prov}.psra_{prov}_agg_losses_q95_r1 b ON a.loss_type = b.loss_type AND a.fsauid = b.fsauid AND a."GenOcc" = b."GenOcc" AND a."GenType" = b."GenType";

-- delete *total* rows from table
DELETE FROM psra_{prov}.psra_{prov}_agg_losses_q95 WHERE fsauid = '*total*';

DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_losses_q95_b0, psra_{prov}.psra_{prov}_agg_losses_q95_r1 CASCADE;



-- add agg_losses tables
DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_losses_stats_b0, psra_{prov}.psra_{prov}_agg_losses_stats_r1, psra_{prov}.psra_{prov}_agg_losses_stats CASCADE;
-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_losses_stats_b0(
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
exposed_value float,
loss_ratio float,
region varchar
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_losses_stats_b0(loss_type,fsauid,"GenOcc","GenType",loss_value,exposured_value,loss_ratio,region)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_losses-stats_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV ;


-- create table
CREATE TABLE psra_{prov}.psra_{prov}_agg_losses_stats_r1(
loss_type varchar,
fsauid varchar,
"GenOcc" varchar,
"GenType" varchar,
loss_value float,
exposed_value float,
loss_ratio float,
region varchar
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_agg_losses_stats_r1(loss_type,fsauid,"GenOcc","GenType",loss_value,exposured_value,loss_ratio,region)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_agg_losses-stats_r1.csv'
        WITH 
          DELIMITER AS ','
          CSV ;



CREATE TABLE psra_{prov}.psra_{prov}_agg_losses_stats AS
SELECT
a.loss_type,
a.fsauid,
a."GenOcc",
a."GenType",
a.region,
a.loss_value_b0,
a.exposured_value_b0,
a.loss_ratio_b0,
b.loss_value_r1,
b.exposured_value_r1,
b.loss_ratio_r1

FROM psra_{prov}.psra_{prov}_agg_losses_stats_b0 a
LEFT JOIN psra_{prov}.psra_{prov}_agg_losses_stats_r1 b ON a.loss_type = b.loss_type AND a.fsauid = b.fsauid AND a."GenOcc" = b."GenOcc" AND a."GenType" = b."GenType";

-- delete *total* rows from table
DELETE FROM psra_{prov}.psra_{prov}_agg_losses_stats WHERE fsauid = '*total*';

DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_agg_losses_stats_b0, psra_{prov}.psra_{prov}_agg_losses_stats_r1 CASCADE;