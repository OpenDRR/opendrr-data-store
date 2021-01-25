REM export social fabric layer by economic region into geopackages

ECHO %time%

REM ab
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (4810,4820,4830,4840,4850,4860,4870,4880) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\ab\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM bc
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\bc\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM mb
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (4610,4620,4630,4640,4650,4660,4670,4680) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\mb\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM nb
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\nb\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM nl
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\nl\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM ns
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\ns\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM nt
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (6110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\nt\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM nu
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\nu\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM on
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\on\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM pe
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\pe\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM qc
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\qc\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM sk
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (4710,4720,4730,4740,4750,4760) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\sk\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

REM yt
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO (FOR %%y IN (6010) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\yt\social_fabric\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE eruid = '%%y'")

ECHO %time%

PAUSE