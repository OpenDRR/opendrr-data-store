REM create zip of each geopackage in each given folder using 7zip

ECHO %TIME%
REM earthquake scenarios
CD /D "D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg

REM multi_hazard_threat
CD /D "D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\economic_region\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg

CD /D "D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg

REM physical_exposure
CD /D "D:\Workspace\data\view_outputs\all_indicators\physical_exposure\economic_region\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg

CD /D "D:\Workspace\data\view_outputs\all_indicators\physical_exposure\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg

REM risk_dynamics
CD /D "D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\economic_region\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg
CD /D "D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg

REM seismic_risk
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\economic_region\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\national\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg

REM social_fabric
CD /D "D:\Workspace\data\view_outputs\all_indicators\social_fabric\economic_region\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg
CD /D "D:\Workspace\data\view_outputs\all_indicators\social_fabric\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
REM delete geopackages in folder
DEL *.gpkg

ECHO %TIME%
PAUSE