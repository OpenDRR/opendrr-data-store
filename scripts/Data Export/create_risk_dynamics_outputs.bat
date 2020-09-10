REM Export views to geojson, and geopackage files. Replace exposure name {bldgexp_canada} to target exposure if different to run.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility_s_tbl,nhsl_risk_dynamics_land_use_change_s_tbl,nhsl_risk_dynamics_population_growth_s_tbl) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\%%x.geojson PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" results_nhsl_risk_dynamics.%%x

REM Geopackage Shapefile export
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility_s_tbl,nhsl_risk_dynamics_land_use_change_s_tbl,nhsl_risk_dynamics_population_growth_s_tbl) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\%%x.gpkg PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" results_nhsl_risk_dynamics.%%x

PAUSE