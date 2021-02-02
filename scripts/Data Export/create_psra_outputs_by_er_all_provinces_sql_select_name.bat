REM Export views from postgis db. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage BC PSRA
FOR %%x IN (psra_bc_all_indicators_b,psra_bc_all_indicators_s) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_bc.%%x WHERE eruid = '%%y'" -nln %%x_%%y)


FOR %%x IN (psra_bc_all_indicators_b, ^
psra_bc_all_indicators_s, ^
psra_bc_pml_s, ^
psra_bc_src_loss, ^
psra_bc_hcurves_pga, ^
psra_bc_hcurves_sa0p1, ^
psra_bc_hcurves_sa0p2, ^
psra_bc_hcurves_sa0p3, ^
psra_bc_hcurves_sa0p5, ^
psra_bc_hcurves_sa0p6, ^
psra_bc_hcurves_sa1p0, ^
psra_bc_hcurves_sa2p0, ^
psra_bc_hmaps, ^
psra_bc_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_bc.%%x" -nln %%x

PAUSE


REM Geopackage NL PSRA
FOR %%x IN (psra_nl_all_indicators_b,psra_nl_all_indicators_s) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nl.%%x WHERE eruid = '%%y'" -nln %%x_%%y)


FOR %%x IN (psra_nl_all_indicators_b, ^
psra_nl_all_indicators_s, ^
psra_nl_pml_s, ^
psra_nl_src_loss, ^
psra_nl_hcurves_pga, ^
psra_nl_hcurves_sa0p1, ^
psra_nl_hcurves_sa0p2, ^
psra_nl_hcurves_sa0p3, ^
psra_nl_hcurves_sa0p5, ^
psra_nl_hcurves_sa0p6, ^
psra_nl_hcurves_sa1p0, ^
psra_nl_hcurves_sa2p0, ^
psra_nl_hmaps, ^
psra_nl_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nl.%%x" -nln %%x

PAUSE


REM Geopackage PE PSRA
FOR %%x IN (psra_pe_all_indicators_b,psra_pe_all_indicators_s) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_pe.%%x WHERE eruid = '%%y'" -nln %%x_%%y)


FOR %%x IN (psra_pe_all_indicators_b, ^
psra_pe_all_indicators_s, ^
psra_pe_pml_s, ^
psra_pe_src_loss, ^
psra_pe_hcurves_pga, ^
psra_pe_hcurves_sa0p1, ^
psra_pe_hcurves_sa0p2, ^
psra_pe_hcurves_sa0p3, ^
psra_pe_hcurves_sa0p5, ^
psra_pe_hcurves_sa0p6, ^
psra_pe_hcurves_sa1p0, ^
psra_pe_hcurves_sa2p0, ^
psra_pe_hmaps, ^
psra_pe_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_pe.%%x" -nln %%x

PAUSE


REM Geopackage NS PSRA
FOR %%x IN (psra_ns_all_indicators_b,psra_ns_all_indicators_s) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ns.%%x WHERE eruid = '%%y'" -nln %%x_%%y)


FOR %%x IN (psra_ns_all_indicators_b, ^
psra_ns_all_indicators_s, ^
psra_ns_pml_s, ^
psra_ns_src_loss, ^
psra_ns_hcurves_pga, ^
psra_ns_hcurves_sa0p1, ^
psra_ns_hcurves_sa0p2, ^
psra_ns_hcurves_sa0p3, ^
psra_ns_hcurves_sa0p5, ^
psra_ns_hcurves_sa0p6, ^
psra_ns_hcurves_sa1p0, ^
psra_ns_hcurves_sa2p0, ^
psra_ns_hmaps, ^
psra_ns_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ns.%%x" -nln %%x

PAUSE


REM Geopackage NB PSRA
FOR %%x IN (psra_nb_all_indicators_b,psra_nb_all_indicators_s) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nb.%%x WHERE eruid = '%%y'" -nln %%x_%%y)


FOR %%x IN (psra_nb_all_indicators_b, ^
psra_nb_all_indicators_s, ^
psra_nb_pml_s, ^
psra_nb_src_loss, ^
psra_nb_hcurves_pga, ^
psra_nb_hcurves_sa0p1, ^
psra_nb_hcurves_sa0p2, ^
psra_nb_hcurves_sa0p3, ^
psra_nb_hcurves_sa0p5, ^
psra_nb_hcurves_sa0p6, ^
psra_nb_hcurves_sa1p0, ^
psra_nb_hcurves_sa2p0, ^
psra_nb_hmaps, ^
psra_nb_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\%%x_.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nb.%%x" -nln %%x

PAUSE