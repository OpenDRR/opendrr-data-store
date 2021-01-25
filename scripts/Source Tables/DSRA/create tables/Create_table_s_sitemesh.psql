
DROP TABLE IF EXISTS sitemesh.s_sitemesh_SIM6p8_CR2022_37;


-- create table
CREATE TABLE sitemesh.s_sitemesh_SIM6p8_CR2022_37(
    site_id varchar,
    lon float,
    lat float
    
);

-- import exposure from csv
COPY sitemesh.s_sitemesh_SIM6p8_CR2022_37(site_id, lon, lat)
    FROM 'D:\workspace\GitHub\opendrr-data-store\sample-datasets\scenario-risk\model-outputs\scenario-hazard\s_sitemesh_SIM6p8_CR2022_37.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;