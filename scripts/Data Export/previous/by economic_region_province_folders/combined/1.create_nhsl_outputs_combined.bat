REM Export NHSL physical exposure views from postgis db into Geopackage by economic region. Change ogr2ogr path,location paths,db information if needed.

ECHO %TIME%
REM Geopackage physical exposure BC
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\bc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure NL
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\nl\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure PE
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\pe\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure NS
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\ns\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure NB
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\nb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure QC
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\qc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure ON
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\on\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure MB
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (4610,4620,4630,4640,4650,4660,4670,4680) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\mb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure SK
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (4710,4720,4730,4740,4750,4760) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\sk\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure AB
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (4810,4820,4830,4840,4850,4860,4870,4880) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\ab\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure YT
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (6010) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\yt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure NT
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (6110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\nt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage physical exposure NU
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO (FOR %%y IN (6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\nu\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE eruid = '%%y'" -nln %%x_%%y)



REM Export NHSL hazard threat views from postgis db into Geopackage by economic region. Change ogr2ogr path,location paths,db information if needed.
 
REM Geopackage multi hazard threat BC
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\bc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat NL
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\nl\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat PE
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\pe\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat NS
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\ns\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat NB
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\nb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat QC
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\qc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat ON
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\on\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat MB
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (4610,4620,4630,4640,4650,4660,4670,4680) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\mb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat SK
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (4710,4720,4730,4740,4750,4760) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\sk\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat AB
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (4810,4820,4830,4840,4850,4860,4870,4880) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\ab\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat YT
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (6010) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\yt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat NT
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (6110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\nt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage multi hazard threat NU
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\nu\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)



REM Export NHSL risk dynamics views from postgis db into Geopackage by economic region. Change ogr2ogr path,location paths,db information if needed.

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



REM Export NHSL social fabric views from postgis db into Geopackage by economic region. Change ogr2ogr path,location paths,db information if needed.

REM Geopackage social fabric BC
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\bc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric NL
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\nl\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric PE
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\pe\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric NS
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\ns\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric NB
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\nb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric QC
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\qc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric ON
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\on\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric MB
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (4610,4620,4630,4640,4650,4660,4670,4680) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\mb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric SK
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (4710,4720,4730,4740,4750,4760) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\sk\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric AB
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (4810,4820,4830,4840,4850,4860,4870,4880) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\ab\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric YT
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (6010) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\yt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric NT
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (6110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\nt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage social fabric NU
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO (FOR %%y IN (6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\nu\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'" -nln %%x_%%y)


REM Export NHSL P/T views from postgis db into Geopackage. Change ogr2ogr path,location paths,db information if needed.

ECHO %TIME% 
REM Geopackage physical exposure
FOR %%x IN (nhsl_physical_exposure_all_indicators_b, ^
nhsl_physical_exposure_all_indicators_b_ab, ^
nhsl_physical_exposure_all_indicators_b_bc, ^
nhsl_physical_exposure_all_indicators_b_mb, ^
nhsl_physical_exposure_all_indicators_b_nb, ^
nhsl_physical_exposure_all_indicators_b_nl, ^
nhsl_physical_exposure_all_indicators_b_ns, ^
nhsl_physical_exposure_all_indicators_b_nt, ^
nhsl_physical_exposure_all_indicators_b_nu, ^
nhsl_physical_exposure_all_indicators_b_on, ^
nhsl_physical_exposure_all_indicators_b_pe, ^
nhsl_physical_exposure_all_indicators_b_qc, ^
nhsl_physical_exposure_all_indicators_b_sk, ^
nhsl_physical_exposure_all_indicators_b_yt, ^
nhsl_physical_exposure_all_indicators_s, ^
nhsl_physical_exposure_all_indicators_s_ab, ^
nhsl_physical_exposure_all_indicators_s_bc, ^
nhsl_physical_exposure_all_indicators_s_mb, ^
nhsl_physical_exposure_all_indicators_s_nb, ^
nhsl_physical_exposure_all_indicators_s_nl, ^
nhsl_physical_exposure_all_indicators_s_ns, ^
nhsl_physical_exposure_all_indicators_s_nt, ^
nhsl_physical_exposure_all_indicators_s_nu, ^
nhsl_physical_exposure_all_indicators_s_on, ^
nhsl_physical_exposure_all_indicators_s_pe, ^
nhsl_physical_exposure_all_indicators_s_qc, ^
nhsl_physical_exposure_all_indicators_s_sk, ^
nhsl_physical_exposure_all_indicators_s_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x" -nln %%x

REM Geopackage risk dynamics
FOR %%x IN (nhsl_risk_dynamics_all_indicators, ^
nhsl_risk_dynamics_all_indicators_ab, ^
nhsl_risk_dynamics_all_indicators_bc, ^
nhsl_risk_dynamics_all_indicators_mb, ^
nhsl_risk_dynamics_all_indicators_nb, ^
nhsl_risk_dynamics_all_indicators_nl, ^
nhsl_risk_dynamics_all_indicators_ns, ^
nhsl_risk_dynamics_all_indicators_nt, ^
nhsl_risk_dynamics_all_indicators_nu, ^
nhsl_risk_dynamics_all_indicators_on, ^
nhsl_risk_dynamics_all_indicators_pe, ^
nhsl_risk_dynamics_all_indicators_qc, ^
nhsl_risk_dynamics_all_indicators_sk, ^
nhsl_risk_dynamics_all_indicators_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x" -nln %%x

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
nhsl_social_fabric_all_indicators_s_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x" -nln %%x

REM Geopackage multi hazard threat
FOR %%x IN (nhsl_hazard_threat_all_indicators_s, ^
nhsl_hazard_threat_all_indicators_s_ab, ^
nhsl_hazard_threat_all_indicators_s_bc, ^
nhsl_hazard_threat_all_indicators_s_mb, ^
nhsl_hazard_threat_all_indicators_s_nb, ^
nhsl_hazard_threat_all_indicators_s_nl, ^
nhsl_hazard_threat_all_indicators_s_ns, ^
nhsl_hazard_threat_all_indicators_s_nt, ^
nhsl_hazard_threat_all_indicators_s_nu, ^
nhsl_hazard_threat_all_indicators_s_on, ^
nhsl_hazard_threat_all_indicators_s_pe, ^
nhsl_hazard_threat_all_indicators_s_qc, ^
nhsl_hazard_threat_all_indicators_s_sk, ^
nhsl_hazard_threat_all_indicators_s_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x" -nln %%x

REM Geopackage multi hazard threat
FOR %%x IN (nhsl_hazard_threat_all_indicators_b, ^
nhsl_hazard_threat_all_indicators_b_ab, ^
nhsl_hazard_threat_all_indicators_b_bc, ^
nhsl_hazard_threat_all_indicators_b_mb, ^
nhsl_hazard_threat_all_indicators_b_nb, ^
nhsl_hazard_threat_all_indicators_b_nl, ^
nhsl_hazard_threat_all_indicators_b_ns, ^
nhsl_hazard_threat_all_indicators_b_nt, ^
nhsl_hazard_threat_all_indicators_b_nu, ^
nhsl_hazard_threat_all_indicators_b_on, ^
nhsl_hazard_threat_all_indicators_b_pe, ^
nhsl_hazard_threat_all_indicators_b_qc, ^
nhsl_hazard_threat_all_indicators_b_sk, ^
nhsl_hazard_threat_all_indicators_b_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x" -nln %%x

ECHO %TIME% 
PAUSE