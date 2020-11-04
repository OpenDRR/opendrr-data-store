REM Export views to geojson, and geopackage files. Replace exposure name {bldgexp_canada} to target exposure if different to run.  Change ogr2ogr path, location paths, db information if needed.


REM Geojson export
FOR %%x IN (nhsl_social_fabric_family_structure_s,nhsl_social_fabric_financial_agency_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "GeoJSON" D:\workspace\data\view_outputs\nhsl\social_fabric\%%x_bc.geojson PG:"host=localhost user=postgres dbname=opendrr_10302020 password=password" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE pruid = '59'"