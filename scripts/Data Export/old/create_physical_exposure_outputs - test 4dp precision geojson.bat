REM Export views to geojson, and geopackage files. Replace exposure name {bldgexp_canada} to target exposure if different to run.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (nhsl_physical_exposure_assets_b,nhsl_physical_exposure_assets_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" -lco COORDINATE_PRECISION=4 D:\workspace\data\view_outputs\4dp_test\%%x_4dp.geojson PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" ^
-sql "SELECT * FROM results_nhsl_physical_exposure.%%x LIMIT 200"

FOR %%x IN (nhsl_physical_exposure_assets_b,nhsl_physical_exposure_assets_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\4dp_test\%%x.geojson PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" ^
-sql "SELECT * FROM results_nhsl_physical_exposure.%%x LIMIT 200"

REM Geopackage Shapefile export
FOR %%x IN (nhsl_physical_exposure_assets_b,nhsl_physical_exposure_assets_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" -lco COORDINATE_PRECISION=4 D:\workspace\data\view_outputs\4dp_test\%%x_4dp.gpkg PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" ^
-sql "SELECT * FROM results_nhsl_physical_exposure.%%x LIMIT 200"

FOR %%x IN (nhsl_physical_exposure_assets_b,nhsl_physical_exposure_assets_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\4dp_test\%%x.gpkg PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" ^
-sql "SELECT * FROM results_nhsl_physical_exposure.%%x LIMIT 200"

PAUSE