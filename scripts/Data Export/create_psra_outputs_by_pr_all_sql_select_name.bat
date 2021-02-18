REM Export views from postgis db. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage BC PSRA
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
psra_bc_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_bc.%%x" -nln %%x




REM Geopackage NL PSRA
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
psra_nl_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nl.%%x" -nln %%x




REM Geopackage PE PSRA
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
psra_pe_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_pe.%%x" -nln %%x




REM Geopackage NS PSRA
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
psra_ns_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ns.%%x" -nln %%x




REM Geopackage NB PSRA
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
psra_nb_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nb.%%x" -nln %%x




REM Geopackage QC PSRA
FOR %%x IN (psra_qc_all_indicators_b, ^
psra_qc_all_indicators_s, ^
psra_qc_pml_s, ^
psra_qc_src_loss, ^
psra_qc_hcurves_pga, ^
psra_qc_hcurves_sa0p1, ^
psra_qc_hcurves_sa0p2, ^
psra_qc_hcurves_sa0p3, ^
psra_qc_hcurves_sa0p5, ^
psra_qc_hcurves_sa0p6, ^
psra_qc_hcurves_sa1p0, ^
psra_qc_hcurves_sa2p0, ^
psra_qc_hmaps, ^
psra_qc_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_qc.%%x" -nln %%x





REM Geopackage ON PSRA
FOR %%x IN (psra_on_all_indicators_b, ^
psra_on_all_indicators_s, ^
psra_on_pml_s, ^
psra_on_src_loss, ^
psra_on_hcurves_pga, ^
psra_on_hcurves_sa0p1, ^
psra_on_hcurves_sa0p2, ^
psra_on_hcurves_sa0p3, ^
psra_on_hcurves_sa0p5, ^
psra_on_hcurves_sa0p6, ^
psra_on_hcurves_sa1p0, ^
psra_on_hcurves_sa2p0, ^
psra_on_hmaps, ^
psra_on_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_on.%%x" -nln %%x





REM Geopackage MB PSRA
FOR %%x IN (psra_mb_all_indicators_b, ^
psra_mb_all_indicators_s, ^
psra_mb_pml_s, ^
psra_mb_src_loss, ^
psra_mb_hcurves_pga, ^
psra_mb_hcurves_sa0p1, ^
psra_mb_hcurves_sa0p2, ^
psra_mb_hcurves_sa0p3, ^
psra_mb_hcurves_sa0p5, ^
psra_mb_hcurves_sa0p6, ^
psra_mb_hcurves_sa1p0, ^
psra_mb_hcurves_sa2p0, ^
psra_mb_hmaps, ^
psra_mb_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_mb.%%x" -nln %%x




REM Geopackage SK PSRA
FOR %%x IN (psra_sk_all_indicators_b, ^
psra_sk_all_indicators_s, ^
psra_sk_pml_s, ^
psra_sk_src_loss, ^
psra_sk_hcurves_pga, ^
psra_sk_hcurves_sa0p1, ^
psra_sk_hcurves_sa0p2, ^
psra_sk_hcurves_sa0p3, ^
psra_sk_hcurves_sa0p5, ^
psra_sk_hcurves_sa0p6, ^
psra_sk_hcurves_sa1p0, ^
psra_sk_hcurves_sa2p0, ^
psra_sk_hmaps, ^
psra_sk_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_sk.%%x" -nln %%x




REM Geopackage AB PSRA
FOR %%x IN (psra_ab_all_indicators_b, ^
psra_ab_all_indicators_s, ^
psra_ab_pml_s, ^
psra_ab_src_loss, ^
psra_ab_hcurves_pga, ^
psra_ab_hcurves_sa0p1, ^
psra_ab_hcurves_sa0p2, ^
psra_ab_hcurves_sa0p3, ^
psra_ab_hcurves_sa0p5, ^
psra_ab_hcurves_sa0p6, ^
psra_ab_hcurves_sa1p0, ^
psra_ab_hcurves_sa2p0, ^
psra_ab_hmaps, ^
psra_ab_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ab.%%x" -nln %%x




REM Geopackage YT PSRA
FOR %%x IN (psra_yt_all_indicators_b, ^
psra_yt_all_indicators_s, ^
psra_yt_pml_s, ^
psra_yt_src_loss, ^
psra_yt_hcurves_pga, ^
psra_yt_hcurves_sa0p1, ^
psra_yt_hcurves_sa0p2, ^
psra_yt_hcurves_sa0p3, ^
psra_yt_hcurves_sa0p5, ^
psra_yt_hcurves_sa0p6, ^
psra_yt_hcurves_sa1p0, ^
psra_yt_hcurves_sa2p0, ^
psra_yt_hmaps, ^
psra_yt_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_yt.%%x" -nln %%x




REM Geopackage NT PSRA
FOR %%x IN (psra_nt_all_indicators_b, ^
psra_nt_all_indicators_s, ^
psra_nt_pml_s, ^
psra_nt_src_loss, ^
psra_nt_hcurves_pga, ^
psra_nt_hcurves_sa0p1, ^
psra_nt_hcurves_sa0p2, ^
psra_nt_hcurves_sa0p3, ^
psra_nt_hcurves_sa0p5, ^
psra_nt_hcurves_sa0p6, ^
psra_nt_hcurves_sa1p0, ^
psra_nt_hcurves_sa2p0, ^
psra_nt_hmaps, ^
psra_nt_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nt.%%x" -nln %%x




REM Geopackage NU PSRA
FOR %%x IN (psra_nu_all_indicators_b, ^
psra_nu_all_indicators_s, ^
psra_nu_pml_s, ^
psra_nu_src_loss, ^
psra_nu_hcurves_pga, ^
psra_nu_hcurves_sa0p1, ^
psra_nu_hcurves_sa0p2, ^
psra_nu_hcurves_sa0p3, ^
psra_nu_hcurves_sa0p5, ^
psra_nu_hcurves_sa0p6, ^
psra_nu_hcurves_sa1p0, ^
psra_nu_hcurves_sa2p0, ^
psra_nu_hmaps, ^
psra_nu_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\layer_name\PR\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nu.%%x" -nln %%x

