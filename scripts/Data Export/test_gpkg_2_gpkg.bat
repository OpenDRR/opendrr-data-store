REM Geopackage NL PSRA
REM ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\psra_nl_all_indicators_b_1010.gpkg D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\nl\psra_nl_all_indicators_b_.gpkg -sql "SELECT * FROM psra_nl_all_indicators_b WHERE eruid = '1010'" -nln psra_nl_all_indicators_b_1010

REM Geopackage BC PSRA
FOR %%x IN (psra_bc_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_bc.%%x" -nln %%x

FOR %%x IN (psra_bc_all_indicators_b) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_bc_all_indicators_b.gpkg -sql "SELECT * FROM psra_bc_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)




REM Geopackage NL PSRA
FOR %%x IN (psra_nl_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nl.%%x" -nln %%x

FOR %%x IN (psra_nl_all_indicators_b) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_nl_all_indicators_b.gpkg -sql "SELECT * FROM psra_nl_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)




REM Geopackage PE PSRA
FOR %%x IN (psra_pe_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_pe.%%x" -nln %%x

FOR %%x IN (psra_pe_all_indicators_b) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_pe_all_indicators_b.gpkg -sql "SELECT * FROM psra_pe_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)



REM Geopackage NS PSRA
FOR %%x IN (psra_ns_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ns.%%x" -nln %%x

FOR %%x IN (psra_ns_all_indicators_b) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_ns_all_indicators_b.gpkg -sql "SELECT * FROM psra_ns_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)



REM Geopackage NB PSRA
FOR %%x IN (psra_nb_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nb.%%x" -nln %%x

FOR %%x IN (psra_nb_all_indicators_b) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_nb_all_indicators_b.gpkg -sql "SELECT * FROM psra_nb_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)






REM Geopackage QC PSRA
FOR %%x IN (psra_qc_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_qc.%%x" -nln %%x

FOR %%x IN (psra_qc_all_indicators_b) DO (FOR %%y IN (2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_qc_all_indicators_b.gpkg -sql "SELECT * FROM psra_qc_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)




REM Geopackage ON PSRA
FOR %%x IN (psra_on_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_on.%%x" -nln %%x

FOR %%x IN (psra_on_all_indicators_b) DO (FOR %%y IN (3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_on_all_indicators_b.gpkg -sql "SELECT * FROM psra_on_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)





REM Geopackage MB PSRA
FOR %%x IN (psra_mb_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_mb.%%x" -nln %%x

FOR %%x IN (psra_mb_all_indicators_b) DO (FOR %%y IN (4610,4620,4630,4640,4650,4660,4670,4680) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_mb_all_indicators_b.gpkg  -sql "SELECT * FROM psra_mb_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)



REM Geopackage SK PSRA
FOR %%x IN (psra_sk_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_sk.%%x" -nln %%x

FOR %%x IN (psra_sk_all_indicators_b) DO (FOR %%y IN (4710,4720,4730,4740,4750,4760) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_sk_all_indicators_b.gpkg -sql "SELECT * FROM psra_sk_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)





REM Geopackage AB PSRA
FOR %%x IN (psra_ab_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ab.%%x" -nln %%x

FOR %%x IN (psra_ab_all_indicators_b) DO (FOR %%y IN (4810,4820,4830,4840,4850,4860,4870,4880) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_ab_all_indicators_b.gpkg -sql "SELECT * FROM psra_ab_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)



REM Geopackage YT PSRA
FOR %%x IN (psra_yt_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_yt.%%x" -nln %%x

FOR %%x IN (psra_yt_all_indicators_b) DO (FOR %%y IN (6010) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_yt_all_indicators_b.gpkg -sql "SELECT * FROM psra_yt_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)



REM Geopackage NT PSRA
FOR %%x IN (psra_nt_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nt.%%x" -nln %%x

FOR %%x IN (psra_nt_all_indicators_b) DO (FOR %%y IN (6110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_nt_all_indicators_b.gpkg -sql "SELECT * FROM psra_nt_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)




REM Geopackage NU PSRA
FOR %%x IN (psra_nu_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nu.%%x" -nln %%x

FOR %%x IN (psra_nu_all_indicators_b) DO (FOR %%y IN (6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_nu_all_indicators_b.gpkg -sql "SELECT * FROM psra_nu_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)

