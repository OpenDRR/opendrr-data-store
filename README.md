# opendrr-data-store
*last updated Jan 17, 2023*

Repo for storage of PostgreSQL sql scripts, data exports and related works for testing and development for the OpenDRR PostgreSQL database. Scripts in this repo are run and tested on a local desktop/host and modified accordingly in order to support model_factory repo for successful implementation in a docker instance.

## documents
Temporary location of spreadsheets and csv files to support development of various indicators.  

## scripts
PostgreSQL scripts, data export scripts for local development and testing.

#### / Data Export
Bat scripts for exporting, zipping various PostgreSQL tables to GeoPackage format using GDAL OGR2OGR.

https://gdal.org/

https://gdal.org/programs/ogr2ogr.html

https://www.7-zip.org/
  

#### /Diagrams
ER Diagram of OpenDRR database in draw.io format. *Diagrams are still a work in progress and not completed yet.*

https://www.diagrams.net/

#### / Indicators
Scripts for testing, development, and generating various indicators.

- 1.0 Human Settlement
	- 1.1 Physical Exposure
	- 1.2 Multi-Hazard Risk
	- 1.3 Social Fabric
	- 1.4 Risk Dynamics
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
