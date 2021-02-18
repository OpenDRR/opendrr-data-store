REM Export views from postgis db. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage BC PSRA
FOR %%x IN (psra_bc_all_indicators_b,psra_bc_all_indicators_s) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_bc.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE


REM Geopackage NL PSRA
FOR %%x IN (psra_nl_all_indicators_b,psra_nl_all_indicators_s) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nl.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE



REM Geopackage PE PSRA
FOR %%x IN (psra_pe_all_indicators_b,psra_pe_all_indicators_s) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_pe.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE



REM Geopackage NS PSRA
FOR %%x IN (psra_ns_all_indicators_b,psra_ns_all_indicators_s) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ns.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE



REM Geopackage NB PSRA
FOR %%x IN (psra_nb_all_indicators_b,psra_nb_all_indicators_s) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nb.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE



REM Geopackage QC PSRA
FOR %%x IN (psra_qc_all_indicators_b,psra_qc_all_indicators_s) DO (FOR %%y IN (2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_qc.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE




REM Geopackage ON PSRA
FOR %%x IN (psra_on_all_indicators_b,psra_on_all_indicators_s) DO (FOR %%y IN (3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_on.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE




REM Geopackage MB PSRA
FOR %%x IN (psra_mb_all_indicators_b,psra_mb_all_indicators_s) DO (FOR %%y IN (4610,4620,4630,4640,4650,4660,4670,4680) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_mb.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE



REM Geopackage SK PSRA
FOR %%x IN (psra_sk_all_indicators_b,psra_sk_all_indicators_s) DO (FOR %%y IN (4710,4720,4730,4740,4750,4760) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_sk.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE



REM Geopackage AB PSRA
FOR %%x IN (psra_ab_all_indicators_b,psra_ab_all_indicators_s) DO (FOR %%y IN (4810,4820,4830,4840,4850,4860,4870,4880) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ab.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE



REM Geopackage YT PSRA
FOR %%x IN (psra_yt_all_indicators_b,psra_yt_all_indicators_s) DO (FOR %%y IN (6010) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_yt.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE



REM Geopackage NT PSRA
FOR %%x IN (psra_nt_all_indicators_b,psra_nt_all_indicators_s) DO (FOR %%y IN (6110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nt.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE



REM Geopackage NU PSRA
FOR %%x IN (psra_nu_all_indicators_b,psra_nu_all_indicators_s) DO (FOR %%y IN (6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nu.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE
