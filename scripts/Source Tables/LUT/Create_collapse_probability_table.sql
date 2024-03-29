-- script to generate collapse probability table

DROP TABLE IF EXISTS lut.collapse_probability CASCADE;

-- create table
CREATE TABLE lut.collapse_probability(
    "typology" varchar,
    "eqbldgtype" varchar,
    "collapse_pc" float
     
);

-- import exposure from csv
COPY lut.collapse_probability ("typology", "eqbldgtype", "collapse_pc")
    FROM 'D:\workspace\data\human-settlement-national\collapse_probability.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;