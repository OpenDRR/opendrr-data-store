REM Export views from postgis db. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage dsra, _all_indicators_b
FOR %%x IN (dsra_acm6p5_beaufort, ^
dsra_acm7p2_lrdmf, ^
dsra_idm4p7_sidney, ^
dsra_idm4p8_sidney, ^
dsra_idm5p0_sidney, ^
dsra_idm5p2_sidney, ^
dsra_idm5p4_sidney, ^
dsra_idm5p6_sidney, ^
dsra_idm5p8_sidney, ^
dsra_idm6p0_sidney, ^
dsra_idm6p2_sidney, ^
dsra_idm6p4_sidney, ^
dsra_idm6p6_sidney, ^
dsra_idm6p8_jdfpathways, ^
dsra_idm6p8_sidney, ^
dsra_idm7p0_sidney, ^
dsra_idm7p1_sidney, ^
dsra_idm7p1_sidneytest, ^
dsra_scm6p5_ottawa, ^
dsra_scm7p0_montrealnw, ^
dsra_scm7p0_montrealnwcanshm5, ^
dsra_sim9p0_cszlockedtrans) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\sql_select\%%x_all_indicators_b.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_%%x.%%x_all_indicators_b"


REM Geopackage dsra, _all_indicators_s
FOR %%x IN (dsra_acm6p5_beaufort, ^
dsra_acm7p2_lrdmf, ^
dsra_idm4p7_sidney, ^
dsra_idm4p8_sidney, ^
dsra_idm5p0_sidney, ^
dsra_idm5p2_sidney, ^
dsra_idm5p4_sidney, ^
dsra_idm5p6_sidney, ^
dsra_idm5p8_sidney, ^
dsra_idm6p0_sidney, ^
dsra_idm6p2_sidney, ^
dsra_idm6p4_sidney, ^
dsra_idm6p6_sidney, ^
dsra_idm6p8_jdfpathways, ^
dsra_idm6p8_sidney, ^
dsra_idm7p0_sidney, ^
dsra_idm7p1_sidney, ^
dsra_idm7p1_sidneytest, ^
dsra_scm6p5_ottawa, ^
dsra_scm7p0_montrealnw, ^
dsra_scm7p0_montrealnwcanshm5, ^
dsra_sim9p0_cszlockedtrans) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\sql_select\%%x_all_indicators_s.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_%%x.%%x_all_indicators_s"


REM Geopackage dsra, _shakemap
FOR %%x IN (dsra_acm6p5_beaufort, ^
dsra_acm7p2_lrdmf, ^
dsra_idm4p7_sidney, ^
dsra_idm4p8_sidney, ^
dsra_idm5p0_sidney, ^
dsra_idm5p2_sidney, ^
dsra_idm5p4_sidney, ^
dsra_idm5p6_sidney, ^
dsra_idm5p8_sidney, ^
dsra_idm6p0_sidney, ^
dsra_idm6p2_sidney, ^
dsra_idm6p4_sidney, ^
dsra_idm6p6_sidney, ^
dsra_idm6p8_jdfpathways, ^
dsra_idm6p8_sidney, ^
dsra_idm7p0_sidney, ^
dsra_idm7p1_sidney, ^
dsra_idm7p1_sidneytest, ^
dsra_scm6p5_ottawa, ^
dsra_scm7p0_montrealnw, ^
dsra_scm7p0_montrealnwcanshm5, ^
dsra_sim9p0_cszlockedtrans) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\sql_select\%%x_shakemap.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_%%x.%%x_shakemap"

PAUSE