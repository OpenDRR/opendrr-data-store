REM Export NHSL hexgrid views from postgis db into GeoPackages. Change ogr2ogr path,location paths,db information if needed.

ECHO %TIME% 
REM Geopackage physical exposure
FOR %%x IN (nhsl_physical_exposure_indicators_hexbin_1km, ^
nhsl_physical_exposure_indicators_hexbin_1km_uc, ^
nhsl_physical_exposure_indicators_hexbin_5km, ^
nhsl_physical_exposure_indicators_hexbin_5km_uc, ^
nhsl_physical_exposure_indicators_hexbin_10km, ^
nhsl_physical_exposure_indicators_hexbin_10km_uc, ^
nhsl_physical_exposure_indicators_hexbin_25km, ^
nhsl_physical_exposure_indicators_hexbin_25km_uc, ^
nhsl_physical_exposure_indicators_hexbin_50km_uc, ^
nhsl_physical_exposure_indicators_hexbin_100km_uc) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\hexgrid\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x" -nln %%x

REM Geopackage multi hazard threat
FOR %%x IN (nhsl_hazard_threat_prioritization_hexgrid_1km, ^
nhsl_hazard_threat_prioritization_hexgrid_1km_uc, ^
nhsl_hazard_threat_prioritization_hexgrid_5km, ^
nhsl_hazard_threat_prioritization_hexgrid_5km_uc, ^
nhsl_hazard_threat_prioritization_hexgrid_10km, ^
nhsl_hazard_threat_prioritization_hexgrid_10km_uc, ^
nhsl_hazard_threat_prioritization_hexgrid_25km, ^
nhsl_hazard_threat_prioritization_hexgrid_25km_uc, ^
nhsl_hazard_threat_prioritization_hexgrid_50km_uc, ^
nhsl_hazard_threat_prioritization_hexgrid_100km_uc) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\hexgrid\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x" -nln %%x

REM Geopackage social fabric
FOR %%x IN (nhsl_social_fabric_indicators_hexgrid_1km, ^
nhsl_social_fabric_indicators_hexgrid_1km_uc, ^
nhsl_social_fabric_indicators_hexgrid_5km, ^
nhsl_social_fabric_indicators_hexgrid_5km_uc, ^
nhsl_social_fabric_indicators_hexgrid_10km, ^
nhsl_social_fabric_indicators_hexgrid_10km_uc, ^
nhsl_social_fabric_indicators_hexgrid_25km, ^
nhsl_social_fabric_indicators_hexgrid_25km_uc, ^
nhsl_social_fabric_indicators_hexgrid_50km_uc, ^
nhsl_social_fabric_indicators_hexgrid_100km_uc) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\hexgrid\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x" -nln %%x

ECHO %TIME% 
PAUSE