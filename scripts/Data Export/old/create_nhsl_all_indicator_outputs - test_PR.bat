REM Export views to geojson, and geopackage files. Replace exposure name {bldgexp_canada} to target exposure if different to run.  Change ogr2ogr path, location paths, db information if needed.


REM Geopackage Shapefile export
FOR %%x IN (10,11,12,13,24,35,46,47,48,59,60,61,62) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\regions\nhsl_physical_exposure_all_indicators_b_%%x.gpkg PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" ^
-sql "SELECT * FROM results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_b WHERE pruid = '%%x'"
PAUSE
