
--intermediates table to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_displhshld_calc1 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_displhshld_calc1 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc1 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc1 AS
(
SELECT
a."AssetID",
c.number,
a."sD_Moderate_b0",
a."sD_Moderate_r1",
a."sD_Extensive_b0",
a."sD_Extensive_r1",
a."sD_Complete_b0",
a."sD_Complete_r1",
--a."sC_Downtime_b0",
--a."sC_Downtime_r1",
a."sC_Interruption_b0",
a."sC_Interruption_r1",
d."E_CensusDU",
b."E_BldgOccG",
b."E_SFHshld",
b."E_MFHshld",

-- SFM
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Moderate_b0" / c.number) ELSE 0 END AS "SFM_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Moderate_r1" / c.number) ELSE 0 END AS "SFM_r1",
--CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Moderate_b0") ELSE 0 END AS "SFM_b0",
--CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Moderate_r1") ELSE 0 END AS "SFM_r1",

-- SFE
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Extensive_b0" / c.number) ELSE 0 END AS "SFE_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Extensive_r1" / c.number) ELSE 0 END AS "SFE_r1",
--CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Extensive_b0") ELSE 0 END AS "SFE_b0",
--CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Extensive_r1") ELSE 0 END AS "SFE_r1",

-- SFC
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Complete_b0" / c.number) ELSE 0 END AS "SFC_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Complete_r1" / c.number) ELSE 0 END AS "SFC_r1",
--CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Complete_b0") ELSE 0 END AS "SFC_b0",
--CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Complete_r1") ELSE 0 END AS "SFC_r1",

-- MFM
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Moderate_b0" / c.number) ELSE 0 END AS "MFM_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Moderate_r1" / c.number) ELSE 0 END AS "MFM_r1",
--CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Moderate_b0") ELSE 0 END AS "MFM_b0",
--CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Moderate_r1") ELSE 0 END AS "MFM_r1",

-- MFE
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Extensive_b0" / c.number) ELSE 0 END AS "MFE_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Extensive_r1" / c.number) ELSE 0 END AS "MFE_r1",
--CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Extensive_b0") ELSE 0 END AS "MFE_b0",
--CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Extensive_r1") ELSE 0 END AS "MFE_r1",

-- MFC
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Complete_b0" / c.number) ELSE 0 END AS "MFC_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Complete_r1" / c.number) ELSE 0 END AS "MFC_r1",
--CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Complete_b0") ELSE 0 END AS "MFC_b0",
--CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Complete_r1") ELSE 0 END AS "MFC_r1",

0 AS "W_SFM",
0 AS "W_SFE",
1 AS "W_SFC",
0 AS "W_MFM",
0.9 AS "W_MFE",
1 AS "W_MFC"

FROM dsra.dsra_sim9p0_cascadiainterfacebestfault a
--FROM dsra.dsra_{eqScenario} a
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_indicators_b b ON a."AssetID" = b."BldgID"
LEFT JOIN exposure.canada_exposure c ON  a."AssetID" = c.id
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_indicators_s d ON c.sauid = d."Sauid"
);


--intermediate tables to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_displhshld_calc2 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_displhshld_calc2 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc2 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc2 AS
(
SELECT
"AssetID",
-- ([W_SFM]*[SFM]) + ([W_SFE]*[SFE]) + ([W_SFC]*[SFC]) = SF
("W_SFM" * "SFM_b0") + ("W_SFE" * "SFE_b0") + ("W_SFC" * "SFC_b0") AS "SF_b0",
("W_SFM" * "SFM_r1") + ("W_SFE" * "SFE_r1") + ("W_SFC" * "SFC_r1") AS "SF_r1",

--([W_MFM]*[MFM]) + ([W_MFE]*[MFE]) + ([W_MFC]*MFC]) = MF
("W_MFM" * "MFM_b0") + ("W_MFE" * "MFE_b0") + ("W_MFC" * "MFC_b0") AS "MF_b0",
("W_MFM" * "MFM_r1") + ("W_MFE" * "MFE_r1") + ("W_MFC" * "MFC_r1") AS "MF_r1"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc1
--FROM results_dsra_{eqScenario}.{eqScenario}_displhshld_calc1
);


--intermediate tables to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_displhshld_calc3 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_displhshld_calc3 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc3 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc3 AS
(
SELECT
a."AssetID",

--(([SF_Hshlds] * [SF]) + ([MF_Hshlds] * [MF])) * ([CensusDU] / ([SF_Hshlds] + [MF_Hshlds]) = DH
--COALESCE((a."E_SFHshld" * b."SF_b0") + (a."E_MFHshld" * b."MF_b0") * (a."E_CensusDU" /NULLIF((a."E_SFHshld" + a."E_MFHshld"),0)),0) AS "sC_DisplHshld_b0",
COALESCE((a."E_SFHshld" * b."SF_b0") + (a."E_MFHshld" * b."MF_b0"),0) AS "sC_DisplHshld_b0",
--COALESCE((a."E_SFHshld" * b."SF_r1") + (a."E_MFHshld" * b."MF_r1") * (a."E_CensusDU" /NULLIF((a."E_SFHshld" + a."E_MFHshld"),0)),0) AS "sC_DisplHshld_r1",
COALESCE((a."E_SFHshld" * b."SF_r1") + (a."E_MFHshld" * b."MF_r1"),0) AS "sC_DisplHshld_r1"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc1 a
--FROM results_dsra_{eqScenario}.{eqScenario}_displhshld_calc1 a
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc2 b on a."AssetID" = b."AssetID"
--LEFT JOIN results_dsra_{eqScenario}.{eqScenario}_displhshld_calc2 b on a."AssetID" = b."AssetID"
);


--intermediate tables to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_displhshld CASCADE
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_displhshld AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld AS
(
SELECT
a."AssetID",
a.number,
a."sD_Moderate_b0",
a."sD_Moderate_r1",
a."sD_Extensive_b0",
a."sD_Extensive_r1",
a."sD_Complete_b0",
a."sD_Complete_r1",
--a."sC_Downtime_b0",
--a."sC_Downtime_r1",
a."sC_Interruption_b0",
a."sC_Interruption_r1",
a."E_CensusDU",
a."E_BldgOccG",
a."E_SFHshld",
a."E_MFHshld",
a."SFM_b0",
a."SFM_r1",
a."SFE_b0",
a."SFE_r1",
a."SFC_b0",
a."SFC_r1",
a."MFM_b0",
a."MFM_r1",
a."MFE_b0",
a."MFE_r1",
a."MFC_b0",
a."MFC_r1",
a."W_SFM",
a."W_SFE",
a."W_SFC",
a."W_MFM",
a."W_MFE",
a."W_MFC",
b."SF_b0",
b."SF_r1",
b."MF_b0",
b."MF_r1",
c."sC_DisplHshld_b0",
c."sC_DisplHshld_r1"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc1 a
--FROM results_dsra_{eqScenario}.{eqScenario}_displhshld_calc1 a
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc2 b ON a."AssetID" = b."AssetID"
--LEFT JOIN results_dsra_{eqScenario}.{eqScenario}_displhshld_calc2 b ON a."AssetID" = b."AssetID"
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc3 c ON a."AssetID" = c."AssetID"
--LEFT JOIN results_dsra_{eqScenario}.{eqScenario}_displhshld_calc3 c ON a."AssetID" = c."AssetID"
);

--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_displhshld_calc1,results_dsra_{eqScenario}.{eqScenario}_displhshld_calc2,results_dsra_{eqScenario}.{eqScenario}_displhshld_calc3;
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc1,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc2,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc3;


-- create schema for new scenario
--CREATE SCHEMA IF NOT EXISTS results_dsra_{eqScenario};
CREATE SCHEMA IF NOT EXISTS results_dsra_sim9p0_cascadiainterfacebestfault;


--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc1 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter_calc1 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc1 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc1 AS
(
SELECT 
a."Sauid",
SUM(a."sC_Hshld_b0") AS "sCt_DisplHshld_b0",
SUM(a."sC_Hshld_r1") AS "sCt_DisplHshld_r1",
SUM(b."E_PopNight") AS "Et_PopNight"
	
FROM results_dsra_sim9p0_cascadiainterfacebestfault.dsra_sim9p0_cascadiainterfacebestfault_indicators_b a
--FROM results_dsra_{eqScenario}.dsra_{eqScenario}_indicators_b a
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_indicators_b b ON a."AssetID" = b."BldgID"
GROUP BY a."Sauid"
);


--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc2 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter_calc2 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2 AS
(
SELECT
a."Sauid",
a."sCt_DisplHshld_b0",
a."sCt_DisplHshld_r1",
a."Et_PopNight",
b."E_CensusPop",
b."E_CensusDU",
b."E_People_DU",
b."Et_SFHshld",
b."Et_MFHshld",
c.inc_hshld,
c.vis_min,
c.indigenous,
c.renter,
c.age_gt65,
c.age_lt6,


--IM
--IF [Inc_Hshld] =< $15,000, THEN 0.62 = IM1
CASE WHEN c.inc_hshld <= 15000 THEN 1 * 0.62 ELSE 0 END AS "IM1",

--IF [Inc_Hshld] > $15,000 AND [Inc_Hshld] =<, $20,000 THEN 0.42 = IM2
CASE WHEN c.inc_hshld > 15000 AND c.inc_hshld <= 20000 THEN 1 * 0.42 ELSE 0 END AS "IM2",

--IF [Inc_Hshld] > $20,000 AND [Inc_Hshld] =<, $35,000 THEN 0.29 = IM3
CASE WHEN c.inc_hshld > 20000 AND c.inc_hshld <= 35000 THEN 1 * 0.29 ELSE 0 END AS "IM3",

--IF [Inc_Hshld] > $35,000 AND [Inc_Hshld] =<, $50,000 THEN  0.22 = IM4
CASE WHEN c.inc_hshld > 35000 AND c.inc_hshld <= 50000 THEN 1 *  0.22 ELSE 0 END AS "IM4",

--IF [Inc_Hshld] > $50,000 THEN 0.13 = IM5
CASE WHEN c.inc_hshld > 50000 THEN 1 * 0.13 ELSE 0 END AS "IM5",


--EM
--1 - vis_min - indigenous *0.24 = white
(1 - c.vis_min - c.indigenous) * 0.24 AS "EM1",

--vis_min * 0.40 = EM2, modification factors is average of Hazus visible minority values {avg(0.48 + 0.47 + 0.26)} = 0.40
c.vis_min * 0.40 AS "EM2",

--indigenous * 0.26 = EM3
c.indigenous * 0.26 AS "EM3",

--OM
--renter * 0.40 = OM1
c.renter * 0.40 AS "OM1",

--owner * 0.40 = OM2, 1 - renter
1 - c.renter * 0.40 AS "OM2",


--AM
--age_lt6 * 0.40 = AM1
c.age_lt6 * 0.40 AS "AM1",

-- 1 - (age_lt6 + c.age_gt65) * 0.40, percentage of population between6 and 65
1 - (c.age_lt6 + c.age_gt65) * 0.40 AS "AM2",
	
-- age_gt65 * 0.40 = AM3
c.age_gt65 * 0.40 AS "AM3"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc1 a
--FROM results_dsra_{eqScenario}.{eqScenario}_shelter_calc1 a
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_indicators_s b ON a."Sauid" = b."Sauid"
LEFT JOIN census.census_2016_canada c ON b."Sauid" = c.sauidt
);


-- intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc3 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter_calc3 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3 AS
(
SELECT
"Sauid",

--(displaced household * nighttime population)/(households (single fam + multi fam))
COALESCE(((a."sCt_DisplHshld_b0" * a."Et_PopNight") / NULLIF((a."Et_SFHshld" + a."Et_MFHshld"),0)),0) AS "ppl_b0",
COALESCE(((a."sCt_DisplHshld_r1" * a."Et_PopNight") / NULLIF((a."Et_SFHshld" + a."Et_MFHshld"),0)),0) AS "ppl_r1"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2 a
--FROM results_dsra_{eqScenario}.{eqScenario}_shelter_calc2 a
);



-- intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc4 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter_calc4 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc4 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc4 AS
(
SELECT A."Sauid",
--IM1, EM1, OM1, AM* = X1
((0.73 * a."IM1") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM1") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM1") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM3")) AS "X1",

--IM1, EM1, OM2, AM* = X2
((0.73 * a."IM1") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM1") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM1") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM3")) AS "X2",

--IM1, EM2, OM1, AM* = X3
((0.73 * a."IM1") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM1") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM1") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM3")) AS "X3",

--IM1, EM2, OM2, AM* = X4
((0.73 * a."IM1") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM1") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM1") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM3")) AS "X4",

--IM1, EM3, OM1, AM* = X5
((0.73 * a."IM1") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM1") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM1") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM3")) AS "X5",

--IM1, EM3, OM2, AM* = X6
((0.73 * a."IM1") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM1") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM1") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM3")) AS "X6",

--IM2, EM1, OM1, AM* = X7
((0.73 * a."IM2") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM2") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM2") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM3")) AS "X7",

--IM2, EM1, OM2, AM* = X8
((0.73 * a."IM2") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM2") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM2") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM3")) AS "X8",

--IM2, EM2, OM1, AM* = X9
((0.73 * a."IM2") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM2") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM2") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM3")) AS "X9",

--IM2, EM2, OM2, AM* = X10
((0.73 * a."IM2") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM2") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM2") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM3")) AS "X10",

--IM2, EM3, OM1, AM* = X11
((0.73 * a."IM2") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM2") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM2") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM3")) AS "X11",

--IM2, EM3, OM2, AM* = X12
((0.73 * a."IM2") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM2") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM2") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM3")) AS "X12",

--IM3, EM1, OM1, AM* = X13
((0.73 * a."IM3") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM3") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM3") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM3")) AS "X13",

--IM3, EM1, OM2, AM* = X14
((0.73 * a."IM3") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM3") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM3") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM3")) AS "X14",

--IM3, EM2, OM1, AM* = X15
((0.73 * a."IM3") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM3") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM3") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM3")) AS "X15",

--IM3, EM2, OM2, AM* = X16
((0.73 * a."IM3") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM3") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM3") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM3")) AS "X16",

--IM3, EM3, OM1, AM* = X17
((0.73 * a."IM3") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM3") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM3") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM3")) AS "X17",

--IM3, EM3, OM2, AM* = X18
((0.73 * a."IM3") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM3") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM3") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM3")) AS "X18",

--IM4, EM1, OM1, AM* = X19
((0.73 * a."IM4") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM4") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM4") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM3")) AS "X19",

--IM4, EM1, OM2, AM* = X20
((0.73 * a."IM4") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM4") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM4") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM3")) AS "X20",

--IM4, EM2, OM1, AM* = X21
((0.73 * a."IM4") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM4") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM4") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM3")) AS "X21",

--IM4, EM2, OM2, AM* = X22
((0.73 * a."IM4") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM4") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM4") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM3")) AS "X22",

--IM4, EM3, OM1, AM* = X23
((0.73 * a."IM4") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM4") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM4") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM3")) AS "X23",

--IM4, EM3, OM2, AM* = X24
((0.73 * a."IM4") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM4") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM4") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM3")) AS "X24",

--IM5, EM1, OM1, AM* = X25
((0.73 * a."IM5") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM5") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM5") + (0.27 * a."EM1") + (0 * a."OM1") + (0 * a."AM3")) AS "X25",

--IM5, EM1, OM2, AM* = X26
((0.73 * a."IM5") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM5") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM5") + (0.27 * a."EM1") + (0 * a."OM2") + (0 * a."AM3")) AS "X26",

--IM5, EM2, OM1, AM* = X27
((0.73 * a."IM5") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM5") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM5") + (0.27 * a."EM2") + (0 * a."OM1") + (0 * a."AM3")) AS "X27",

--IM5, EM2, OM2, AM* = X28
((0.73 * a."IM5") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM5") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM5") + (0.27 * a."EM2") + (0 * a."OM2") + (0 * a."AM3")) AS "X28",

--IM5, EM3, OM1, AM* = X29
((0.73 * a."IM5") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM1")) + 
((0.73 * a."IM5") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM2")) + 
((0.73 * a."IM5") + (0.27 * a."EM3") + (0 * a."OM1") + (0 * a."AM3")) AS "X29",

--IM5, EM3, OM2, AM* = X30
((0.73 * a."IM5") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM1")) + 
((0.73 * a."IM5") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM2")) + 
((0.73 * a."IM5") + (0.27 * a."EM3") + (0 * a."OM2") + (0 * a."AM3")) AS "X30"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2 a
--FROM results_dsra_{eqScenario}.{eqScenario}_shelter_calc2 a
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3 b ON a."Sauid" = b."Sauid"
--LEFT JOIN results_dsra_{eqScenario}.{eqScenario}_shelter_calc3 b ON a."Sauid" = b."Sauid"
);



-- intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc5 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter_calc5 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc5 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc5 AS
(
SELECT 
a."Sauid",

-- alpha
"X1" + "X2" + "X3" + "X4" + "X5" + "X6" + "X7" + "X8" + "X9" + "X10" +
"X11" + "X12" + "X13" + "X14" + "X15" + "X16" + "X17" + "X18" + "X19" + "X20" + 
"X21" + "X22" + "X23" + "X24" + "X25" + "X26" + "X27" + "X28" + "X29" + "X30" AS "alpha"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc4 a
--FROM results_dsra_{eqScenario}.{eqScenario}_shelter_calc4 a
);



-- intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc6 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter_calc6 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc6 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc6 AS
(
SELECT 
a."Sauid",

--IM1, EM1, OM1, AM* = X1
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X1_b0",

--IM1, EM1, OM2, AM* = X2
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X2_b0",

--IM1, EM2, OM1, AM* = X3
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X3_b0",

--IM1, EM2, OM2, AM* = X4
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X4_b0",

--IM1, EM3, OM1, AM* = X5
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X5_b0",

--IM1, EM3, OM2, AM* = X6
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM1") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X6_b0",

--IM2, EM1, OM1, AM* = X7
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X7_b0",

--IM2, EM1, OM2, AM* = X8
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X8_b0",

--IM2, EM2, OM1, AM* = X9
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X9_b0",

--IM2, EM2, OM2, AM* = X10
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X10_b0",

--IM2, EM3, OM1, AM* = X11
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X11_b0",

--IM2, EM3, OM2, AM* = X12
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM2") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X12_b0",

--IM3, EM1, OM1, AM* = X13
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X13_b0",

--IM3, EM1, OM2, AM* = X14
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X14_b0",

--IM3, EM2, OM1, AM* = X15
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X15_b0",

--IM3, EM2, OM2, AM* = X16
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X16_b0",

--IM3, EM3, OM1, AM* = X17
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X17_b0",

--IM3, EM3, OM2, AM* = X18
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM3") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X18_b0",

--IM4, EM1, OM1, AM* = X19
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X19_b0",

--IM4, EM1, OM2, AM* = X20
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X20_b0",

--IM4, EM2, OM1, AM* = X21
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X21_b0",

--IM4, EM2, OM2, AM* = X22
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X22_b0",

--IM4, EM3, OM1, AM* = X23
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X23_b0",

--IM4, EM3, OM2, AM* = X24
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM4") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X24_b0",

--IM5, EM1, OM1, AM* = X25
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X25_b0",

--IM5, EM1, OM2, AM* = X26
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X26_b0",

--IM5, EM2, OM1, AM* = X27
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X27_b0",

--IM5, EM2, OM2, AM* = X28
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X28_b0",

--IM5, EM3, OM1, AM* = X29
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X29_b0" ,

--IM5, EM3, OM2, AM* = X30
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_b0") * (a."IM5") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X30_b0",


--IM1, EM1, OM1, AM* = X1
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X1_r1",

--IM1, EM1, OM2, AM* = X2
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X2_r1",

--IM1, EM2, OM1, AM* = X3
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X3_r1",

--IM1, EM2, OM2, AM* = X4
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X4_r1",

--IM1, EM3, OM1, AM* = X5
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X5_r1",

--IM1, EM3, OM2, AM* = X6
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM1") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X6_r1",

--IM2, EM1, OM1, AM* = X7
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X7_r1",

--IM2, EM1, OM2, AM* = X8
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X8_r1",

--IM2, EM2, OM1, AM* = X9
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X9_r1",

--IM2, EM2, OM2, AM* = X10
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X10_r1",

--IM2, EM3, OM1, AM* = X11
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X11_r1",

--IM2, EM3, OM2, AM* = X12
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM2") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X12_r1",

--IM3, EM1, OM1, AM* = X13
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X13_r1",

--IM3, EM1, OM2, AM* = X14
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X14_r1",

--IM3, EM2, OM1, AM* = X15
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X15_r1",

--IM3, EM2, OM2, AM* = X16
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X16_r1",

--IM3, EM3, OM1, AM* = X17
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X17_r1",

--IM3, EM3, OM2, AM* = X18
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM3") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X18_r1",

--IM4, EM1, OM1, AM* = X19
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X19_r1",

--IM4, EM1, OM2, AM* = X20
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X20_r1",

--IM4, EM2, OM1, AM* = X21
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X21_r1",

--IM4, EM2, OM2, AM* = X22
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X22_r1",

--IM4, EM3, OM1, AM* = X23
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X23_r1",

--IM4, EM3, OM2, AM* = X24
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM4") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X24_r1",

--IM5, EM1, OM1, AM* = X25
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM1") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM1") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM1") * (a."OM1") * (a."AM3")) AS "X25_r1",

--IM5, EM1, OM2, AM* = X26
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM1") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM1") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM1") * (a."OM2") * (a."AM3")) AS "X26_r1",

--IM5, EM2, OM1, AM* = X27
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM2") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM2") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM2") * (a."OM1") * (a."AM3")) AS "X27_r1",

--IM5, EM2, OM2, AM* = X28
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM2") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM2") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM2") * (a."OM2") * (a."AM3")) AS "X28_r1",

--IM5, EM3, OM1, AM* = X29
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM3") * (a."OM1") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM3") * (a."OM1") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM3") * (a."OM1") * (a."AM3")) AS "X29_r1" ,

--IM5, EM3, OM2, AM* = X30
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM3") * (a."OM2") * (a."AM1")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM3") * (a."OM2") * (a."AM2")) +
((c.alpha) * (b."ppl_r1") * (a."IM5") * (a."EM3") * (a."OM2") * (a."AM3")) AS "X30_r1"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2 a
--FROM results_dsra_{eqScenario}.{eqScenario}_shelter_calc2 a
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3 b ON a."Sauid" = b."Sauid"
--LEFT JOIN results_dsra_{eqScenario}.{eqScenario}_shelter_calc3 b ON a."Sauid" = b."Sauid"
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc5 c ON a."Sauid" = c."Sauid"
--LEFT JOIN results_dsra_{eqScenario}.{eqScenario}_shelter_calc5 c ON a."Sauid" = c."Sauid"
);



--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc7 CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter_calc7 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc7 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc7 AS
(
SELECT
a."Sauid",

--"sCt_Shelter_b0"
a."X1_b0" + a."X2_b0" + a."X3_b0" + a."X4_b0" + a."X5_b0" + a."X6_b0" + a."X7_b0" + a."X8_b0" + a."X9_b0" + a."X10_b0" + 
a."X11_b0" + a."X12_b0" + a."X13_b0" + a."X14_b0" + a."X15_b0" + a."X16_b0" + a."X17_b0" + a."X18_b0" + a."X19_b0" + a."X20_b0" +
a."X21_b0" + a."X22_b0" + a."X23_b0" + a."X24_b0" + a."X25_b0" + a."X26_b0" + a."X27_b0" + a."X28_b0" + a."X29_b0" + a."X30_b0" AS "sCt_Shelter_b0",

--"sCt_Shelter_r1"
a."X1_r1" + a."X2_r1" + a."X3_r1" + a."X4_r1" + a."X5_r1" + a."X6_r1" + a."X7_r1" + a."X8_r1" + a."X9_r1" + a."X10_r1" + 
a."X11_r1" + a."X12_r1" + a."X13_r1" + a."X14_r1" + a."X15_r1" + a."X16_r1" + a."X17_r1" + a."X18_r1" + a."X19_r1" + a."X20_r1" +
a."X21_r1" + a."X22_r1" + a."X23_r1" + a."X24_r1" + a."X25_r1" + a."X26_r1" + a."X27_r1" + a."X28_r1" + a."X29_r1" + a."X30_r1" AS "sCt_Shelter_r1"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc6 a
--FROM results_dsra_{eqScenario}.{eqScenario}_shelter_calc6 a
);



--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter CASCADE;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter AS
(
SELECT
a."Sauid",
a."sCt_DisplHshld_b0",
a."sCt_DisplHshld_r1",
a."Et_PopNight",
a."E_CensusPop",
a."E_CensusDU",
a."E_People_DU",
a."Et_SFHshld",
a."Et_MFHshld",
a.inc_hshld,
a.vis_min,
a.indigenous,
a.renter,
a.age_gt65,
a.age_lt6,
a."IM1",
a."IM2",
a."IM3",
a."IM4",
a."IM5",
a."EM1",
a."EM2",
a."EM3",
a."OM1",
a."OM2",
a."AM1",
a."AM2",
a."AM3",
b."sCt_Shelter_b0",
b."sCt_Shelter_r1"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2 a
--FROM results_dsra_{eqScenario}.{eqScenario}_shelter_calc2 a
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc7 b ON a."Sauid" = b."Sauid"
--LEFT JOIN results_dsra_{eqScenario}.{eqScenario}_shelter_calc7 b ON a."Sauid" = b."Sauid"
);



--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc1,results_dsra_{eqScenario}.{eqScenario}_shelter_calc2,results_dsra_{eqScenario}.{eqScenario}_shelter_calc3,results_dsra_{eqScenario}.{eqScenario}_shelter_calc4,results_dsra_{eqScenario}.{eqScenario}_shelter_calc5,results_dsra_{eqScenario}.{eqScenario}_shelter_calc6,results_dsra_{eqScenario}.{eqScenario}_shelter_calc7;
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc1,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2,
results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc4,
results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc5,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc6,
results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc7;