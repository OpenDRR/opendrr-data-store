@REM @echo OFF

@REM REM create boundaries schema geometry tables from default geopackages.  Change ogr2ogr.exe PATH / geopackage path if nessessary to run.

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_ADAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_ADAUID" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_CANADA.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CANADA" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_CDUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CDUID" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_CSDUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CSDUID" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_ERUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_ERUID" -lco LAUNDER=NO
 
@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_FSAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_FSAUID" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_SAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_SAUID" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_DAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_DAUID" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_PRUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_PRUID" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_5km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_5km" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_10km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_10km" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_25km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_25km" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_50km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_50km" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_100km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_100km" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_GlobalFabric.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_GlobalFabric" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_1km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_1km_intersect" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_5km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_5km_intersect" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_10km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_10km_intersect" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_25km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_25km_intersect" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_50km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_50km_intersect" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_100km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_100km_intersect" -lco LAUNDER=NO 

@REM ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_GlobalFabric_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_GlobalFabric_intersect" -lco LAUNDER=NO 

@REM PAUSE


@REM @echo OFF

REM individual provinces for 1km
REM create boundaries schema geometry tables from default geopackages.  Change ogr2ogr.exe PATH / geopackage path if nessessary to run.

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_ADAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_ADAUID" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_CANADA.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CANADA" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_CDUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CDUID" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_CSDUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CSDUID" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_ERUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_ERUID" -lco LAUNDER=NO
 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_FSAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_FSAUID" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_SAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_SAUID" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_DAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_DAUID" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\workspace\GitHub\boundaries\Geometry_PRUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_PRUID" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_AB.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_AB" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_BC.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_BC" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_MB.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_MB" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_NB.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NB" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_NL.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NL" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_NS.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NS" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_NT.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NT" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_NU.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_NU" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_ON.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_ON" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_PE.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_PE" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_QC.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_QC" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_SK.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_SK" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_1km_YT.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_1km_YT" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_5km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_5km" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_10km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_10km" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_25km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_25km" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_50km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_50km" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_100km.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_100km" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\HexGrid_GlobalFabric.gpkg" -t_srs "EPSG:4326" -nln boundaries."HexGrid_GlobalFabric" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_1km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_1km_intersect" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_5km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_5km_intersect" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_10km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_10km_intersect" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_25km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_25km_intersect" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_50km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_50km_intersect" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_100km_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_100km_intersect" -lco LAUNDER=NO 

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=opendrr password=admin port=5433" "D:\Workspace\GitHub\boundaries\hexbin_4326\SAUID_HexGrid_GlobalFabric_intersect.gpkg" -t_srs "EPSG:4326" -nln boundaries."SAUID_HexGrid_GlobalFabric_intersect" -lco LAUNDER=NO 

PAUSE