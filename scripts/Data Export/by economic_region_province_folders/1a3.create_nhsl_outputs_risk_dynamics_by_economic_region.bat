REM Export NHSL risk dynamics views from postgis db into Geopackage by economic region. Change ogr2ogr path,location paths,db information if needed.

ECHO %TIME% 
REM Geopackage risk dynamics BC
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\bc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics NL
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\nl\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics PE
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\pe\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics NS
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\ns\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics NB
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\nb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics QC
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\qc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics ON
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\on\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics MB
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (4610,4620,4630,4640,4650,4660,4670,4680) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\mb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics SK
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (4710,4720,4730,4740,4750,4760) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\sk\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics AB
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (4810,4820,4830,4840,4850,4860,4870,4880) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\ab\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics YT
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (6010) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\yt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics NT
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (6110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\nt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage risk dynamics NU
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO (FOR %%y IN (6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\nu\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

ECHO %TIME% 
PAUSE