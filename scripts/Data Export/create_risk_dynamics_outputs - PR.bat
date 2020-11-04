REM Export views to geojson, and geopackage files. Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility_s,nhsl_risk_dynamics_land_use_change_s,nhsl_risk_dynamics_population_growth_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\nhsl\risk_dynamics\%%x_bc.geojson PG:"host=localhost user=postgres dbname=opendrr_10302020 password=password" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x  WHERE pruid = '59'"

REM Geopackage Shapefile export
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility_s,nhsl_risk_dynamics_land_use_change_s,nhsl_risk_dynamics_population_growth_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\nhsl\risk_dynamics\%%x_bc.gpkg PG:"host=localhost user=postgres dbname=opendrr_10302020 password=password" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x  WHERE pruid = '59'"

PAUSE