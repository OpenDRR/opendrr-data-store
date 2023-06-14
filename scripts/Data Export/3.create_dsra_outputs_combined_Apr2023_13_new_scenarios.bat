REM Export DSRA views from postgis db into Geopackages. Change ogr2ogr path, location paths, db information if needed.

ECHO %TIME% 
REM Geopackage dsra, _indicators_b
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_indicators_b.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_indicators_b" -nln %%x_indicators_b


REM Geopackage dsra, _indicators_s
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_indicators_s.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_indicators_s" -nln %%x_indicators_s


REM Geopackage dsra, _indicators_csd
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_indicators_csd.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_indicators_csd" -nln %%x_indicators_csd


REM Geopackage dsra, _shakemap
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_shakemap" -nln %%x_shakemap


REM Export DSRA views from postgis db into Geopackages. Change ogr2ogr path, location paths, db information if needed.

REM Geopackage dsra, _shakemap_hexgrid_1km
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_1km.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_1" -nln %%x_shakemap_hexgrid_1km

REM Geopackage dsra, _shakemap_hexgrid_1km_uc
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_1km_uc.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_1_uc" -nln %%x_shakemap_hexgrid_1km_uc

REM Geopackage dsra, _shakemap_hexgrid_5km
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_5km.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_5" -nln %%x_shakemap_hexgrid_5km

REM Geopackage dsra, _shakemap_hexgrid_5km_uc
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_5km_uc.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_5_uc" -nln %%x_shakemap_hexgrid_5km_uc

REM Geopackage dsra, _shakemap_hexgrid_10km
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_10km.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_10" -nln %%x_shakemap_hexgrid_10km

REM Geopackage dsra, _shakemap_hexgrid_10km_uc
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_10km_uc.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_10_uc" -nln %%x_shakemap_hexgrid_10km_uc

REM Geopackage dsra, _shakemap_hexgrid_25km
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_25km.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_25" -nln %%x_shakemap_hexgrid_25km

REM Geopackage dsra, _shakemap_hexgrid_25km_uc
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_25km_uc.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_25_uc" -nln %%x_shakemap_hexgrid_25km_uc

REM Geopackage dsra, _shakemap_hexgrid_50km_uc
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_50km_uc.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_50_uc" -nln %%x_shakemap_hexgrid_50km_uc

REM Geopackage dsra, _shakemap_hexgrid_100km_uc
FOR %%x IN (dsra_acm4p9_vedderfault, ^
dsra_acm5p0_georgiastraitfault, ^
dsra_acm5p0_mysterylake, ^
dsra_acm5p2_beaufortfault, ^
dsra_acm5p2_vedderfault, ^
dsra_acm5p5_southeypoint, ^
dsra_acm5p7_southeypoint, ^
dsra_acm7p7_queencharlottefault, ^
dsra_acm8p0_queencharlottefault, ^
dsra_scm5p0_burlingtontorontostructuralzone, ^
dsra_scm5p0_rougebeach, ^
dsra_scm5p6_gloucesterfault, ^
dsra_scm5p9_millesilesfault) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\%%x_shakemap_hexgrid_100km_uc.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM results_%%x.%%x_sm_hg_100_uc" -nln %%x_shakemap_hexgrid_100km_uc


REM Export DSRA master all scenarios views from postgis db into Geopackage. Change ogr2ogr path, location paths, db information if needed.

@REM REM Geopackage dsra, _all_scenarios
@REM FOR %%x IN (dsra_all_scenarios_building, ^
@REM dsra_all_scenarios_cduid, ^
@REM dsra_all_scenarios_csduid, ^
@REM dsra_all_scenarios_dauid, ^
@REM dsra_all_scenarios_eruid, ^
@REM dsra_all_scenarios_fsauid, ^
@REM dsra_all_scenarios_pruid, ^
@REM dsra_all_scenarios_sauid
@REM ) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\scenario_info\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM dsra.%%x" -nln %%x

REM Geopackage dsra, shakemap scenario extents
FOR %%x IN (shakemap_scenario_extents) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\scenario_info\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5432" -sql "SELECT * FROM gmf.%%x" -nln %%x


REM Create zip of each geopackage in given folders using 7zip.exe.  Delete all geopackages after zipping in directory.

REM earthquake scenarios
CD /D "D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM earthquake scenarios scenario info
CD /D "D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\scenario_info\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg


ECHO %TIME% 
PAUSE