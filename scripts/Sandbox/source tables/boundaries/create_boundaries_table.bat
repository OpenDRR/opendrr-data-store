@echo OFF

REM create boundaries schema geometry tables from default geopackages.  Change ogr2ogr.exe PATH / geopackage path if nessessary to run.
"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\data\human-settlement-national\layers\Geometry ADAUID.gpkg" -nln boundaries."Geometry ADAUID" -lco LAUNDER=NO 
"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\data\human-settlement-national\layers\Geometry CANADA.gpkg" -nln boundaries."Geometry CANADA" -lco LAUNDER=NO 
"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\data\human-settlement-national\layers\Geometry CDUID.gpkg" -nln boundaries."Geometry CDUID" -lco LAUNDER=NO 
"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\data\human-settlement-national\layers\Geometry CSDUID.gpkg" -nln boundaries."Geometry CSDUID" -lco LAUNDER=NO 
"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\data\human-settlement-national\layers\Geometry ERUID.gpkg" -nln boundaries."Geometry ERUID" -lco LAUNDER=NO 
"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\data\human-settlement-national\layers\Geometry FSAUID.gpkg" -nln boundaries."Geometry FSAUID" -lco LAUNDER=NO 
"C:\OSGeo4W64\bin\ogr2ogr.exe" -f "PostgreSQL" PG:"host=localhost user=postgres dbname=oq_sandbox password=password" "D:\workspace\data\human-settlement-national\layers\Geometry SAUID.gpkg" -nln boundaries."Geometry SAUID" -lco LAUNDER=NO 

pause