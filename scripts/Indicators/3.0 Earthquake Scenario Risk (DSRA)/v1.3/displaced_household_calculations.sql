-- intermediates table to calculate displaced households for DSRA
-- DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc1
-- CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc1 AS
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


-- intermediate tables to calculate displaced households for DSRA
-- DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc2
-- CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc2 AS
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


-- intermediate tables to calculate displaced households for DSRA
-- DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc3
-- CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld_calc3 AS
DROP TABLE IF EXISTS results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc3;
CREATE TABLE results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc3 AS
(
SELECT
a."AssetID",

-- (([SF_Hshlds] * [SF]) + ([MF_Hshlds] * [MF])) * ([CensusDU] / ([SF_Hshlds] + [MF_Hshlds]) = DH
COALESCE((a."E_SFHshld" * b."SF_b0") + (a."E_MFHshld" * b."MF_b0") * (a."E_CensusDU" /NULLIF((a."E_SFHshld" + a."E_MFHshld"),0)),0) AS "sC_DisplHshld_b0",
COALESCE((a."E_SFHshld" * b."SF_r1") + (a."E_MFHshld" * b."MF_r1") * (a."E_CensusDU" /NULLIF((a."E_SFHshld" + a."E_MFHshld"),0)),0) AS "sC_DisplHshld_r1"

FROM results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc1 a
LEFT JOIN results_dsra_acm7p3_leechriverfullfault.acm7p3_leechriverfullfault_displhshld_calc2 b on a."AssetID" = b."AssetID"
);


-- intermediate tables to calculate displaced households for DSRA
-- DROP TABLE IF EXISTS results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld
-- CREATE TABLE results_dsra_{eq_Scenario}.{eq_Scenario}.displhshld AS
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