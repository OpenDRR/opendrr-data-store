REM Export views to geojson, and geopackage files.Change ogr2ogr path, location paths, db information if needed.

REM physical exposure geojson
FOR %%x IN (nhsl_physical_exposure_all_indicators_b,nhsl_physical_exposure_all_indicators_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "geojson" D:\workspace\data\view_outputs\thoughtspot\%%x_BC.geojson PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=password" -sql "SELECT * FROM results_nhsl_physical_exposure.%%x WHERE pruid = '59'"

REM risk dynamics geojson
FOR %%x IN (nhsl_risk_dynamics_all_indicators) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "geojson" D:\workspace\data\view_outputs\thoughtspot\%%x_BC.geojson PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=password" -sql "SELECT * FROM results_nhsl_risk_dynamics.%%x WHERE pruid = '59'"

REM social fabric geojson
FOR %%x IN (nhsl_social_fabric_all_indicators_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "geojson" D:\workspace\data\view_outputs\thoughtspot\%%x_BC.geojson PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=password" -sql "SELECT * FROM results_nhsl_social_fabric.%%x WHERE pruid = '59'"

REM multihazard geojson
FOR %%x IN (nhsl_hazard_threat_all_indicators_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "geojson" D:\workspace\data\view_outputs\thoughtspot\%%x_BC.geojson PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=password" -sql "SELECT * FROM results_nhsl_hazard_threat.%%x WHERE pruid = '59'"

REM DSRA geojson
FOR %%x IN (dsra_sim9p0_cszlockedtrans_all_indicators_b,dsra_sim9p0_cszlockedtrans_all_indicators_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "geojson" D:\workspace\data\view_outputs\thoughtspot\%%x.geojson PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=password" results_dsra_sim9p0_cszlockedtrans.%%x

PAUSE


