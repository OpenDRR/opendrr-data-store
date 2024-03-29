DROP TABLE IF EXISTS gmf.s_gmfdata_SIM6p8_CR2022_37;


-- create table
CREATE TABLE gmf.s_gmfdata_SIM6p8_CR2022_37(
    event_id varchar,
    site_id varchar,
    gmv_PGA float,
    gmv_PGV float,
    "gmv_SA(0.1)" float,
    "gmv_SA(0.2)" float,
    "gmv_SA(0.3)" float,
    "gmv_SA(0.6)" float,
    "gmv_SA(1.0)" float
    
);

-- import exposure from csv
COPY gmf.s_gmfdata_SIM6p8_CR2022_37 (event_id, site_id, gmv_pga, gmv_pgv, "gmv_SA(0.1)", "gmv_SA(0.2)", "gmv_SA(0.3)", "gmv_SA(0.6)", "gmv_SA(1.0)")
    FROM 'D:\workspace\GitHub\opendrr-data-store\sample-datasets\scenario-risk\model-outputs\scenario-hazard\s_gmfdata_SIM6p8_CR2022_37.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;