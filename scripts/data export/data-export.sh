#!/bin/bash

arr=(results_afm7p2_lrdmf.afm7p2_lrdmf_casualties_sauid \
results_afm7p2_lrdmf.afm7p2_lrdmf_damage_state_building \
results_afm7p2_lrdmf.afm7p2_lrdmf_damage_state_sauid \
results_afm7p2_lrdmf.afm7p2_lrdmf_economic_loss_building \
results_afm7p2_lrdmf.afm7p2_lrdmf_economic_loss_sauid \
results_afm7p2_lrdmf.afm7p2_lrdmf_recovery_time_building \
results_afm7p2_lrdmf.afm7p2_lrdmf_recovery_time_sauid \
results_afm7p2_lrdmf.afm7p2_lrdmf_scenario_shakemap_intensity_building \
results_afm7p2_lrdmf.afm7p2_lrdmf_scenario_shakemap_intensity_sauid \
results_afm7p2_lrdmf.afm7p2_lrdmf_social_disruption_building \
results_afm7p2_lrdmf.afm7p2_lrdmf_social_disruption_sauid \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_casualties_sauid \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_damage_state_building \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_damage_state_sauid \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_economic_loss_building \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_economic_loss_sauid \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_recovery_time_building \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_recovery_time_sauid \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_scenario_shakemap_intensity_building \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_scenario_shakemap_intensity_sauid \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_social_disruption_building \
results_sim9p0_cascadiaair.sim9p0_cascadiaair_social_disruption_sauid)

mkdir data

for i in "${arr[@]}"
do
    echo "Exporting ${i}"
    IFS='.'
    read -a strarr <<<"$i"
    ogr2ogr -f "GPKG" "data/${strarr[1]}.gpkg" "PG:host=localhost port=5432 dbname=opendrr user=postgres password=password" -sql "SELECT * FROM ${i}"
    ogr2ogr -f "GeoJSON" "data/${strarr[1]}.geojson" "PG:host=localhost port=5432 dbname=opendrr user=postgres password=password" -sql "SELECT * FROM ${i}"
    # ogr2ogr -f "MapML" "data/${strarr[1]}.mapml" "PG:host=localhost port=5432 dbname=opendrr user=postgres password=password" -sql "SELECT * FROM ${i}"
done
