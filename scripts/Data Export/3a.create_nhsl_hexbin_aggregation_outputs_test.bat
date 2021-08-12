REM Export nhsl hexbin aggregation samples

ECHO %TIME% 
REM Geopackage physical exposure
FOR %%x IN (nhsl_physical_exposure_all_indicators_hexbin_5km, ^
nhsl_physical_exposure_all_indicators_hexbin_10km, ^
nhsl_physical_exposure_all_indicators_hexbin_25km, ^
nhsl_physical_exposure_all_indicators_hexbin_50km, ^
nhsl_physical_exposure_all_indicators_hexbin_100km, ^
nhsl_physical_exposure_all_indicators_hexbin_global_fabric) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\hexbin_samples\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x" -nln %%x

REM Geopackage multi hazard threat
FOR %%x IN (nhsl_hazard_threat_prioritization_hexgrid_5km, ^
nhsl_hazard_threat_prioritization_hexgrid_10km, ^
nhsl_hazard_threat_prioritization_hexgrid_25km, ^
nhsl_hazard_threat_prioritization_hexgrid_50km, ^
nhsl_hazard_threat_prioritization_hexgrid_100km, ^
nhsl_hazard_threat_prioritization_hexgrid_global_fabric) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\hexbin_samples\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x" -nln %%x

REM Geopackage social fabric
FOR %%x IN (nhsl_social_fabric_all_indicators_hexgrid_5km, ^
nhsl_social_fabric_all_indicators_hexgrid_10km, ^
nhsl_social_fabric_all_indicators_hexgrid_25km, ^
nhsl_social_fabric_all_indicators_hexgrid_50km, ^
nhsl_social_fabric_all_indicators_hexgrid_100km, ^
nhsl_social_fabric_all_indicators_hexgrid_global_fabric) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\hexbin_samples\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x" -nln %%x

ECHO %TIME% 
PAUSE