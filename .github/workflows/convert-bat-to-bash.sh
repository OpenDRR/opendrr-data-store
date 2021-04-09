#!/bin/bash

# A quick-and-dirty script to convert 'scripts/Data Export/'*.bat
# batch files to bash scripts.

sed -e '
1i #!/bin/bash\
# Automatically converted from .bat file.  Do not edit!\

s/\r//
s/^REM/#/
s/^ECHO %TIME%/date/
s/^ECHO/echo/
/^PAUSE$/d
s/, ^$/ \\/
s/^[a-z0-9_]\+ \\/\t&/
s/^\([a-z0-9_]\+\)) DO /\t\1\ndo\n/
s/)\? DO (\?/; do\n/g
' | sed -e '
s/^FOR %%x IN/for i in/
s/^FOR %%y IN/  for j in/
/for [a-z] in/ y/,/ /
/for [a-z] in/ s/[()]//g

/^ogr2ogr/ s/%%x/${i}/g
/^ogr2ogr/ s/%%y/${j}/g
/^ogr2ogr/ s/D:\\Workspace\\//g
/^ogr2ogr/ s/\\/\//g
/^ogr2ogr/ s/host=[a-z]\+/host='"'"'\$PGHOST'"'"'/
/^ogr2ogr/ s/dbname=[a-z_]\+/dbname='"'"'\$DB_NAME'"'"'/
/^ogr2ogr/ s/password=[a-z_]\+/password='"'"'\$PGPASSWORD'"'"'/
s/\(-nln [^ ]\+\))/\1/
s/.*-nln \(.*\)/    echo "Processing \\"\1\\"..."\n&/

/ogr2ogr.* -nln \${i}[A-Za-z0-9_-]*$/a\
done

/ogr2ogr.* -nln \${i}_\${j}[A-Za-z0-9_-]*$/a\
  done\
done

s/ogr2ogr.* \([0-9A-Za-z_/-]\+\)\/\([0-9A-Za-z_${}]\+\)\.gpkg.*/    mkdir -p \1\n    \/usr\/bin\/time &\n    ( cd \1 \&\& 7z a -sdel \2.zip \2.gpkg )/

' | sed -e '
/^CD / s/D:\\Workspace\\//g
/^CD / s/\\/\//g
/^CD / s/\&\& FOR %%i IN (\*\.\*)\?/\&\& \\\nfor i in *.gpkg/g
s/^CD \/D /cd /
/^7z/ s/%%~ni.zip/$(basename $i .gpkg).zip/
/^7z/ s/%%i/$i/
/^7z/a done\
cd -
s/^7z\.exe/  7z/
/^DEL \*\.gpkg/d
'
