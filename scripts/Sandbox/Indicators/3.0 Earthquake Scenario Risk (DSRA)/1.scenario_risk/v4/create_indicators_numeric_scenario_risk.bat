@echo OFF
@SET PGPASSFILE=C:\Users\William Chow\AppData\Roaming\postresql\pgpass.conf

rem scenario risk
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\1.Create_scenario_risk_building_indicators_rlz0_b0_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\1.Create_scenario_risk_building_indicators_rlz0_r1_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\1.Create_scenario_risk_building_indicators_rlz0_r2_ALL.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\1.Create_scenario_risk_building_indicators_rlz1_b0_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\1.Create_scenario_risk_building_indicators_rlz1_r1_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\1.Create_scenario_risk_building_indicators_rlz1_r2_ALL.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\1.Create_scenario_risk_building_indicators_rlz2_b0_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\1.Create_scenario_risk_building_indicators_rlz2_r1_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\1.Create_scenario_risk_building_indicators_rlz2_r2_ALL.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\2.Create_scenario_risk_aggregation_view_rlz0_b0_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\2.Create_scenario_risk_aggregation_view_rlz0_r1_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\2.Create_scenario_risk_aggregation_view_rlz0_r2_ALL.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\2.Create_scenario_risk_aggregation_view_rlz1_b0_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\2.Create_scenario_risk_aggregation_view_rlz1_r1_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\2.Create_scenario_risk_aggregation_view_rlz1_r2_ALL.psql"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\2.Create_scenario_risk_aggregation_view_rlz2_b0_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\2.Create_scenario_risk_aggregation_view_rlz2_r1_ALL.psql"
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -U postgres -d oq_sandbox -f "D:\workspace\GitHub\opendrr-data-store\scripts\Sandbox\Indicators\1.scenario_risk\v4\cast 6dp numeric\2.Create_scenario_risk_aggregation_view_rlz2_r2_ALL.psql"

pause