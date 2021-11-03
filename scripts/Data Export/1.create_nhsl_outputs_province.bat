REM Export NHSL P/T views from postgis db into Geopackage. Change ogr2ogr path,location paths,db information if needed.

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
nhsl_physical_exposure_indicators_s_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\physical_exposure\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x" -nln %%x

REM Geopackage risk dynamics
FOR %%x IN (nhsl_risk_dynamics_all_indicators, ^
nhsl_risk_dynamics_indicators_ab, ^
nhsl_risk_dynamics_indicators_bc, ^
nhsl_risk_dynamics_indicators_mb, ^
nhsl_risk_dynamics_indicators_nb, ^
nhsl_risk_dynamics_indicators_nl, ^
nhsl_risk_dynamics_indicators_ns, ^
nhsl_risk_dynamics_indicators_nt, ^
nhsl_risk_dynamics_indicators_nu, ^
nhsl_risk_dynamics_indicators_on, ^
nhsl_risk_dynamics_indicators_pe, ^
nhsl_risk_dynamics_indicators_qc, ^
nhsl_risk_dynamics_indicators_sk, ^
nhsl_risk_dynamics_indicators_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x" -nln %%x

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
nhsl_social_fabric_indicators_s_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\social_fabric\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_social_fabric.%%x" -nln %%x

REM Geopackage multi hazard threat
FOR %%x IN (nhsl_hazard_threat_indicators_s, ^
nhsl_hazard_threat_indicators_s_ab, ^
nhsl_hazard_threat_indicators_s_bc, ^
nhsl_hazard_threat_indicators_s_mb, ^
nhsl_hazard_threat_indicators_s_nb, ^
nhsl_hazard_threat_indicators_s_nl, ^
nhsl_hazard_threat_indicators_s_ns, ^
nhsl_hazard_threat_indicators_s_nt, ^
nhsl_hazard_threat_indicators_s_nu, ^
nhsl_hazard_threat_indicators_s_on, ^
nhsl_hazard_threat_indicators_s_pe, ^
nhsl_hazard_threat_indicators_s_qc, ^
nhsl_hazard_threat_indicators_s_sk, ^
nhsl_hazard_threat_indicators_s_yt) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\province\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=admin" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x" -nln %%x

ECHO %TIME% 
PAUSE