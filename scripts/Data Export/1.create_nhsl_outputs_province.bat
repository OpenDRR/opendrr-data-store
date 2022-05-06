REM Export NHSL P/T views from postgis db into GeoPackages. Change ogr2ogr path,location paths,db information if needed.

ECHO %TIME% 
REM Geopackage physical exposure
FOR %%x IN (nhsl_physical_exposure_indicators_b, ^
nhsl_physical_exposure_indicators_b_ab, ^
nhsl_physical_exposure_indicators_b_bc, ^
nhsl_physical_exposure_indicators_b_mb, ^
nhsl_physical_exposure_indicators_b_nb, ^
nhsl_physical_exposure_indicators_b_nl, ^
nhsl_physical_exposure_indicators_b_ns, ^
nhsl_physical_exposure_indicators_b_nt, ^
nhsl_physical_exposure_indicators_b_nu, ^
nhsl_physical_exposure_indicators_b_on, ^
nhsl_physical_exposure_indicators_b_pe, ^
nhsl_physical_exposure_indicators_b_qc, ^
nhsl_physical_exposure_indicators_b_sk, ^
nhsl_physical_exposure_indicators_b_yt, ^
nhsl_physical_exposure_indicators_s, ^
nhsl_physical_exposure_indicators_s_ab, ^
nhsl_physical_exposure_indicators_s_bc, ^
nhsl_physical_exposure_indicators_s_mb, ^
nhsl_physical_exposure_indicators_s_nb, ^
nhsl_physical_exposure_indicators_s_nl, ^
nhsl_physical_exposure_indicators_s_ns, ^
nhsl_physical_exposure_indicators_s_nt, ^
nhsl_physical_exposure_indicators_s_nu, ^
nhsl_physical_exposure_indicators_s_on, ^
nhsl_physical_exposure_indicators_s_pe, ^
nhsl_physical_exposure_indicators_s_qc, ^
nhsl_physical_exposure_indicators_s_sk, ^
nhsl_physical_exposure_indicators_s_yt, ^
nhsl_physical_exposure_indicators_hexbin_1km, ^
nhsl_physical_exposure_indicators_hexbin_1km_uc, ^
nhsl_physical_exposure_indicators_hexbin_5km, ^
nhsl_physical_exposure_indicators_hexbin_5km_uc, ^
nhsl_physical_exposure_indicators_hexbin_10km, ^
nhsl_physical_exposure_indicators_hexbin_10km_uc, ^
nhsl_physical_exposure_indicators_hexbin_25km_uc, ^
nhsl_physical_exposure_indicators_hexbin_50km_uc, ^
nhsl_physical_exposure_indicators_hexbin_100km_uc) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x" -nln %%x

@REM REM Geopackage risk dynamics
@REM FOR %%x IN (nhsl_risk_dynamics_indicators, ^
@REM nhsl_risk_dynamics_indicators_ab, ^
@REM nhsl_risk_dynamics_indicators_bc, ^
@REM nhsl_risk_dynamics_indicators_mb, ^
@REM nhsl_risk_dynamics_indicators_nb, ^
@REM nhsl_risk_dynamics_indicators_nl, ^
@REM nhsl_risk_dynamics_indicators_ns, ^
@REM nhsl_risk_dynamics_indicators_nt, ^
@REM nhsl_risk_dynamics_indicators_nu, ^
@REM nhsl_risk_dynamics_indicators_on, ^
@REM nhsl_risk_dynamics_indicators_pe, ^
@REM nhsl_risk_dynamics_indicators_qc, ^
@REM nhsl_risk_dynamics_indicators_sk, ^
@REM nhsl_risk_dynamics_indicators_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x" -nln %%x

REM Geopackage social fabric
FOR %%x IN (nhsl_social_fabric_indicators_s, ^
nhsl_social_fabric_indicators_s_ab, ^
nhsl_social_fabric_indicators_s_bc, ^
nhsl_social_fabric_indicators_s_mb, ^
nhsl_social_fabric_indicators_s_nb, ^
nhsl_social_fabric_indicators_s_nl, ^
nhsl_social_fabric_indicators_s_ns, ^
nhsl_social_fabric_indicators_s_nt, ^
nhsl_social_fabric_indicators_s_nu, ^
nhsl_social_fabric_indicators_s_on, ^
nhsl_social_fabric_indicators_s_pe, ^
nhsl_social_fabric_indicators_s_qc, ^
nhsl_social_fabric_indicators_s_sk, ^
nhsl_social_fabric_indicators_s_yt, ^
nhsl_social_fabric_indicators_hexgrid_1km, ^
nhsl_social_fabric_indicators_hexgrid_1km_uc, ^
nhsl_social_fabric_indicators_hexgrid_5km, ^
nhsl_social_fabric_indicators_hexgrid_5km_uc, ^
nhsl_social_fabric_indicators_hexgrid_10km, ^
nhsl_social_fabric_indicators_hexgrid_10km_uc, ^
nhsl_social_fabric_indicators_hexgrid_25km, ^
nhsl_social_fabric_indicators_hexgrid_25km_uc, ^
nhsl_social_fabric_indicators_hexgrid_50km_uc, ^
nhsl_social_fabric_indicators_hexgrid_100km_uc) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_nhsl_social_fabric.%%x" -nln %%x

@REM REM Geopackage multi hazard threat
@REM FOR %%x IN (nhsl_hazard_threat_indicators_s, ^
@REM nhsl_hazard_threat_indicators_s_ab, ^
@REM nhsl_hazard_threat_indicators_s_bc, ^
@REM nhsl_hazard_threat_indicators_s_mb, ^
@REM nhsl_hazard_threat_indicators_s_nb, ^
@REM nhsl_hazard_threat_indicators_s_nl, ^
@REM nhsl_hazard_threat_indicators_s_ns, ^
@REM nhsl_hazard_threat_indicators_s_nt, ^
@REM nhsl_hazard_threat_indicators_s_nu, ^
@REM nhsl_hazard_threat_indicators_s_on, ^
@REM nhsl_hazard_threat_indicators_s_pe, ^
@REM nhsl_hazard_threat_indicators_s_qc, ^
@REM nhsl_hazard_threat_indicators_s_sk, ^
@REM nhsl_hazard_threat_indicators_s_yt, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_1km, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_1km_uc, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_5km, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_5km_uc, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_10km, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_10km_uc, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_25km, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_25km_uc, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_50km_uc, ^
@REM nhsl_hazard_threat_prioritization_hexgrid_100km_uc) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x" -nln %%x


REM Create zip of each geopackage in given folders using 7zip.exe.  Delete all geopackages after zipping in directory.
@REM REM multi_hazard_threat
@REM CD /D "D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
@REM DEL *.gpkg

REM physical_exposure
CD /D "D:\Workspace\data\view_outputs\all_indicators\physical_exposure\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

@REM REM risk_dynamics
@REM CD /D "D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
@REM DEL *.gpkg

REM social_fabric
CD /D "D:\Workspace\data\view_outputs\all_indicators\social_fabric\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

ECHO %TIME% 
PAUSE