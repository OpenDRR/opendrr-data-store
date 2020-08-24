REM Export social vulnerability views to geojson, and geopackage files. Replace social vulnerability {sovi} to target risk dynamics if different to run.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (social_vulnerability_family_structure_sauid,social_vulnerability_financial_agency_sauid,social_vulnerability_housing_conditions_sauid,social_vulnerability_individual_autonomy_sauid) ^
DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\geojson\%%x.geojson PG:"host=localhost user=postgres dbname=oq_sandbox password=password" results_sovi.%%x

REM Geopackage Shapefile export
FOR %%x IN (social_vulnerability_family_structure_sauid,social_vulnerability_financial_agency_sauid,social_vulnerability_housing_conditions_sauid,social_vulnerability_individual_autonomy_sauid) ^
DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\geopackage\%%x.gpkg PG:"host=localhost user=postgres dbname=oq_sandbox password=password" results_sovi.%%x

PAUSE