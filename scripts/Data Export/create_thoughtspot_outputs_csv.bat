REM Export views to geojson, and geopackage files.Change ogr2ogr path, location paths, db information if needed.

REM physical exposure csv
FOR %%x IN (nhsl_physical_exposure_all_indicators_b) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "csv" D:\workspace\data\view_outputs\thoughtspot\%%x_BC.csv PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=password" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE pruid = '59'"

PAUSE



