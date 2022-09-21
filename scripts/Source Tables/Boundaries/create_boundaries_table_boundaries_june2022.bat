REM create boundaries schema geometry tables from default geopackages.  Change ogr2ogr.exe PATH / geopackage path if nessessary to run.

REM  import boundaries
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\Geometry_ADAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_ADAUID" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\Geometry_CANADA.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CANADA" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\Geometry_CDUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CDUID" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\Geometry_CSDUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CSDUID" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\Geometry_ERUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_ERUID" -lco LAUNDER=NO
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\Geometry_FSAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_FSAUID" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\Geometry_SAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_SAUID" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\Geometry_DAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_DAUID" -lco LAUNDER=NO 
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=boundaries_create password=admin port=5433" "D:\Workspace\GitHub\boundaries - update_900913\Geometry_PRUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_PRUID" -lco LAUNDER=NO 
PAUSE