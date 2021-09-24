-- calculate new EQRiskIndex indicator for PSRA
--DROP TABLE IF EXISTS results_psra_{prov}.psra_{prov}_eqriskindex_calc CASCADE;
--CREATE TABLE results_psra_{prov}.psra_{prov}_eqriskindex_calc AS
DROP TABLE IF EXISTS results_psra_ns.psra_ns_eqriskindex_calc CASCADE;
CREATE TABLE results_psra_ns.psra_ns_eqriskindex_calc AS
(
SELECT
a.asset_id,
b.sauid,
a.structural_b0,
a.nonstructural_b0,
a.contents_b0,
a.occupants_b0 AS "lifeloss_b0",
a.contents_b0 + a.nonstructural_b0 + a.structural_b0 AS "asset_loss_b0",
a.structural_r1,
a.nonstructural_r1,
a.contents_r1,
a.occupants_r1 AS "lifeloss_r1",
a.contents_r1 + a.nonstructural_r1 + a.structural_r1 AS "asset_loss_r1",
b.structural,
b.nonstructural,
b.contents,
b.structural + b.nonstructural + b.contents AS "asset_value",
b.night,
COALESCE((a.contents_b0 + a.nonstructural_b0 + a.structural_b0)/NULLIF((b.structural + b.nonstructural + b.contents),0),0) AS "bldglossratio_b0",
COALESCE((a.contents_r1 + a.nonstructural_b0 + a.structural_r1)/NULLIF((b.structural + b.nonstructural + b.contents),0),0) AS "bldglossratio_r1",
COALESCE(a.occupants_b0/NULLIF(b.night,0),0) AS "lifelossratio_b0",
COALESCE(a.occupants_r1/NULLIF(b.night,0),0) AS "lifelossratio_r1"

FROM psra_ns.psra_ns_avg_losses_stats a
--FROM psra_{prov}.psra_{prov}_avg_losses_stats a
LEFT JOIN exposure.canada_exposure b ON a.asset_id = b.id
);



--DROP TABLE IF EXISTS TABLE results_psra_{prov}.psra_{prov}_eqriskindex CASCADE;
--CREATE TABLE results_psra_{prov}.psra_{prov}_eqriskindex AS
DROP TABLE IF EXISTS results_psra_ns.psra_ns_eqriskindex CASCADE;
CREATE TABLE results_psra_ns.psra_ns_eqriskindex AS
(
SELECT
a.sauid,
SUM(a.asset_loss_b0) AS "asset_loss_b0",
SUM(a.asset_loss_r1) AS "asset_loss_r1",
SUM(a.lifeloss_b0) AS "lifeloss_b0",
SUM(a.lifeloss_r1) AS "lifeloss_r1",
SUM(a.lifeloss_b0 * 8000000) AS "lifelosscost_b0",
SUM(a.lifeloss_r1 * 8000000) AS "lifelosscost_r1",
AVG(a.bldglossratio_b0) AS "bldglossratio_b0",
AVG(a.bldglossratio_r1) AS "bldglossratio_r1",
AVG(a.lifelossratio_b0) AS "lifelossratio_b0",
AVG(a.lifelossratio_r1) AS "lifelossratio_r1",
b."SVlt_Score" + 1 AS "SVlt_Score_translated",

--EQ Risk Index calculations
(SUM(a.asset_loss_b0) + SUM(a.lifeloss_b0 * 8000000)) * (b."SVlt_Score" + 1) AS "eqri_abs_score_b0",
'null' AS "eqri_abs_rating_b0",
(AVG(a.bldglossratio_b0) + AVG(a.lifelossratio_b0)) * (b."SVlt_Score" + 1) AS "eqri_rel_score_b0",
'null' AS "eqri_rel_rating_b0",
(SUM(a.asset_loss_r1) + SUM(a.lifeloss_r1 * 8000000)) * (b."SVlt_Score" + 1) AS "eqri_abs_score_r1",
'null' AS "eqri_abs_rating_r1",
(AVG(a.bldglossratio_r1) + AVG(a.lifelossratio_r1)) * (b."SVlt_Score" + 1) AS "eqri_rel_score_r1",
'null' AS "eqri_rel_rating_r1"

FROM results_psra_ns.psra_ns_eqriskindex_calc a
--FROM results_psra_{prov}.psra_{prov}_eqriskindex_calcs a
LEFT JOIN results_nhsl_social_fabric.nhsl_social_fabric_all_indicators_s b ON a.sauid = b."Sauid"
GROUP BY a.sauid,b."SVlt_Score"
);



--create threshold lookup table for rating
--DROP TABLE IF EXISTS results_psra_{prov}.psra_{prov}_eqri_thresholds CASCADE;
--CREATE TABLE results_psra_{prov}.psra__{prov}_eqri_thresholds AS
DROP TABLE IF EXISTS results_psra_ns.psra_ns_eqri_thresholds CASCADE;
CREATE TABLE results_psra_ns.psra_ns_eqri_thresholds
(
percentile NUMERIC,
abs_score_threshold_b0 FLOAT DEFAULT 0,
abs_score_threshold_r1 FLOAT DEFAULT 0,
rel_score_threshold_b0 FLOAT DEFAULT 0,
rel_score_threshold_r1 FLOAT DEFAULT 0,
rating VARCHAR
);




--insert default values
--INSERT INTO results_psra_{prov}.psra_{prov}_eqri_thresholds (percentile,rating) VALUES
INSERT INTO results_psra_ns.psra_ns_eqri_thresholds (percentile,rating) VALUES
(0,'Very Low'),
(0.35,'Relatively Low'),
(0.60,'Relatively Moderate'),
(0.80,'Relatively High'),
(0.95,'Very High');




/*
--update values with calculated percentiles
--0.35 percentile
UPDATE results_psra_{prov}.psra_{prov}_eqri_thresholds 
SET abs_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.35) WITHIN GROUP (ORDER BY eqri_abs_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	abs_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.35) WITHIN GROUP (ORDER BY eqri_abs_score_r1) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	rel_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.35) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	rel_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.35) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex) WHERE percentile = 0.35;

-- 0.60 percentile
UPDATE results_psra_{prov}.psra_{prov}_eqri_thresholds 
SET abs_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.60) WITHIN GROUP (ORDER BY eqri_abs_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	abs_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.60) WITHIN GROUP (ORDER BY eqri_abs_score_r1) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	rel_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.60) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	rel_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.60) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex) WHERE percentile = 0.60;
	
-- 0.80 percentile
UPDATE results_psra_{prov}.psra_{prov}_eqri_thresholds 
SET abs_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY eqri_abs_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	abs_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY eqri_abs_score_r1) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	rel_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	rel_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex) WHERE percentile = 0.80;
	
-- 0.95 percentile
UPDATE results_psra_{prov}.psra_{prov}_eqri_thresholds 
SET abs_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY eqri_abs_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	abs_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY eqri_abs_score_r1) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	rel_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex),
	rel_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_{prov}.psra_{prov}_eqriskindex) WHERE percentile = 0.95;
*/



--update values with calculated percentiles
--0.35 percentile
UPDATE results_psra_ns.psra_ns_eqri_thresholds 
SET abs_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.35) WITHIN GROUP (ORDER BY eqri_abs_score_b0) FROM results_psra_ns.psra_ns_eqriskindex),
	abs_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.35) WITHIN GROUP (ORDER BY eqri_abs_score_r1) FROM results_psra_ns.psra_ns_eqriskindex),
	rel_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.35) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_ns.psra_ns_eqriskindex),
	rel_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.35) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_ns.psra_ns_eqriskindex) WHERE percentile = 0.35;

-- 0.60 percentile
UPDATE results_psra_ns.psra_ns_eqri_thresholds 
SET abs_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.60) WITHIN GROUP (ORDER BY eqri_abs_score_b0) FROM results_psra_ns.psra_ns_eqriskindex),
	abs_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.60) WITHIN GROUP (ORDER BY eqri_abs_score_r1) FROM results_psra_ns.psra_ns_eqriskindex),
	rel_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.60) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_ns.psra_ns_eqriskindex),
	rel_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.60) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_ns.psra_ns_eqriskindex) WHERE percentile = 0.60;
	
-- 0.80 percentile
UPDATE results_psra_ns.psra_ns_eqri_thresholds 
SET abs_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY eqri_abs_score_b0) FROM results_psra_ns.psra_ns_eqriskindex),
	abs_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY eqri_abs_score_r1) FROM results_psra_ns.psra_ns_eqriskindex),
	rel_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_ns.psra_ns_eqriskindex),
	rel_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_ns.psra_ns_eqriskindex) WHERE percentile = 0.80;
	
-- 0.95 percentile
UPDATE results_psra_ns.psra_ns_eqri_thresholds 
SET abs_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY eqri_abs_score_b0) FROM results_psra_ns.psra_ns_eqriskindex),
	abs_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY eqri_abs_score_r1) FROM results_psra_ns.psra_ns_eqriskindex),
	rel_score_threshold_b0 = (SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_ns.psra_ns_eqriskindex),
	rel_score_threshold_r1 = (SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY eqri_rel_score_b0) FROM results_psra_ns.psra_ns_eqriskindex) WHERE percentile = 0.95;



/*
-- update rating with threshold lookup table values
UPDATE results_psra_{prov}.psra_{prov}_eqriskindex
SET eqri_abs_rating_b0 =
	CASE 
		WHEN eqri_abs_score_b0 < (SELECT abs_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.35) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0)
		WHEN eqri_abs_score_b0 < (SELECT abs_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.60) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.35)
		WHEN eqri_abs_score_b0 < (SELECT abs_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.80) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.6)
		WHEN eqri_abs_score_b0 < (SELECT abs_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.8)
		WHEN eqri_abs_score_b0 > (SELECT abs_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95)
		ELSE 'Error' END,
	eqri_abs_rating_r1 =
	CASE 
		WHEN eqri_abs_score_r1 < (SELECT abs_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.35) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0)
		WHEN eqri_abs_score_r1 < (SELECT abs_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.60) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.35)
		WHEN eqri_abs_score_r1 < (SELECT abs_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.80) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.6)
		WHEN eqri_abs_score_r1 < (SELECT abs_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.8)
		WHEN eqri_abs_score_r1 > (SELECT abs_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95)
		ELSE 'Error' END,
	eqri_rel_rating_b0 =
	CASE 
		WHEN eqri_rel_score_b0 < (SELECT rel_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.35) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0)
		WHEN eqri_rel_score_b0 < (SELECT rel_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.60) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.35)
		WHEN eqri_rel_score_b0 < (SELECT rel_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.80) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.6)
		WHEN eqri_rel_score_b0 < (SELECT rel_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.8)
		WHEN eqri_rel_score_b0 > (SELECT rel_score_threshold_b0 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95)
		ELSE 'Error' END,
	eqri_rel_rating_r1 =
	CASE 
		WHEN eqri_rel_score_r1 < (SELECT rel_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.35) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0)
		WHEN eqri_rel_score_r1 < (SELECT rel_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.60) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.35)
		WHEN eqri_rel_score_r1 < (SELECT rel_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.80) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.6)
		WHEN eqri_rel_score_r1 < (SELECT rel_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.8)
		WHEN eqri_rel_score_r1 > (SELECT rel_score_threshold_r1 FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_{prov}.psra_{prov}_eqri_thresholds WHERE percentile = 0.95)
		ELSE 'Error' END;
*/



-- update rating with threshold lookup table values
UPDATE results_psra_ns.psra_ns_eqriskindex
SET eqri_abs_rating_b0 =
	CASE 
		WHEN eqri_abs_score_b0 < (SELECT abs_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.35) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0)
		WHEN eqri_abs_score_b0 < (SELECT abs_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.60) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.35)
		WHEN eqri_abs_score_b0 < (SELECT abs_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.80) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.6)
		WHEN eqri_abs_score_b0 < (SELECT abs_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.8)
		WHEN eqri_abs_score_b0 > (SELECT abs_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95)
		ELSE 'Error' END,
	eqri_abs_rating_r1 =
	CASE 
		WHEN eqri_abs_score_r1 < (SELECT abs_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.35) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0)
		WHEN eqri_abs_score_r1 < (SELECT abs_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.60) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.35)
		WHEN eqri_abs_score_r1 < (SELECT abs_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.80) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.6)
		WHEN eqri_abs_score_r1 < (SELECT abs_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.8)
		WHEN eqri_abs_score_r1 > (SELECT abs_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95)
		ELSE 'Error' END,
	eqri_rel_rating_b0 =
	CASE 
		WHEN eqri_rel_score_b0 < (SELECT rel_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.35) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0)
		WHEN eqri_rel_score_b0 < (SELECT rel_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.60) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.35)
		WHEN eqri_rel_score_b0 < (SELECT rel_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.80) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.6)
		WHEN eqri_rel_score_b0 < (SELECT rel_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.8)
		WHEN eqri_rel_score_b0 > (SELECT rel_score_threshold_b0 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95)
		ELSE 'Error' END,
	eqri_rel_rating_r1 =
	CASE 
		WHEN eqri_rel_score_r1 < (SELECT rel_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.35) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0)
		WHEN eqri_rel_score_r1 < (SELECT rel_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.60) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.35)
		WHEN eqri_rel_score_r1 < (SELECT rel_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.80) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.6)
		WHEN eqri_rel_score_r1 < (SELECT rel_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.8)
		WHEN eqri_rel_score_r1 > (SELECT rel_score_threshold_r1 FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95) THEN (SELECT rating FROM results_psra_ns.psra_ns_eqri_thresholds WHERE percentile = 0.95)
		ELSE 'Error' END;