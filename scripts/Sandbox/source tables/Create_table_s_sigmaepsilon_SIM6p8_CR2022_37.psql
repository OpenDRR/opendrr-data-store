
DROP TABLE IF EXISTS lut.s_sigmaepsilon_SIM6p8_CR2022_37;


-- create table
CREATE TABLE lut.s_sigmaepsilon_SIM6p8_CR2022_37(
    event_id varchar,
    sig varchar,
    eps varchar

    
);

-- import exposure from csv
COPY lut.s_sigmaepsilon_SIM6p8_CR2022_37.(event_id, sig, eps)
    FROM 'C:\GitHub\opendrr-data-store\sample-datasets\model-outputs\scenario-hazard\s_sigmaepsilon_SIM6p8_CR2022_37.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;

