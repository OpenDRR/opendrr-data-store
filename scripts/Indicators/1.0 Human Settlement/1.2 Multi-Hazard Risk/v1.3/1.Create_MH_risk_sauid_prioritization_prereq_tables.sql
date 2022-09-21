-- create schema for new scenario
CREATE SCHEMA IF NOT EXISTS results_nhsl_hazard_threat;

-- create prereq tables for prioritization calculation, based off previous hazard threat run v1.0
-- create multi hazard indicators
DROP TABLE IF EXISTS results_nhsl_hazard_threat.hazard_threat_values_s CASCADE;
CREATE TABLE results_nhsl_hazard_threat.hazard_threat_values_s AS 

-- 1.0 Human Settlement
-- 1.2 Hazard Threat
SELECT 
a.sauid AS "Sauid",
CAST(CAST(ROUND(CAST(a.sauidlon AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_SauidLon",
CAST(CAST(ROUND(CAST(a.sauidlat AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_SauidLat",
CAST(CAST(ROUND(CAST(a.sauid_km2 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaKm2",
CAST(CAST(ROUND(CAST(a.sauid_ha AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_AreaHa",
c.sactype AS "E_SAC",
a.landuse AS "E_LandUse",
CAST(CAST(ROUND(CAST(SUM(a.number) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgNum",
CAST(CAST(ROUND(CAST(e.censusdu AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusDU",
CAST(CAST(ROUND(CAST(SUM(a.day) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopDay",
CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopNight",
CAST(CAST(ROUND(CAST(SUM(a.transit) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_PopTransit",
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural + a.contents) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_AssetValue",
CAST(CAST(ROUND(CAST(SUM(a.structural + a.nonstructural) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "Et_BldgValue",
CAST(CAST(ROUND(CAST(SUM(a.bldg_ft2) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_BldgAreaTotal",

/*
CASE
	WHEN (c."PopHa" < 35) THEN 'Low'
	WHEN (c."PopHa" > 35 AND c."PopHa" < 75) THEN 'Moderate'
	WHEN (c."PopHa" > 75) THEN 'High'
	ELSE 'None' END AS "HTt_Exposure",
*/

CASE
	WHEN (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'Low'
	WHEN (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'Moderate'
	WHEN (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'High'
	ELSE 'None' END AS "HTt_Exposure",

--MMI
CAST(CAST(ROUND(CAST(b.mmi6 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_MMI6",
CAST(CAST(ROUND(CAST(b.mmi7 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_MMI7",
CAST(CAST(ROUND(CAST(b.mmi8 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_MMI8",

-- PGV
CAST(CAST(ROUND(CAST(b.pgv2500 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_PGV2500",
CAST(CAST(ROUND(CAST(b.pgv500 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_PGV500",

/*
CASE 
	WHEN (b.pgv500 > 0.011 AND b.pgv500 < 0.081) THEN 'Low'
	WHEN (b.pgv500 > 0.081 AND b.pgv500 < 0.16) THEN 'Moderate'
	WHEN (b.pgv500 > 0.16 AND b.pgv500 < 0.31) THEN 'Considerable'
	WHEN (b.pgv500 > 0.31 AND b.pgv500 < 0.6) THEN 'High'
	WHEN (b.pgv500 > 0.6) THEN 'Extreme'
	ELSE 'None' END AS "HTd_PGV500",

CASE
	WHEN (b.pgv500 > 0.011 AND b.pgv500 < 0.081) AND (c."PopHa" <= 35) THEN 'A1'
	WHEN (b.pgv500 > 0.011 AND b.pgv500 < 0.081) AND (c."PopHa" > 35 AND c."PopHa" <= 75) THEN 'A2'
	WHEN (b.pgv500 > 0.011 AND b.pgv500 < 0.081) AND (c."PopHa" > 75) THEN 'A3'
	WHEN (b.pgv500 > 0.081 AND b.pgv500 < 0.16) AND (c."PopHa" <= 35) THEN 'B1'
	WHEN (b.pgv500 > 0.081 AND b.pgv500 < 0.16) AND (c."PopHa" > 35 AND c."PopHa" <= 75) THEN 'B2'
	WHEN (b.pgv500 > 0.081 AND b.pgv500 < 0.16) AND (c."PopHa" > 75) THEN 'B3'
	WHEN (b.pgv500 > 0.16 AND b.pgv500 < 0.31) OR (b.pgv500 > 0.31 AND b.pgv500 < 0.6) OR (b.pgv500 > 0.6) AND (c."PopHa" <= 35) THEN 'C1'
	WHEN (b.pgv500 > 0.16 AND b.pgv500 < 0.31) OR (b.pgv500 > 0.31 AND b.pgv500 < 0.6) OR (b.pgv500 > 0.6) AND (c."PopHa" > 35 AND c."PopHa" <= 75) THEN 'C2'
	WHEN (b.pgv500 > 0.16 AND b.pgv500 < 0.31) OR (b.pgv500 > 0.31 AND b.pgv500 < 0.6) OR (b.pgv500 > 0.6) AND (c."PopHa" > 75) THEN 'C3'
	ELSE 'None' END AS "HTt_PGV500",

CASE WHEN (b.pgv500 >= 0.16) OR (b.tsun500 >= 50) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_PGV500",
*/

CASE 
	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'Low'
	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'Moderate'
	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'considerable')) THEN 'Considerable'
	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'High'
	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'Extreme'
	ELSE 'None' END AS "HTd_PGV500",

CASE
	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
	(c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'

	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND
	(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'

	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
	(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'
	
	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'

	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
   (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'

	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'
	
    WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'considerable')) OR 
    (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'

	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'considerable')) OR 
    (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND 
    c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'

	WHEN (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'considerable')) OR 
    (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.pgv500 < (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.pgv500 > (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'
    
	ELSE 'None' END AS "HTt_PGV500",

CASE WHEN (b.pgv500 >= (SELECT hti_pgv500 FROM mh.mh_thresholds WHERE threat = 'moderate')) OR (b.tsun500 >= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable')) THEN 
CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_PGV500",

-- PGA
CAST(CAST(ROUND(CAST(b.pga2500 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_PGA2500",
CAST(CAST(ROUND(CAST(b.pga500 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_PGA500",

/*
CASE 
	WHEN (b.pga500 > 0.039 AND b.pga500 <= 0.0920) THEN 'Low'
	WHEN (b.pga500 > 0.0920 AND b.pga500 <= 0.180) THEN 'Moderate'
	WHEN (b.pga500 > 0.180 AND b.pga500 <= 0.340) THEN 'Considerable'
	WHEN (b.pga500 > 0.340 AND b.pga500 <= 0.650) THEN 'High'
	WHEN (b.pga500 > 0.650) THEN 'Extreme'
	ELSE 'None' END AS "HTd_PGA500",

CASE
	WHEN (b.pga500 > 0.039 AND b.pga500 <= 0.0920) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'
	WHEN (b.pga500 > 0.039 AND b.pga500 <= 0.0920) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'
	WHEN (b.pga500 > 0.039 AND b.pga500 <= 0.0920) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'
	WHEN (b.pga500 > 0.0920 AND b.pga500 <= 0.180) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'
	WHEN (b.pga500 > 0.0920 AND b.pga500 <= 0.180) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'
	WHEN (b.pga500 > 0.0920 AND b.pga500 <= 0.180) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'
	WHEN (b.pga500 > 0.180 AND b.pga500 <= 0.340) OR (b.pga500 > 0.340 AND b.pga500 <= 0.650) OR (b.pga500 > 0.650) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'
	WHEN (b.pga500 > 0.180 AND b.pga500 <= 0.340) OR (b.pga500 > 0.340 AND b.pga500 <= 0.650) OR (b.pga500 > 0.650) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'
	WHEN (b.pga500 > 0.180 AND b.pga500 <= 0.340) OR (b.pga500 > 0.340 AND b.pga500 <= 0.650) OR (b.pga500 > 0.650) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'
	ELSE 'None' END AS "HTt_PGA500",

CASE WHEN (b.pga500 >= 0.18) OR (b.tsun500 >= 50) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_PGA500",
*/

CASE 
	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'Low'
	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'Moderate'
	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'considerable')) THEN 'Considerable'
	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'High'
	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'Extreme'
	ELSE 'None' END AS "HTd_PGA500",

CASE
	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'
	
    WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'
	
    WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'

	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'

	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'
	
    WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'
	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'considerable')) OR 
    (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'

	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'considerable')) OR 
    (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND 
    c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'

	WHEN (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'considerable')) OR 
    (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.pga500 <= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.pga500 > (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'

	ELSE 'None' END AS "HTt_PGA500",

CASE WHEN (b.pga500 >= (SELECT hti_pga500 FROM mh.mh_thresholds WHERE threat = 'moderate')) OR (b.tsun500 >= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable')) THEN 
CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_PGA500",

-- Tsunami
CAST(CAST(ROUND(CAST(b.tsun500 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Tsun500",

/*
CASE 
	WHEN (b.tsun500 > 0 AND b.tsun500 <= 50) THEN 'Considerable'
	WHEN (b.tsun500 > 50 AND b.tsun500 <= 100) THEN 'High'
	WHEN (b.tsun500 > 100) THEN 'Extreme'
	ELSE 'None' END AS "Htd_Tsun500",
	
CASE
	WHEN (b.tsun500 > 0 AND b.tsun500 <= 50) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'
	WHEN (b.tsun500 > 0 AND b.tsun500 <= 50) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'
	WHEN (b.tsun500 > 0 AND b.tsun500 <= 50) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'
	WHEN (b.tsun500 > 50 AND b.tsun500 <= 100) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'
	WHEN (b.tsun500 > 50 AND b.tsun500 <= 100) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'
	WHEN (b.tsun500 > 50 AND b.tsun500 <= 100) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'
	WHEN (b.tsun500 > 100) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'
	WHEN (b.tsun500 > 100) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'
	WHEN (b.tsun500 > 100) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'
	ELSE 'None' END AS "HTt_Tsun500",

CASE WHEN (b.tsun500 >= 50) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_Tsun500",
*/

CASE 
	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.tsun500 <= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable')) THEN 'Considerable'
    WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.tsun500 <= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'High'
	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'Extreme'
	ELSE 'None' END AS "Htd_Tsun500",
	
CASE
	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.tsun500 <= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'

	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.tsun500 <= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'

	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.tsun500 <= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'

	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.tsun500 <= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'high')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'

	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.tsun500 <= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'

	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.tsun500 <= (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'

	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'

	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND 
    c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'

	WHEN (b.tsun500 > (SELECT hti_tsun500 FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'

	ELSE 'None' END AS "HTt_Tsun500",

CASE WHEN (b.tsun500 >= 50) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_Tsun500",

-- Flood
CAST(CAST(ROUND(CAST(b.fld50_jrc AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Fld50",
CAST(CAST(ROUND(CAST(b.fld100_jrc AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Fld100",
CAST(CAST(ROUND(CAST(b.fld200_jrc AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Fld200",
CAST(CAST(ROUND(CAST(b.fld500_jrc AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Fld500",

/*
CASE
	WHEN (b.fld500 > 10 AND b.fld500 < 30) THEN 'Low'
	WHEN (b.fld500 >= 30 AND b.fld500 < 100) THEN 'Moderate'
	WHEN (b.fld500 >= 100 AND b.fld500 < 200) THEN 'Considerable'
	WHEN (b.fld500 >= 200 AND b.fld500 < 400) THEN 'High'
	WHEN (b.fld500 >= 400) THEN 'Extreme'
	ELSE 'None' END AS "HTd_Fld500",

CASE
	WHEN (b.fld500 > 10 AND b.fld500 < 30) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'
	WHEN (b.fld500 > 10 AND b.fld500 < 30) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'
	WHEN (b.fld500 > 10 AND b.fld500 < 30) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'
	WHEN (b.fld500 >= 30 AND b.fld500 < 100) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'
	WHEN (b.fld500 >= 30 AND b.fld500 < 100) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'
	WHEN (b.fld500 >= 30 AND b.fld500 < 100) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'
	WHEN (b.fld500 >= 100 AND b.fld500 < 200) OR (b.fld500 >= 200 AND b.fld500 < 400) OR (b.fld500 >= 400) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'
	WHEN (b.fld500 >= 100 AND b.fld500 < 200) OR (b.fld500 >= 200 AND b.fld500 < 400) OR (b.fld500 >= 400) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'
	WHEN (b.fld500 >= 100 AND b.fld500 < 200) OR (b.fld500 >= 200 AND b.fld500 < 400) OR (b.fld500 >= 400) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'
	ELSE 'None' END AS "HTt_Fld500",
	
CASE WHEN (b.fld500 >= 100) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_Fld500",
CAST(CAST(ROUND(CAST(b.fld1000 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Fld1000",
*/

CASE
	WHEN (b.fld500_jrc > (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'Low'
    WHEN (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'Moderate'
	WHEN (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'considerable')) THEN 'Considerable'
	WHEN (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'High'
	WHEN (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'Extreme'
	ELSE 'None' END AS "HTd_Fld500",

CASE
	WHEN (b.fld500_jrc > (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'

	WHEN (b.fld500_jrc > (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'

	WHEN (b.fld500_jrc > (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'
	
    WHEN (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'

	WHEN (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'

	WHEN (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'

	WHEN (b.fld500_jrc >= 100 AND b.fld500_jrc < 200) OR (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.fld500_jrc >= 400) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'

	WHEN (b.fld500_jrc >= 100 AND b.fld500_jrc < 200) OR (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.fld500_jrc >= 400) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'

	WHEN (b.fld500_jrc >= 100 AND b.fld500_jrc < 200) OR (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.fld500_jrc < (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.fld500_jrc >= 400) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'
	
    ELSE 'None' END AS "HTt_Fld500",
	
CASE WHEN (b.fld500_jrc >= (SELECT hti_fld500 FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_Fld500",

--CAST(CAST(ROUND(CAST(b.fld1000 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Fld1000",

-- Wildfire
CAST(CAST(ROUND(CAST(b.wildfire AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Wildfire",

/*
CASE 
	WHEN (b.wildfire > 200 AND b.wildfire <= 500) THEN 'Low'
	WHEN (b.wildfire > 500 AND b.wildfire <= 2000) THEN 'Moderate'
	WHEN (b.wildfire > 2000 AND b.wildfire <= 4000) THEN 'Considerable'
	WHEN (b.wildfire > 4000 AND b.wildfire < 10000) THEN 'High'
	WHEN (b.wildfire > 10000) THEN 'Extreme'
	ELSE 'None' END AS "HTd_Wildfire",

CASE
	WHEN (b.wildfire > 200 AND b.wildfire <= 500) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'
	WHEN (b.wildfire > 200 AND b.wildfire <= 500) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'
	WHEN (b.wildfire > 200 AND b.wildfire <= 500) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'
	WHEN (b.wildfire > 500 AND b.wildfire <= 2000) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'
	WHEN (b.wildfire > 500 AND b.wildfire <= 2000) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'
	WHEN (b.wildfire > 500 AND b.wildfire <= 2000) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'
	WHEN (b.wildfire > 2000 AND b.wildfire <= 4000) OR (b.wildfire > 4000 AND b.wildfire < 10000) OR (b.wildfire > 10000) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'
	WHEN (b.wildfire > 2000 AND b.wildfire <= 4000) OR (b.wildfire > 4000 AND b.wildfire < 10000) OR (b.wildfire > 10000) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'
	WHEN (b.wildfire > 2000 AND b.wildfire <= 4000) OR (b.wildfire > 4000 AND b.wildfire < 10000) OR (b.wildfire > 10000) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'
	ELSE 'None' END AS "HTt_Wildfire",

CASE WHEN (b.wildfire >= 2000) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_Wildfire",
*/

CASE 
	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.wui_type = 'Interface') THEN 'Low'
	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.wui_type = 'Mixed') THEN 'Moderate'
	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'considerable') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) THEN 'Considerable'
    WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.wildfire < (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'high') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) THEN 'High'
	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'high') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) THEN 'Extreme'
	ELSE 'None' END AS "HTd_Wildfire",

CASE
	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.wui_type = 'Interface') AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'
	
    WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.wui_type = 'Interface') AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'

	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.wui_type = 'Interface') AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'

	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.wui_type = 'Mixed') AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'

	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.wui_type = 'Mixed') AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'

	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.wui_type = 'Mixed') AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'

	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'considerable') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) OR 
    (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.wildfire < (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'high') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) OR 
    (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'high') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'

	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'considerable') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) OR 
    (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.wildfire < (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'high') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) OR 
    (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'high') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') 
    AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'

	WHEN (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.wildfire <= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'considerable') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) OR 
    (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.wildfire < (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'high') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) OR 
    (b.wildfire > (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'high') AND (b.wui_type = 'Mixed' OR b.wui_type = 'Interface')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'

	ELSE 'None' END AS "HTt_Wildfire",

CASE WHEN (b.wildfire >= (SELECT hti_wildfire FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_Wildfire",

-- Landslide
--CAST(CAST(ROUND(CAST(b.lndsus AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_LndSus",

/*
CASE 
	WHEN (b.lndsus > 0.5 AND b.lndsus <= 1) THEN 'Low'
	WHEN (b.lndsus > 1 AND b.lndsus <= 2) THEN 'Moderate'
	WHEN (b.lndsus > 2 AND b.lndsus <= 3) THEN 'Considerable'
	WHEN (b.lndsus > 3 AND b.lndsus <= 4) THEN 'High'
	WHEN (b.lndsus > 4) THEN 'Extreme'
	ELSE 'None' END AS "HTd_LndSus",

CASE
	WHEN (b.lndsus > 0.5 AND b.lndsus <= 1) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'
	WHEN (b.lndsus > 0.5 AND b.lndsus <= 1) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'
	WHEN (b.lndsus > 0.5 AND b.lndsus <= 1) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'
	WHEN (b.lndsus > 1 AND b.lndsus <= 2)  OR (b.lndsus > 2 AND b.lndsus <= 3) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'
	WHEN (b.lndsus > 1 AND b.lndsus <= 2)  OR (b.lndsus > 2 AND b.lndsus <= 3) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'
	WHEN (b.lndsus > 1 AND b.lndsus <= 2)  OR (b.lndsus > 2 AND b.lndsus <= 3) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'
	WHEN (b.lndsus > 3 AND b.lndsus <= 4) OR (b.lndsus > 4) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'
	WHEN (b.lndsus > 3 AND b.lndsus <= 4) OR (b.lndsus > 4) AND(c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'
	WHEN (b.lndsus > 3 AND b.lndsus <= 4) OR (b.lndsus > 4) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'
	ELSE 'None' END AS "HTt_LndSus",
	
CASE WHEN (b.lndsus >= 3) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_LndSus",
*/

/*
CASE 
	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'Low'
	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'Moderate'
    WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'considerable')) THEN 'Considerable'
	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'High'
	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'Extreme'
 	ELSE 'None' END AS "HTd_LndSus",
*/

/*
CASE
	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'

	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'

	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'

	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'moderate'))  OR 
    (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'considerable')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'

	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'moderate'))  OR 
    (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'considerable')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'

	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'moderate'))  OR 
    (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'moderate') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'considerable')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'

	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'C1'

	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND 
    c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C2'

	WHEN (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'considerable') AND b.lndsus <= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.lndsus > (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'high')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'C3'

	ELSE 'None' END AS "HTt_LndSus",
*/

--CASE WHEN (b.lndsus >= (SELECT hti_lndsus FROM mh.mh_thresholds WHERE threat = 'considerable')) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_LndSus",

--Cyclone
CAST(CAST(ROUND(CAST(b.cy100 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Cy100",
CAST(CAST(ROUND(CAST(b.cy250 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Cy250",
CAST(CAST(ROUND(CAST(b.cy500 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Cy500",

/*
CASE
	WHEN (b.cy500 > 89 AND b.cy500 <= 119) THEN 'Low'
	WHEN (b.cy500 > 119 AND b.cy500 <= 153) THEN 'Moderate'
	WHEN (b.cy500 > 154 AND b.cy500 <= 177) THEN 'Considerable'
	WHEN (b.cy500 > 178 AND b.cy500 <= 208) THEN 'High'
	WHEN (b.cy500 > 209) THEN 'Extreme'
	ELSE 'None' END AS "HTd_Cy500",

CASE
	WHEN (b.cy500 > 89 AND b.cy500 <= 119) AND (c."PopHa" <= 35) THEN 'A1'
	WHEN (b.cy500 > 89 AND b.cy500 <= 119) AND (c."PopHa" > 35 AND c."PopHa" <= 75) THEN 'A2'
	WHEN (b.cy500 > 89 AND b.cy500 <= 119) AND (c."PopHa" > 75) THEN 'A3'
	WHEN (b.cy500 > 119 AND b.cy500 <= 153) AND (c."PopHa" <= 35) THEN 'B1'
	WHEN (b.cy500 > 119 AND b.cy500 <= 153) AND (c."PopHa" > 35 AND c."PopHa" <= 75) THEN 'B2'
	WHEN (b.cy500 > 119 AND b.cy500 <= 153) AND (c."PopHa" > 75) THEN 'B3'
	WHEN (b.cy500 > 154 AND b.cy500 <= 177) OR (b.cy500 > 178 AND b.cy500 <= 208) OR (b.cy500 > 209) AND (c."PopHa" <= 35) THEN 'B1'
	WHEN (b.cy500 > 154 AND b.cy500 <= 177) OR (b.cy500 > 178 AND b.cy500 <= 208) OR (b.cy500 > 209) AND (c."PopHa" > 35 AND c."PopHa" <= 75) THEN 'B2'
	WHEN (b.cy500 > 154 AND b.cy500 <= 177) OR (b.cy500 > 178 AND b.cy500 <= 208) OR (b.cy500 > 209) AND (c."PopHa" > 75) THEN 'B3'
	ELSE 'None' END AS "HTt_Cy500",

CASE WHEN (b.cy500 >= 178) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_Cy500",
*/

CASE
	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'Low'
	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'Moderate'
	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'moderate_p1') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'considerable')) THEN 'Considerable'
	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'considerable_p1') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'high')) THEN 'High'
	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'high_p1')) THEN 'Extreme'
	ELSE 'None' END AS "HTd_Cy500",

CASE
	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'A1'
	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A2'

	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_bottom') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_high')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'A3'

	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'

	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'

	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'low_high') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'moderate')) AND 
    (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'

	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'moderate_p1') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'considerable')) OR 
    (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'considerable_p1') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'high_p1')) AND (c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high')) THEN 'B1'

	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'moderate_p1') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'considerable')) OR 
    (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'considerable_p1') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'high_p1')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'low_high') AND 
    c."PopHa" < (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B2'

	WHEN (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'moderate_p1') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'considerable')) OR 
    (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'considerable_p1') AND b.cy500 <= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'high')) OR 
    (b.cy500 > (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'high_p1')) AND (c."PopHa" > (SELECT htt_exposure FROM mh.mh_thresholds WHERE threat = 'moderate')) THEN 'B3'

	ELSE 'None' END AS "HTt_Cy500",


CASE WHEN (b.cy500 >= (SELECT hti_cy500 FROM mh.mh_thresholds WHERE threat = 'considerable_p1')) THEN CAST(CAST(ROUND(CAST(SUM(a.night) AS NUMERIC),6) AS FLOAT) AS NUMERIC) ELSE 0 END AS "HTp_Cy500",

CAST(CAST(ROUND(CAST(b.cy1000 AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "HTi_Cy1000",

d."PRUID" AS "pruid",
d."PRNAME" AS "prname",
d."ERUID" AS "eruid",
d."ERNAME" AS "ername",
d."CDUID" AS "cduid",
d."CDNAME" AS "cdname",
d."CSDUID" AS "csduid",
d."CSDNAME" AS "csdname",
d."CFSAUID" AS "fsauid",
d."DAUIDt" AS "dauid",
d."SACCODE" AS "saccode",
d."SACTYPE" AS "sactype",
d.geom AS "geom_poly"
--d.geompoint AS "geom_point"

FROM exposure.canada_exposure a
LEFT JOIN mh.mh_intensity_canada b ON a.sauid = b.sauidt
LEFT JOIN sovi.sovi_sauid_nov2021 c on a.sauid = c.sauid
LEFT JOIN boundaries."Geometry_SAUID" d ON a.sauid = d."SAUIDt" 
LEFT JOIN census.census_2016_canada e on a.sauid = e.sauidt
GROUP BY a.sauid,a.sauidlon,a.sauidlat,a.sauid_km2,a.sauid_ha,a.landuse,d."PRUID",b.mmi6,b.mmi7,b.mmi8,b.pgv2500,b.pgv500,b.pga2500,b.pga500,b.tsun500,b.fld50_jrc,b.fld100_jrc,b.fld200_jrc,b.fld500_jrc,b.wildfire,b.cy100,b.cy250,b.cy500,b.cy1000,
b.lndsus,b.wui_type,c."PopHa",c.sactype,e.censusdu,d."PRNAME",d."ERUID",d."ERNAME",d."CDUID",d."CDNAME",d."CSDUID",d."CSDNAME",d."CFSAUID",d."DAUIDt",d."SACCODE",d."SACTYPE",d.geom;


-- create req indicator values at CSD level
DROP TABLE IF EXISTS  results_nhsl_hazard_threat.hazard_threat_values_csd;
CREATE TABLE results_nhsl_hazard_threat.hazard_threat_values_csd AS
SELECT
csduid,
SUM("Et_BldgNum") AS "Et_BldgNum",
SUM("Et_PopNight") AS "Et_PopNight",
SUM("Et_AssetValue") AS "Et_AssetValue"
FROM results_nhsl_hazard_threat.hazard_threat_values_s
GROUP BY csduid
ORDER BY csduid ASC;