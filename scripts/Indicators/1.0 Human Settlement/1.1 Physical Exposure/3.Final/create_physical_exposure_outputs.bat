REM Export physical exposure views to geojson, and geopackage files. Replace exposure name {bldgexp_canada} to target exposure if different to run.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (bldgexp_canada_assets_building,bldgexp_canada_assets_sauid,bldgexp_canada_building_function_sauid,bldgexp_canada_building_type_sauid,bldgexp_canada_buildings_building,bldgexp_canada_people_building,
bldgexp_canada_people_sauid,bldgexp_canada_settled_area_sauid) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\geojson\%%x.geojson PG:"host=localhost user=postgres dbname=oq_sandbox password=password" results_bldgexp_canada.%%x

REM Geopackage Shapefile export
FOR %%x IN (bldgexp_canada_assets_building,bldgexp_canada_assets_sauid,bldgexp_canada_building_function_sauid,bldgexp_canada_building_type_sauid,bldgexp_canada_buildings_building,bldgexp_canada_people_building,
bldgexp_canada_people_sauid,bldgexp_canada_settled_area_sauid) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\geopackage\%%x.gpkg PG:"host=localhost user=postgres dbname=oq_sandbox password=password" results_bldgexp_canada.%%x

PAUSE

