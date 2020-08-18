REM Export scenario risk (DSRA) views to geojson, and geopackage files. Replace scenario risk (DSRA) {dsra_sim6p8_cr2022} to target risk dynamics if different to run.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (dsra_sim6p8_cr2022_casualties_building,dsra_sim6p8_cr2022_casualties_sauid,dsra_sim6p8_cr2022_damage_state_building,dsra_sim6p8_cr2022_damage_state_sauid,dsra_sim6p8_cr2022_economic_loss_building,
dsra_sim6p8_cr2022_economic_loss_sauid,dsra_sim6p8_cr2022_recovery_time_building,dsra_sim6p8_cr2022_recovery_time_sauid,dsra_sim6p8_cr2022_scenario_shakemap_intensity_building,
dsra_sim6p8_cr2022_scenario_shakemap_intensity_sauid,dsra_sim6p8_cr2022_social_disruption_buildingdsra_sim6p8_cr2022_social_disruption_sauid) ^
DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\geojson\%%x.geojson PG:"host=localhost user=postgres dbname=oq_sandbox password=password" results_dsra_sim6p8_cr2022.%%x

REM Geopackage Shapefile export
FOR %%x IN (dsra_sim6p8_cr2022_casualties_building,dsra_sim6p8_cr2022_casualties_sauid,dsra_sim6p8_cr2022_damage_state_building,dsra_sim6p8_cr2022_damage_state_sauid,dsra_sim6p8_cr2022_economic_loss_building,
dsra_sim6p8_cr2022_economic_loss_sauid,dsra_sim6p8_cr2022_recovery_time_building,dsra_sim6p8_cr2022_recovery_time_sauid,dsra_sim6p8_cr2022_scenario_shakemap_intensity_building,
dsra_sim6p8_cr2022_scenario_shakemap_intensity_sauid,dsra_sim6p8_cr2022_social_disruption_buildingdsra_sim6p8_cr2022_social_disruption_sauid) ^
DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\geopackage\%%x.gpkg PG:"host=localhost user=postgres dbname=oq_sandbox password=password" results_dsra_sim6p8_cr2022.%%x

PAUSE

