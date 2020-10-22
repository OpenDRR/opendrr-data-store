@echo OFF

REM create boundaries schema geometry tables from default geopackages.  Change ogr2ogr.exe PATH / geopackage path if nessessary to run.

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" "D:\workspace\GitHub\boundaries\Geometry_ADAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_ADAUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" "D:\workspace\GitHub\boundaries\Geometry_CANADA.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CANADA" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" "D:\workspace\GitHub\boundaries\Geometry_CDUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CDUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" "D:\workspace\GitHub\boundaries\Geometry_CSDUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_CSDUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" "D:\workspace\GitHub\boundaries\Geometry_ERUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_ERUID" -lco LAUNDER=NO
 
"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" "D:\workspace\GitHub\boundaries\Geometry_FSAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_FSAUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" "D:\workspace\GitHub\boundaries\Geometry_SAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_SAUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" "D:\workspace\GitHub\boundaries\Geometry_DAUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_DAUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" "D:\workspace\GitHub\boundaries\Geometry_PRUID.gpkg" -t_srs "EPSG:4326" -nln boundaries."Geometry_PRUID" -lco LAUNDER=NO 

pause