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
results_sim9p0_cascadiaair.sim9p0_cascadiaair_social_disruption_sauid \
nhsl_hazard_threat_cy_threat_cy_wind_hazard_s \ 
nhsl_hazard_threat_cy_threat_to_assets_s \ 
nhsl_hazard_threat_cy_threat_to_buildings_s \ 
nhsl_hazard_threat_cy_threat_to_people_s \ 
nhsl_hazard_threat_eq_seismic_hazard_intensity_s \ 
nhsl_hazard_threat_eq_threat_to_assets_s \ 
nhsl_hazard_threat_eq_threat_to_buildings_s \ 
nhsl_hazard_threat_eq_threat_to_people_s \ 
nhsl_hazard_threat_fl_threat_fl_inundation_hazard_s \ 
nhsl_hazard_threat_fl_threat_to_assets_s \ 
nhsl_hazard_threat_fl_threat_to_buildings_s \ 
nhsl_hazard_threat_fl_threat_to_people_s \ 
nhsl_hazard_threat_ls_threat_debris_flow_hazard_s \ 
nhsl_hazard_threat_ls_threat_to_assets_s \ 
nhsl_hazard_threat_ls_threat_to_buildings_s \ 
nhsl_hazard_threat_ls_threat_to_people_s \ 
nhsl_hazard_threat_mh_mh_intensity_s \ 
nhsl_hazard_threat_mh_threat_to_assets_s \ 
nhsl_hazard_threat_mh_threat_to_buildings_s \ 
nhsl_hazard_threat_mh_threat_to_people_s \ 
nhsl_hazard_threat_ts_threat_to_assets_s \ 
nhsl_hazard_threat_ts_threat_to_buildings_s \ 
nhsl_hazard_threat_ts_threat_to_people_s \ 
nhsl_hazard_threat_ts_threat_ts_inundation_hazard_s \ 
nhsl_hazard_threat_wf_threat_to_assets_s \ 
nhsl_hazard_threat_wf_threat_to_buildings_s \ 
nhsl_hazard_threat_wf_threat_to_people_s \ 
nhsl_hazard_threat_wf_threat_wf_hazard_s \ 
nhsl_physical_exposure_buildings_b \ 
nhsl_physical_exposure_people_b \ 
nhsl_physical_exposure_assets_b \ 
nhsl_physical_exposure_settled_area_s \ 
nhsl_physical_exposure_building_function_s \ 
nhsl_physical_exposure_building_type_s \ 
nhsl_physical_exposure_people_s \ 
nhsl_physical_exposure_assets_s \ 
nhsl_risk_dynamics_hazard_susceptibility_s \ 
nhsl_risk_dynamics_land_use_change_s \ 
nhsl_risk_dynamics_population_growth_s \ 
nhsl_social_fabric_family_structure_s \ 
nhsl_social_fabric_financial_agency_s \ 
nhsl_social_fabric_housing_conditions_s \ 
nhsl_social_fabric_individual_autonomy_s)

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
