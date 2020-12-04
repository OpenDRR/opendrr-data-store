REM Export views to geojson, and geopackage files. Replace exposure name {bldgexp_canada} to target exposure if different to run.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
REM bc
FOR %%x IN (dsra_acm7p2_lrdmf_affected_people_casualties_b, ^
dsra_acm7p2_lrdmf_affected_people_casualties_s, ^
dsra_acm7p2_lrdmf_affected_people_social_disruption_b, ^
dsra_acm7p2_lrdmf_affected_people_social_disruption_s, ^
dsra_acm7p2_lrdmf_all_indicators_b, ^
dsra_acm7p2_lrdmf_all_indicators_s, ^
dsra_acm7p2_lrdmf_building_damage_damage_state_b, ^
dsra_acm7p2_lrdmf_building_damage_damage_state_s, ^
dsra_acm7p2_lrdmf_building_damage_recovery_b, ^
dsra_acm7p2_lrdmf_building_damage_recovery_s, ^
dsra_acm7p2_lrdmf_economic_security_economic_loss_b, ^
dsra_acm7p2_lrdmf_economic_security_economic_loss_s, ^
dsra_acm7p2_lrdmf_scenario_hazard_shakemap_intensity_b, ^
dsra_acm7p2_lrdmf_scenario_hazard_shakemap_intensity_s) DO (FOR %%y IN (5910,5920,5930,5940,5950,5960,5970,5980) DO ogr2ogr -f "gpkg" D:\Workspace\data\view_outputs\economic_regions\dsra\%%x_%%y.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=admin" -sql "SELECT * FROM results_dsra_acm7p2_lrdmf.%%x WHERE eruid = '%%y'")

PAUSE


