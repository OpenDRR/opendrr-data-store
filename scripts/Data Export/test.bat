REM Geopackage multi hazard threat
FOR %%x IN (nhsl_hazard_threat_all_indicators_s,nhsl_hazard_threat_all_indicators_b) DO (FOR %%y IN (1010,1020,1030,1040,1110,1210,1220,1230,1240,1250,1310,1320,1330,1340,1350,2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490,3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595,4610,4620,4630,4640,4650,4660,4670,4680,4710,4720,4730,4740,4750,4760,4810,4820,4830,4840,4850,4860,4870,4880,5910,5920,5930,5940,5950,5960,5970,5980,6010,6110,6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\economic_region\layer_name\multi_hazard_threat\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE eruid = '%%y'" -nln %%x_%%y)
PAUSE


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
nhsl_hazard_threat_all_indicators_s_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\province\layer_name\multi_hazard_threat\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x" -nln %%x
PAUSE

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
nhsl_hazard_threat_all_indicators_b_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\province\layer_name\multi_hazard_threat\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x" -nln %%x
PAUSE