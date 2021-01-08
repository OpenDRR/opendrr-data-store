-- script to agg curves stats
DROP TABLE IF EXISTS psra_bc.psra_bc5940_80_src_loss_b0, psra_bc.psra_bc5940_80_src_loss_r2, psra_bc.psra_bc5940_80_src_loss, psra_bc.psra_bc5940_80_src_loss_b0_temp, psra_bc.psra_bc5940_80_src_loss_r2_temp CASCADE;

-- create table
CREATE TABLE psra_bc.psra_bc5940_80_src_loss_b0(
source varchar,
loss_type varchar,
loss_value float,
trt varchar
);

-- import exposure from csv
COPY psra_bc.psra_bc5940_80_src_loss_b0(source,loss_type,loss_value,trt)
    FROM 'D:\workspace\data\psra_new_datasets\3_ebRisk\ebR_bc5940-80_src_loss_table_b0.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;


-- create temp table for agg
CREATE TABLE psra_bc.psra_bc5940_80_src_loss_b0_temp AS
(
SELECT
source,
loss_type,
trt,
SUM(loss_value) AS "loss_value"

FROM psra_bc.psra_bc5940_80_src_loss_b0
GROUP BY source,loss_type,trt);



-- create table
CREATE TABLE psra_bc.psra_bc5940_80_src_loss_r2(
source varchar,
loss_type varchar,
loss_value float,
trt varchar
);

-- import exposure from csv
COPY psra_bc.psra_bc5940_80_src_loss_r2(source,loss_type,loss_value,trt)
    FROM 'D:\workspace\data\psra_new_datasets\3_ebRisk\ebR_bc5940-80_src_loss_table_r2.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;


-- create temp table for agg
CREATE TABLE psra_bc.psra_bc5940_80_src_loss_r2_temp AS
(
SELECT
source,
loss_type,
trt,
SUM(loss_value) AS "loss_value"

FROM psra_bc.psra_bc5940_80_src_loss_r2
GROUP BY source,loss_type,trt);



CREATE TABLE psra_bc.psra_bc5940_80_src_loss AS
(
SELECT a.source,
a.loss_type,
a.trt,
a.loss_value AS "loss_value_b0",
b.loss_value AS "loss_value_r2"

FROM psra_bc.psra_bc5940_80_src_loss_b0_temp a
INNER JOIN psra_bc.psra_bc5940_80_src_loss_r2_temp b ON a.source = b.source AND a.loss_type = b.loss_type AND a.trt = b.trt
);

DROP TABLE IF EXISTS psra_bc.psra_bc5940_80_src_loss_b0, psra_bc.psra_bc5940_80_src_loss_r2, psra_bc.psra_bc5940_80_src_loss_b0_temp, psra_bc.psra_bc5940_80_src_loss_r2_temp  CASCADE;