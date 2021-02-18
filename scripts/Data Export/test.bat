REM Geopackage PE PSRA
FOR %%x IN (psra_pe_all_indicators_b) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_pe.%%x" -nln %%x

FOR %%x IN (psra_pe_all_indicators_b) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\test\%%x_%%y.gpkg D:\Workspace\data\view_outputs\test\gpkg_2_gpkg\psra_pe_all_indicators_b.gpkg -sql "SELECT * FROM psra_pe_all_indicators_b WHERE eruid = '%%y'" -nln %%x_%%y)

PAUSE