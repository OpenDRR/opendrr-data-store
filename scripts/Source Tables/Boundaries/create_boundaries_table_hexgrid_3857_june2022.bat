REM create boundaries schema geometry tables from default geopackages.  Change ogr2ogr.exe PATH / geopackage path if nessessary to run.

REM import hexgrid 3857
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_AB.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_AB_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_AB_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_AB_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_BC.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_BC_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_BC_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_BC_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_MB.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_MB_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_MB_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_MB_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NB.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NB_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NB_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NB_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NL.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NL_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NL_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NL_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NS.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NS_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NS_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NS_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NT.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NT_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NT_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NT_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NU.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NU_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_NU_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_NU_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_ON.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_ON_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_ON_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_ON_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_PE.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_PE_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_PE_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_PE_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_QC.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_QC_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_QC_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_QC_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_SK.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_SK_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_SK_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_SK_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_YT.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_YT_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_1km_YT_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_1km_YT_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_5km.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_5km_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_5km_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_5km_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_10km.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_10km_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_10km_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_10km_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_25km.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_25km_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_25km_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_25km_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_50km_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_50km_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\HexGrid_100km_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."HexGrid_100km_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_1km_intersect.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_1km_intersect_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_1km_intersect_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_1km_intersect_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_5km_intersect.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_5km_intersect_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_5km_intersect_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_5km_intersect_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_10km_intersect.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_10km_intersect_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_10km_intersect_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_10km_intersect_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_25km_intersect.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_25km_intersect_3857" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_25km_intersect_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_25km_intersect_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_50km_intersect_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_50km_intersect_unclipped_3857" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\hexgrid_3857_gpkg\SAUID_HexGrid_100km_intersect_unclipped.gpkg" -t_srs "EPSG:3857" -nln boundaries."SAUID_HexGrid_100km_intersect_unclipped_3857" -lco LAUNDER=NO 
PAUSE