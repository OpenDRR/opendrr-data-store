--intermediates table to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc1
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc1 AS
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
a."sC_Downtime_b0",
a."sC_Downtime_r1",
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
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_b b ON a."AssetID" = b."BldgID"
LEFT JOIN exposure.canada_exposure c ON  a."AssetID" = c.id
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_s d ON c.sauid = d."Sauid"
);


--intermediate tables to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc2
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc2 AS
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
);


--intermediate tables to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc3
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc3 AS
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
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc2 b on a."AssetID" = b."AssetID"
);


--intermediate tables to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld AS
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
a."sC_Downtime_b0",
a."sC_Downtime_r1",
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
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc2 b ON a."AssetID" = b."AssetID"
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc3 c ON a."AssetID" = c."AssetID"
);

--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_displhshld_calc1,results_dsra_{eqScenario}.{eqScenario}_displhshld_calc2,results_dsra_{eqScenario}.{eqScenario}_displhshld_calc3;
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc1,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc2,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_displhshld_calc3;


--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc1;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter_calc1 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc1 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc1 AS
(
SELECT 
a."Sauid",
SUM(a."sC_DisplHshld_b0") AS "sCt_DisplHshld_b0",
SUM(a."sC_DisplHshld_r1") AS "sCt_DisplHshld_r1",
SUM(b."E_PopNight") AS "Et_PopNight"
	
FROM results_dsra_sim9p0_cascadiainterfacebestfault.dsra_sim9p0_cascadiainterfacebestfault_all_indicators_b a
--FROM results_dsra_{eqScenario}.dsra_{eqScenario}_all_indicators_b a
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_b b ON a."AssetID" = b."BldgID"
GROUP BY a."Sauid"
);


--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc2
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc2 AS
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

--IM
--IF [Inc_Hshld] =< $15,000, THEN 0.62 = IM1
CASE WHEN c.inc_hshld <= 15000 THEN 0.62 ELSE 0 END AS "IM1",
--IF [Inc_Hshld] > $15,000 AND [Inc_Hshld] =<, $20,000 THEN 0.42 = IM2
CASE WHEN c.inc_hshld > 15000 AND c.inc_hshld <= 20000 THEN 0.29 ELSE 0 END AS "IM2",
--IF [Inc_Hshld] > $20,000 AND [Inc_Hshld] =<, $35,000 THEN 0.29 = IM3
CASE WHEN c.inc_hshld > 20000 AND c.inc_hshld <= 35000 THEN 0.29 ELSE 0 END AS "IM3",
--IF [Inc_Hshld] > $35,000 AND [Inc_Hshld] =<, $50,000 THEN  0.22 = IM4
CASE WHEN c.inc_hshld > 35000 AND c.inc_hshld <= 50000 THEN 0.29 ELSE 0 END AS "IM4",
--IF [Inc_Hshld] > $50,000 THEN 0.13 = IM5
CASE WHEN c.inc_hshld > 50000 THEN 0.13 ELSE 0 END AS "IM5",

--EM
--[Imm_LT5_p] * 0.24 = EM1, Imm_LT5_p = IF [Imm_LT5_t] =1 Then ([Imm_LT5] x [CensusPop]
--CASE WHEN d."VFt_ImmLT5" = 1 THEN c.imm_lt5 * b."E_CensusPop" * 0.24 ELSE 0 END AS "EM1",
--CASE WHEN d."VFt_ImmLT5" = 1 THEN c.imm_lt5 * 0.24 ELSE 0 END AS "EM1",
c.imm_lt5 * 0.24 AS "EM1",

--[Live_Alone_p] * 0.48 = EM2,  Live_Alone_p = IF [Live_Alone_t] =1 Then ([Live_Alone] x [CensusPop]
--CASE WHEN d."VFt_LivAlone" = 1 THEN c.live_alone * b."E_CensusPop" * 0.48 ELSE 0 END AS "EM2",
--CASE WHEN d."VFt_LivAlone" = 1 THEN c.live_alone * 0.48 ELSE 0 END AS "EM2",
c.live_alone * 0.48 AS "EM2",

--[No_EngFr_p] * 0.47 = EM3, No_EngFr_p = IF [No_EngFr_t] =1 Then ([No_EngFr] x [CensusPop]
--CASE WHEN d."VFt_LivAlone" = 1 THEN c.live_alone * b."E_CensusPop" * 0.47 ELSE 0 END AS "EM3",
--CASE WHEN d."VFt_LivAlone" = 1 THEN c.live_alone * 0.47 ELSE 0 END AS "EM3",
c.live_alone * 0.47 AS "EM3",

--[LonePar3Kids_p] * 0.26 = EM4, LonePar3Kids_p = IF [LonePar3Kids_t] =1 Then ([LonePar3Kids] x [CensusPop] 
--CASE WHEN d."VFt_LonPar3Kids" = 1 THEN c.lonepar3kids * b."E_CensusPop" * 0.26 ELSE 0 END AS "EM4",
--CASE WHEN d."VFt_LonPar3Kids" = 1 THEN c.lonepar3kids * 0.26 ELSE 0 END AS "EM4",
c.lonepar3kids * 0.26 AS "EM4",

--[Indigenous_p] * 0.26 = EM5, Indigenous_p = IF [Indigenous_t] =1 Then ([Indigenous] x [CensusPop]
--CASE WHEN d."VAt_Indigenous" = 1 THEN c.indigenous * b."E_CensusPop" * 0.26 ELSE 0 END AS "EM5",
--CASE WHEN d."VAt_Indigenous" = 1 THEN c.indigenous * 0.26 ELSE 0 END AS "EM5",
c.indigenous * 0.26 AS "EM5",

--OM
--[Renter_p] * 0.40 = OM1, Renter_p = IF [Renter_t] =1 Then ([Renter] x [CensusPop]
--CASE WHEN d."VHt_Renter" = 1 THEN c.renter * b."E_CensusPop" * 0.40 ELSE 0 END AS "OM1",
--CASE WHEN d."VHt_Renter" = 1 THEN c.renter * 0.40 ELSE 0 END AS "OM1",
c.renter * 0.40 AS "OM1",

--(([CensusDU] * People_DU]) - [Renter] ) * 0.40 = OM2
--((b."E_CensusDU" * b."E_People_DU") - c.renter) * 0.40 AS "OM2",
1 - c.renter * 0.40 AS "OM2",

--AM
--[Age_GT65_p] * 0.40 = AM1, Age_GT65_p = IF [Age_GT65_t] =1 Then ([Age_GT65] x [CensusPop]
--CASE WHEN d."VAt_AgeGT65" = 1 THEN c.age_gt65 * b."E_CensusPop" * 0.40 ELSE 0 END AS "AM1",
--CASE WHEN d."VAt_AgeGT65" = 1 THEN c.age_gt65 * 0.40 ELSE 0 END AS "AM1",
c.age_gt65 * 0.40 AS "AM1",

--[Age_LT6_p] * 0.40 = AM2, Age_LT6_p = IF [Age_LT6_t] =1 Then ([Age_LT6] x [CensusPop]
--CASE WHEN d."VAt_AgeLT6" = 1 THEN c.age_lt6 * b."E_CensusPop" * 0.40 ELSE 0 END AS "AM2"
--CASE WHEN d."VAt_AgeLT6" = 1 THEN c.age_lt6 * 0.40 ELSE 0 END AS "AM2",
c.age_lt6 * 0.40 AS "AM2"


FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc1 a
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_s b ON a."Sauid" = b."Sauid"
LEFT JOIN sovi.sovi_census_canada c ON b."Sauid" = c.sauidt
LEFT JOIN results_nhsl_social_fabric.nhsl_social_fabric_all_indicators_s d ON a."Sauid" = d."Sauid"
);


-- intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc3
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc3 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3 AS
(
SELECT
"Sauid",

--(0.73* ([IM1]+[IM2]+[IM3]+[IM4]+[IM5])) + (0.27*([EM1]+[EM2]+[EM3]+[EM4]+[EM5])) = sigma
(0.73 * ("IM1" + "IM2" + "IM3" + "IM4" + "IM5")) + (0.27 * ("EM1" + "EM2" + "EM3" + "EM4" + "EM5")) AS "sigma"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2
--FROM results_dsra_{eqScenario}.{eqScenario}_shelter_calc2
);


-- intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc4
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc4 AS
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc4 CASCADE;
CREATE TABLE results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc4 AS
(
SELECT
a."Sauid",
--[sigma] * (([DisplHshld] * [CensusPop]) / CensusDU) * ([IM1]+[IM2]+[IM3]+[IM4]+[IM5]) * ([EM1]+[EM2]+[EM3]+[EM4]+[EM5]) * ([OM1]+[OM2]) * ([AM1]+[AM2]) = Shelter
--b.sigma * COALESCE(((a."sCt_DisplHshld_b0" * a."E_CensusPop") / NULLIF(a."E_CensusDU",0)),0) * (a."IM1" + a."IM2" + a."IM3" + a."IM4" + a."IM5") * (a."EM1" + a."EM2" + a."EM3" + a."EM4" + a."EM5") * (a."OM1" + a."OM2") * (a."AM1" + a."AM2") AS "sCt_Shelter_b0",
b.sigma * COALESCE(((a."sCt_DisplHshld_b0" * a."Et_PopNight") / NULLIF((a."Et_SFHshld" + a."Et_MFHshld"),0)),0) * (a."IM1" + a."IM2" + a."IM3" + a."IM4" + a."IM5") * (a."EM1" + a."EM2" + a."EM3" + a."EM4" + a."EM5") * (a."OM1" + a."OM2") * (a."AM1" + a."AM2") AS "sCt_Shelter_b0",
--b.sigma * COALESCE(((a."sCt_DisplHshld_r1" * a."E_CensusPop") / NULLIF(a."E_CensusDU",0)),0) * (a."IM1" + a."IM2" + a."IM3" + a."IM4" + a."IM5") * (a."EM1" + a."EM2" + a."EM3" + a."EM4" + a."EM5") * (a."OM1" + a."OM2") * (a."AM1" + a."AM2") AS "sCt_Shelter_r1"
b.sigma * COALESCE(((a."sCt_DisplHshld_r1" * a."Et_PopNight") / NULLIF((a."Et_SFHshld" + a."Et_MFHshld"),0)),0) * (a."IM1" + a."IM2" + a."IM3" + a."IM4" + a."IM5") * (a."EM1" + a."EM2" + a."EM3" + a."EM4" + a."EM5") * (a."OM1" + a."OM2") * (a."AM1" + a."AM2") AS "sCt_Shelter_r1"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2 a
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3 b ON a."Sauid" = b."Sauid"
);


--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.shelter
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.shelter AS
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
a."IM1",
a."IM2",
a."IM3",
a."IM4",
a."IM5",
a."EM1",
a."EM2",
a."EM3",
a."EM4",
a."EM5",
a."OM1",
a."OM2",
a."AM1",
a."AM2",
b.sigma,
c."sCt_Shelter_b0",
c."sCt_Shelter_r1"

FROM results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2 a
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3 b ON a."Sauid" = b."Sauid"
LEFT JOIN results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc4 c ON a."Sauid" = c."Sauid"
);

--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc1,results_dsra_{eqScenario}.{eqScenario}_shelter_calc2,results_dsra_{eqScenario}.{eqScenario}_shelter_calc3,results_dsra_{eqScenario}.{eqScenario}_shelter_calc4;
DROP TABLE IF EXISTS results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc1,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc2,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc3,results_dsra_sim9p0_cascadiainterfacebestfault.sim9p0_cascadiainterfacebestfault_shelter_calc4;