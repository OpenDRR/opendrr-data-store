-- create schema for new scenario
CREATE SCHEMA IF NOT EXISTS results_nhsl_hazard_threat;

-- hazard threat priority - sauid query
SELECT 
a."Sauid",
a.csduid,


-- buildings absolute
a."Et_BldgNum",
CASE
	WHEN a."Et_BldgNum" = 0 THEN 0
	WHEN a."Et_BldgNum" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY a."Et_BldgNum") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_BldgNum" < (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY a."Et_BldgNum") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_BldgNum" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY a."Et_BldgNum") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_BldgNum" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY a."Et_BldgNum") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END AS "ET_BldgNum_abs_rating",

-- building relative
b."Et_BldgNum",
(a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)) AS "Et_BldgNum_rel",
CASE
	WHEN (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)) IS NULL THEN 0
	WHEN (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)) = 0 THEN 0
	WHEN (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0))) 
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_BldgNum"/NULLIF(b."Et_BldgNum",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END AS "Et_BldgNum_rel_rating",
	
-- population absolute
a."Et_PopNight",
CASE
	WHEN a."Et_PopNight" = 0 THEN 0
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END AS "Et_PopNight_abs_rating",

-- population relative
b."Et_PopNight",
(a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) AS "Et_PopNight_rel", -- divide by zero error, set null
CASE
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) IS NULL THEN 0 -- catch null values from divide by zero error, set null
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) = 0 THEN 0
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END AS "Et_PopNight_rel_rating",

-- assets absolute
a."Et_BldgValue",
a."Et_AssetValue",
CASE
	WHEN a."Et_AssetValue" = 0 THEN 0
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END AS "Et_AssetValue_abs_rating",

-- assets relative
b."Et_AssetValue",
(a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) AS "Et_AssetValue_rel",
CASE
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) IS NULL THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) = 0 THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END AS "Et_AssetValue_rel_rating",

-- social fabric
c."VFt_Score",
c."VAt_Score",
c."VHt_Score",
c."VEt_Score",
c."SVlt_Score",

-- eq shaking prioritization
-- hazard intensity
a."HTi_MMI6",
a."HTi_MMI7",
a."HTi_MMI8",
a."HTi_PGV2500",
a."HTi_PGV500",
a."HTi_PGA2500",
a."HTi_PGA500",

-- pgv threat
a."HTd_PGV500",
a."HTt_PGV500",
a."HTp_PGV500",

-- pga threat
a."HTd_PGA500",
a."HTt_PGA500",
a."HTp_PGA500",

-- pga priority - absolute
CASE
	WHEN a."HTd_PGA500" = 'None' THEN 0
	WHEN a."HTd_PGA500" = 'Low' THEN 1
	WHEN a."HTd_PGA500" = 'Moderate' THEN 2
	WHEN a."HTd_PGA500" = 'Considerable' THEN 3
	WHEN a."HTd_PGA500" = 'High' THEN 4
	WHEN a."HTd_PGA500" = 'Extreme' THEN 5
	ELSE 0 END AS "eq_bld_dmg_pot_abs",
(CASE
	WHEN a."Et_AssetValue" = 0 THEN 0
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) * (CASE
	WHEN a."HTd_PGA500" = 'None' THEN 0
	WHEN a."HTd_PGA500" = 'Low' THEN 1
	WHEN a."HTd_PGA500" = 'Moderate' THEN 2
	WHEN a."HTd_PGA500" = 'Considerable' THEN 3
	WHEN a."HTd_PGA500" = 'High' THEN 4
	WHEN a."HTd_PGA500" = 'Extreme' THEN 5
	ELSE 0 END) AS "eq_asset_loss_pot_abs",
CASE
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_PGA500" > (SELECT pga_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END AS "eq_human_impct_pot_abs",
(CASE
	WHEN a."Et_PopNight" = 0 THEN 0
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) * (CASE
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_PGA500" > (SELECT pga_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END) AS "eq_human_loss_pot_abs",
((CASE
	WHEN a."Et_AssetValue" = 0 THEN 0
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) * (CASE
	WHEN a."HTd_PGA500" = 'None' THEN 0
	WHEN a."HTd_PGA500" = 'Low' THEN 1
	WHEN a."HTd_PGA500" = 'Moderate' THEN 2
	WHEN a."HTd_PGA500" = 'Considerable' THEN 3
	WHEN a."HTd_PGA500" = 'High' THEN 4
	WHEN a."HTd_PGA500" = 'Extreme' THEN 5
	ELSE 0 END) + (CASE
	WHEN a."Et_PopNight" = 0 THEN 0
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) * (CASE
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_PGA500" > (SELECT pga_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END)) * c."SVlt_Score" AS "eq_shaking_score_abs",

-- pga priority - relative
CASE
	WHEN a."HTd_PGA500" = 'None' THEN 0
	WHEN a."HTd_PGA500" = 'Low' THEN 1
	WHEN a."HTd_PGA500" = 'Moderate' THEN 2
	WHEN a."HTd_PGA500" = 'Considerable' THEN 3
	WHEN a."HTd_PGA500" = 'High' THEN 4
	WHEN a."HTd_PGA500" = 'Extreme' THEN 5
	ELSE 0 END AS "eq_bld_dmg_pot_rel",
(CASE
	WHEN a."HTd_PGA500" = 'None' THEN 0
	WHEN a."HTd_PGA500" = 'Low' THEN 1
	WHEN a."HTd_PGA500" = 'Moderate' THEN 2
	WHEN a."HTd_PGA500" = 'Considerable' THEN 3
	WHEN a."HTd_PGA500" = 'High' THEN 4
	WHEN a."HTd_PGA500" = 'Extreme' THEN 5
	ELSE 0 END) * (CASE
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) IS NULL THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) = 0 THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) AS "eq_asset_loss_pot_rel",
CASE
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_PGA500" > (SELECT pga_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END AS "eq_human_impct_pot_rel",
(CASE
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_PGA500" > (SELECT pga_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END) * (CASE
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) IS NULL THEN 0 -- catch null values from divide by zero error, set null
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) = 0 THEN 0
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) AS "eq_human_loss_pot_rel",
((CASE
	WHEN a."HTd_PGA500" = 'None' THEN 0
	WHEN a."HTd_PGA500" = 'Low' THEN 1
	WHEN a."HTd_PGA500" = 'Moderate' THEN 2
	WHEN a."HTd_PGA500" = 'Considerable' THEN 3
	WHEN a."HTd_PGA500" = 'High' THEN 4
	WHEN a."HTd_PGA500" = 'Extreme' THEN 5
	ELSE 0 END) * (CASE
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) IS NULL THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) = 0 THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) + (CASE
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_PGA500" < (SELECT pga_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_PGA500" > (SELECT pga_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END) * (CASE
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) IS NULL THEN 0 -- catch null values from divide by zero error, set null
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) = 0 THEN 0
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END)) * c."SVlt_Score" AS "eq_shaking_score_rel",


-- flood threat and prioritization
-- hazard intensity
a."HTi_Fld50",
a."HTi_Fld100",
a."HTi_Fld200",
a."HTi_Fld500",

-- threat
a."HTd_Fld500",
a."HTt_Fld500",
a."HTp_Fld500",

-- flood priority - absolute
CASE
	WHEN a."HTd_Fld500" = 'None' THEN 0
	WHEN a."HTd_Fld500" = 'Low' THEN 1
	WHEN a."HTd_Fld500" = 'Moderate' THEN 2
	WHEN a."HTd_Fld500" = 'Considerable' THEN 3
	WHEN a."HTd_Fld500" = 'High' THEN 4
	WHEN a."HTd_Fld500" = 'Extreme' THEN 5
	ELSE 0 END AS "fld_bld_dmg_pot_abs",
(CASE
	WHEN a."HTd_Fld500" = 'None' THEN 0
	WHEN a."HTd_Fld500" = 'Low' THEN 1
	WHEN a."HTd_Fld500" = 'Moderate' THEN 2
	WHEN a."HTd_Fld500" = 'Considerable' THEN 3
	WHEN a."HTd_Fld500" = 'High' THEN 4
	WHEN a."HTd_Fld500" = 'Extreme' THEN 5
	ELSE 0 END) * (CASE
	WHEN a."Et_AssetValue" = 0 THEN 0
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) AS "fld_asset_loss_pot_abs",
CASE
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_Fld500" > (SELECT fld_tsun_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END AS "fld_human_impct_pot_abs",
(CASE
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_Fld500" > (SELECT fld_tsun_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END) * (CASE
	WHEN a."Et_PopNight" = 0 THEN 0
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) AS "fld_human_loss_pot_abs",
((CASE
	WHEN a."HTd_Fld500" = 'None' THEN 0
	WHEN a."HTd_Fld500" = 'Low' THEN 1
	WHEN a."HTd_Fld500" = 'Moderate' THEN 2
	WHEN a."HTd_Fld500" = 'Considerable' THEN 3
	WHEN a."HTd_Fld500" = 'High' THEN 4
	WHEN a."HTd_Fld500" = 'Extreme' THEN 5
	ELSE 0 END) * (CASE
	WHEN a."Et_AssetValue" = 0 THEN 0
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_AssetValue" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY "Et_AssetValue") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) + (CASE
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_Fld500" > (SELECT fld_tsun_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END) * (CASE
	WHEN a."Et_PopNight" = 0 THEN 0
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 1
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 2
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 3
	WHEN a."Et_PopNight" < (SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY a."Et_PopNight") FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END)) * c."SVlt_Score" AS "fld_priority_score_abs",

-- flood priority - absolute
CASE
	WHEN a."HTd_Fld500" = 'None' THEN 0
	WHEN a."HTd_Fld500" = 'Low' THEN 1
	WHEN a."HTd_Fld500" = 'Moderate' THEN 2
	WHEN a."HTd_Fld500" = 'Considerable' THEN 3
	WHEN a."HTd_Fld500" = 'High' THEN 4
	WHEN a."HTd_Fld500" = 'Extreme' THEN 5
	ELSE 0 END AS "fld_bld_dmg_pot_rel",
(CASE
	WHEN a."HTd_Fld500" = 'None' THEN 0
	WHEN a."HTd_Fld500" = 'Low' THEN 1
	WHEN a."HTd_Fld500" = 'Moderate' THEN 2
	WHEN a."HTd_Fld500" = 'Considerable' THEN 3
	WHEN a."HTd_Fld500" = 'High' THEN 4
	WHEN a."HTd_Fld500" = 'Extreme' THEN 5
	ELSE 0 END) * (CASE
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) IS NULL THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) = 0 THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) AS "fld_asset_loss_pot_rel",
CASE
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_Fld500" > (SELECT fld_tsun_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END AS "fld_human_impct_pot_rel",
(CASE
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_Fld500" > (SELECT fld_tsun_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END) * (CASE
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) IS NULL THEN 0 -- catch null values from divide by zero error, set null
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) = 0 THEN 0
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) AS "fld_human_loss_pot_rel",
((CASE
	WHEN a."HTd_Fld500" = 'None' THEN 0
	WHEN a."HTd_Fld500" = 'Low' THEN 1
	WHEN a."HTd_Fld500" = 'Moderate' THEN 2
	WHEN a."HTd_Fld500" = 'Considerable' THEN 3
	WHEN a."HTd_Fld500" = 'High' THEN 4
	WHEN a."HTd_Fld500" = 'Extreme' THEN 5
	ELSE 0 END) * (CASE
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) IS NULL THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) = 0 THEN 0
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_AssetValue"/NULLIF(b."Et_AssetValue",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END) + (CASE
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'None') THEN 0
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Low') THEN 1
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Moderate') THEN 2
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Considerable') THEN 3
	WHEN a."HTi_Fld500" < (SELECT fld_tsun_pp_to FROM mh.mh_ratings_thresholds WHERE impact_potential = 'High') THEN 4
	WHEN a."HTi_Fld500" > (SELECT fld_tsun_pp_frm FROM mh.mh_ratings_thresholds WHERE impact_potential = 'Extreme') THEN 5
	ELSE 0 END) + (CASE
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) IS NULL THEN 0 -- catch null values from divide by zero error, set null
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) = 0 THEN 0
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 1
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.50) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 2
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 3
	WHEN (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)) < 
		(SELECT percentile_cont(0.95) WITHIN GROUP (ORDER BY (a."Et_PopNight"/NULLIF(b."Et_PopNight",0)))
		FROM results_nhsl_hazard_threat.hazard_treat_values_s a
		LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
		WHERE a.pruid ='59') THEN 4
	ELSE 5 END)) * c."SVlt_Score" AS "fld_priority_score_rel"




FROM results_nhsl_hazard_threat.hazard_treat_values_s a
LEFT JOIN results_nhsl_hazard_threat.hazard_treat_values_csd b ON a.csduid = b.csduid
LEFT JOIN results_nhsl_social_fabric.nhsl_social_fabric_all_indicators_s_tbl c ON a."Sauid" = c."Sauid"
--WHERE a.pruid ='59'
WHERE a.pruid ='59' AND a."Sauid" in ('59002339')
ORDER BY a."Sauid" ASC;