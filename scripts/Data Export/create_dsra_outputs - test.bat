REM Export views from postgis db. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage dsra, _all_indicators_b
FOR %%x IN (dsra_acm7p2_lrdmf, ^
dsra_idm4p7_sidney, ^
dsra_sim9p0_cszlockedtrans) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_all_indicators_b.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" results_%%x.%%x_all_indicators_b


REM Geopackage dsra, _all_indicators_s
FOR %%x IN (dsra_acm7p2_lrdmf, ^
dsra_idm4p7_sidney, ^
dsra_sim9p0_cszlockedtrans) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_all_indicators_s.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" results_%%x.%%x_all_indicators_s

PAUSE