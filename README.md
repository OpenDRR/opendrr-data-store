# opendrr-data-store
Repo for storage of PostGIS/PostgreSQL gsql scripts, data exports and related works for testing and development.  Scripts in this repo are run on and tested on local host and modified accordingly to support model_factory repo.

## sample-datasets
Sample datasets for sandbox database creation.

## scripts
PostgreSQL scripts, data export scripts for local development and testing.

#### / Data Export
Scripts for testing, development and exporting PostreSQL tables to different formats using GDAL OGR2OGR.  

https://gdal.org/index.html  
https://gdal.org/programs/ogr2ogr.html

#### / ER Creation
Scripts for ER creation testing and development (PK/FK).  For future implementation of ER Diagrams using schemaspy.  

http://schemaspy.org/

#### / Indicators
Scripts for testing, development, and generating the various indicators.<br>

 - 1.0 Human Settlement
        - 1.1 Physical Exposure
        - 1.2 Risk Dynamics
        - 1.3 Social Fabric
	 
 - 2.0 Seismic Risk (PSRA)

 - 3.0 Earthquake Scenario Risk (DSRA)

 - 4.0 Multi-Hazard Risk

#### /Source Tables
Scripts for testing, development, loading and transforming the source data tables to generating the indicators.

 - Boundaries
 - Census
 - DSRA
 - Exposure
 - GHSL
 - LUT
 - MH
 - PSRA
 - SoVi
