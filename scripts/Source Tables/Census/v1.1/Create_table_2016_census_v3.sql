-- script to generate Canada exposure table

DROP TABLE IF EXISTS census.census_2016_canada;

-- create table
CREATE TABLE census.census_2016_canada(
    PRIMARY KEY(SAUIDt),
    OBJECTID varchar,
    SAUIDt varchar,
    SAUIDi float,
    DAUIDt varchar,
    DAUIDi float,
    Fsauid varchar,
    Csdname varchar,
    Cdname varchar,
    Ername varchar,
    Prname varchar,
    Lon float,
    Lat float,
    BldgNum float,
    CostAsset float,
    CostBldg float,
    PopDay float,
    PopNight float,
    PopTrnst float,
    Concrete float,
    Manufactured float,
    Precast float,
    RMasonry float,
    Steel float,
    URMasonry float,
    Wood float,
    Agr float,
    Comm float,
    Ind float,
    Civic float,
    Res_HD float,
    Res_MD float,
    Res_LD float,
    CensusPop float,
    CensusBldg float,
    CensusDU float,
    CensusRESLD float,
    CensusResMD float,
    CensusRESHD float,
    CensusCOMM float,
    CensusIND float,
    CensusCIVIC float,
    CensusAGR float,
    Area_km2 float,
    Area_ha float,
    Shape_Length float,
    Shape_Area float,
    LandUse varchar,
    PRUID varchar,
    ProvAbbr varchar,
    People_DU float,
    DAUID varchar,
    SACTYPE varchar,
    PopTotal float,
    Pop_Dens float,
    Pop_Ha float,
    Bus_Ha float,
    Pre_1975 float,
    Renter float,
    Hshld_NSuit float,
    Hshld_Mntn1 float,
    Hshld_MntnAge float,
    Pub_Trans float,
    Vis_Min float,
    Imm_LT5 float,
    Indigenous float,
    Age_GT65 float,
    Age_LT6 float,
    Age_Median float,
    NoSec_School float,
    Retail_Job float,
    Health_Job float,
    Fam_GT5 float,
    LonePar3Kids float,
    Live_Alone float,
    No_EngFr float,
    Moved_LT1 float,
    NoWrkPlace float,
    Shltr_GT30 float,
    Inc_Indv float,
    Inc_Hshld float,
    Inc_LowDecile float,
    Unemployed float,
    Work_Parttime float,
    Work_None float,
    Employ_Inc float
    
);

-- import exposure from csv
COPY census.census_2016_canada (OBJECTID, SAUIDt, SAUIDi, DAUIDt, DAUIDi, Fsauid, Csdname, Cdname, Ername, Prname, Lon, Lat, BldgNum, CostAsset, CostBldg, PopDay, PopNight, PopTrnst, Concrete, Manufactured, 
Precast, RMasonry, Steel, URMasonry, Wood, Agr, Comm, Ind, Civic, Res_HD, Res_MD, Res_LD, CensusPop, CensusBldg, CensusDU, CensusRESLD, CensusResMD, CensusRESHD, CensusCOMM, CensusIND, CensusCIVIC, 
CensusAGR, Area_km2, Area_ha, Shape_Length, Shape_Area, LandUse, PRUID, ProvAbbr, People_DU, DAUID, SACTYPE, PopTotal, Pop_Dens, Pop_Ha, Bus_Ha, Pre_1975, Renter, Hshld_NSuit, Hshld_Mntn1, Hshld_MntnAge, 
Pub_Trans, Vis_Min, Imm_LT5, Indigenous, Age_GT65, Age_LT6, Age_Median, NoSec_School, Retail_Job, Health_Job, Fam_GT5, LonePar3Kids, Live_Alone, No_EngFr, Moved_LT1, NoWrkPlace, Shltr_GT30, Inc_Indv, 
Inc_Hshld, Inc_LowDecile, Unemployed, Work_Parttime, Work_None, Employ_Inc)
    FROM 'D:\Workspace\GitHub\openquake-inputs\exposure\census-ref-sauid\census-attributes-2016.csv'
        WITH 
          DELIMITER AS ','
          CSV HEADER ;


-- add missing sauid that is new in exposure model but missing in census
INSERT INTO census.census_2016_canada(sauidt)
VALUES(62000215);

-- create index
CREATE INDEX census_2016_canada_idx ON census.census_2016_canada (sauidt);