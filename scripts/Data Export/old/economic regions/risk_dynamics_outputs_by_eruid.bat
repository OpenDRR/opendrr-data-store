REM export risk dynamics layer by economic region into geopackages

ECHO %time%

REM ab
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (4810,4820,4830,4840,4850,4860,4870,4880) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\ab\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM bc
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\bc\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM mb
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (4610,4620,4630,4640,4650,4660,4670,4680) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\mb\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM nb
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\nb\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM nl
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\nl\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM ns
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\ns\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM nt
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (6110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\nt\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM nu
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\nu\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM on
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\on\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM pe
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\pe\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM qc
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\qc\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM sk
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (4710,4720,4730,4740,4750,4760) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\sk\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

REM yt
FOR %%x IN (nhsl_risk_dynamics_hazard_susceptibility,nhsl_risk_dynamics_land_use_change,nhsl_risk_dynamics_population_growth) DO (FOR %%y IN (6010) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\yt\risk_dynamics\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE eruid = '%%y'")

ECHO %time%

PAUSE