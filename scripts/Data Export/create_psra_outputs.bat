REM Export views from postgis db. Change ogr2ogr path, location paths, db information if needed.


REM Geopackage BC PSRA
FOR %%x IN (psra_bc5910_all_indicators_b, ^
psra_bc5910_all_indicators_s, ^
psra_bc5910_economic_security_economic_loss_b, ^
psra_bc5910_economic_security_economic_loss_s, ^
psra_bc5910_economic_security_pml_b0_s, ^
psra_bc5910_economic_security_pml_r2_s, ^
psra_bc5910_src_loss, ^
psra_bc5920a1_economic_security_economic_loss_b, ^
psra_bc5920a1_economic_security_economic_loss_s, ^
psra_bc5920a1_economic_security_pml_b0_s, ^
psra_bc5920a1_economic_security_pml_r2_s, ^
psra_bc5920a1_src_loss, ^
psra_bc5920a2_economic_security_economic_loss_b, ^
psra_bc5920a2_economic_security_economic_loss_s, ^
psra_bc5920a2_economic_security_pml_b0_s, ^
psra_bc5920a2_economic_security_pml_r2_s, ^
psra_bc5920a2_src_loss, ^
psra_bc5920a_all_indicators_b, ^
psra_bc5920a_all_indicators_s, ^
psra_bc5920b_all_indicators_b, ^
psra_bc5920b_all_indicators_s, ^
psra_bc5920b_economic_security_economic_loss_b, ^
psra_bc5920b_economic_security_economic_loss_s, ^
psra_bc5920b_economic_security_pml_b0_s, ^
psra_bc5920b_economic_security_pml_r2_s, ^
psra_bc5920b_src_loss, ^
psra_bc5930_all_indicators_b, ^
psra_bc5930_all_indicators_s, ^
psra_bc5930_economic_security_economic_loss_b, ^
psra_bc5930_economic_security_economic_loss_s, ^
psra_bc5930_economic_security_pml_b0_s, ^
psra_bc5930_economic_security_pml_r2_s, ^
psra_bc5930_src_loss, ^
psra_bc5940_80_all_indicators_b, ^
psra_bc5940_80_all_indicators_s, ^
psra_bc5940_80_economic_security_economic_loss_b, ^
psra_bc5940_80_economic_security_economic_loss_s, ^
psra_bc5940_80_economic_security_pml_b0_s, ^
psra_bc5940_80_economic_security_pml_r2_s, ^
psra_bc5940_80_src_loss, ^
psra_bc_hcurves_pga, ^
psra_bc_hcurves_sa0p1, ^
psra_bc_hcurves_sa0p3, ^
psra_bc_hcurves_sa0p5, ^
psra_bc_hcurves_sa0p6, ^
psra_bc_hcurves_sa10p0, ^
psra_bc_hcurves_sa1p0, ^
psra_bc_hcurves_sa2p0, ^
psra_bc_hcurves_sa5p0, ^
psra_bc_hmaps, ^
psra_bc_uhs) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\all_indicators\seismic_risk\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" results_psra_bc.%%x

PAUSE
