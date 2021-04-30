REM Export DSRA master all scenarios views from postgis db into Geopackage. Change ogr2ogr path, location paths, db information if needed.

ECHO %TIME% 
REM Geopackage dsra, _all_scenarios
FOR %%x IN (dsra_all_scenarios, ^
dsra_all_scenarios_cduid, ^
dsra_all_scenarios_csduid, ^
dsra_all_scenarios_dauid, ^
dsra_all_scenarios_eruid, ^
dsra_all_scenarios_fsauid, ^
dsra_all_scenarios_pruid, ^
dsra_all_scenarios_sauid) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM dsra.%%x" -nln %%x

ECHO %TIME% 
PAUSE