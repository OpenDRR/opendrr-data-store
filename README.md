# opendrr-data-store
Repo for storing PostGIS/PostgreSQL database creation, query scripts and related works.

## sample-datasets
Sample datasets for sandbox database creation.

## scripts
PostgreSQL scripts for sandbox developement.

#### / Indicators
Scripts for generating various indicators.<br>

 - 1.0 Human Settlement
	 - 1.1 Physical Exposure
		 - 1.AssetID Risk Profile
		 - 2.SAUID Risk Profile
		 - 3.Final<br>
		 
	 - 1.2 Risk Dynamics
	 - 1.3 Social Fabric
		 - 2.SAUID Risk Profile
		 - 3.Final<br>
		 
 - 2.0 Seismic Risk (PSRA)
	 - 1.AssetID Risk Profile
		 - hazard map 677
		 - hazard map 688
	 - 2.SAUID Risk Profile
		 - hazard map 677
		 - hazard map 688
	 - 3.Final<br>
	 
 - 3.0 Earthquake Scenario Risk (DSRA)
	 - 1.AssetID Risk Profile
	 - 2.SAUID Risk Profile
	 - 3.Final
	 - 
 - 4.0 Multi-Hazard Risk
	 - 2.SAUID Risk Profile
	 - 3.Final<br>

 
#### /Source Tables
Scripts for loading and transforming the source data tables to generating the indicators.<br>

 - Boundaries
 - Census
 - DSRA
 - Exposure
 - GHSL
 - LUT
 - MH
 - PSRA
 - SoVi