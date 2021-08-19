SELECT
a.sauid AS "Sauid",
CAST(CAST(ROUND(CAST(c.censuspop AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusPop",
CAST(CAST(ROUND(CAST(c.censusdu AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusDU",
CAST(CAST(ROUND(CAST(AVG(COALESCE(c.censuspop/NULLIF(c.censusdu,0),0)) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_CensusDU_calculated",
CAST(CAST(ROUND(CAST(AVG(a.popdu) AS NUMERIC),6) AS FLOAT) AS NUMERIC) AS "E_People_DU_from_source",
ABS(AVG(COALESCE(c.censuspop/NULLIF(c.censusdu,0),0)) - AVG(a.popdu)) AS "difference"

FROM exposure.canada_exposure a
LEFT JOIN census.census_2016_canada c ON a.sauid = c.sauidt
LEFT JOIN boundaries."Geometry_SAUID" d on a.sauid = d."SAUIDt"
GROUP BY a.sauid,c.censuspop,c.censusdu;