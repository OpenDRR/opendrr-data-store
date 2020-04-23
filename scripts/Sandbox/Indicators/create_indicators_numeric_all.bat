@echo OFF
@SET PGPASSFILE=C:\Users\William Chow\AppData\Roaming\postresql\pgpass.conf

rem scenario risk
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\1.Create_scenario_risk_building_indicators_all_merged_rlz0_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\1.Create_scenario_risk_building_indicators_all_merged_rlz0_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\1.Create_scenario_risk_building_indicators_all_merged_rlz0_r2.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\1.Create_scenario_risk_building_indicators_all_merged_rlz1_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\1.Create_scenario_risk_building_indicators_all_merged_rlz1_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\1.Create_scenario_risk_building_indicators_all_merged_rlz1_r2.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\1.Create_scenario_risk_building_indicators_all_merged_rlz2_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\1.Create_scenario_risk_building_indicators_all_merged_rlz2_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\1.Create_scenario_risk_building_indicators_all_merged_rlz2_r2.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\3.Create_scenario_risk_aggregation_view_indicators_all_merged_rlz0_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\3.Create_scenario_risk_aggregation_view_indicators_all_merged_rlz0_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\3.Create_scenario_risk_aggregation_view_indicators_all_merged_rlz0_r2.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\3.Create_scenario_risk_aggregation_view_indicators_all_merged_rlz1_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\3.Create_scenario_risk_aggregation_view_indicators_all_merged_rlz1_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\3.Create_scenario_risk_aggregation_view_indicators_all_merged_rlz1_r2.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\3.Create_scenario_risk_aggregation_view_indicators_all_merged_rlz2_b0.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\3.Create_scenario_risk_aggregation_view_indicators_all_merged_rlz2_r1.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v3 (cast)\cast 6dp numeric\3.Create_scenario_risk_aggregation_view_indicators_all_merged_rlz2_r2.psql"

rem physical exposure
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\2.physical_exposure\v2 (cast)\cast 6dp numeric\1.Create_phyiscal_exposure_building_indicators_merge.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\2.physical_exposure\v2 (cast)\cast 6dp numeric\3.Create_phyiscal_exposure_sauid_indicators_view_merge.psql"

rem multi hazard
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\cast 6dp numeric\Create_MH_intensity_sauid_all_merged.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\3.multi_hazard_threat\cast 6dp numeric\Create_MH_threat_view_all_merged.psql"

rem social vulnerability
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\4.social_vulnuerability\v2\cast 6dp numeric\1.social vulnerability sauid indicators all merged.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\4.social_vulnuerability\v2\cast 6dp numeric\3..social vulnerability view indicators all merged.psql"
pause