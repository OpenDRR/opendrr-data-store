-- script to update sovi census table with updated VH_pop_ha and VH_bus_ha from exposure
SELECT
a.sauidt,
(b."Et_Comm" + b."Et_Ind" + b."Et_Civic" + b."Et_Agr") / b."E_AreaHa" AS "VH_Bus_ha",
"E_CensusPop" / b."E_AreaHa" AS "VH_pop_ha"

FROM sovi.sovi_census_canada a
LEFT JOIN results_nhsl_physical_exposure.nhsl_physical_exposure_indicators_s b ON a.sauidt = b."Sauid";