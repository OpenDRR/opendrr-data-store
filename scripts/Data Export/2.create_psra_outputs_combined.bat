REM Export PSRA views from postgis db into GeoPackages by P/T. Change ogr2ogr path, location paths, db information if needed.
ECHO %TIME%

REM Geopackage AB PSRA
FOR %%x IN (psra_ab_indicators_b, ^
psra_ab_indicators_s, ^
psra_ab_indicators_csd, ^
psra_ab_expected_loss_fsa, ^
psra_ab_agg_loss_fsa, ^
psra_ab_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\ab\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_ab.%%x" -nln %%x

REM Geopackage BC PSRA
FOR %%x IN (psra_bc_indicators_b, ^
psra_bc_indicators_s, ^
psra_bc_indicators_csd, ^
psra_bc_expected_loss_fsa, ^
psra_bc_agg_loss_fsa, ^
psra_bc_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\bc\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_bc.%%x" -nln %%x

REM Geopackage MB PSRA
FOR %%x IN (psra_mb_indicators_b, ^
psra_mb_indicators_s, ^
psra_mb_indicators_csd, ^
psra_mb_expected_loss_fsa, ^
psra_mb_agg_loss_fsa, ^
psra_mb_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\mb\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_mb.%%x" -nln %%x

REM Geopackage NB PSRA
FOR %%x IN (psra_nb_indicators_b, ^
psra_nb_indicators_s, ^
psra_nb_indicators_csd, ^
psra_nb_expected_loss_fsa, ^
psra_nb_agg_loss_fsa, ^
psra_nb_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nb\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_nb.%%x" -nln %%x

REM Geopackage NL PSRA
FOR %%x IN (psra_nl_indicators_b, ^
psra_nl_indicators_s, ^
psra_nl_indicators_csd, ^
psra_nl_expected_loss_fsa, ^
psra_nl_agg_loss_fsa, ^
psra_nl_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nl\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_nl.%%x" -nln %%x

REM Geopackage NS PSRA
FOR %%x IN (psra_ns_indicators_b, ^
psra_ns_indicators_s, ^
psra_ns_indicators_csd, ^
psra_ns_expected_loss_fsa, ^
psra_ns_agg_loss_fsa, ^
psra_ns_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\ns\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_ns.%%x" -nln %%x

REM Geopackage NT PSRA
FOR %%x IN (psra_nt_indicators_b, ^
psra_nt_indicators_s, ^
psra_nt_indicators_csd, ^
psra_nt_expected_loss_fsa, ^
psra_nt_agg_loss_fsa, ^
psra_nt_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nt\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_nt.%%x" -nln %%x

REM Geopackage NU PSRA
FOR %%x IN (psra_nu_indicators_b, ^
psra_nu_indicators_s, ^
psra_nu_indicators_csd, ^
psra_nu_expected_loss_fsa, ^
psra_nu_agg_loss_fsa, ^
psra_nu_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nu\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_nu.%%x" -nln %%x

REM Geopackage ON PSRA
FOR %%x IN (psra_on_indicators_b, ^
psra_on_indicators_s, ^
psra_on_indicators_csd, ^
psra_on_expected_loss_fsa, ^
psra_on_agg_loss_fsa, ^
psra_on_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\on\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_on.%%x" -nln %%x

REM Geopackage PE PSRA
FOR %%x IN (psra_pe_indicators_b, ^
psra_pe_indicators_s, ^
psra_pe_indicators_csd, ^
psra_pe_expected_loss_fsa, ^
psra_pe_agg_loss_fsa, ^
psra_pe_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\pe\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_pe.%%x" -nln %%x

REM Geopackage QC PSRA
FOR %%x IN (psra_qc_indicators_b, ^
psra_qc_indicators_s, ^
psra_qc_indicators_csd, ^
psra_qc_expected_loss_fsa, ^
psra_qc_agg_loss_fsa, ^
psra_qc_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\qc\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_qc.%%x" -nln %%x

REM Geopackage SK PSRA
FOR %%x IN (psra_sk_indicators_b, ^
psra_sk_indicators_s, ^
psra_sk_indicators_csd, ^
psra_sk_expected_loss_fsa, ^
psra_sk_agg_loss_fsa, ^
psra_sk_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\sk\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_sk.%%x" -nln %%x

REM Geopackage YT PSRA
FOR %%x IN (psra_yt_indicators_b, ^
psra_yt_indicators_s, ^
psra_yt_indicators_csd, ^
psra_yt_expected_loss_fsa, ^
psra_yt_agg_loss_fsa, ^
psra_yt_src_loss) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\yt\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_yt.%%x" -nln %%x


REM Export PSRA views from postgis db into GeoPackages for national level. Change ogr2ogr path, location paths, db information if needed.

REM Geopackage national PSRA
FOR %%x IN (psra_indicators_b, ^
psra_indicators_s, ^
psra_indicators_csd, ^
psra_agg_loss_fsa, ^
psra_expected_loss_fsa, ^
psra_src_loss, ^
psra_canada_agg_loss, ^
psra_canada_expected_loss, ^
psra_canada_expected_loss_500yr, ^
psra_canada_src_loss, ^
psra_indicators_hexgrid_1km, ^
psra_indicators_hexgrid_1km_uc, ^
psra_indicators_hexgrid_5km, ^
psra_indicators_hexgrid_5km_uc, ^
psra_indicators_hexgrid_10km, ^
psra_indicators_hexgrid_10km_uc, ^
psra_indicators_hexgrid_25km, ^
psra_indicators_hexgrid_25km_uc, ^
psra_indicators_hexgrid_50km_uc, ^
psra_indicators_hexgrid_100km_uc) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\national\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_psra_national.%%x" -nln %%x


REM Create zip of each geopackage in given folders using 7zip.exe.  Delete all geopackages after zipping in directory.
REM AB
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\ab\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM BC
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\bc\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM MB
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\mb\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NB
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nb\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NL
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nl\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NS
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\ns\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NT
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nt\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NU
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nu\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM ON
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\on\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM PE
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\pe\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM QC
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\qc\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM SK
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\sk\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM YT
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\yt\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM national
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\national\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM social_fabric
CD /D "D:\Workspace\data\view_outputs\all_indicators\social_fabric\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg


ECHO %TIME%
PAUSE