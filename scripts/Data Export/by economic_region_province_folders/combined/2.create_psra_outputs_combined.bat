REM Export PSRA views from postgis db into Geopackage by economic region. Change ogr2ogr path, location paths, db information if needed.

ECHO %TIME%
REM Geopackage BC PSRA
FOR %%x IN (psra_bc_all_indicators_b,psra_bc_all_indicators_s) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\bc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_bc.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage NL PSRA
FOR %%x IN (psra_nl_all_indicators_b,psra_nl_all_indicators_s) DO (FOR %%y IN (1010,1020,1030,1040) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\nl\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nl.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage PE PSRA
FOR %%x IN (psra_pe_all_indicators_b,psra_pe_all_indicators_s) DO (FOR %%y IN (1110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\pe\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_pe.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage NS PSRA
FOR %%x IN (psra_ns_all_indicators_b,psra_ns_all_indicators_s) DO (FOR %%y IN (1210,1220,1230,1240,1250) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\ns\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ns.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage NB PSRA
FOR %%x IN (psra_nb_all_indicators_b,psra_nb_all_indicators_s) DO (FOR %%y IN (1310,1320,1330,1340,1350) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\nb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nb.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage QC PSRA
FOR %%x IN (psra_qc_all_indicators_b,psra_qc_all_indicators_s) DO (FOR %%y IN (2410,2415,2420,2425,2430,2433,2435,2440,2445,2450,2455,2460,2465,2470,2475,2480,2490) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\qc\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_qc.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage ON PSRA
FOR %%x IN (psra_on_all_indicators_b,psra_on_all_indicators_s) DO (FOR %%y IN (3510,3515,3520,3530,3540,3550,3560,3570,3580,3590,3595) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\on\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_on.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage MB PSRA
FOR %%x IN (psra_mb_all_indicators_b,psra_mb_all_indicators_s) DO (FOR %%y IN (4610,4620,4630,4640,4650,4660,4670,4680) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\mb\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_mb.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage SK PSRA
FOR %%x IN (psra_sk_all_indicators_b,psra_sk_all_indicators_s) DO (FOR %%y IN (4710,4720,4730,4740,4750,4760) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\sk\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_sk.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage AB PSRA
FOR %%x IN (psra_ab_all_indicators_b,psra_ab_all_indicators_s) DO (FOR %%y IN (4810,4820,4830,4840,4850,4860,4870,4880) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\ab\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ab.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage YT PSRA
FOR %%x IN (psra_yt_all_indicators_b,psra_yt_all_indicators_s) DO (FOR %%y IN (6010) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\yt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_yt.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage NT PSRA
FOR %%x IN (psra_nt_all_indicators_b,psra_nt_all_indicators_s) DO (FOR %%y IN (6110) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\nt\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nt.%%x WHERE eruid = '%%y'" -nln %%x_%%y)

REM Geopackage NU PSRA
FOR %%x IN (psra_nu_all_indicators_b,psra_nu_all_indicators_s) DO (FOR %%y IN (6210) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\nu\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nu.%%x WHERE eruid = '%%y'" -nln %%x_%%y)



REM Export PSRA views from postgis db into Geopackage by province. Change ogr2ogr path, location paths, db information if needed.


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
psra_bc_hmaps_xref, ^
psra_bc_agg_curves_stats, ^
psra_bc_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\bc\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_bc.%%x" -nln %%x

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
psra_nl_hmaps_xref, ^
psra_nl_agg_curves_stats, ^
psra_nl_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nl\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nl.%%x" -nln %%x

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
psra_pe_hmaps_xref, ^
psra_pe_agg_curves_stats, ^
psra_pe_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\pe\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_pe.%%x" -nln %%x

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
psra_ns_hmaps_xref, ^
psra_ns_agg_curves_stats, ^
psra_ns_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\ns\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ns.%%x" -nln %%x

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
psra_nb_hmaps_xref, ^
psra_nb_agg_curves_stats, ^
psra_nb_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nb\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nb.%%x" -nln %%x

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
psra_qc_hmaps_xref, ^
psra_qc_agg_curves_stats, ^
psra_qc_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\qc\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_qc.%%x" -nln %%x

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
psra_on_hmaps_xref, ^
psra_on_agg_curves_stats, ^
psra_on_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\on\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_on.%%x" -nln %%x

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
psra_mb_hmaps_xref, ^
psra_mb_agg_curves_stats, ^
psra_mb_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\mb\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_mb.%%x" -nln %%x

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
psra_sk_hmaps_xref, ^
psra_sk_agg_curves_stats, ^
psra_sk_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\sk\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_sk.%%x" -nln %%x

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
psra_ab_hmaps_xref, ^
psra_ab_agg_curves_stats, ^
psra_ab_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\ab\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_ab.%%x" -nln %%x

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
psra_yt_hmaps_xref, ^
psra_yt_agg_curves_stats, ^
psra_yt_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\yt\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_yt.%%x" -nln %%x

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
psra_nt_hmaps_xref, ^
psra_nt_agg_curves_stats, ^
psra_nt_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nt\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nt.%%x" -nln %%x

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
psra_nu_hmaps_xref, ^
psra_nu_agg_curves_stats, ^
psra_nu_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nu\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_nu.%%x" -nln %%x




REM Export PSRA views from postgis db into Geopackage for national level. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage national PSRA
FOR %%x IN (psra_all_indicators_b, ^
psra_all_indicators_s, ^
psra_pml_s, ^
psra_src_loss, ^
psra_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\national\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_psra_national.%%x" -nln %%x

ECHO %TIME%
PAUSE