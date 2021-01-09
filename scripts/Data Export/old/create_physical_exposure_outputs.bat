REM Export views to geojson, and geopackage files. Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (nhsl_physical_exposure_buildings_b,nhsl_physical_exposure_people_b,nhsl_physical_exposure_assets_b,nhsl_physical_exposure_settled_area_s,nhsl_physical_exposure_building_function_s,nhsl_physical_exposure_building_type_s,
nhsl_physical_exposure_people_s,nhsl_physical_exposure_assets_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\nhsl\physical_exposure\%%x.geojson PG:"host=localhost user=postgres dbname=opendrr_10302020 password=password" results_nhsl_physical_exposure.%%x

REM Geopackage Shapefile export
FOR %%x IN (nhsl_physical_exposure_buildings_b,nhsl_physical_exposure_people_b,nhsl_physical_exposure_assets_b,nhsl_physical_exposure_settled_area_s,nhsl_physical_exposure_building_function_s,nhsl_physical_exposure_building_type_s,
nhsl_physical_exposure_people_s,nhsl_physical_exposure_assets_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\nhsl\physical_exposure\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_10302020 password=password" results_nhsl_physical_exposure.%%x

PAUSE