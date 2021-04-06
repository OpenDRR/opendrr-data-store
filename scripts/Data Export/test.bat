ECHO %TIME%
REM earthquake scenarios
CD /D "D:\Workspace\data\view_outputs\all_indicators\test\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"

REM delete geopackages in folder
DEL *.gpkg
PAUSE