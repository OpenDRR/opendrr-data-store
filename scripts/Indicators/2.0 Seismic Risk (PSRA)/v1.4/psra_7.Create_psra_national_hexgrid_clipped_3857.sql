-- test hexgrid aggregation for psra national level

-- 1km
DROP VIEW IF EXISTS results_psra_national.psra_indicators_hexgrid_1km CASCADE;
CREATE VIEW results_psra_national.psra_indicators_hexgrid_1km AS
SELECT 
c.gridid_1,
SUM(a."eDt_Slight_b0" * b.area_ratio) AS "eDt_Slight_b0",
AVG(a."eDtr_Slight_b0" * b.area_ratio) AS "eDtr_Slight_b0",
SUM(a."eDt_Moderate_b0" * b.area_ratio) AS "eDt_Moderate_b0",
AVG(a."eDtr_Moderate_b0" * b.area_ratio) AS "eDtr_Moderate_b0",
SUM(a."eDt_Extensive_b0" * b.area_ratio) AS "eDt_Extensive_b0",
AVG(a."eDtr_Extensive_b0" * b.area_ratio) AS "eDtr_Extensive_b0",
SUM(a."eDt_Complete_b0" * b.area_ratio) AS "eDt_Complete_b0",
AVG(a."eDtr_Complete_b0" * b.area_ratio) AS "eDtr_Complete_b0",
SUM(a."eDt_Collapse_b0" * b.area_ratio) AS "eDt_Collapse_b0",
AVG(a."eDtr_Collapse_b0" * b.area_ratio) AS "eDtr_Collapse_b0",
SUM(a."eDt_Fail_Collapse_b0" * b.area_ratio) AS "eDt_Fail_Collapse_b0",

SUM(a."eDt_Slight_r1" * b.area_ratio) AS "eDt_Slight_r1",
AVG(a."eDtr_Slight_r1" * b.area_ratio) AS "eDtr_Slight_r1",
SUM(a."eDt_Moderate_r1" * b.area_ratio) AS "eDt_Moderate_r1",
AVG(a."eDtr_Moderate_r1" * b.area_ratio) AS "eDtr_Moderate_r1",
SUM(a."eDt_Extensive_r1" * b.area_ratio) AS "eDt_Extensive_r1",
AVG(a."eDtr_Extensive_r1" * b.area_ratio) AS "eDtr_Extensive_r1",
SUM(a."eDt_Complete_r1" * b.area_ratio) AS "eDt_Complete_r1",
AVG(a."eDtr_Complete_r1" * b.area_ratio) AS "eDtr_Complete_r1",
SUM(a."eDt_Collapse_r1" * b.area_ratio) AS "eDt_Collapse_r1",
AVG(a."eDtr_Collapse_r1" * b.area_ratio) AS "eDtr_Collapse_r1",
SUM(a."eDt_Fail_Collapse_r1" * b.area_ratio) AS "eDt_Fail_Collapse_r1",

SUM(a."eDt_Slight05_b0" * b.area_ratio) AS "eDt_Slight05_b0",
AVG(a."eDtr_Slight05_b0" * b.area_ratio) AS "eDtr_Slight05_b0",
SUM(a."eDt_Moderate05_b0" * b.area_ratio) AS "eDt_Moderate05_b0",
AVG(a."eDtr_Moderate05_b0" * b.area_ratio) AS "eDtr_Moderate05_b0",
SUM(a."eDt_Extensive05_b0" * b.area_ratio) AS "eDt_Extensive05_b0",
AVG(a."eDtr_Extensive05_b0" * b.area_ratio) AS "eDtr_Extensive05_b0",
SUM(a."eDt_Complete05_b0" * b.area_ratio) AS "eDt_Complete05_b0",
AVG(a."eDtr_Complete05_b0" * b.area_ratio) AS "eDtr_Complete05_b0",
SUM(a."eDt_Collapse05_b0" * b.area_ratio) AS "eDt_Collapse05_b0",
AVG(a."eDtr_Collapse05_b0" * b.area_ratio) AS "eDtr_Collapse05_b0",
SUM(a."eDt_Fail_Collapse05_b0" * b.area_ratio) AS "eDt_Fail_Collapse05_b0",

SUM(a."eDt_Slight05_r1" * b.area_ratio) AS "eDt_Slight05_r1",
AVG(a."eDtr_Slight05_r1" * b.area_ratio) AS "eDtr_Slight05_r1",
SUM(a."eDt_Moderate05_r1" * b.area_ratio) AS "eDt_Moderate05_r1",
AVG(a."eDtr_Moderate05_r1" * b.area_ratio) AS "eDtr_Moderate05_r1",
SUM(a."eDt_Extensive05_r1" * b.area_ratio) AS "eDt_Extensive05_r1",
AVG(a."eDtr_Extensive05_r1" * b.area_ratio) AS "eDtr_Extensive05_r1",
SUM(a."eDt_Complete05_r1" * b.area_ratio) AS "eDt_Complete05_r1",
AVG(a."eDtr_Complete05_r1" * b.area_ratio) AS "eDtr_Complete05_r1",
SUM(a."eDt_Collapse05_r1" * b.area_ratio) AS "eDt_Collapse05_r1",
AVG(a."eDtr_Collapse05_r1" * b.area_ratio) AS "eDtr_Collapse05_r1",
SUM(a."eDt_Fail_Collapse05_r1" * b.area_ratio) AS "eDt_Fail_Collapse05_r1",

SUM(a."eDt_Slight95_b0" * b.area_ratio) AS "eDt_Slight95_b0",
AVG(a."eDtr_Slight95_b0" * b.area_ratio) AS "eDtr_Slight95_b0",
SUM(a."eDt_Moderate95_b0" * b.area_ratio) AS "eDt_Moderate95_b0",
AVG(a."eDtr_Moderate95_b0" * b.area_ratio) AS "eDtr_Moderate95_b0",
SUM(a."eDt_Extensive95_b0" * b.area_ratio) AS "eDt_Extensive95_b0",
AVG(a."eDtr_Extensive95_b0" * b.area_ratio) AS "eDtr_Extensive95_b0",
SUM(a."eDt_Complete95_b0" * b.area_ratio) AS "eDt_Complete95_b0",
AVG(a."eDtr_Complete95_b0" * b.area_ratio) AS "eDtr_Complete95_b0",
SUM(a."eDt_Collapse95_b0" * b.area_ratio) AS "eDt_Collapse95_b0",
AVG(a."eDtr_Collapse95_b0" * b.area_ratio) AS "eDtr_Collapse95_b0",
SUM(a."eDt_Fail_Collapse95_b0" * b.area_ratio) AS "eDt_Fail_Collapse95_b0",

SUM(a."eDt_Slight95_r1" * b.area_ratio) AS "eDt_Slight95_r1",
AVG(a."eDtr_Slight95_r1" * b.area_ratio) AS "eDtr_Slight95_r1",
SUM(a."eDt_Moderate95_r1" * b.area_ratio) AS "eDt_Moderate95_r1",
AVG(a."eDtr_Moderate95_r1" * b.area_ratio) AS "eDtr_Moderate95_r1",
SUM(a."eDt_Extensive95_r1" * b.area_ratio) AS "eDt_Extensive95_r1",
AVG(a."eDtr_Extensive95_r1" * b.area_ratio) AS "eDtr_Extensive95_r1",
SUM(a."eDt_Complete95_r1" * b.area_ratio) AS "eDt_Complete95_r1",
AVG(a."eDtr_Complete95_r1" * b.area_ratio) AS "eDtr_Complete95_r1",
SUM(a."eDt_Collapse95_r1" * b.area_ratio) AS "eDt_Collapse95_r1",
AVG(a."eDtr_Collapse95_r1" * b.area_ratio) AS "eDtr_Collapse95_r1",
SUM(a."eDt_Fail_Collapse95_r1" * b.area_ratio) AS "eDt_Fail_Collapse95_r1",

SUM(a."eCt_Fatality_b0" * b.area_ratio) AS "eCt_Fatality_b0",
AVG(a."eCtr_Fatality_b0" * b.area_ratio) AS "eCtr_Fatality_b0",

SUM(a."eCt_Fatality_r1" * b.area_ratio) AS "eCt_Fatality_r1",
AVG(a."eCtr_Fatality_r1" * b.area_ratio) AS "eCtr_Fatality_r1",

SUM(a."eAALt_Asset_b0" * b.area_ratio) AS "eAALt_Asset_b0",
AVG(a."eAALm_Asset_b0" * b.area_ratio) AS "eAALm_Asset_b0",
SUM(a."eAALt_Bldg_b0" * b.area_ratio) AS "eAALt_Bldg_b0",
AVG(a."eAALm_Bldg_b0" * b.area_ratio) AS "eAALm_Bldg_b0",
SUM(a."eAALt_Str_b0" * b.area_ratio) AS "eAALt_Str_b0",
SUM(a."eAALt_NStr_b0" * b.area_ratio) AS "eAALt_NStr_b0",
SUM(a."eAALt_Cont_b0" * b.area_ratio) AS "eAALt_Cont_b0",
SUM(a."eAALt_Asset_r1" * b.area_ratio) AS "eAALt_Asset_r1",
AVG(a."eAALm_Asset_r1" * b.area_ratio) AS "eAALm_Asset_r1",
SUM(a."eAALt_Bldg_r1" * b.area_ratio) AS "eAALt_Bldg_r1",
AVG(a."eAALm_Bldg_r1" * b.area_ratio) AS "eAALm_Bldg_r1",
SUM(a."eAALt_Str_r1" * b.area_ratio) AS "eAALt_Str_r1",
SUM(a."eAALt_NStr_r1" * b.area_ratio) AS "eAALt_NStr_r1",
SUM(a."eAALt_Cont_r1" * b.area_ratio) AS "eAALt_Cont_r1",
CAST(CAST(ROUND(CAST(d.eqri_abs_cbrt_minmax_b0 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_abs_score_b0",
d.eqri_abs_rating_b0 AS "eqri_abs_rank_b0",
CAST(CAST(ROUND(CAST(d.eqri_norm_cbrt_minmax_b0 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_norm_score_b0",
d.eqri_norm_rating_b0 AS "eqri_norm_rank_b0",
CAST(CAST(ROUND(CAST(d.eqri_abs_cbrt_minmax_r1 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_abs_score_r1",
d.eqri_abs_rating_r1 AS "eqri_abs_rank_r1",
CAST(CAST(ROUND(CAST(d.eqri_norm_cbrt_minmax_r1 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_norm_score_r1",
d.eqri_norm_rating_r1 AS "eqri_norm_rank_r1",
c.geom

FROM results_psra_national.psra_indicators_s_tbl a
LEFT JOIN boundaries."SAUID_HexGrid_1km_intersect_3857" b ON a."Sauid" = b.sauid
LEFT JOIN boundaries."HexGrid_1km_3857" c ON b.gridid_1 = c.gridid_1
LEFT JOIN results_psra_national.psra_sri_calc_hg_1km d ON b.gridid_1 = d.gridid_1
GROUP BY c.gridid_1,d.eqri_abs_cbrt_minmax_b0,d.eqri_abs_rating_b0,d.eqri_norm_cbrt_minmax_b0,eqri_norm_rating_b0,d.eqri_abs_cbrt_minmax_r1,d.eqri_abs_rating_r1,d.eqri_norm_cbrt_minmax_r1,d.eqri_norm_rating_r1,c.geom;



-- 5km
DROP VIEW IF EXISTS results_psra_national.psra_indicators_hexgrid_5km CASCADE;
CREATE VIEW results_psra_national.psra_indicators_hexgrid_5km AS
SELECT 
c.gridid_5,
SUM(a."eDt_Slight_b0" * b.area_ratio) AS "eDt_Slight_b0",
AVG(a."eDtr_Slight_b0" * b.area_ratio) AS "eDtr_Slight_b0",
SUM(a."eDt_Moderate_b0" * b.area_ratio) AS "eDt_Moderate_b0",
AVG(a."eDtr_Moderate_b0" * b.area_ratio) AS "eDtr_Moderate_b0",
SUM(a."eDt_Extensive_b0" * b.area_ratio) AS "eDt_Extensive_b0",
AVG(a."eDtr_Extensive_b0" * b.area_ratio) AS "eDtr_Extensive_b0",
SUM(a."eDt_Complete_b0" * b.area_ratio) AS "eDt_Complete_b0",
AVG(a."eDtr_Complete_b0" * b.area_ratio) AS "eDtr_Complete_b0",
SUM(a."eDt_Collapse_b0" * b.area_ratio) AS "eDt_Collapse_b0",
AVG(a."eDtr_Collapse_b0" * b.area_ratio) AS "eDtr_Collapse_b0",
SUM(a."eDt_Fail_Collapse_b0" * b.area_ratio) AS "eDt_Fail_Collapse_b0",

SUM(a."eDt_Slight_r1" * b.area_ratio) AS "eDt_Slight_r1",
AVG(a."eDtr_Slight_r1" * b.area_ratio) AS "eDtr_Slight_r1",
SUM(a."eDt_Moderate_r1" * b.area_ratio) AS "eDt_Moderate_r1",
AVG(a."eDtr_Moderate_r1" * b.area_ratio) AS "eDtr_Moderate_r1",
SUM(a."eDt_Extensive_r1" * b.area_ratio) AS "eDt_Extensive_r1",
AVG(a."eDtr_Extensive_r1" * b.area_ratio) AS "eDtr_Extensive_r1",
SUM(a."eDt_Complete_r1" * b.area_ratio) AS "eDt_Complete_r1",
AVG(a."eDtr_Complete_r1" * b.area_ratio) AS "eDtr_Complete_r1",
SUM(a."eDt_Collapse_r1" * b.area_ratio) AS "eDt_Collapse_r1",
AVG(a."eDtr_Collapse_r1" * b.area_ratio) AS "eDtr_Collapse_r1",
SUM(a."eDt_Fail_Collapse_r1" * b.area_ratio) AS "eDt_Fail_Collapse_r1",

SUM(a."eDt_Slight05_b0" * b.area_ratio) AS "eDt_Slight05_b0",
AVG(a."eDtr_Slight05_b0" * b.area_ratio) AS "eDtr_Slight05_b0",
SUM(a."eDt_Moderate05_b0" * b.area_ratio) AS "eDt_Moderate05_b0",
AVG(a."eDtr_Moderate05_b0" * b.area_ratio) AS "eDtr_Moderate05_b0",
SUM(a."eDt_Extensive05_b0" * b.area_ratio) AS "eDt_Extensive05_b0",
AVG(a."eDtr_Extensive05_b0" * b.area_ratio) AS "eDtr_Extensive05_b0",
SUM(a."eDt_Complete05_b0" * b.area_ratio) AS "eDt_Complete05_b0",
AVG(a."eDtr_Complete05_b0" * b.area_ratio) AS "eDtr_Complete05_b0",
SUM(a."eDt_Collapse05_b0" * b.area_ratio) AS "eDt_Collapse05_b0",
AVG(a."eDtr_Collapse05_b0" * b.area_ratio) AS "eDtr_Collapse05_b0",
SUM(a."eDt_Fail_Collapse05_b0" * b.area_ratio) AS "eDt_Fail_Collapse05_b0",

SUM(a."eDt_Slight05_r1" * b.area_ratio) AS "eDt_Slight05_r1",
AVG(a."eDtr_Slight05_r1" * b.area_ratio) AS "eDtr_Slight05_r1",
SUM(a."eDt_Moderate05_r1" * b.area_ratio) AS "eDt_Moderate05_r1",
AVG(a."eDtr_Moderate05_r1" * b.area_ratio) AS "eDtr_Moderate05_r1",
SUM(a."eDt_Extensive05_r1" * b.area_ratio) AS "eDt_Extensive05_r1",
AVG(a."eDtr_Extensive05_r1" * b.area_ratio) AS "eDtr_Extensive05_r1",
SUM(a."eDt_Complete05_r1" * b.area_ratio) AS "eDt_Complete05_r1",
AVG(a."eDtr_Complete05_r1" * b.area_ratio) AS "eDtr_Complete05_r1",
SUM(a."eDt_Collapse05_r1" * b.area_ratio) AS "eDt_Collapse05_r1",
AVG(a."eDtr_Collapse05_r1" * b.area_ratio) AS "eDtr_Collapse05_r1",
SUM(a."eDt_Fail_Collapse05_r1" * b.area_ratio) AS "eDt_Fail_Collapse05_r1",

SUM(a."eDt_Slight95_b0" * b.area_ratio) AS "eDt_Slight95_b0",
AVG(a."eDtr_Slight95_b0" * b.area_ratio) AS "eDtr_Slight95_b0",
SUM(a."eDt_Moderate95_b0" * b.area_ratio) AS "eDt_Moderate95_b0",
AVG(a."eDtr_Moderate95_b0" * b.area_ratio) AS "eDtr_Moderate95_b0",
SUM(a."eDt_Extensive95_b0" * b.area_ratio) AS "eDt_Extensive95_b0",
AVG(a."eDtr_Extensive95_b0" * b.area_ratio) AS "eDtr_Extensive95_b0",
SUM(a."eDt_Complete95_b0" * b.area_ratio) AS "eDt_Complete95_b0",
AVG(a."eDtr_Complete95_b0" * b.area_ratio) AS "eDtr_Complete95_b0",
SUM(a."eDt_Collapse95_b0" * b.area_ratio) AS "eDt_Collapse95_b0",
AVG(a."eDtr_Collapse95_b0" * b.area_ratio) AS "eDtr_Collapse95_b0",
SUM(a."eDt_Fail_Collapse95_b0" * b.area_ratio) AS "eDt_Fail_Collapse95_b0",

SUM(a."eDt_Slight95_r1" * b.area_ratio) AS "eDt_Slight95_r1",
AVG(a."eDtr_Slight95_r1" * b.area_ratio) AS "eDtr_Slight95_r1",
SUM(a."eDt_Moderate95_r1" * b.area_ratio) AS "eDt_Moderate95_r1",
AVG(a."eDtr_Moderate95_r1" * b.area_ratio) AS "eDtr_Moderate95_r1",
SUM(a."eDt_Extensive95_r1" * b.area_ratio) AS "eDt_Extensive95_r1",
AVG(a."eDtr_Extensive95_r1" * b.area_ratio) AS "eDtr_Extensive95_r1",
SUM(a."eDt_Complete95_r1" * b.area_ratio) AS "eDt_Complete95_r1",
AVG(a."eDtr_Complete95_r1" * b.area_ratio) AS "eDtr_Complete95_r1",
SUM(a."eDt_Collapse95_r1" * b.area_ratio) AS "eDt_Collapse95_r1",
AVG(a."eDtr_Collapse95_r1" * b.area_ratio) AS "eDtr_Collapse95_r1",
SUM(a."eDt_Fail_Collapse95_r1" * b.area_ratio) AS "eDt_Fail_Collapse95_r1",

SUM(a."eCt_Fatality_b0" * b.area_ratio) AS "eCt_Fatality_b0",
AVG(a."eCtr_Fatality_b0" * b.area_ratio) AS "eCtr_Fatality_b0",

SUM(a."eCt_Fatality_r1" * b.area_ratio) AS "eCt_Fatality_r1",
AVG(a."eCtr_Fatality_r1" * b.area_ratio) AS "eCtr_Fatality_r1",

SUM(a."eAALt_Asset_b0" * b.area_ratio) AS "eAALt_Asset_b0",
AVG(a."eAALm_Asset_b0" * b.area_ratio) AS "eAALm_Asset_b0",
SUM(a."eAALt_Bldg_b0" * b.area_ratio) AS "eAALt_Bldg_b0",
AVG(a."eAALm_Bldg_b0" * b.area_ratio) AS "eAALm_Bldg_b0",
SUM(a."eAALt_Str_b0" * b.area_ratio) AS "eAALt_Str_b0",
SUM(a."eAALt_NStr_b0" * b.area_ratio) AS "eAALt_NStr_b0",
SUM(a."eAALt_Cont_b0" * b.area_ratio) AS "eAALt_Cont_b0",
SUM(a."eAALt_Asset_r1" * b.area_ratio) AS "eAALt_Asset_r1",
AVG(a."eAALm_Asset_r1" * b.area_ratio) AS "eAALm_Asset_r1",
SUM(a."eAALt_Bldg_r1" * b.area_ratio) AS "eAALt_Bldg_r1",
AVG(a."eAALm_Bldg_r1" * b.area_ratio) AS "eAALm_Bldg_r1",
SUM(a."eAALt_Str_r1" * b.area_ratio) AS "eAALt_Str_r1",
SUM(a."eAALt_NStr_r1" * b.area_ratio) AS "eAALt_NStr_r1",
SUM(a."eAALt_Cont_r1" * b.area_ratio) AS "eAALt_Cont_r1",
CAST(CAST(ROUND(CAST(d.eqri_abs_cbrt_minmax_b0 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_abs_score_b0",
d.eqri_abs_rating_b0 AS "eqri_abs_rank_b0",
CAST(CAST(ROUND(CAST(d.eqri_norm_cbrt_minmax_b0 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_norm_score_b0",
d.eqri_norm_rating_b0 AS "eqri_norm_rank_b0",
CAST(CAST(ROUND(CAST(d.eqri_abs_cbrt_minmax_r1 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_abs_score_r1",
d.eqri_abs_rating_r1 AS "eqri_abs_rank_r1",
CAST(CAST(ROUND(CAST(d.eqri_norm_cbrt_minmax_r1 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_norm_score_r1",
d.eqri_norm_rating_r1 AS "eqri_norm_rank_r1",
c.geom

FROM results_psra_national.psra_indicators_s_tbl a
LEFT JOIN boundaries."SAUID_HexGrid_5km_intersect_3857" b ON a."Sauid" = b.sauid
LEFT JOIN boundaries."HexGrid_5km_3857" c ON b.gridid_5 = c.gridid_5
LEFT JOIN results_psra_national.psra_sri_calc_hg_5km d ON b.gridid_5 = d.gridid_5
GROUP BY c.gridid_5,d.eqri_abs_cbrt_minmax_b0,d.eqri_abs_rating_b0,d.eqri_norm_cbrt_minmax_b0,eqri_norm_rating_b0,d.eqri_abs_cbrt_minmax_r1,d.eqri_abs_rating_r1,d.eqri_norm_cbrt_minmax_r1,d.eqri_norm_rating_r1,c.geom;



-- 10km
DROP VIEW IF EXISTS results_psra_national.psra_indicators_hexgrid_10km CASCADE;
CREATE VIEW results_psra_national.psra_indicators_hexgrid_10km AS
SELECT 
c.gridid_10,
SUM(a."eDt_Slight_b0" * b.area_ratio) AS "eDt_Slight_b0",
AVG(a."eDtr_Slight_b0" * b.area_ratio) AS "eDtr_Slight_b0",
SUM(a."eDt_Moderate_b0" * b.area_ratio) AS "eDt_Moderate_b0",
AVG(a."eDtr_Moderate_b0" * b.area_ratio) AS "eDtr_Moderate_b0",
SUM(a."eDt_Extensive_b0" * b.area_ratio) AS "eDt_Extensive_b0",
AVG(a."eDtr_Extensive_b0" * b.area_ratio) AS "eDtr_Extensive_b0",
SUM(a."eDt_Complete_b0" * b.area_ratio) AS "eDt_Complete_b0",
AVG(a."eDtr_Complete_b0" * b.area_ratio) AS "eDtr_Complete_b0",
SUM(a."eDt_Collapse_b0" * b.area_ratio) AS "eDt_Collapse_b0",
AVG(a."eDtr_Collapse_b0" * b.area_ratio) AS "eDtr_Collapse_b0",
SUM(a."eDt_Fail_Collapse_b0" * b.area_ratio) AS "eDt_Fail_Collapse_b0",

SUM(a."eDt_Slight_r1" * b.area_ratio) AS "eDt_Slight_r1",
AVG(a."eDtr_Slight_r1" * b.area_ratio) AS "eDtr_Slight_r1",
SUM(a."eDt_Moderate_r1" * b.area_ratio) AS "eDt_Moderate_r1",
AVG(a."eDtr_Moderate_r1" * b.area_ratio) AS "eDtr_Moderate_r1",
SUM(a."eDt_Extensive_r1" * b.area_ratio) AS "eDt_Extensive_r1",
AVG(a."eDtr_Extensive_r1" * b.area_ratio) AS "eDtr_Extensive_r1",
SUM(a."eDt_Complete_r1" * b.area_ratio) AS "eDt_Complete_r1",
AVG(a."eDtr_Complete_r1" * b.area_ratio) AS "eDtr_Complete_r1",
SUM(a."eDt_Collapse_r1" * b.area_ratio) AS "eDt_Collapse_r1",
AVG(a."eDtr_Collapse_r1" * b.area_ratio) AS "eDtr_Collapse_r1",
SUM(a."eDt_Fail_Collapse_r1" * b.area_ratio) AS "eDt_Fail_Collapse_r1",

SUM(a."eDt_Slight05_b0" * b.area_ratio) AS "eDt_Slight05_b0",
AVG(a."eDtr_Slight05_b0" * b.area_ratio) AS "eDtr_Slight05_b0",
SUM(a."eDt_Moderate05_b0" * b.area_ratio) AS "eDt_Moderate05_b0",
AVG(a."eDtr_Moderate05_b0" * b.area_ratio) AS "eDtr_Moderate05_b0",
SUM(a."eDt_Extensive05_b0" * b.area_ratio) AS "eDt_Extensive05_b0",
AVG(a."eDtr_Extensive05_b0" * b.area_ratio) AS "eDtr_Extensive05_b0",
SUM(a."eDt_Complete05_b0" * b.area_ratio) AS "eDt_Complete05_b0",
AVG(a."eDtr_Complete05_b0" * b.area_ratio) AS "eDtr_Complete05_b0",
SUM(a."eDt_Collapse05_b0" * b.area_ratio) AS "eDt_Collapse05_b0",
AVG(a."eDtr_Collapse05_b0" * b.area_ratio) AS "eDtr_Collapse05_b0",
SUM(a."eDt_Fail_Collapse05_b0" * b.area_ratio) AS "eDt_Fail_Collapse05_b0",

SUM(a."eDt_Slight05_r1" * b.area_ratio) AS "eDt_Slight05_r1",
AVG(a."eDtr_Slight05_r1" * b.area_ratio) AS "eDtr_Slight05_r1",
SUM(a."eDt_Moderate05_r1" * b.area_ratio) AS "eDt_Moderate05_r1",
AVG(a."eDtr_Moderate05_r1" * b.area_ratio) AS "eDtr_Moderate05_r1",
SUM(a."eDt_Extensive05_r1" * b.area_ratio) AS "eDt_Extensive05_r1",
AVG(a."eDtr_Extensive05_r1" * b.area_ratio) AS "eDtr_Extensive05_r1",
SUM(a."eDt_Complete05_r1" * b.area_ratio) AS "eDt_Complete05_r1",
AVG(a."eDtr_Complete05_r1" * b.area_ratio) AS "eDtr_Complete05_r1",
SUM(a."eDt_Collapse05_r1" * b.area_ratio) AS "eDt_Collapse05_r1",
AVG(a."eDtr_Collapse05_r1" * b.area_ratio) AS "eDtr_Collapse05_r1",
SUM(a."eDt_Fail_Collapse05_r1" * b.area_ratio) AS "eDt_Fail_Collapse05_r1",

SUM(a."eDt_Slight95_b0" * b.area_ratio) AS "eDt_Slight95_b0",
AVG(a."eDtr_Slight95_b0" * b.area_ratio) AS "eDtr_Slight95_b0",
SUM(a."eDt_Moderate95_b0" * b.area_ratio) AS "eDt_Moderate95_b0",
AVG(a."eDtr_Moderate95_b0" * b.area_ratio) AS "eDtr_Moderate95_b0",
SUM(a."eDt_Extensive95_b0" * b.area_ratio) AS "eDt_Extensive95_b0",
AVG(a."eDtr_Extensive95_b0" * b.area_ratio) AS "eDtr_Extensive95_b0",
SUM(a."eDt_Complete95_b0" * b.area_ratio) AS "eDt_Complete95_b0",
AVG(a."eDtr_Complete95_b0" * b.area_ratio) AS "eDtr_Complete95_b0",
SUM(a."eDt_Collapse95_b0" * b.area_ratio) AS "eDt_Collapse95_b0",
AVG(a."eDtr_Collapse95_b0" * b.area_ratio) AS "eDtr_Collapse95_b0",
SUM(a."eDt_Fail_Collapse95_b0" * b.area_ratio) AS "eDt_Fail_Collapse95_b0",

SUM(a."eDt_Slight95_r1" * b.area_ratio) AS "eDt_Slight95_r1",
AVG(a."eDtr_Slight95_r1" * b.area_ratio) AS "eDtr_Slight95_r1",
SUM(a."eDt_Moderate95_r1" * b.area_ratio) AS "eDt_Moderate95_r1",
AVG(a."eDtr_Moderate95_r1" * b.area_ratio) AS "eDtr_Moderate95_r1",
SUM(a."eDt_Extensive95_r1" * b.area_ratio) AS "eDt_Extensive95_r1",
AVG(a."eDtr_Extensive95_r1" * b.area_ratio) AS "eDtr_Extensive95_r1",
SUM(a."eDt_Complete95_r1" * b.area_ratio) AS "eDt_Complete95_r1",
AVG(a."eDtr_Complete95_r1" * b.area_ratio) AS "eDtr_Complete95_r1",
SUM(a."eDt_Collapse95_r1" * b.area_ratio) AS "eDt_Collapse95_r1",
AVG(a."eDtr_Collapse95_r1" * b.area_ratio) AS "eDtr_Collapse95_r1",
SUM(a."eDt_Fail_Collapse95_r1" * b.area_ratio) AS "eDt_Fail_Collapse95_r1",

SUM(a."eCt_Fatality_b0" * b.area_ratio) AS "eCt_Fatality_b0",
AVG(a."eCtr_Fatality_b0" * b.area_ratio) AS "eCtr_Fatality_b0",

SUM(a."eCt_Fatality_r1" * b.area_ratio) AS "eCt_Fatality_r1",
AVG(a."eCtr_Fatality_r1" * b.area_ratio) AS "eCtr_Fatality_r1",

SUM(a."eAALt_Asset_b0" * b.area_ratio) AS "eAALt_Asset_b0",
AVG(a."eAALm_Asset_b0" * b.area_ratio) AS "eAALm_Asset_b0",
SUM(a."eAALt_Bldg_b0" * b.area_ratio) AS "eAALt_Bldg_b0",
AVG(a."eAALm_Bldg_b0" * b.area_ratio) AS "eAALm_Bldg_b0",
SUM(a."eAALt_Str_b0" * b.area_ratio) AS "eAALt_Str_b0",
SUM(a."eAALt_NStr_b0" * b.area_ratio) AS "eAALt_NStr_b0",
SUM(a."eAALt_Cont_b0" * b.area_ratio) AS "eAALt_Cont_b0",
SUM(a."eAALt_Asset_r1" * b.area_ratio) AS "eAALt_Asset_r1",
AVG(a."eAALm_Asset_r1" * b.area_ratio) AS "eAALm_Asset_r1",
SUM(a."eAALt_Bldg_r1" * b.area_ratio) AS "eAALt_Bldg_r1",
AVG(a."eAALm_Bldg_r1" * b.area_ratio) AS "eAALm_Bldg_r1",
SUM(a."eAALt_Str_r1" * b.area_ratio) AS "eAALt_Str_r1",
SUM(a."eAALt_NStr_r1" * b.area_ratio) AS "eAALt_NStr_r1",
SUM(a."eAALt_Cont_r1" * b.area_ratio) AS "eAALt_Cont_r1",
CAST(CAST(ROUND(CAST(d.eqri_abs_cbrt_minmax_b0 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_abs_score_b0",
d.eqri_abs_rating_b0 AS "eqri_abs_rank_b0",
CAST(CAST(ROUND(CAST(d.eqri_norm_cbrt_minmax_b0 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_norm_score_b0",
d.eqri_norm_rating_b0 AS "eqri_norm_rank_b0",
CAST(CAST(ROUND(CAST(d.eqri_abs_cbrt_minmax_r1 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_abs_score_r1",
d.eqri_abs_rating_r1 AS "eqri_abs_rank_r1",
CAST(CAST(ROUND(CAST(d.eqri_norm_cbrt_minmax_r1 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_norm_score_r1",
d.eqri_norm_rating_r1 AS "eqri_norm_rank_r1",
c.geom

FROM results_psra_national.psra_indicators_s_tbl a
LEFT JOIN boundaries."SAUID_HexGrid_10km_intersect_3857" b ON a."Sauid" = b.sauid
LEFT JOIN boundaries."HexGrid_10km_3857" c ON b.gridid_10 = c.gridid_10
LEFT JOIN results_psra_national.psra_sri_calc_hg_10km d ON b.gridid_10 = d.gridid_10
GROUP BY c.gridid_10,d.eqri_abs_cbrt_minmax_b0,d.eqri_abs_rating_b0,d.eqri_norm_cbrt_minmax_b0,eqri_norm_rating_b0,d.eqri_abs_cbrt_minmax_r1,d.eqri_abs_rating_r1,d.eqri_norm_cbrt_minmax_r1,d.eqri_norm_rating_r1,c.geom;


-- 25km
DROP VIEW IF EXISTS results_psra_national.psra_indicators_hexgrid_25km CASCADE;
CREATE VIEW results_psra_national.psra_indicators_hexgrid_25km AS
SELECT 
c.gridid_25,
SUM(a."eDt_Slight_b0" * b.area_ratio) AS "eDt_Slight_b0",
AVG(a."eDtr_Slight_b0" * b.area_ratio) AS "eDtr_Slight_b0",
SUM(a."eDt_Moderate_b0" * b.area_ratio) AS "eDt_Moderate_b0",
AVG(a."eDtr_Moderate_b0" * b.area_ratio) AS "eDtr_Moderate_b0",
SUM(a."eDt_Extensive_b0" * b.area_ratio) AS "eDt_Extensive_b0",
AVG(a."eDtr_Extensive_b0" * b.area_ratio) AS "eDtr_Extensive_b0",
SUM(a."eDt_Complete_b0" * b.area_ratio) AS "eDt_Complete_b0",
AVG(a."eDtr_Complete_b0" * b.area_ratio) AS "eDtr_Complete_b0",
SUM(a."eDt_Collapse_b0" * b.area_ratio) AS "eDt_Collapse_b0",
AVG(a."eDtr_Collapse_b0" * b.area_ratio) AS "eDtr_Collapse_b0",
SUM(a."eDt_Fail_Collapse_b0" * b.area_ratio) AS "eDt_Fail_Collapse_b0",

SUM(a."eDt_Slight_r1" * b.area_ratio) AS "eDt_Slight_r1",
AVG(a."eDtr_Slight_r1" * b.area_ratio) AS "eDtr_Slight_r1",
SUM(a."eDt_Moderate_r1" * b.area_ratio) AS "eDt_Moderate_r1",
AVG(a."eDtr_Moderate_r1" * b.area_ratio) AS "eDtr_Moderate_r1",
SUM(a."eDt_Extensive_r1" * b.area_ratio) AS "eDt_Extensive_r1",
AVG(a."eDtr_Extensive_r1" * b.area_ratio) AS "eDtr_Extensive_r1",
SUM(a."eDt_Complete_r1" * b.area_ratio) AS "eDt_Complete_r1",
AVG(a."eDtr_Complete_r1" * b.area_ratio) AS "eDtr_Complete_r1",
SUM(a."eDt_Collapse_r1" * b.area_ratio) AS "eDt_Collapse_r1",
AVG(a."eDtr_Collapse_r1" * b.area_ratio) AS "eDtr_Collapse_r1",
SUM(a."eDt_Fail_Collapse_r1" * b.area_ratio) AS "eDt_Fail_Collapse_r1",

SUM(a."eDt_Slight05_b0" * b.area_ratio) AS "eDt_Slight05_b0",
AVG(a."eDtr_Slight05_b0" * b.area_ratio) AS "eDtr_Slight05_b0",
SUM(a."eDt_Moderate05_b0" * b.area_ratio) AS "eDt_Moderate05_b0",
AVG(a."eDtr_Moderate05_b0" * b.area_ratio) AS "eDtr_Moderate05_b0",
SUM(a."eDt_Extensive05_b0" * b.area_ratio) AS "eDt_Extensive05_b0",
AVG(a."eDtr_Extensive05_b0" * b.area_ratio) AS "eDtr_Extensive05_b0",
SUM(a."eDt_Complete05_b0" * b.area_ratio) AS "eDt_Complete05_b0",
AVG(a."eDtr_Complete05_b0" * b.area_ratio) AS "eDtr_Complete05_b0",
SUM(a."eDt_Collapse05_b0" * b.area_ratio) AS "eDt_Collapse05_b0",
AVG(a."eDtr_Collapse05_b0" * b.area_ratio) AS "eDtr_Collapse05_b0",
SUM(a."eDt_Fail_Collapse05_b0" * b.area_ratio) AS "eDt_Fail_Collapse05_b0",

SUM(a."eDt_Slight05_r1" * b.area_ratio) AS "eDt_Slight05_r1",
AVG(a."eDtr_Slight05_r1" * b.area_ratio) AS "eDtr_Slight05_r1",
SUM(a."eDt_Moderate05_r1" * b.area_ratio) AS "eDt_Moderate05_r1",
AVG(a."eDtr_Moderate05_r1" * b.area_ratio) AS "eDtr_Moderate05_r1",
SUM(a."eDt_Extensive05_r1" * b.area_ratio) AS "eDt_Extensive05_r1",
AVG(a."eDtr_Extensive05_r1" * b.area_ratio) AS "eDtr_Extensive05_r1",
SUM(a."eDt_Complete05_r1" * b.area_ratio) AS "eDt_Complete05_r1",
AVG(a."eDtr_Complete05_r1" * b.area_ratio) AS "eDtr_Complete05_r1",
SUM(a."eDt_Collapse05_r1" * b.area_ratio) AS "eDt_Collapse05_r1",
AVG(a."eDtr_Collapse05_r1" * b.area_ratio) AS "eDtr_Collapse05_r1",
SUM(a."eDt_Fail_Collapse05_r1" * b.area_ratio) AS "eDt_Fail_Collapse05_r1",

SUM(a."eDt_Slight95_b0" * b.area_ratio) AS "eDt_Slight95_b0",
AVG(a."eDtr_Slight95_b0" * b.area_ratio) AS "eDtr_Slight95_b0",
SUM(a."eDt_Moderate95_b0" * b.area_ratio) AS "eDt_Moderate95_b0",
AVG(a."eDtr_Moderate95_b0" * b.area_ratio) AS "eDtr_Moderate95_b0",
SUM(a."eDt_Extensive95_b0" * b.area_ratio) AS "eDt_Extensive95_b0",
AVG(a."eDtr_Extensive95_b0" * b.area_ratio) AS "eDtr_Extensive95_b0",
SUM(a."eDt_Complete95_b0" * b.area_ratio) AS "eDt_Complete95_b0",
AVG(a."eDtr_Complete95_b0" * b.area_ratio) AS "eDtr_Complete95_b0",
SUM(a."eDt_Collapse95_b0" * b.area_ratio) AS "eDt_Collapse95_b0",
AVG(a."eDtr_Collapse95_b0" * b.area_ratio) AS "eDtr_Collapse95_b0",
SUM(a."eDt_Fail_Collapse95_b0" * b.area_ratio) AS "eDt_Fail_Collapse95_b0",

SUM(a."eDt_Slight95_r1" * b.area_ratio) AS "eDt_Slight95_r1",
AVG(a."eDtr_Slight95_r1" * b.area_ratio) AS "eDtr_Slight95_r1",
SUM(a."eDt_Moderate95_r1" * b.area_ratio) AS "eDt_Moderate95_r1",
AVG(a."eDtr_Moderate95_r1" * b.area_ratio) AS "eDtr_Moderate95_r1",
SUM(a."eDt_Extensive95_r1" * b.area_ratio) AS "eDt_Extensive95_r1",
AVG(a."eDtr_Extensive95_r1" * b.area_ratio) AS "eDtr_Extensive95_r1",
SUM(a."eDt_Complete95_r1" * b.area_ratio) AS "eDt_Complete95_r1",
AVG(a."eDtr_Complete95_r1" * b.area_ratio) AS "eDtr_Complete95_r1",
SUM(a."eDt_Collapse95_r1" * b.area_ratio) AS "eDt_Collapse95_r1",
AVG(a."eDtr_Collapse95_r1" * b.area_ratio) AS "eDtr_Collapse95_r1",
SUM(a."eDt_Fail_Collapse95_r1" * b.area_ratio) AS "eDt_Fail_Collapse95_r1",

SUM(a."eCt_Fatality_b0" * b.area_ratio) AS "eCt_Fatality_b0",
AVG(a."eCtr_Fatality_b0" * b.area_ratio) AS "eCtr_Fatality_b0",

SUM(a."eCt_Fatality_r1" * b.area_ratio) AS "eCt_Fatality_r1",
AVG(a."eCtr_Fatality_r1" * b.area_ratio) AS "eCtr_Fatality_r1",

SUM(a."eAALt_Asset_b0" * b.area_ratio) AS "eAALt_Asset_b0",
AVG(a."eAALm_Asset_b0" * b.area_ratio) AS "eAALm_Asset_b0",
SUM(a."eAALt_Bldg_b0" * b.area_ratio) AS "eAALt_Bldg_b0",
AVG(a."eAALm_Bldg_b0" * b.area_ratio) AS "eAALm_Bldg_b0",
SUM(a."eAALt_Str_b0" * b.area_ratio) AS "eAALt_Str_b0",
SUM(a."eAALt_NStr_b0" * b.area_ratio) AS "eAALt_NStr_b0",
SUM(a."eAALt_Cont_b0" * b.area_ratio) AS "eAALt_Cont_b0",
SUM(a."eAALt_Asset_r1" * b.area_ratio) AS "eAALt_Asset_r1",
AVG(a."eAALm_Asset_r1" * b.area_ratio) AS "eAALm_Asset_r1",
SUM(a."eAALt_Bldg_r1" * b.area_ratio) AS "eAALt_Bldg_r1",
AVG(a."eAALm_Bldg_r1" * b.area_ratio) AS "eAALm_Bldg_r1",
SUM(a."eAALt_Str_r1" * b.area_ratio) AS "eAALt_Str_r1",
SUM(a."eAALt_NStr_r1" * b.area_ratio) AS "eAALt_NStr_r1",
SUM(a."eAALt_Cont_r1" * b.area_ratio) AS "eAALt_Cont_r1",
CAST(CAST(ROUND(CAST(d.eqri_abs_cbrt_minmax_b0 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_abs_score_b0",
d.eqri_abs_rating_b0 AS "eqri_abs_rank_b0",
CAST(CAST(ROUND(CAST(d.eqri_norm_cbrt_minmax_b0 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_norm_score_b0",
d.eqri_norm_rating_b0 AS "eqri_norm_rank_b0",
CAST(CAST(ROUND(CAST(d.eqri_abs_cbrt_minmax_r1 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_abs_score_r1",
d.eqri_abs_rating_r1 AS "eqri_abs_rank_r1",
CAST(CAST(ROUND(CAST(d.eqri_norm_cbrt_minmax_r1 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "eqri_norm_score_r1",
d.eqri_norm_rating_r1 AS "eqri_norm_rank_r1",
c.geom

FROM results_psra_national.psra_indicators_s_tbl a
LEFT JOIN boundaries."SAUID_HexGrid_25km_intersect_3857" b ON a."Sauid" = b.sauid
LEFT JOIN boundaries."HexGrid_25km_3857" c ON b.gridid_25 = c.gridid_25
LEFT JOIN results_psra_national.psra_sri_calc_hg_25km d ON b.gridid_25 = d.gridid_25
GROUP BY c.gridid_25,d.eqri_abs_cbrt_minmax_b0,d.eqri_abs_rating_b0,d.eqri_norm_cbrt_minmax_b0,eqri_norm_rating_b0,d.eqri_abs_cbrt_minmax_r1,d.eqri_abs_rating_r1,d.eqri_norm_cbrt_minmax_r1,d.eqri_norm_rating_r1,c.geom;