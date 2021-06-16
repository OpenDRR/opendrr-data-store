-- create index on geometries tables
CREATE INDEX IF NOT EXISTS geometry_aduid_pruid_idx ON boundaries."Geometry_ADAUID"("ADAUID");

CREATE INDEX IF NOT EXISTS geometry_canada_fid_idx ON boundaries."Geometry_ADAUID"("fid");

CREATE INDEX IF NOT EXISTS geometry_cduid_cduid_idx ON boundaries."Geometry_CDUID"("CDUID");

CREATE INDEX IF NOT EXISTS geometry_csduid_csduid_idx ON boundaries."Geometry_CSDUID"("CSDUID");

CREATE INDEX IF NOT EXISTS geometry_dauid_dauid_idx ON boundaries."Geometry_DAUID"("DAUID");

CREATE INDEX IF NOT EXISTS geometry_eruid_eruid_idx ON boundaries."Geometry_ERUID"("ERUID");

CREATE INDEX IF NOT EXISTS geometry_fsauid_fsauid_idx ON boundaries."Geometry_FSAUID"("CFSAUID");

CREATE INDEX IF NOT EXISTS geometry_pruid_pruid_idx ON boundaries."Geometry_PRUID"("PRUID");

CREATE INDEX IF NOT EXISTS geometry_sauid_sauid_idx ON boundaries."Geometry_SAUID"("SAUIDt");
CREATE INDEX IF NOT EXISTS geometry_sauid_dauid_idx ON boundaries."Geometry_SAUID"("DAUIDt");
CREATE INDEX IF NOT EXISTS geometry_sauid_cfsauid_idx ON boundaries."Geometry_SAUID"("CFSAUID");
CREATE INDEX IF NOT EXISTS geometry_sauid_csduid_idx ON boundaries."Geometry_SAUID"("CSDUID");
CREATE INDEX IF NOT EXISTS geometry_sauid_adauid_idx ON boundaries."Geometry_SAUID"("ADAUID");
CREATE INDEX IF NOT EXISTS geometry_sauid_cduid_idx ON boundaries."Geometry_SAUID"("CDUID");
CREATE INDEX IF NOT EXISTS geometry_sauid_eruid_idx ON boundaries."Geometry_SAUID"("ERUID");
CREATE INDEX IF NOT EXISTS geometry_sauid_pruid_idx ON boundaries."Geometry_SAUID"("PRUID");

-- create index on census tables
CREATE INDEX IF NOT EXISTS census_2016_canada_sauid_idx ON census.census_2016_canada("sauidt");


-- create index on dsra tables
CREATE INDEX IF NOT EXISTS dsra_acm6p5_beaufort_assetid_idx ON dsra.dsra_acm6p5_beaufort("AssetID");


-- create index on exposure tables
CREATE INDEX IF NOT EXISTS canada_exposure_id_idx ON exposure.canada_exposure("id");
CREATE INDEX IF NOT EXISTS canada_exposure_sauid_idx ON exposure.canada_exposure("sauid");


CREATE INDEX IF NOT EXISTS metrovan_building_exposure_id_idx ON exposure.metrovan_building_exposure("id");
CREATE INDEX IF NOT EXISTS metrovan_building_exposure_sauid_idx ON exposure.metrovan_building_exposure("sauid");

CREATE INDEX IF NOT EXISTS metrovan_sauid_exposure_sauid_idx ON exposure.metrovan_sauid_exposure("sauid");
CREATE INDEX IF NOT EXISTS metrovan_sauid_exposure_geom_site_idx ON exposure.metrovan_sauid_exposure USING gist("geom_site");

CREATE INDEX IF NOT EXISTS metrovan_site_exposure_id_idx ON exposure.metrovan_site_exposure("id");
CREATE INDEX IF NOT EXISTS metrovan_site_exposure_id_building_idx ON exposure.metrovan_site_exposure("id_building");
CREATE INDEX IF NOT EXISTS metrovan_site_exposure_sauid_idx ON exposure.metrovan_site_exposure("sauidid");
CREATE INDEX IF NOT EXISTS metrovan_site_exposure_geom_site_idx ON exposure.metrovan_site_exposure USING GIST("geom_site");
CREATE INDEX IF NOT EXISTS metrovan_site_exposure_geom_sauid_idx ON exposure.metrovan_site_exposure USING GIST("geom_sauid");


-- create index on ghsl tables
CREATE INDEX IF NOT EXISTS ghsl_mh_intensity_ghsl_ghslid_idx ON ghsl.ghsl_mh_intensity_ghsl("ghslid");
CREATE INDEX IF NOT EXISTS ghsl_mh_intensity_ghsl_pruid_idx ON ghsl.ghsl_mh_intensity_ghsl("pruid");
CREATE INDEX IF NOT EXISTS ghsl_mh_intensity_ghsl_cduid_idx ON ghsl.ghsl_mh_intensity_ghsl("cduid");
CREATE INDEX IF NOT EXISTS ghsl_mh_intensity_ghsl_csduid_idx ON ghsl.ghsl_mh_intensity_ghsl("csduid");
CREATE INDEX IF NOT EXISTS ghsl_mh_intensity_ghsl_eruid_idx ON ghsl.ghsl_mh_intensity_ghsl("eruid");

-- create index on gmf tables
CREATE INDEX IF NOT EXISTS shakemap_acm6p5_beaufort_site_id_idx ON gmf.shakemap_acm6p5_beaufort("site_id");


-- create index on mh tables
CREATE INDEX IF NOT EXISTS mh_intensity_canada_sauidt_idx ON mh.mh_intensity_canada("sauidt");

CREATE INDEX IF NOT EXISTS mh_intensity_canada_mhsum_sauid_idx ON mh.mh_intensity_canada_mhsum("sauidt");


-- create index on psra tables
CREATE INDEX IF NOT EXISTS psra_mb_cd_dmg_mean_id_idx ON psra_mb.psra_mb_cd_dmg_mean(asset_id);
CREATE INDEX IF NOT EXISTS psra_mb_ed_dmg_mean_id_idx ON psra_mb.psra_mb_ed_dmg_mean(asset_id);
CREATE INDEX IF NOT EXISTS psra_mb_hmaps_xref_id_idx ON psra_mb.psra_mb_hmaps_xref(id);
CREATE INDEX IF NOT EXISTS psra_mb_avg_losses_stats_asset_id_idx ON psra_mb.psra_mb_avg_losses_stats(asset_id);


-- create index on sovi tables
CREATE INDEX IF NOT EXISTS sovi_census_canada_sauid_idx ON sovi.sovi_census_canada(sauidt);
CREATE INDEX IF NOT EXISTS sovi_census_canada_dauid_idx ON sovi.sovi_census_canada(dauidt);
CREATE INDEX IF NOT EXISTS sovi_census_canada_cfsauid_idx ON sovi.sovi_census_canada(cfsauid);
CREATE INDEX IF NOT EXISTS sovi_census_canada_csduid_idx ON sovi.sovi_census_canada(csduid);
CREATE INDEX IF NOT EXISTS sovi_census_canada_adauid_idx ON sovi.sovi_census_canada(adauid);
CREATE INDEX IF NOT EXISTS sovi_census_canada_cduid_idx ON sovi.sovi_census_canada(cduid);
CREATE INDEX IF NOT EXISTS sovi_census_canada_eruid_idx ON sovi.sovi_census_canada(eruid);
CREATE INDEX IF NOT EXISTS sovi_census_canada_pruid_idx ON sovi.sovi_census_canada(pruid);

CREATE INDEX IF NOT EXISTS sovi_index_canada_sauid_idx ON sovi.sovi_index_canada(sauidt);
CREATE INDEX IF NOT EXISTS sovi_index_canada_dauid_idx ON sovi.sovi_index_canada(dauidt);
CREATE INDEX IF NOT EXISTS sovi_index_canada_cfsauid_idx ON sovi.sovi_index_canada(cfsauid);
CREATE INDEX IF NOT EXISTS sovi_index_canada_csduid_idx ON sovi.sovi_index_canada(csduid);
CREATE INDEX IF NOT EXISTS sovi_index_canada_adauid_idx ON sovi.sovi_index_canada(adauid);
CREATE INDEX IF NOT EXISTS sovi_index_canada_cduid_idx ON sovi.sovi_index_canada(cduid);
CREATE INDEX IF NOT EXISTS sovi_index_canada_eruid_idx ON sovi.sovi_index_canada(eruid);
CREATE INDEX IF NOT EXISTS sovi_index_canada_pruid_idx ON sovi.sovi_index_canada(pruid);


-- create index on vs30 tables
CREATE INDEX IF NOT EXISTS vs_30_can_site_model_xref_id_idx ON vs30.vs30_can_site_model_xref("id");

CREATE INDEX IF NOT EXISTS vs30_can_site_model_metrovan_building_exposure_xref_id_idx ON vs30.vs30_can_site_model_metrovan_building_exposure_xref("id");

CREATE INDEX IF NOT EXISTS vs30_can_site_model_metrovan_sauid_exposure_xref_sauid_idx ON vs30.vs30_can_site_model_metrovan_sauid_exposure_xref("sauid");

CREATE INDEX IF NOT EXISTS vs30_can_site_model_metrovan_site_exposure_xref_id_idx ON vs30.vs30_can_site_model_metrovan_site_exposure_xref("id");






