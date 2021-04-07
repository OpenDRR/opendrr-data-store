REM Create zip of each geopackage in given folders using 7zip.exe.  Delete all geopackages after zipping in directory.

ECHO %TIME%
REM earthquake scenarios
CD /D "D:\Workspace\data\view_outputs\all_indicators\earthquake_scenarios\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM multi_hazard_threat
CD /D "D:\Workspace\data\view_outputs\all_indicators\multi_hazard_threat\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM physical_exposure
CD /D "D:\Workspace\data\view_outputs\all_indicators\physical_exposure\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM risk_dynamics
CD /D "D:\Workspace\data\view_outputs\all_indicators\risk_dynamics\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM seismic_risk
REM AB
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\ab\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM BC
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\bc\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM MB
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\mb\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NB
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nb\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NL
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nl\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NS
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\ns\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NT
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nt\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM NU
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\nu\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM ON
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\on\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM PE
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\pe\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM QC
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\qc\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM SK
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\sk\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM YT
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\province\yt\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM national
CD /D "D:\Workspace\data\view_outputs\all_indicators\seismic_risk\national\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg

REM social_fabric
CD /D "D:\Workspace\data\view_outputs\all_indicators\social_fabric\province\" && FOR %%i IN (*.*) DO 7z.exe a "%%~ni.zip" "%%i"
DEL *.gpkg


ECHO %TIME%
PAUSE