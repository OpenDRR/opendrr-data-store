REM create boundaries schema geometry tables from default geopackages.  Change ogr2ogr.exe PATH / geopackage path if nessessary to run.

REM import hexgrid 4326
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_AB.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_AB" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_AB_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_AB_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_BC.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_BC" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_BC_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_BC_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_MB.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_MB" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_MB_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_MB_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NB.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NB" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NB_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NB_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NL.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NL" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NL_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NL_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NS.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NS" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NS_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NS_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NT.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NT" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NT_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NT_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NU.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NU" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_NU_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NU_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_ON.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_ON" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_ON_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_ON_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_PE.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_PE" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_PE_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_PE_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_QC.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_QC" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_QC_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_QC_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_SK.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_SK" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_SK_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_SK_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_YT.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_YT" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_1km_YT_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_YT_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_5km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_5km" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_5km_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_5km_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_10km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_10km" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_10km_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_10km_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_25km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_25km" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_25km_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_25km_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_50km_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_50km_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_100km_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_100km_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\HexGrid_GlobalFabric.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_GlobalFabric" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_GlobalFabric_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_GlobalFabric_intersect" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_1km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_1km_intersect" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_1km_intersect_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_1km_intersect_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_5km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_5km_intersect" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_5km_intersect_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_5km_intersect_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_10km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_10km_intersect" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_10km_intersect_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_10km_intersect_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_25km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_25km_intersect" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_25km_intersect_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_25km_intersect_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_50km_intersect_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_50km_intersect_unclipped" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_4326_gpkg\SAUID_HexGrid_100km_intersect_unclipped.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_100km_intersect_unclipped" -lco LAUNDER=NO 
PAUSE