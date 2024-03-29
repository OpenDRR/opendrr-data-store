-- script to agg curves stats
DROP TABLE IF EXISTS lut.psra_source_types,psra_{prov}.psra_{prov}_src_loss_b0, psra_{prov}.psra_{prov}_src_loss_r1, psra_{prov}.psra_{prov}_src_loss, psra_{prov}.psra_{prov}_src_loss_b0_temp, psra_{prov}.psra_{prov}_src_loss_r1_temp CASCADE;

-- create source type table
CREATE TABLE lut.psra_source_types(
code varchar,
name varchar,
tectonicregion varchar
);

-- import table from csv
COPY lut.psra_source_types(code,name,tectonicregion)
    FROM 'D:\Workspace\data\source datasets\psra sample dataset\sourceTypes.csv'
        WITH 
          DELIMITER AS ','
          CSV ;


-- create table
CREATE TABLE psra_{prov}.psra_{prov}_src_loss_b0(
source varchar,
loss_type varchar,
loss_value float,
region varchar
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_src_loss_b0(source,loss_type,loss_value,trt,region)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_src_loss_table_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV ;



-- create temp table for agg
CREATE TABLE psra_{prov}.psra_{prov}_src_loss_b0_temp AS
(
SELECT
source,
loss_type,
trt,
SUM(loss_value) AS "loss_value",
region

FROM psra_{prov}.psra_{prov}_src_loss_b0
GROUP BY source,loss_type,trt,region);




-- create table
CREATE TABLE psra_{prov}.psra_{prov}_src_loss_r1(
source varchar,
loss_type varchar,
loss_value float,
region varchar
);

-- import exposure from csv
COPY psra_{prov}.psra_{prov}_src_loss_r1(source,loss_type,loss_value,trt,region)
    FROM '/usr/src/app/ebRisk/{prov}/ebR_{prov}_src_loss_table_r1.csv'
        WITH 
          DELIMITER AS ','
          CSV ;



-- create temp table for agg
CREATE TABLE psra_{prov}.psra_{prov}_src_loss_r1_temp AS
(
SELECT
source,
loss_type,
trt,
region,
SUM(loss_value) AS "loss_value"

FROM psra_{prov}.psra_{prov}_src_loss_r1
GROUP BY source,loss_type,trt,region);


DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_src_loss CASCADE;
CREATE TABLE psra_{prov}.psra_{prov}_src_loss AS
(
SELECT a.source,
a.loss_type,
a.region,
a.loss_value AS "loss_value_b0",
b.loss_value AS "loss_value_r1"

FROM psra_{prov}.psra_{prov}_src_loss_b0 a
INNER JOIN psra_{prov}.psra_{prov}_src_loss_r1 b ON a.source = b.source AND a.loss_type = b.loss_type AND a.region = b.region
);

DROP TABLE IF EXISTS psra_{prov}.psra_{prov}_src_loss_b0_temp, psra_{prov}.psra_{prov}_src_loss_r1_temp CASCADE;