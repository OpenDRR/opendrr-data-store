--intermediates table to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc1
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc1 AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc1;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc1 AS
(
SELECT
a."AssetID",
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
-- SFE
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Extensive_b0" / c.number) ELSE 0 END AS "SFE_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Extensive_r1" / c.number) ELSE 0 END AS "SFE_r1",
-- SFC
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Complete_b0" / c.number) ELSE 0 END AS "SFC_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-LD' THEN (a."sD_Complete_r1" / c.number) ELSE 0 END AS "SFC_r1",
-- MFM
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Moderate_b0" / c.number) ELSE 0 END AS "MFM_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Moderate_r1" / c.number) ELSE 0 END AS "MFM_r1",
-- MFE
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Extensive_b0" / c.number) ELSE 0 END AS "MFE_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Extensive_r1" / c.number) ELSE 0 END AS "MFE_r1",
-- MFC
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Complete_b0" / c.number) ELSE 0 END AS "MFC_b0",
CASE WHEN b."E_BldgOccG" = 'Residential-MD' OR b."E_BldgOccG" = 'Residential-HD' THEN (a."sD_Complete_r1" / c.number) ELSE 0 END AS "MFC_r1",

0 AS "W_SFM",
0 AS "W_SFE",
1 AS "W_SFC",
0 AS "W_MFM",
0.9 AS "W_MFE",
1 AS "W_MFC"

FROM dsra.dsra_acm7p3_leechriverfullfault a
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_b b ON a."AssetID" = b."BldgID"
LEFT JOIN exposure.canada_exposure c ON  a."AssetID" = c.id
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_s d ON c.sauid = d."Sauid"
);


--intermediate tables to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc2
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc2 AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc2;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc2 AS
(
SELECT
"AssetID",
-- ([W_SFM]*[SFM]) + ([W_SFE]*[SFE]) + ([W_SFC]*[SFC]) = SF
("W_SFM" * "SFM_b0") + ("W_SFE" * "SFE_b0") + ("W_SFC" * "SFC_b0") AS "SF_b0",
("W_SFM" * "SFM_r1") + ("W_SFE" * "SFE_r1") + ("W_SFC" * "SFC_r1") AS "SF_r1",

--([W_MFM]*[MFM]) + ([W_MFE]*[MFE]) + ([W_MFC]*MFC]) = MF
("W_MFM" * "MFM_b0") + ("W_MFE" * "MFE_b0") + ("W_MFC" * "MFC_b0") AS "MF_b0",
("W_MFM" * "MFM_r1") + ("W_MFE" * "MFE_r1") + ("W_MFC" * "MFC_r1") AS "MF_r1"

FROM results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc1
);


--intermediate tables to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc3
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc3 AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc3;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc3 AS
(
SELECT
a."AssetID",

--(([SF_Hshlds] * [SF]) + ([MF_Hshlds] * [MF])) * ([CensusDU] / ([SF_Hshlds] + [MF_Hshlds]) = DH
COALESCE((a."E_SFHshld" * b."SF_b0") + (a."E_MFHshld" * b."MF_b0") * (a."E_CensusDU" /NULLIF((a."E_SFHshld" + a."E_MFHshld"),0)),0) AS "sC_DisplHshld_b0",
COALESCE((a."E_SFHshld" * b."SF_r1") + (a."E_MFHshld" * b."MF_r1") * (a."E_CensusDU" /NULLIF((a."E_SFHshld" + a."E_MFHshld"),0)),0) AS "sC_DisplHshld_r1"

FROM results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc1 a
LEFT JOIN results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc2 b on a."AssetID" = b."AssetID"
);


--intermediate tables to calculate displaced households for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld AS
(
SELECT
a."AssetID",
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

FROM results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc1 a
LEFT JOIN results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc2 b ON a."AssetID" = b."AssetID"
LEFT JOIN results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc3 c ON a."AssetID" = c."AssetID"
);

--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_displhshld_calc1,results_dsra_{eqScenario}.{eqScenario}_displhshld_calc2,results_dsra_{eqScenario}.{eqScenario}_displhshld_calc3;
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc1,results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc2,results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc3;


--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc1;
--CREATE TABLE results_dsra_{eqScenario}.{eqScenario}_shelter_calc1 AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc1;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc1 AS
(
SELECT 
"Sauid",
SUM("sC_DisplHshld_b0") AS "sCt_DisplHshld_b0",
SUM("sC_DisplHshld_r1") AS "sCt_DisplHshld_r1"
FROM results_dsra_acm7p3_leechriverfullfault.dsra_acm7p3_leechriverfullfault_all_indicators_b
--FROM results_dsra_{eqScenario}.dsra_{eqScenario}_all_indicators_b
GROUP BY "Sauid"
);


--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc2
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc2 AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc2;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc2 AS
(
SELECT
a."Sauid",
a."sCt_DisplHshld_b0",
a."sCt_DisplHshld_r1",
b."E_CensusPop",
b."E_CensusDU",
b."E_People_DU",

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
--[Imm_LT5] * 0.24 = EM1
d.imm_lt5 * 0.24 AS "EM1",
--[Live_Alone] * 0.48 = EM2
d.live_alone * 0.48 AS "EM2",
--[No_EngFr] * 0.47 = EM3
d.no_engfr * 0.47 AS "EM3",
--[LonePar3Kids] * 0.26 = EM4
d.lonepar3kids * 0.26 AS "EM4",
--[Indigenous] * 0.26 = EM5
d.indigenous * 0.26 AS "EM5",

--OM
--[Renter] * 0.40 = OM1
d.renter * 0.40 AS "OM1",
--(([CensusDU] * People_DU]) - [Renter] ) * 0.40 = OM2
((b."E_CensusDU" * b."E_People_DU") - d.renter) * 0.40 AS "OM2",

--AM
--[Age_GT65] * 0.40 = AM1
d.age_gt65 * 0.40 AS "AM1",
--[Age_LT6] * 0.40 = AM2
d.age_lt6 * 0.40 AS "AM2"

FROM results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc1 a
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_all_indicators_s b ON a."Sauid" = b."Sauid"
LEFT JOIN sovi.sovi_census_canada c ON b."Sauid" = c.sauidt
LEFT JOIN sovi.sovi_index_canada d ON b."Sauid" = d.sauidt
);


-- intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc3
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc3 AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc3;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc3 AS
(
SELECT
"Sauid",

--(0.73* ([IM1]+[IM2]+[IM3]+[IM4]+[IM5])) + (0.27*([EM1]+[EM2]+[EM3]+[EM4]+[EM5])) = sigma
(0.73 * ("IM1" + "IM2" + "IM3" + "IM4" + "IM5")) + (0.27 * ("EM1" + "EM2" + "EM3" + "EM4" + "EM5")) AS "sigma"

FROM results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc2
--FROM results_dsra_{eqScenario}.{eqScenario}_shelter_calc2
);


-- intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc4
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.shelter_calc4 AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc4;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc4 AS
(
SELECT
a."Sauid",
--[sigma] * (([DisplHshld] * [CensusPop]) / CensusDU) * ([IM1]+[IM2]+[IM3]+[IM4]+[IM5]) * ([EM1]+[EM2]+[EM3]+[EM4]+[EM5]) * ([OM1]+[OM2]) * ([AM1]+[AM2]) = Shelter
b.sigma * COALESCE(((a."sCt_DisplHshld_b0" * a."E_CensusPop") / NULLIF(a."E_CensusDU",0)),0) * (a."IM1" + a."IM2" + a."IM3" + a."IM4" + a."IM5") * (a."EM1" + a."EM2" + a."EM3" + a."EM4" + a."EM5") * (a."OM1" + a."OM2") * 
(a."AM1" + a."AM2") AS "sCt_Shelter_b0",
b.sigma * COALESCE(((a."sCt_DisplHshld_r1" * a."E_CensusPop") / NULLIF(a."E_CensusDU",0)),0) * (a."IM1" + a."IM2" + a."IM3" + a."IM4" + a."IM5") * (a."EM1" + a."EM2" + a."EM3" + a."EM4" + a."EM5") * (a."OM1" + a."OM2") * 
(a."AM1" + a."AM2") AS "sCt_Shelter_r1"

FROM results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc2 a
LEFT JOIN results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc3 b ON a."Sauid" = b."Sauid"
);


--intermediates table to calculate shelter for DSRA
--DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.shelter
--CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.shelter AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter AS
(
SELECT
a."Sauid",
a."sCt_DisplHshld_b0",
a."sCt_DisplHshld_r1",
a."E_CensusPop",
a."E_CensusDU",
a."E_People_DU",
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

FROM results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc2 a
LEFT JOIN results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc3 b ON a."Sauid" = b."Sauid"
LEFT JOIN results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc4 c ON a."Sauid" = c."Sauid"
);

--DROP TABLE IF EXISTS results_dsra_{eqScenario}.{eqScenario}_shelter_calc1,results_dsra_{eqScenario}.{eqScenario}_shelter_calc2,results_dsra_{eqScenario}.{eqScenario}_shelter_calc3,results_dsra_{eqScenario}.{eqScenario}_shelter_calc4;
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc1,results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc2,results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc3,results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_shelter_calc4;