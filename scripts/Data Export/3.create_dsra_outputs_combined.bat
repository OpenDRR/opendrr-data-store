REM Export DSRA views from postgis db into Geopackage. Change ogr2ogr path, location paths, db information if needed.

ECHO %TIME% 
REM Geopackage dsra, _indicators_b
FOR %%x IN (dsra_acm7p3_leechriverfullfault, ^
dsra_idm7p1_sidney, ^
dsra_sim9p0_cascadiainterfacebestfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_indicators_b.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_%%x.%%x_indicators_b" -nln %%x_indicators_b


REM Geopackage dsra, _indicators_s
FOR %%x IN (dsra_acm7p3_leechriverfullfault, ^
dsra_idm7p1_sidney, ^
dsra_sim9p0_cascadiainterfacebestfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_indicators_s.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_%%x.%%x_indicators_s" -nln %%x_indicators_s


REM Geopackage dsra, _indicators_csd
FOR %%x IN (dsra_acm7p3_leechriverfullfault, ^
dsra_idm7p1_sidney, ^
dsra_sim9p0_cascadiainterfacebestfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_indicators_csd.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_%%x.%%x_indicators_csd" -nln %%x_indicators_csd


REM Geopackage dsra, _shakemap
FOR %%x IN (dsra_acm7p3_leechriverfullfault, ^
dsra_idm7p1_sidney, ^
dsra_sim9p0_cascadiainterfacebestfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_%%x.%%x_shakemap" -nln %%x_shakemap


REM Export DSRA master all scenarios views from postgis db into Geopackage. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage dsra, _all_scenarios
FOR %%x IN (dsra_all_scenarios_building, ^
dsra_all_scenarios_cduid, ^
dsra_all_scenarios_csduid, ^
dsra_all_scenarios_dauid, ^
dsra_all_scenarios_eruid, ^
dsra_all_scenarios_fsauid, ^
dsra_all_scenarios_pruid, ^
dsra_all_scenarios_sauid
) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\scenario_info\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM dsra.%%x" -nln %%x

REM Geopackage dsra, shakemap scenario extents
FOR %%x IN (shakemap_scenario_extents) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\scenario_info\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM gmf.%%x" -nln %%x

ECHO %TIME% 
PAUSE