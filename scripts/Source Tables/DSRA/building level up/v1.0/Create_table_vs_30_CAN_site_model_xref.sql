-- script to generate vs30 can site model xref

DROP TABLE IF EXISTS vs30.vs30_can_site_model_xref;


-- create table
CREATE TABLE vs30.vs30_can_site_model_xref(
    id varchar,
    asset_lon float,
    asset_lat float,
    vs30 float,
    z1pt0 float,
    z2pt5 float,
    vs_lon float,
    vs_lat float,
    distance float 
);

-- import exposure from csv
COPY vs30.vs30_can_site_model_xref (id, asset_lon, asset_lat, vs30, z1pt0, z2pt5, vs_lon, vs_lat, distance)
    FROM 'D:\Workspace\data\source datasets\dsra\vs30_CAN_site_model_xref.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;