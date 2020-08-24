REM Export rick dynamic views to geojson, and geopackage files. Replace risk dynamics {ghsl_hazthreat_may2020_v1p2} to target risk dynamics if different to run.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (risk_dynamics_hazard_susceptibility,risk_dynamics_land_use_change,risk_dynamics_population_growth) ^
DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\geojson\%%x.geojson PG:"host=localhost user=postgres dbname=oq_sandbox password=password" results_ghsl_hazthreat_may2020_v1p2.%%x

REM Geopackage Shapefile export
FOR %%x IN (risk_dynamics_hazard_susceptibility,risk_dynamics_land_use_change,risk_dynamics_population_growth) ^
DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\geopackage\%%x.gpkg PG:"host=localhost user=postgres dbname=oq_sandbox password=password" results_ghsl_hazthreat_may2020_v1p2.%%x

PAUSE