REM Export views from postgis db. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage physical exposure
FOR %%x IN (nhsl_physical_exposure_all_indicators_s_qc) DO ogr2ogr -f "FlatGeobuf" D:\Workspace\data\view_outputs\all_indicators\province\layer_name\physical_exposure\%%x.fgb PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x" -nln %%x