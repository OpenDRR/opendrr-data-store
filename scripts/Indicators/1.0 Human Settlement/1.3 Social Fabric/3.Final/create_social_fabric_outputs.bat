REM Export views to geojson, and geopackage files. Replace exposure name {bldgexp_canada} to target exposure if different to run.  Change ogr2ogr path, location paths, db information if needed.

REM Geojson export
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\%%x.geojson PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" results_nhsl_risk_dynamics.%%x

REM Geopackage Shapefile export
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s,nhsl_social_fabric_housing_conditions_s,nhsl_social_fabric_individual_autonomy_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\%%x.gpkg PG:"host=localhost user=postgres dbname=oq_sandbox_new_exposure password=password" results_nhsl_physical_exposure.%%x

PAUSE