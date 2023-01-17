# opendrr-data-store
*Dernière mise à jour : 17 janvier 2023*

Repo pour le stockage des scripts sql PostgreSQL, des exportations de données et des travaux connexes pour le test et le développement de la base de données OpenDRR PostgreSQL. Les scripts dans ce repo sont exécutés et testés sur un bureau/hôte local et modifiés en conséquence afin de supporter le repo model_factory pour une implémentation réussie dans une instance docker.

## documents
Emplacement temporaire des feuilles de calcul et des fichiers csv pour soutenir le développement de divers indicateurs.  

## scripts
Scripts PostgreSQL, scripts d'exportation de données pour le développement local et les tests.

#### / Data Export
Scripts Bat pour exporter, zipper diverses tables PostgreSQL au format GeoPackage en utilisant GDAL OGR2OGR.

https://gdal.org/

https://gdal.org/programs/ogr2ogr.html

https://www.7-zip.org/
  

#### /Diagrams
Diagramme ER de la base de données OpenDRR au format draw.io. *Les diagrammes sont toujours un travail en cours et ne sont pas encore terminés.*

https://www.diagrams.net/

#### / Indicators
Scripts pour le test, le développement et la génération de divers indicateurs.

- 1.0 Établissement humain
	- 1.1 Exposition physique
	- 1.2 Risque multirisque
	- 1.3 Tissu social
	- 1.4 Dynamique du risque
- 2.0 Risque sismique (PSRA)
- 3.0 Risque lié à un scénario de tremblement de terre (DSRA)
- 4.0 Risque multirisque

  

#### /Source Tables
Scripts de test, de développement, de chargement et de transformation des tables de données sources pour générer les indicateurs.
- Frontières
- Recensement
- DSRA
- Exposition
- GHSL
- LUT
- MH
- PSRA
- SoVi
