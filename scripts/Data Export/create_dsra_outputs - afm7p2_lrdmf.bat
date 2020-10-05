REM Export views to geojson, and geopackage files. Replace exposure name {bldgexp_canada} to target exposure if different to run.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (afm7p2_lrdmf_casualties_building,afm7p2_lrdmf_casualties_sauid,afm7p2_lrdmf_damage_state_building,afm7p2_lrdmf_damage_state_sauid,afm7p2_lrdmf_economic_loss_building,afm7p2_lrdmf_economic_loss_sauid,afm7p2_lrdmf_recovery_time_building,
afm7p2_lrdmf_recovery_time_sauid,afm7p2_lrdmf_scenario_shakemap_intensity_building,afm7p2_lrdmf_scenario_shakemap_intensity_sauid,afm7p2_lrdmf_social_disruption_building,
afm7p2_lrdmf_social_disruption_sauid) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\afm7p2_lrdmf\%%x.geojson PG:"host=localhost user=postgres dbname=opendrr password=password" results_afm7p2_lrdmf.%%x

REM Geopackage export
FOR %%x IN (afm7p2_lrdmf_casualties_building,afm7p2_lrdmf_casualties_sauid,afm7p2_lrdmf_damage_state_building,afm7p2_lrdmf_damage_state_sauid,afm7p2_lrdmf_economic_loss_building,afm7p2_lrdmf_economic_loss_sauid,afm7p2_lrdmf_recovery_time_building,
afm7p2_lrdmf_recovery_time_sauid,afm7p2_lrdmf_scenario_shakemap_intensity_building,afm7p2_lrdmf_scenario_shakemap_intensity_sauid,afm7p2_lrdmf_social_disruption_building,
afm7p2_lrdmf_social_disruption_sauid) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\afm7p2_lrdmf\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr password=password" results_afm7p2_lrdmf.%%x

PAUSE