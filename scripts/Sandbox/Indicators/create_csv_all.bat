@echo OFF
@SET PGPASSFILE=C:\Users\William Chow\AppData\Roaming\postresql\pgpass.conf

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_building_csv_rlz0_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_building_csv_rlz0_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_building_csv_rlz0_r2.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_building_csv_rlz1_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_building_csv_rlz1_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_building_csv_rlz1_r2.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_building_csv_rlz2_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_building_csv_rlz2_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_building_csv_rlz2_r2.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_view_csv_rlz0_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_view_csv_rlz0_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_view_csv_rlz0_r2.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_view_csv_rlz1_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_view_csv_rlz1_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_view_csv_rlz1_r2.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_view_csv_rlz2_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_view_csv_rlz2_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\export csv\create_scenario_risk_view_csv_rlz2_r2.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\2.physical_exposure\v2 (cast)\export csv\Create_physical_exposure_building_indicators_csv.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\2.physical_exposure\v2 (cast)\export csv\Create_physical_exposure_indicators_agg_view_csv.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\export csv\create_mh_intensity_sauid_csv.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\export csv\create_mh_threat_view_cyclone_hazard_csv.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\export csv\create_mh_threat_view_flood_hazard_csv.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\export csv\create_mh_threat_view_landslide_hazard_csv.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\export csv\create_mh_threat_view_mh_csv.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\export csv\create_mh_threat_view_seismic_hazard_csv.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\export csv\create_mh_threat_view_tsunami_hazard_csv.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\export csv\create_mh_threat_view_wildfire_hazard_csv.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\4.social_vulnuerability\v2\export csv\Create_social_vulnerability_sauid_indicators_csv.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\4.social_vulnuerability\v2\export csv\Create_social_vulnerability_view_indicators_csv.psql"



pause