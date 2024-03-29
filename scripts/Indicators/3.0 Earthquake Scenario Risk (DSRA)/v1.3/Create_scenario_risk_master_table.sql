-- create master dsra table
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_tbl(
assetid varchar,
sauid varchar,
dauid varchar,
csduid varchar,
csdname varchar,
fsauid varchar,
cduid varchar,
cdname varchar,
eruid varchar,
ername varchar,
pruid varchar,
prname varchar,
sh_rupname varchar,
--sh_rupabbr varchar,
sh_mag varchar,
sh_hypolon float,
sh_hypolat float,
sh_hypodepth float,
sh_rake varchar,
geom_point geometry
); 

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_acm6p5_beaufort.dsra_acm6p5_beaufort_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_acm7p2_lrdmf.dsra_acm7p2_lrdmf_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_acm7p3_georgiastraitnew.dsra_acm7p3_georgiastraitnew_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm4p7_sidney.dsra_idm4p7_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm4p8_sidney.dsra_idm4p8_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm5p0_sidney.dsra_idm5p0_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm5p2_sidney.dsra_idm5p2_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm5p4_sidney.dsra_idm5p4_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm5p6_sidney.dsra_idm5p6_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm5p8_sidney.dsra_idm5p8_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm6p0_sidney.dsra_idm6p0_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm6p2_sidney.dsra_idm6p2_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm6p4_sidney.dsra_idm6p4_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm6p6_sidney.dsra_idm6p6_sidney_indicators_b;

/*
-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm6p8_jdfpathways.dsra_idm6p8_jdfpathways_indicators_b;
*/

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm6p8_sidney.dsra_idm6p8_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm7p0_sidney.dsra_idm7p0_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm7p1_sidney.dsra_idm7p1_sidney_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_idm7p1_sidneytest.dsra_idm7p1_sidneytest_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_scm6p5_ottawa.dsra_scm6p5_ottawa_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_scm7p0_montrealnw.dsra_scm7p0_montrealnw_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_scm7p0_montrealnwcanshm5.dsra_scm7p0_montrealnwcanshm5_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_sim9p0_cascadiainterfacebestfault.dsra_sim9p0_cascadiainterfacebestfault_indicators_b;

-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_sim9p0_cszlockedtrans.dsra_sim9p0_cszlockedtrans_indicators_b;

/*
-- insert values into table, this scenario has no rupture info, ignore for now
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth","sH_Rake",geom_point
FROM results_dsra_scm7p0_montrealnwcanshm5.dsra_scm7p0_montrealnwcanshm5_indicators_b;
*/

/* -- template
-- insert values into table
INSERT INTO dsra.dsra_all_scenarios_tbl(assetid,sauid,pruid,prname,eruid,cduid,cdname,csduid,csdname,fsauid,dauid,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,geom_point)
SELECT "AssetID","Sauid",pruid,prname,eruid,ername,cduid,cdname,csduid,csdname,fsauid,dauid,"sH_RupName","sH_Mag","sH_HypoLon","sH_HypoLat","sH_HypoDepth",geom_point
FROM results_{eqScenario}.dsra_{eqScenario}_indicators_b;
*/

-- create index on master dsra table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_assetid_idx ON dsra.dsra_all_scenarios_tbl(assetid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_idx ON dsra.dsra_all_scenarios_tbl(sauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_pruid_idx ON dsra.dsra_all_scenarios_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_eruid_idx ON dsra.dsra_all_scenarios_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_cduid_idx ON dsra.dsra_all_scenarios_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_idx ON dsra.dsra_all_scenarios_tbl(csduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_fsauid_idx ON dsra.dsra_all_scenarios_tbl(fsauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_idx ON dsra.dsra_all_scenarios_tbl(dauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_geom_idx ON dsra.dsra_all_scenarios_tbl USING GIST(geom_point);

-- create master dsra building view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_building CASCADE;
CREATE VIEW dsra.dsra_all_scenarios AS 
SELECT * FROM dsra.dsra_all_scenarios_tbl ORDER BY assetid,sh_rupname;


/*
-- create master dsra sauid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_sauid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_sauid_tbl AS
(
SELECT
a.sauid,
a.dauid,
a.csduid,
a.csdname,
a.cduid,
a.cdname,
a.fsauid,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_tbl a
LEFT JOIN boundaries."Geometry_SAUID" b ON a.sauid = b."SAUIDt"
GROUP BY sauid,dauid,csduid,csdname,cduid,cdname,fsauid,eruid,ername,pruid,prname,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,b.geom);

-- create index on master dsra sauid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_sauid_idx ON dsra.dsra_all_scenarios_sauid_tbl(sauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_dauid_idx ON dsra.dsra_all_scenarios_sauid_tbl(dauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_csduid_idx ON dsra.dsra_all_scenarios_sauid_tbl(csduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_fsauid_idx ON dsra.dsra_all_scenarios_sauid_tbl(fsauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_cduid_idx ON dsra.dsra_all_scenarios_sauid_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_eruid_idx ON dsra.dsra_all_scenarios_sauid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_pruid_idx ON dsra.dsra_all_scenarios_sauid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_geom_idx ON dsra.dsra_all_scenarios_sauid_tbl USING GIST(geom);

-- create master dsra sauid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_sauid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_sauid AS 
SELECT * FROM dsra.dsra_all_scenarios_sauid_tbl;
*/

-- create master dsra sauid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_sauid_tbl_temp CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_sauid_tbl_temp AS
(
SELECT
a.sauid,
a.dauid,
a.csduid,
a.csdname,
a.cduid,
a.cdname,
a.fsauid,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake
FROM dsra.dsra_all_scenarios_tbl a
GROUP BY sauid,dauid,csduid,csdname,cduid,cdname,fsauid,eruid,ername,pruid,prname,sh_rupname,/*sh_rupabbr,*/sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake);

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_sauid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_sauid_tbl AS
(
SELECT
a.sauid,
a.dauid,
a.csduid,
a.csdname,
a.cduid,
a.cdname,
a.fsauid,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_sauid_tbl_temp a
LEFT JOIN boundaries."Geometry_SAUID" b ON a.sauid = b."SAUIDt");

-- create index on master dsra sauid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_sauid_idx ON dsra.dsra_all_scenarios_sauid_tbl(sauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_dauid_idx ON dsra.dsra_all_scenarios_sauid_tbl(dauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_csduid_idx ON dsra.dsra_all_scenarios_sauid_tbl(csduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_fsauid_idx ON dsra.dsra_all_scenarios_sauid_tbl(fsauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_cduid_idx ON dsra.dsra_all_scenarios_sauid_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_eruid_idx ON dsra.dsra_all_scenarios_sauid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_pruid_idx ON dsra.dsra_all_scenarios_sauid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_sauid_geom_idx ON dsra.dsra_all_scenarios_sauid_tbl USING GIST(geom);

-- create master dsra sauid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_sauid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_sauid AS 
SELECT * FROM dsra.dsra_all_scenarios_sauid_tbl ORDER BY sauid,sh_rupname;

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_sauid_tbl_temp CASCADE;

/*
-- create master dsra dauid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_dauid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_dauid_tbl AS
(
SELECT
a.dauid,
a.csduid,
a.csdname,
a.fsauid,
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_tbl a
LEFT JOIN boundaries."Geometry_DAUID" b ON a.dauid = b."DAUID"
GROUP BY dauid,csduid,csdname,fsauid,cduid,cdname,eruid,ername,pruid,prname,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,b.geom);

-- create index on master dsra dauid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_dauid_idx ON dsra.dsra_all_scenarios_dauid_tbl(dauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_csduid_idx ON dsra.dsra_all_scenarios_dauid_tbl(csduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_fsauid_idx ON dsra.dsra_all_scenarios_dauid_tbl(fsauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_cduid_idx ON dsra.dsra_all_scenarios_dauid_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_eruid_idx ON dsra.dsra_all_scenarios_dauid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_pruid_idx ON dsra.dsra_all_scenarios_dauid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_geom_idx ON dsra.dsra_all_scenarios_dauid_tbl USING GIST(geom);

-- create master dsra dauid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_dauid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_dauid AS 
SELECT * FROM dsra.dsra_all_scenarios_dauid_tbl;
*/

-- create master dsra dauid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_dauid_tbl_temp CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_dauid_tbl_temp AS
(
SELECT
a.dauid,
a.csduid,
a.csdname,
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake
FROM dsra.dsra_all_scenarios_tbl a
LEFT JOIN boundaries."Geometry_DAUID" b ON a.dauid = b."DAUID"
GROUP BY dauid,csduid,csdname,cduid,cdname,eruid,ername,pruid,prname,sh_rupname,/*sh_rupabbr,*/sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake);

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_dauid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_dauid_tbl AS
(
SELECT
a.dauid,
a.csduid,
a.csdname,
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_dauid_tbl_temp a
LEFT JOIN boundaries."Geometry_DAUID" b ON a.dauid = b."DAUID");

-- create index on master dsra dauid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_dauid_idx ON dsra.dsra_all_scenarios_dauid_tbl(dauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_csduid_idx ON dsra.dsra_all_scenarios_dauid_tbl(csduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_cduid_idx ON dsra.dsra_all_scenarios_dauid_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_eruid_idx ON dsra.dsra_all_scenarios_dauid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_pruid_idx ON dsra.dsra_all_scenarios_dauid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_dauid_geom_idx ON dsra.dsra_all_scenarios_dauid_tbl USING GIST(geom);

-- create master dsra dauid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_dauid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_dauid AS 
SELECT * FROM dsra.dsra_all_scenarios_dauid_tbl ORDER BY dauid,sh_rupname;

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_dauid_tbl_temp CASCADE;

/*
-- create master dsra csduid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_csduid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_csduid_tbl AS
(
SELECT
a.csduid,
a.csdname,
a.fsauid,
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_tbl a
LEFT JOIN boundaries."Geometry_CSDUID" b ON a.csduid = b."CSDUID"
GROUP BY csduid,csdname,fsauid,cduid,cdname,eruid,ername,pruid,prname,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,b.geom);

-- create index on master dsra csduid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_csduid_idx ON dsra.dsra_all_scenarios_csduid_tbl(csduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_fsauid_idx ON dsra.dsra_all_scenarios_csduid_tbl(fsauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_cduid_idx ON dsra.dsra_all_scenarios_csduid_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_eruid_idx ON dsra.dsra_all_scenarios_csduid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_pruid_idx ON dsra.dsra_all_scenarios_csduid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_geom_idx ON dsra.dsra_all_scenarios_csduid_tbl USING GIST(geom);

-- create master dsra csduid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_csduid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_csduid AS 
SELECT * FROM dsra.dsra_all_scenarios_csduid_tbl;
*/

-- create master dsra csduid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_csduid_tbl_temp CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_csduid_tbl_temp AS
(
SELECT
a.csduid,
a.csdname,
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake
FROM dsra.dsra_all_scenarios_tbl a
GROUP BY csduid,csdname,cduid,cdname,eruid,ername,pruid,prname,sh_rupname,/*sh_rupabbr,*/sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake);

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_csduid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_csduid_tbl AS
(
SELECT
a.csduid,
a.csdname,
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_csduid_tbl_temp a
LEFT JOIN boundaries."Geometry_CSDUID" b ON a.csduid = b."CSDUID");

-- create index on master dsra csduid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_csduid_idx ON dsra.dsra_all_scenarios_csduid_tbl(csduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_cduid_idx ON dsra.dsra_all_scenarios_csduid_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_eruid_idx ON dsra.dsra_all_scenarios_csduid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_pruid_idx ON dsra.dsra_all_scenarios_csduid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_csduid_geom_idx ON dsra.dsra_all_scenarios_csduid_tbl USING GIST(geom);

-- create master dsra csduid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_csduid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_csduid AS 
SELECT * FROM dsra.dsra_all_scenarios_csduid_tbl ORDER BY csduid,sh_rupname;

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_csduid_tbl_temp CASCADE;

/*
-- create master dsra fsauid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_fsauid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_fsauid_tbl AS
(
SELECT
a.fsauid,
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_tbl a
LEFT JOIN boundaries."Geometry_FSAUID" b ON a.fsauid = b."CFSAUID"
GROUP BY fsauid,cduid,cdname,eruid,ername,pruid,prname,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,b.geom);

-- create index on master dsra fsauid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_fsauid_fsauid_idx ON dsra.dsra_all_scenarios_fsauid_tbl(fsauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_fsauid_cduid_idx ON dsra.dsra_all_scenarios_fsauid_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_fsauid_eruid_idx ON dsra.dsra_all_scenarios_fsauid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_fsauid_pruid_idx ON dsra.dsra_all_scenarios_fsauid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_fsauid_geom_idx ON dsra.dsra_all_scenarios_fsauid_tbl USING GIST(geom);

-- create master dsra fsauid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_fsauid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_fsauid AS 
SELECT * FROM dsra.dsra_all_scenarios_fsauid_tbl;
*/

-- create master dsra fsauid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_fsauid_tbl_temp CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_fsauid_tbl_temp AS
(
SELECT
a.fsauid,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake
FROM dsra.dsra_all_scenarios_tbl a
GROUP BY fsauid,pruid,prname,sh_rupname,/*sh_rupabbr,*/sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake);

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_fsauid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_fsauid_tbl AS
(
SELECT
a.fsauid,
a.pruid,
a.prname,
a.sh_rupname,
a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_fsauid_tbl_temp a
LEFT JOIN boundaries."Geometry_FSAUID" b ON a.fsauid = b."CFSAUID");

-- create index on master dsra fsauid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_fsauid_fsauid_idx ON dsra.dsra_all_scenarios_fsauid_tbl(fsauid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_fsauid_pruid_idx ON dsra.dsra_all_scenarios_fsauid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_fsauid_geom_idx ON dsra.dsra_all_scenarios_fsauid_tbl USING GIST(geom);

-- create master dsra fsauid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_fsauid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_fsauid AS 
SELECT * FROM dsra.dsra_all_scenarios_fsauid_tbl ORDER BY fsauid,sh_rupname;

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_fsauid_tbl_temp CASCADE;

/*
-- create master dsra cduid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_cduid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_cduid_tbl AS
(
SELECT
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_tbl a
LEFT JOIN boundaries."Geometry_CDUID" b ON a.cduid = b."CDUID"
GROUP BY cduid,cdname,eruid,ername,pruid,prname,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,b.geom);

-- create index on master dsra cduid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_cduid_cduid_idx ON dsra.dsra_all_scenarios_cduid_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_cduid_eruid_idx ON dsra.dsra_all_scenarios_cduid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_cduid_pruid_idx ON dsra.dsra_all_scenarios_cduid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_cduid_geom_idx ON dsra.dsra_all_scenarios_cduid_tbl USING GIST(geom);

-- create master dsra cduid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_cduid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_cduid AS 
SELECT * FROM dsra.dsra_all_scenarios_cduid_tbl;
*/

-- create master dsra cduid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_cduid_tbl_temp CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_cduid_tbl_temp AS
(
SELECT
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake
FROM dsra.dsra_all_scenarios_tbl a
GROUP BY cduid,cdname,eruid,ername,pruid,prname,sh_rupname,/*sh_rupabbr,*/sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake);

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_cduid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_cduid_tbl AS
(
SELECT
a.cduid,
a.cdname,
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_cduid_tbl_temp a
LEFT JOIN boundaries."Geometry_CDUID" b ON a.cduid = b."CDUID");

-- create index on master dsra cduid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_cduid_cduid_idx ON dsra.dsra_all_scenarios_cduid_tbl(cduid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_cduid_eruid_idx ON dsra.dsra_all_scenarios_cduid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_cduid_pruid_idx ON dsra.dsra_all_scenarios_cduid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_cduid_geom_idx ON dsra.dsra_all_scenarios_cduid_tbl USING GIST(geom);

-- create master dsra cduid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_cduid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_cduid AS 
SELECT * FROM dsra.dsra_all_scenarios_cduid_tbl ORDER BY cduid,sh_rupname;

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_cduid_tbl_temp CASCADE;


/*
-- create master dsra eruid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_eruid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_eruid_tbl AS
(
SELECT
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_tbl a
LEFT JOIN boundaries."Geometry_CDUID" b ON a.eruid = b."CDUID"
GROUP BY eruid,ername,pruid,prname,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,b.geom);

-- create index on master dsra eruid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_eruid_eruid_idx ON dsra.dsra_all_scenarios_eruid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_eruid_pruid_idx ON dsra.dsra_all_scenarios_eruid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_eruid_geom_idx ON dsra.dsra_all_scenarios_eruid_tbl USING GIST(geom);

-- create master dsra eruid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_eruid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_eruid AS 
SELECT * FROM dsra.dsra_all_scenarios_eruid_tbl;
*/




-- create master dsra eruid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_eruid_tbl_temp CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_eruid_tbl_temp AS
(
SELECT
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake
FROM dsra.dsra_all_scenarios_tbl a
GROUP BY eruid,ername,pruid,prname,sh_rupname,sh_mag,/*sh_rupabbr,*/sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake);

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_eruid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_eruid_tbl AS
(
SELECT
a.eruid,
a.ername,
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_eruid_tbl_temp a
LEFT JOIN boundaries."Geometry_ERUID" b ON a.eruid = b."ERUID");

-- create index on master dsra eruid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_eruid_eruid_idx ON dsra.dsra_all_scenarios_eruid_tbl(eruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_eruid_pruid_idx ON dsra.dsra_all_scenarios_eruid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_eruid_geom_idx ON dsra.dsra_all_scenarios_eruid_tbl USING GIST(geom);

-- create master dsra eruid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_eruid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_eruid AS 
SELECT * FROM dsra.dsra_all_scenarios_eruid_tbl ORDER BY eruid,sh_rupname;

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_eruid_tbl_temp CASCADE;


/*
--group by geom field is computationally extensive for bigger features especially at the national canada level.  suggest to aggregate without geom and attach geom after.  
-- create master dsra pruid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_pruid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_pruid_tbl AS
(
SELECT
a.pruid,
a.prname,
a.sh_rupname,
a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_tbl a
LEFT JOIN boundaries."Geometry_PRUID" b ON a.pruid = b."PRUID"
GROUP BY pruid,prname,sh_rupname,sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake,b.geom);

-- create index on master dsra pruid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_pruid_pruid_idx ON dsra.dsra_all_scenarios_pruid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_pruid_geom_idx ON dsra.dsra_all_scenarios_pruid_tbl USING GIST(geom);

-- create master dsra pruid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_pruid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_pruid AS 
SELECT * FROM dsra.dsra_all_scenarios_pruid_tbl;
*/




-- create master dsra pruid view
DROP TABLE IF EXISTS dsra.dsra_all_scenarios_pruid_tbl_temp CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_pruid_tbl_temp AS
(
SELECT
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake
FROM dsra.dsra_all_scenarios_tbl a
GROUP BY pruid,prname,sh_rupname,/*sh_rupabbr,*/sh_mag,sh_hypolon,sh_hypolat,sh_hypodepth,sh_rake);

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_pruid_tbl CASCADE;
CREATE TABLE dsra.dsra_all_scenarios_pruid_tbl AS
(
SELECT
a.pruid,
a.prname,
a.sh_rupname,
--a.sh_rupabbr,
a.sh_mag,
a.sh_hypolon,
a.sh_hypolat,
a.sh_hypodepth,
a.sh_rake,
b.geom
FROM dsra.dsra_all_scenarios_pruid_tbl_temp a
LEFT JOIN boundaries."Geometry_PRUID" b ON a.pruid = b."PRUID");

-- create index on master dsra pruid table
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_pruid_pruid_idx ON dsra.dsra_all_scenarios_pruid_tbl(pruid);
CREATE INDEX IF NOT EXISTS dsra_all_scenarios_pruid_geom_idx ON dsra.dsra_all_scenarios_pruid_tbl USING GIST(geom);

-- create master dsra pruid view
DROP VIEW IF EXISTS dsra.dsra_all_scenarios_pruid CASCADE;
CREATE VIEW dsra.dsra_all_scenarios_pruid AS 
SELECT * FROM dsra.dsra_all_scenarios_pruid_tbl ORDER BY pruid,sh_rupname;

DROP TABLE IF EXISTS dsra.dsra_all_scenarios_pruid_tbl_temp CASCADE;



























-- values for dsra master table
/*
SELECT 
a."AssetID",
f.rupture_name AS "sH_RupName",
a."Rupture_Abbr" AS 
f.magnitude AS "sH_Mag",
CAST(CAST(ROUND(CAST(f.lon AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "sH_HypoLon",
CAST(CAST(ROUND(CAST(f.lat AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "sH_HypoLat",
CAST(CAST(ROUND(CAST(f.depth AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "sH_HypoDepth",
f.rake AS "sH_Rake",
b.sauid AS "Sauid",
c."PRUID" AS "pruid",
c."PRNAME" AS "prname",
c."ERUID" AS "eruid",
c."ERNAME" AS "ername",
c."CDUID" AS "cduid",
c."CDNAME" AS "cdname",
c."CSDUID" AS "csduid",
c."CSDNAME" AS "csdname",
c."CFSAUID" AS "fsauid",
c."DAUIDt" AS "dauid",
c."SACCODE" AS "saccode",
c."SACTYPE" AS "sactype",
b.geom AS "geom_point"

FROM dsra.dsra_sim9p0_cszlockedtrans a
LEFT JOIN exposure.canada_exposure b ON a."AssetID" = b.id
LEFT JOIN boundaries."Geometry_SAUID" c on b.sauid = c."SAUIDt"
LEFT JOIN ruptures.rupture_table f ON f.rupture_name = a."Rupture_Abbr";
*/