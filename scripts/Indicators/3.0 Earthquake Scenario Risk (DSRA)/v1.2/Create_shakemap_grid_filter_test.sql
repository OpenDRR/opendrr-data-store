DROP TABLE IF EXISTS gmf.shakemap_acm7p3_leechriverfullfault_grid;
CREATE TABLE gmf.shakemap_acm7p3_leechriverfullfault_grid AS
(
SELECT
DISTINCT(a.site_id),
a.gmv_pga,
a.gmv_pgv,
a."gmv_SA(0.1)",
a."gmv_SA(0.2)",
a."gmv_SA(0.3)",
a."gmv_SA(0.5)",
a."gmv_SA(0.6)",
a."gmv_SA(1.0)",
a."gmv_SA(2.0)",
a.lon,
a.lat,
a.geom
FROM gmf.shakemap_acm7p3_leechriverfullfault a
LEFT JOIN gmf.shakemap_acm7p3_leechriverfullfault_xref b ON a.site_id = b.site_id
WHERE a.site_id NOT IN (SELECT DISTINCT(site_id) FROM gmf.shakemap_acm7p3_leechriverfullfault_xref)
AND a."gmv_SA(0.3)" >= 0.02
);


-- 0.00001 1.11m
-- 0.0001 11.1m
-- 0.001 111m
DROP TABLE IF EXISTS gmf.shakemap_acm7p3_leechriverfullfault_grid1;
CREATE TABLE gmf.shakemap_acm7p3_leechriverfullfault_grid1 AS
(
SELECT * FROM gmf.shakemap_acm7p3_leechriverfullfault
WHERE "gmv_SA(0.3)" >=0.02 AND site_id NOT IN (
	SELECT a.site_id 
	FROM gmf.shakemap_acm7p3_leechriverfullfault a,boundaries."Geometry_SAUID" b
	WHERE ST_INTERSECTS((ST_BUFFER(a.geom,0.00001)),b.geompoint))
);



/*
-- 0.00001 1.11m
-- 0.0001 11.1m
-- 0.001 111m
DROP TABLE IF EXISTS gmf.shakemap_{eqScenario}_grid1;
CREATE TABLE gmf.shakemap_{eqScenario}_grid1 AS
(
SELECT * FROM gmf.shakemap_{eqScenario}
WHERE "gmv_SA(0.3)" >=0.02 AND site_id NOT IN (
	SELECT a.site_id 
	FROM gmf.shakemap_{eqScenario} a,boundaries."Geometry_SAUID" b
	WHERE ST_INTERSECTS((ST_BUFFER(a.geom,0.00001)),b.geompoint))
);




*/
