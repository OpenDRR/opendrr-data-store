REM Export views to geojson, and geopackage files.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\nhsl\social_fabric\%%x.geojson PG:"host=localhost user=postgres dbname=opendrr_10302020 password=password" results_nhsl_social_fabric.%%x

REM Geopackage Shapefile export
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\nhsl\social_fabric\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_10302020 password=password" results_nhsl_social_fabric.%%x

PAUSE