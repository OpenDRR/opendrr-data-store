@echo OFF

REM create boundaries schema geometry tables from default geopackages.  Change ogr2ogr.exe PATH / geopackage path if nessessary to run.

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\GitHub\boundaries\Geometry_ADAUID.gpkg" -nln boundaries."Geometry_ADAUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\GitHub\boundaries\Geometry_CANADA.gpkg" -nln boundaries."Geometry_CANADA" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\GitHub\boundaries\Geometry_CDUID.gpkg" -nln boundaries."Geometry_CDUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\GitHub\boundaries\Geometry_CSDUID.gpkg" -nln boundaries."Geometry_CSDUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\GitHub\boundaries\Geometry_ERUID.gpkg" -nln boundaries."Geometry_ERUID" -lco LAUNDER=NO
 
"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\GitHub\boundaries\Geometry_FSAUID.gpkg" -nln boundaries."Geometry_FSAUID" -lco LAUNDER=NO 

"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\GitHub\boundaries\Geometry_SAUID.gpkg" -nln boundaries."Geometry_SAUID" -lco LAUNDER=NO 

pause

