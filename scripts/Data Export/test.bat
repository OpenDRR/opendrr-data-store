REM Export views from postgis db. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage social fabric
FOR %%x IN (nhsl_social_fabric_all_indicators_s, ^
nhsl_social_fabric_all_indicators_s_ab, ^
nhsl_social_fabric_all_indicators_s_bc, ^
nhsl_social_fabric_all_indicators_s_mb, ^
nhsl_social_fabric_all_indicators_s_nb, ^
nhsl_social_fabric_all_indicators_s_nl, ^
nhsl_social_fabric_all_indicators_s_ns, ^
nhsl_social_fabric_all_indicators_s_nt, ^
nhsl_social_fabric_all_indicators_s_nu, ^
nhsl_social_fabric_all_indicators_s_on, ^
nhsl_social_fabric_all_indicators_s_pe, ^
nhsl_social_fabric_all_indicators_s_qc, ^
nhsl_social_fabric_all_indicators_s_sk, ^
nhsl_social_fabric_all_indicators_s_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\province\sql_select\social_fabric\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x"

REM Geopackage social fabric
FOR %%x IN (nhsl_social_fabric_all_indicators_s, ^
nhsl_social_fabric_all_indicators_s_ab, ^
nhsl_social_fabric_all_indicators_s_bc, ^
nhsl_social_fabric_all_indicators_s_mb, ^
nhsl_social_fabric_all_indicators_s_nb, ^
nhsl_social_fabric_all_indicators_s_nl, ^
nhsl_social_fabric_all_indicators_s_ns, ^
nhsl_social_fabric_all_indicators_s_nt, ^
nhsl_social_fabric_all_indicators_s_nu, ^
nhsl_social_fabric_all_indicators_s_on, ^
nhsl_social_fabric_all_indicators_s_pe, ^
nhsl_social_fabric_all_indicators_s_qc, ^
nhsl_social_fabric_all_indicators_s_sk, ^
nhsl_social_fabric_all_indicators_s_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\province\layer_name\social_fabric\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x" -nln %%x