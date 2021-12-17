-- script to generate shakemap extents polygon table
DROP TABLE IF EXISTS gmf.shakemap_scenario_extents_tbl CASCADE;

CREATE TABLE gmf.shakemap_scenario_extents_temp(
scenario varchar,
geom geometry);

/*
-- add polygon extents
INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT '{eqScenario}',st_astext(st_concavehull(st_collect(geom),0.98)) FROM gmf.shakemap_{eqScenario} WHERE "gmv_SA(0.3)" >= 0.02;

-- add polygon extents with smoothing 
INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT '{eqScenario}',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.{eqScenario} WHERE "gmv_SA(0.3)" >= 0.02;


*/
-- no smoothing
INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'SIM9p0_CascadiaInterfaceBestFault',st_astext(st_concavehull(st_collect(geom),0.98)) FROM gmf.shakemap_sim9p0_cascadiainterfacebestfault;

-- smoothing
INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'SIM9p0_CascadiaInterfaceBestFault',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_sim9p0_cascadiainterfacebestfault;
---


INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'ACM6p5_Beaufort',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_acm6p5_beaufort WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'ACM7p2_LRDMF',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_acm7p2_lrdmf WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'ACM7p3_GeorgiaStraitNew',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_acm7p3_georgiastraitnew WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM4p7_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm4p7_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM4p8_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm4p8_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM5p0_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm5p0_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM5p2_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm5p2_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM5p4_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm5p4_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM5p6_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm5p6_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM5p8_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm5p8_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM6p0_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm6p0_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM6p2_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm6p2_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM6p4_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm6p4_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM6p6_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm6p6_sidney WHERE "gmv_SA(0.3)" >= 0.02;

/*
INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'idm6p8_jdfpathways',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm6p8_jdfpathways WHERE "gmv_SA(0.3)" >= 0.02;
*/

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM6p8_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm6p8_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM7p0_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm7p0_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM7p1_Sidney',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm7p1_sidney WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'IDM7p1_SidneyTest',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_idm7p1_sidneytest WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'SCM6p5_Ottawa',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_scm6p5_ottawa WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'SCM7p0_MontrealNW',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_scm7p0_montrealnw WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'SCM7p0_MontrealNWCanSHM5',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_scm7p0_montrealnwcanshm5 WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'SIM9p0_CSZlockedtrans',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_sim9p0_cszlockedtrans WHERE "gmv_SA(0.3)" >= 0.02;

INSERT INTO gmf.shakemap_scenario_extents_temp(scenario,geom)
SELECT 'SIM9p0_CascadiaInterfaceBestFault',st_astext(st_chaikinsmoothing(st_concavehull(st_collect(geom),0.98))) FROM gmf.shakemap_sim9p0_cascadiainterfacebestfault WHERE "gmv_SA(0.3)" >= 0.02;


-- fix invalid projection
ALTER TABLE gmf.shakemap_scenario_extents_temp
ALTER COLUMN geom TYPE geometry(POLYGON,4326) USING ST_SetSRID(geom,4326);



-- add 10m buffer
UPDATE gmf.shakemap_scenario_extents_temp
SET geom = ST_BUFFER(geom,0.0001) WHERE scenario = 'SIM9p0_CascadiaInterfaceBestFault';
--SET geom = ST_BUFFER(geom,0.0001) WHERE scenario = '{eqScenario};


-- attach ruptures info from rupture table
SELECT 
a.scenario,
--b.rupture_name,
b.magnitude,
CAST(b.rake AS NUMERIC),
CAST(b.lon AS NUMERIC),
CAST(b.lat AS NUMERIC),
CAST(b.depth AS NUMERIC),
a.geom

INTO gmf.shakemap_scenario_extents_tbl
FROM gmf.shakemap_scenario_extents_temp a
LEFT JOIN ruptures.rupture_table b on a.scenario = b.rupture_name;

/*
-- fix invalid projection
ALTER TABLE gmf.shakemap_scenario_extents_tbl
ALTER COLUMN geom TYPE geometry(POLYGON,4326) USING ST_SetSRID(geom,4326);
*/


-- create shakemap extents view
DROP VIEW IF EXISTS gmf.shakemap_scenario_extents CASCADE;
CREATE VIEW gmf.shakemap_scenario_extents AS 
SELECT * FROM gmf.shakemap_scenario_extents_tbl;

-- create index
CREATE INDEX IF NOT EXISTS shakemap_scenario_extents_idx ON gmf.shakemap_scenario_extents_tbl USING GIST(geom);

DROP TABLE IF EXISTS gmf.shakemap_scenario_extents_temp;