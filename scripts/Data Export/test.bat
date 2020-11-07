REM DSRA gpkg
FOR %%x IN (dsra_sim9p0_cszlockedtrans_all_indicators_b,dsra_sim9p0_cszlockedtrans_all_indicators_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "gpkg" D:\workspace\data\view_outputs\thoughtspot\%%x.gpkg PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=password" results_dsra_sim9p0_cszlockedtrans.%%x

REM DSRA geojson
FOR %%x IN (dsra_sim9p0_cszlockedtrans_all_indicators_b,dsra_sim9p0_cszlockedtrans_all_indicators_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "geojson" -lco WRITE_NON_FINITE_VALUES=YES D:\workspace\data\view_outputs\thoughtspot\%%x.geojson PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=password" results_dsra_sim9p0_cszlockedtrans.%%x

REM DSRA csv
FOR %%x IN (dsra_sim9p0_cszlockedtrans_all_indicators_b,dsra_sim9p0_cszlockedtrans_all_indicators_s) DO "C:\OSGeo4W64\bin\ogr2ogr.exe" -f "csv" D:\workspace\data\view_outputs\thoughtspot\%%x.csv PG:"host=localhost user=postgres dbname=opendrr_allscenarios password=password" results_dsra_sim9p0_cszlockedtrans.%%x

PAUSE


