REM Export PSRA views from postgis db into Geopackage for national level. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage national PSRA
FOR %%x IN (psra_all_indicators_b, ^
psra_all_indicators_s, ^
psra_pml_s, ^
psra_src_loss, ^
psra_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\national\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_national.%%x" -nln %%x

PAUSE