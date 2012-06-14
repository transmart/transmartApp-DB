\set ON_ERROR_STOP ON
CREATE TABLE biomart.bio_content (
	bio_file_content_id bigint NOT NULL,
	file_name varchar(1000),
	repository_id bigint,
	location varchar(400),
	title varchar(1000),
	abstract varchar(2000),
	file_type varchar(200) NOT NULL,
	etl_id bigint,
	etl_id_c varchar(30),
	study_name varchar(30),
	cel_location varchar(300),
	cel_file_suffix varchar(30)
);
ALTER TABLE biomart.bio_content OWNER TO biomart;
ALTER TABLE biomart.bio_content ADD CONSTRAINT external_file_pk PRIMARY KEY (bio_file_content_id);
CREATE UNIQUE INDEX bio_content_pk ON biomart.bio_content (bio_file_content_id);
CREATE TABLE biomart.ctd2_clin_inhib_effect (
	ctd_cie_seq bigint,
	ctd_study_id bigint,
	event_description_name varchar(4000),
	event_definition_name varchar(4000),
	adverse_effect_name varchar(4000),
	signal_effect_name varchar(4000),
	pharmaco_parameter_name varchar(500),
	discontinuation_rate_value varchar(250),
	beneficial_effect_name varchar(4000),
	drug_effect varchar(4000),
	clinical_variable_name varchar(250),
	qp_sm_percentage_change varchar(250),
	qp_sm_absolute_change varchar(250),
	qp_sm_rate_of_change varchar(250),
	qp_sm_treatment_period varchar(250),
	qp_sm_group_change varchar(250),
	qp_sm_p_value varchar(250),
	ce_sm_no varchar(250),
	ce_sm_event_rate varchar(250),
	ce_time_to_event varchar(250),
	ce_reduction varchar(250),
	ce_p_value varchar(250),
	clinical_correlation varchar(2000),
	coefficient_value varchar(250),
	statistics_p_value varchar(250),
	statistics_description varchar(4000),
	primary_endpoint_type varchar(250),
	primary_endpoint_definition varchar(4000),
	primary_endpoint_test_name varchar(2000),
	primary_endpoint_time_period varchar(2000),
	primary_endpoint_change varchar(2000),
	primary_endpoint_p_value varchar(2000),
	secondary_endpoint_type varchar(2000),
	secondary_endpoint_definition varchar(4000),
	secondary_endpoint_test_name varchar(2000),
	secondary_endpoint_time_period varchar(4000),
	secondary_endpoint_change varchar(4000),
	secondary_endpoint_p_value varchar(4000)
);
ALTER TABLE biomart.ctd2_clin_inhib_effect OWNER TO biomart;
CREATE TABLE biomart.bio_disease (
	bio_disease_id bigint NOT NULL,
	disease varchar(510) NOT NULL,
	ccs_category varchar(510),
	icd10_code varchar(510),
	mesh_code varchar(510),
	icd9_code varchar(510),
	prefered_name varchar(510),
	etl_id_retired bigint,
	primary_source_cd varchar(30),
	etl_id varchar(50)
);
ALTER TABLE biomart.bio_disease OWNER TO biomart;
ALTER TABLE biomart.bio_disease ADD CONSTRAINT diseasedim_pk PRIMARY KEY (bio_disease_id);
CREATE UNIQUE INDEX bio_disease_pk ON biomart.bio_disease (bio_disease_id);
CREATE TABLE biomart.ctd_drug_inhib (
	ctd_study_id bigint,
	drug_inhibitor_common_name varchar(4000),
	drug_inhibitor_standard_name varchar(4000),
	drug_inhibitor_cas_id varchar(4000)
);
ALTER TABLE biomart.ctd_drug_inhib OWNER TO biomart;
CREATE TABLE biomart.ctd2_disease (
	ctd_disease_seq bigint,
	ctd_study_id bigint,
	disease_type_name varchar(500),
	disease_common_name varchar(500),
	icd10_name varchar(250),
	mesh_name varchar(250),
	study_type_name varchar(2000),
	physiology_name varchar(500)
);
ALTER TABLE biomart.ctd2_disease OWNER TO biomart;
CREATE TABLE biomart.bio_lit_ref_data (
	bio_lit_ref_data_id bigint NOT NULL,
	etl_id varchar(50),
	component varchar(100),
	component_class varchar(250),
	gene_id varchar(50),
	molecule_type varchar(50),
	variant varchar(250),
	reference_type varchar(50),
	reference_id varchar(250),
	reference_title varchar(2000),
	back_references varchar(1000),
	study_type varchar(250),
	disease varchar(250),
	disease_icd10 varchar(250),
	disease_mesh varchar(250),
	disease_site varchar(250),
	disease_stage varchar(250),
	disease_grade varchar(250),
	disease_types varchar(250),
	disease_description varchar(1000),
	physiology varchar(250),
	stat_clinical varchar(500),
	stat_clinical_correlation varchar(250),
	stat_tests varchar(500),
	stat_coefficient varchar(500),
	stat_p_value varchar(100),
	stat_description varchar(1000)
);
ALTER TABLE biomart.bio_lit_ref_data OWNER TO biomart;
ALTER TABLE biomart.bio_lit_ref_data ADD CONSTRAINT bio_lit_ref_data_pk PRIMARY KEY (bio_lit_ref_data_id);
CREATE TABLE biomart.bio_lit_amd_data (
	bio_lit_amd_data_id bigint NOT NULL,
	bio_lit_alt_data_id bigint NOT NULL,
	etl_id varchar(50),
	molecule varchar(50),
	molecule_type varchar(50),
	total_exp_percent varchar(50),
	total_exp_number varchar(100),
	total_exp_value varchar(100),
	total_exp_sd varchar(50),
	total_exp_unit varchar(50),
	over_exp_percent varchar(50),
	over_exp_number varchar(100),
	over_exp_value varchar(100),
	over_exp_sd varchar(50),
	over_exp_unit varchar(50),
	co_exp_percent varchar(50),
	co_exp_number varchar(100),
	co_exp_value varchar(100),
	co_exp_sd varchar(50),
	co_exp_unit varchar(50),
	mutation_type varchar(50),
	mutation_sites varchar(50),
	mutation_change varchar(50),
	mutation_percent varchar(50),
	mutation_number varchar(100),
	target_exp_percent varchar(50),
	target_exp_number varchar(100),
	target_exp_value varchar(100),
	target_exp_sd varchar(50),
	target_exp_unit varchar(50),
	target_over_exp_percent varchar(50),
	target_over_exp_number varchar(100),
	target_over_exp_value varchar(100),
	target_over_exp_sd varchar(50),
	target_over_exp_unit varchar(50),
	techniques varchar(250),
	description varchar(1000)
);
ALTER TABLE biomart.bio_lit_amd_data OWNER TO biomart;
ALTER TABLE biomart.bio_lit_amd_data ADD CONSTRAINT bio_lit_amd_data_pk PRIMARY KEY (bio_lit_amd_data_id);
CREATE TABLE biomart.bio_data_attribute (
	bio_data_attribute_id bigint NOT NULL,
	property_code varchar(200) NOT NULL,
	property_value varchar(200),
	bio_data_id bigint NOT NULL,
	property_unit varchar(100)
);
ALTER TABLE biomart.bio_data_attribute OWNER TO biomart;
ALTER TABLE biomart.bio_data_attribute ADD CONSTRAINT bio_data_attr_pk PRIMARY KEY (bio_data_attribute_id);
CREATE UNIQUE INDEX bio_data_attribute_pk ON biomart.bio_data_attribute (bio_data_attribute_id);
CREATE TABLE biomart.bio_lit_alt_data (
	bio_lit_alt_data_id bigint NOT NULL,
	bio_lit_ref_data_id bigint NOT NULL,
	in_vivo_model_id bigint,
	in_vitro_model_id bigint,
	etl_id varchar(50),
	alteration_type varchar(50),
	control varchar(1000),
	effect varchar(500),
	description varchar(1000),
	techniques varchar(1000),
	patients_percent varchar(500),
	patients_number varchar(500),
	pop_number varchar(250),
	pop_inclusion_criteria varchar(1000),
	pop_exclusion_criteria varchar(1000),
	pop_description varchar(1000),
	pop_type varchar(250),
	pop_value varchar(250),
	pop_phase varchar(250),
	pop_status varchar(250),
	pop_experimental_model varchar(250),
	pop_tissue varchar(250),
	pop_body_substance varchar(250),
	pop_localization varchar(1000),
	pop_cell_type varchar(250),
	clin_submucosa_marker_type varchar(250),
	clin_submucosa_unit varchar(250),
	clin_submucosa_value varchar(250),
	clin_asm_marker_type varchar(250),
	clin_asm_unit varchar(250),
	clin_asm_value varchar(250),
	clin_cellular_source varchar(250),
	clin_cellular_type varchar(250),
	clin_cellular_count varchar(250),
	clin_prior_med_percent varchar(250),
	clin_prior_med_dose varchar(250),
	clin_prior_med_name varchar(250),
	clin_baseline_variable varchar(250),
	clin_baseline_percent varchar(250),
	clin_baseline_value varchar(250),
	clin_smoker varchar(250),
	clin_atopy varchar(250),
	control_exp_percent varchar(50),
	control_exp_number varchar(50),
	control_exp_value varchar(50),
	control_exp_sd varchar(50),
	control_exp_unit varchar(100),
	over_exp_percent varchar(50),
	over_exp_number varchar(50),
	over_exp_value varchar(50),
	over_exp_sd varchar(50),
	over_exp_unit varchar(100),
	loss_exp_percent varchar(50),
	loss_exp_number varchar(50),
	loss_exp_value varchar(50),
	loss_exp_sd varchar(50),
	loss_exp_unit varchar(100),
	total_exp_percent varchar(50),
	total_exp_number varchar(50),
	total_exp_value varchar(50),
	total_exp_sd varchar(50),
	total_exp_unit varchar(100),
	glc_control_percent varchar(250),
	glc_molecular_change varchar(250),
	glc_type varchar(50),
	glc_percent varchar(100),
	glc_number varchar(100),
	ptm_region varchar(250),
	ptm_type varchar(250),
	ptm_change varchar(250),
	loh_loci varchar(250),
	mutation_type varchar(250),
	mutation_change varchar(250),
	mutation_sites varchar(250),
	epigenetic_region varchar(250),
	epigenetic_type varchar(250)
);
ALTER TABLE biomart.bio_lit_alt_data OWNER TO biomart;
ALTER TABLE biomart.bio_lit_alt_data ADD CONSTRAINT bio_lit_alt_data_pk PRIMARY KEY (bio_lit_alt_data_id);
CREATE TABLE biomart.bio_content_repository (
	bio_content_repo_id bigint NOT NULL,
	location varchar(510),
	active_y_n char(1),
	repository_type varchar(200) NOT NULL,
	location_type varchar(200)
);
ALTER TABLE biomart.bio_content_repository OWNER TO biomart;
ALTER TABLE biomart.bio_content_repository ADD CONSTRAINT external_file_repository_pk PRIMARY KEY (bio_content_repo_id);
CREATE UNIQUE INDEX bio_content_repository_pk ON biomart.bio_content_repository (bio_content_repo_id);
CREATE TABLE biomart.bio_data_taxonomy (
	bio_taxonomy_id bigint NOT NULL,
	bio_data_id bigint NOT NULL,
	etl_source varchar(100)
);
ALTER TABLE biomart.bio_data_taxonomy OWNER TO biomart;
CREATE TABLE biomart.bio_compound (
	bio_compound_id bigint NOT NULL,
	cnto_number varchar(200),
	jnj_number varchar(200),
	cas_registry varchar(400),
	code_name varchar(300),
	generic_name varchar(200),
	brand_name varchar(200),
	chemical_name varchar(1000),
	mechanism varchar(400),
	product_category varchar(200),
	description varchar(1000),
	etl_id_retired bigint,
	etl_id varchar(50),
	source_cd varchar(100)
);
ALTER TABLE biomart.bio_compound OWNER TO biomart;
ALTER TABLE biomart.bio_compound ADD CONSTRAINT compounddim_pk PRIMARY KEY (bio_compound_id);
CREATE UNIQUE INDEX bio_compound_pk ON biomart.bio_compound (bio_compound_id);
CREATE TABLE biomart.bio_data_correlation (
	bio_data_id bigint NOT NULL,
	asso_bio_data_id bigint NOT NULL,
	bio_data_correl_descr_id bigint NOT NULL,
	bio_data_correl_id bigint NOT NULL
);
ALTER TABLE biomart.bio_data_correlation OWNER TO biomart;
ALTER TABLE biomart.bio_data_correlation ADD CONSTRAINT bio_data_correlation_pk PRIMARY KEY (bio_data_correl_id);
CREATE INDEX bdc_index1 ON biomart.bio_data_correlation (asso_bio_data_id);
CREATE TABLE biomart.bio_assay_analysis_data_tea (
	bio_asy_analysis_data_id bigint NOT NULL,
	fold_change_ratio bigint,
	raw_pvalue double precision,
	adjusted_pvalue double precision,
	r_value double precision,
	rho_value double precision,
	bio_assay_analysis_id bigint NOT NULL,
	adjusted_p_value_code varchar(100),
	feature_group_name varchar(100) NOT NULL,
	bio_experiment_id bigint,
	bio_assay_platform_id bigint,
	etl_id varchar(100),
	preferred_pvalue double precision,
	cut_value double precision,
	results_value varchar(100),
	numeric_value double precision,
	numeric_value_code varchar(50),
	tea_normalized_pvalue double precision,
	bio_experiment_type varchar(50),
	bio_assay_feature_group_id bigint,
	tea_rank bigint
);
ALTER TABLE biomart.bio_assay_analysis_data_tea OWNER TO biomart;
ALTER TABLE biomart.bio_assay_analysis_data_tea ADD CONSTRAINT bio_aa_data_t_pk PRIMARY KEY (bio_asy_analysis_data_id);
CREATE INDEX idx_baadt_idx10 ON biomart.bio_assay_analysis_data_tea (bio_experiment_type,bio_asy_analysis_data_id);
CREATE INDEX BAADT_IDX10 ON biomart.BIO_ASSAY_ANALYSIS_DATA_TEA (BIO_ASSAY_FEATURE_GROUP_ID, BIO_EXPERIMENT_ID);
alter index biomart.BAADT_IDX10 set tablespace indx;

CREATE INDEX baadt_idx17 ON biomart.bio_assay_analysis_data_tea (bio_assay_analysis_id,tea_rank);
CREATE INDEX baadt_idx7 ON biomart.bio_assay_analysis_data_tea (bio_assay_analysis_id,bio_asy_analysis_data_id);
CREATE INDEX idx_baadt_fg_ad ON biomart.bio_assay_analysis_data_tea (bio_assay_feature_group_id,bio_assay_analysis_id);
CREATE INDEX baadt_idex12 ON biomart.bio_assay_analysis_data_tea (feature_group_name,bio_asy_analysis_data_id);
CREATE INDEX baadt_idx11 ON biomart.bio_assay_analysis_data_tea (bio_experiment_id,bio_assay_analysis_id,bio_asy_analysis_data_id);
CREATE INDEX baadt_f_idx13 ON biomart.bio_assay_analysis_data_tea (bio_assay_feature_group_id,bio_asy_analysis_data_id);
CREATE INDEX baadt_idx6 ON biomart.bio_assay_analysis_data_tea (bio_experiment_id,bio_assay_analysis_id);
CREATE TABLE biomart.bio_assay_feature_group (
	bio_assay_feature_group_id bigint NOT NULL,
	feature_group_name varchar(100) NOT NULL,
	feature_group_type varchar(50) NOT NULL
);
ALTER TABLE biomart.bio_assay_feature_group OWNER TO biomart;
ALTER TABLE biomart.bio_assay_feature_group ADD CONSTRAINT bio_asy_feature_grp_pk PRIMARY KEY (bio_assay_feature_group_id);
CREATE INDEX bio_asy_feature_grp_name_idx ON biomart.bio_assay_feature_group (feature_group_name,bio_assay_feature_group_id);
CREATE TABLE biomart.bio_experiment (
	bio_experiment_id bigint NOT NULL,
	bio_experiment_type varchar(200),
	title varchar(1000),
	description varchar(2000),
	design varchar(2000),
	start_date timestamp,
	completion_date timestamp,
	primary_investigator varchar(400),
	contact_field varchar(400),
	etl_id varchar(100),
	status varchar(100),
	overall_design varchar(2000),
	accession varchar(100),
	entrydt timestamp,
	updated timestamp,
	institution varchar(100),
	country varchar(50),
	biomarker_type varchar(255),
	target varchar(255),
	access_type varchar(100)
);
ALTER TABLE biomart.bio_experiment OWNER TO biomart;
ALTER TABLE biomart.bio_experiment ADD CONSTRAINT experimentdim_pk PRIMARY KEY (bio_experiment_id);
CREATE UNIQUE INDEX bio_experiment_pk ON biomart.bio_experiment (bio_experiment_id);
CREATE INDEX bio_exp_acen_idx ON biomart.bio_experiment (accession);
CREATE INDEX bio_exp_type_idx ON biomart.bio_experiment (bio_experiment_type);
CREATE TABLE biomart.bio_asy_analysis_dataset (
	bio_assay_dataset_id bigint NOT NULL,
	bio_assay_analysis_id bigint NOT NULL
);
ALTER TABLE biomart.bio_asy_analysis_dataset OWNER TO biomart;
ALTER TABLE biomart.bio_asy_analysis_dataset ADD CONSTRAINT bio_data_analysis_dataset_pk PRIMARY KEY (bio_assay_dataset_id,bio_assay_analysis_id);
CREATE UNIQUE INDEX bio_asy_analysis_dataset_pk ON biomart.bio_asy_analysis_dataset (bio_assay_dataset_id,bio_assay_analysis_id);
CREATE TABLE biomart.bio_content_reference (
	bio_content_reference_id bigint NOT NULL,
	bio_content_id bigint NOT NULL,
	bio_data_id bigint NOT NULL,
	content_reference_type varchar(200) NOT NULL,
	etl_id bigint,
	etl_id_c varchar(30)
);
ALTER TABLE biomart.bio_content_reference OWNER TO biomart;
ALTER TABLE biomart.bio_content_reference ADD CONSTRAINT bio_content_ref_n_pk PRIMARY KEY (bio_content_reference_id);
CREATE UNIQUE INDEX bio_content_reference_pk ON biomart.bio_content_reference (bio_content_reference_id);
CREATE TABLE biomart.bio_subject (
	bio_subject_id bigint NOT NULL,
	site_subject_id bigint,
	source varchar(200),
	source_code varchar(200),
	status varchar(200),
	organism varchar(200),
	bio_subject_type varchar(200) NOT NULL
);
ALTER TABLE biomart.bio_subject OWNER TO biomart;
ALTER TABLE biomart.bio_subject ADD CONSTRAINT bio_subject_pk PRIMARY KEY (bio_subject_id);
CREATE TABLE biomart.bio_cell_line (
	disease varchar(510),
	primary_site varchar(510),
	metastatic_site varchar(510),
	species varchar(510),
	attc_number varchar(510),
	cell_line_name varchar(510),
	bio_cell_line_id bigint NOT NULL,
	bio_disease_id bigint,
	origin varchar(200),
	description varchar(500),
	disease_stage varchar(100),
	disease_subtype varchar(200),
	etl_reference_link varchar(300)
);
ALTER TABLE biomart.bio_cell_line OWNER TO biomart;
ALTER TABLE biomart.bio_cell_line ADD CONSTRAINT celllinedictionary_pk PRIMARY KEY (bio_cell_line_id);
CREATE UNIQUE INDEX bio_cell_line_dict_pk ON biomart.bio_cell_line (bio_cell_line_id);
CREATE INDEX bio_cell_line_name_idx ON biomart.bio_cell_line (cell_line_name,bio_cell_line_id);
CREATE TABLE biomart.ctd_allowed_meds_treatment (
	ctd_study_id bigint,
	trtmt_ocs varchar(4000),
	trtmt_ics varchar(4000),
	trtmt_laba varchar(4000),
	trtmt_ltra varchar(4000),
	trtmt_corticosteroids varchar(4000),
	trtmt_anti_fibrotics varchar(4000),
	trtmt_immunosuppressive varchar(4000),
	trtmt_cytotoxic varchar(4000)
);
ALTER TABLE biomart.ctd_allowed_meds_treatment OWNER TO biomart;
CREATE TABLE biomart.bio_data_uid (
	bio_data_id bigint NOT NULL,
	unique_id varchar(300) NOT NULL,
	bio_data_type varchar(100) NOT NULL
);
ALTER TABLE biomart.bio_data_uid OWNER TO biomart;
ALTER TABLE biomart.bio_data_uid ADD CONSTRAINT bio_data_uid_uk UNIQUE (unique_id);
ALTER TABLE biomart.bio_data_uid ADD CONSTRAINT bio_data_uid_pk PRIMARY KEY (bio_data_id);
CREATE TABLE biomart.bio_lit_pe_data (
	bio_lit_pe_data_id bigint NOT NULL,
	bio_lit_ref_data_id bigint NOT NULL,
	in_vivo_model_id bigint,
	in_vitro_model_id bigint,
	etl_id varchar(50),
	description varchar(2000)
);
ALTER TABLE biomart.bio_lit_pe_data OWNER TO biomart;
ALTER TABLE biomart.bio_lit_pe_data ADD CONSTRAINT bio_lit_pe_data_pk PRIMARY KEY (bio_lit_pe_data_id);
CREATE TABLE biomart.bio_taxonomy (
	bio_taxonomy_id bigint NOT NULL,
	taxon_name varchar(200) NOT NULL,
	taxon_label varchar(200) NOT NULL,
	ncbi_tax_id varchar(200)
);
ALTER TABLE biomart.bio_taxonomy OWNER TO biomart;
ALTER TABLE biomart.bio_taxonomy ADD CONSTRAINT bio_taxon_pk PRIMARY KEY (bio_taxonomy_id);
CREATE TABLE biomart.bio_assay_data (
	bio_sample_id bigint,
	bio_assay_data_id bigint NOT NULL,
	log2_value double precision,
	log10_value double precision,
	numeric_value bigint,
	text_value varchar(200),
	float_value double precision,
	feature_group_name varchar(100) NOT NULL,
	bio_experiment_id bigint,
	bio_assay_dataset_id bigint,
	bio_assay_id bigint,
	etl_id bigint
);
ALTER TABLE biomart.bio_assay_data OWNER TO biomart;
ALTER TABLE biomart.bio_assay_data ADD CONSTRAINT bio_experiment_data_fact_pk PRIMARY KEY (bio_assay_data_id);
CREATE UNIQUE INDEX bio_assay_data_pk ON biomart.bio_assay_data (bio_assay_data_id);
CREATE TABLE biomart.bio_assay (
	bio_assay_id bigint NOT NULL,
	etl_id varchar(100) NOT NULL,
	study varchar(200),
	protocol varchar(200),
	description text,
	sample_type varchar(200),
	experiment_id bigint NOT NULL,
	test_date timestamp,
	sample_receive_date timestamp,
	requestor varchar(200),
	bio_assay_type varchar(200) NOT NULL,
	bio_assay_platform_id bigint
);
ALTER TABLE biomart.bio_assay OWNER TO biomart;
ALTER TABLE biomart.bio_assay ADD CONSTRAINT rbmorderdim_pk PRIMARY KEY (bio_assay_id);
CREATE UNIQUE INDEX bio_assay_pk ON biomart.bio_assay (bio_assay_id);
CREATE TABLE biomart.bio_cgdcp_data (
	evidence_code varchar(200),
	negation_indicator char(1),
	cell_line_id bigint,
	nci_disease_concept_code varchar(200),
	nci_role_code varchar(200),
	nci_drug_concept_code varchar(200),
	bio_data_id bigint NOT NULL
);
ALTER TABLE biomart.bio_cgdcp_data OWNER TO biomart;
ALTER TABLE biomart.bio_cgdcp_data ADD CONSTRAINT bio_cancer_gene_curation_fact_ PRIMARY KEY (bio_data_id);
CREATE UNIQUE INDEX bio_cgdcp_data_pk ON biomart.bio_cgdcp_data (bio_data_id);
CREATE TABLE biomart.bio_assay_platform (
	bio_assay_platform_id bigint NOT NULL,
	platform_name varchar(200),
	platform_version varchar(200),
	platform_description varchar(2000),
	platform_array varchar(50),
	platform_accession varchar(20),
	platform_organism varchar(200),
	platform_vendor varchar(200)
);
ALTER TABLE biomart.bio_assay_platform OWNER TO biomart;
ALTER TABLE biomart.bio_assay_platform ADD CONSTRAINT bio_assay_platform_pk PRIMARY KEY (bio_assay_platform_id);
CREATE TABLE biomart.bio_data_disease (
	bio_data_id bigint NOT NULL,
	bio_disease_id bigint NOT NULL,
	etl_source varchar(100)
);
ALTER TABLE biomart.bio_data_disease OWNER TO biomart;
ALTER TABLE biomart.bio_data_disease ADD CONSTRAINT bio_data_disease_pk PRIMARY KEY (bio_data_id,bio_disease_id);
CREATE INDEX bio_dt_dis_did_idx ON biomart.bio_data_disease (bio_data_id);
CREATE INDEX bio_dd_idx2 ON biomart.bio_data_disease (bio_disease_id);
CREATE TABLE biomart.bio_stats_exp_marker (
	bio_marker_id bigint NOT NULL,
	bio_experiment_id bigint NOT NULL,
	bio_stats_exp_marker_id bigint
);
ALTER TABLE biomart.bio_stats_exp_marker OWNER TO biomart;
ALTER TABLE biomart.bio_stats_exp_marker ADD CONSTRAINT bio_s_e_m_pk PRIMARY KEY (bio_marker_id,bio_experiment_id);
CREATE INDEX bio_stats_exp_mk_mk_idx ON biomart.bio_stats_exp_marker (bio_marker_id);
CREATE INDEX bio_stats_exp_mk_exp_idx ON biomart.bio_stats_exp_marker (bio_experiment_id);
CREATE TABLE biomart.bio_marker (
	bio_marker_id bigint NOT NULL,
	bio_marker_name varchar(200),
	bio_marker_description varchar(1000),
	organism varchar(200),
	primary_source_code varchar(200),
	primary_external_id varchar(200),
	bio_marker_type varchar(200) NOT NULL
);
ALTER TABLE biomart.bio_marker OWNER TO biomart;
ALTER TABLE biomart.bio_marker ADD CONSTRAINT biomarker_pk PRIMARY KEY (bio_marker_id);
ALTER TABLE biomart.bio_marker ADD CONSTRAINT sys_c0020430 UNIQUE (organism,primary_external_id);
CREATE UNIQUE INDEX bio_marker_pk ON biomart.bio_marker (bio_marker_id);
CREATE INDEX bio_mkr_type_idx ON biomart.bio_marker (bio_marker_type);
CREATE INDEX bio_mkr_ext_id ON biomart.bio_marker (primary_external_id);
CREATE TABLE biomart.bio_assay_dataset (
	bio_assay_dataset_id bigint NOT NULL,
	dataset_name varchar(400),
	dataset_description varchar(1000),
	dataset_criteria varchar(1000),
	create_date timestamp,
	bio_experiment_id bigint NOT NULL,
	bio_assay_id bigint,
	etl_id varchar(100),
	accession varchar(50)
);
ALTER TABLE biomart.bio_assay_dataset OWNER TO biomart;
ALTER TABLE biomart.bio_assay_dataset ADD CONSTRAINT bio_dataset_pk PRIMARY KEY (bio_assay_dataset_id);
CREATE UNIQUE INDEX bio_assay_dataset_pk ON biomart.bio_assay_dataset (bio_assay_dataset_id);
CREATE TABLE biomart.bio_clinc_trial_time_pt (
	bio_clinc_trial_tm_pt_id bigint NOT NULL,
	time_point varchar(200),
	time_point_code varchar(200),
	start_date timestamp,
	end_date timestamp,
	bio_experiment_id bigint NOT NULL
);
ALTER TABLE biomart.bio_clinc_trial_time_pt OWNER TO biomart;
ALTER TABLE biomart.bio_clinc_trial_time_pt ADD CONSTRAINT bio_clinical_trial_time_point_ PRIMARY KEY (bio_clinc_trial_tm_pt_id);
CREATE UNIQUE INDEX bio_clinc_trial_time_pt_pk ON biomart.bio_clinc_trial_time_pt (bio_clinc_trial_tm_pt_id);
CREATE TABLE biomart.bio_lit_model_data (
	bio_lit_model_data_id bigint NOT NULL,
	etl_id varchar(50),
	model_type varchar(50),
	description varchar(1000),
	stimulation varchar(1000),
	control_challenge varchar(500),
	challenge varchar(1000),
	sentization varchar(1000),
	zygosity varchar(250),
	experimental_model varchar(250),
	animal_wild_type varchar(250),
	tissue varchar(250),
	cell_type varchar(250),
	cell_line varchar(250),
	body_substance varchar(250),
	component varchar(250),
	gene_id varchar(250)
);
ALTER TABLE biomart.bio_lit_model_data OWNER TO biomart;
ALTER TABLE biomart.bio_lit_model_data ADD CONSTRAINT bio_lit_model_data_pk PRIMARY KEY (bio_lit_model_data_id);
CREATE TABLE biomart.bio_data_ext_code (
	bio_data_id bigint NOT NULL,
	code varchar(500) NOT NULL,
	code_source varchar(200),
	code_type varchar(200),
	bio_data_type varchar(100),
	bio_data_ext_code_id bigint NOT NULL,
	etl_id varchar(50)
);
ALTER TABLE biomart.bio_data_ext_code OWNER TO biomart;
ALTER TABLE biomart.bio_data_ext_code ADD CONSTRAINT bio_data_ext_code_pk PRIMARY KEY (bio_data_ext_code_id);
CREATE INDEX bio_data_e_c_c_idx ON biomart.bio_data_ext_code (code);
CREATE INDEX bio_d_e_c_did_ct_idx ON biomart.bio_data_ext_code (bio_data_id,code_type);
CREATE INDEX bio_data_e_c_t_idx ON biomart.bio_data_ext_code (code_type);
CREATE TABLE biomart.ctd_inclusion_criteria (
	ctd_study_id bigint,
	inhaled_steroid_dose varchar(4000),
	laba varchar(4000),
	ocs varchar(4000),
	xolair varchar(4000),
	ltra_inhibitors varchar(4000),
	asthma_phenotype varchar(4000),
	fev1 varchar(4000)
);
ALTER TABLE biomart.ctd_inclusion_criteria OWNER TO biomart;
CREATE TABLE biomart.bio_asy_analysis_pltfm (
	bio_asy_analysis_pltfm_id bigint NOT NULL,
	platform_name varchar(200),
	platform_version varchar(200),
	platform_description varchar(1000)
);
ALTER TABLE biomart.bio_asy_analysis_pltfm OWNER TO biomart;
ALTER TABLE biomart.bio_asy_analysis_pltfm ADD CONSTRAINT bio_assay_analysis_platform_pk PRIMARY KEY (bio_asy_analysis_pltfm_id);
CREATE UNIQUE INDEX bio_asy_analysis_pltfm_pk ON biomart.bio_asy_analysis_pltfm (bio_asy_analysis_pltfm_id);
CREATE TABLE biomart.bio_clinical_trial_design (
	ref_id varchar(4000),
	ref_record_id varchar(4000),
	ref_back_reference varchar(4000),
	ref_article_pmid varchar(4000),
	ref_protocol_id varchar(4000),
	ref_title varchar(4000),
	study_type varchar(4000),
	common_name varchar(4000),
	icd10 varchar(4000),
	mesh varchar(4000),
	disease_type varchar(4000),
	physiology_name varchar(4000),
	trial_status varchar(4000),
	trial_phase varchar(4000),
	nature_of_trial varchar(4000),
	randomization varchar(4000),
	blinded_trial varchar(4000),
	trial_type varchar(4000),
	run_n_period varchar(4000),
	treatment_period varchar(4000),
	washout_period varchar(4000),
	open_label_extension varchar(4000),
	sponsor varchar(4000),
	trial_nbr_of_patients_studied varchar(4000),
	source_type varchar(4000),
	trial_age varchar(4000),
	disease_severity varchar(4000),
	difficult_to_treat varchar(4000),
	asthma_diagnosis varchar(4000),
	inhaled_steroid_dose varchar(4000),
	laba varchar(4000),
	ocs varchar(4000),
	xolair varchar(4000),
	ltra_inhibitors varchar(4000),
	asthma_phenotype varchar(4000),
	fev1 varchar(4000),
	fev1_reversibility varchar(4000),
	tlc varchar(4000),
	fev1_fvc varchar(4000),
	fvc varchar(4000),
	dlco varchar(4000),
	sgrq varchar(4000),
	hrct varchar(4000),
	biopsy varchar(4000),
	dyspnea_on_exertion varchar(4000),
	concomitant_med varchar(4000),
	trial_smokers_pct varchar(4000),
	trial_former_smokers_pct varchar(4000),
	trial_never_smokers_pct varchar(4000),
	trial_pack_years varchar(4000),
	exclusion_criteria varchar(4000),
	minimal_symptoms varchar(4000),
	rescue_medication_use varchar(4000),
	control_details varchar(4000),
	blinding_procedure varchar(4000),
	number_of_arms varchar(4000),
	description varchar(4000),
	arm varchar(4000),
	arm_nbr_of_patients_studied varchar(4000),
	arm_classification_type varchar(4000),
	arm_classification_value varchar(4000),
	arm_asthma_duration varchar(4000),
	arm_geographic_region varchar(4000),
	arm_age varchar(4000),
	arm_gender varchar(4000),
	arm_smokers_pct varchar(4000),
	arm_former_smokers_pct varchar(4000),
	arm_never_smokers_pct varchar(4000),
	arm_pack_years varchar(4000),
	minority_participation varchar(4000),
	baseline_symptom_score varchar(4000),
	baseline_rescue_medication_use varchar(4000),
	clinical_variable varchar(4000),
	clinical_variable_pct varchar(4000),
	clinical_variable_value varchar(4000),
	prior_med_drug_name varchar(4000),
	prior_med_pct varchar(4000),
	prior_med_value varchar(4000),
	biomarker_name varchar(4000),
	biomarker_pct varchar(4000),
	biomarkervalue varchar(4000),
	cellinfo_type varchar(4000),
	cellinfo_count varchar(4000),
	cellinfo_source varchar(4000),
	pulmonary_pathology_name varchar(4000),
	pulmpath_patient_pct varchar(4000),
	pulmpath_value_unit varchar(4000),
	pulmpath_method varchar(4000),
	runin_ocs varchar(4000),
	runin_ics varchar(4000),
	runin_laba varchar(4000),
	runin_ltra varchar(4000),
	runin_corticosteroids varchar(4000),
	runin_anti_fibrotics varchar(4000),
	runin_immunosuppressive varchar(4000),
	runin_cytotoxic varchar(4000),
	runin_description varchar(4000),
	trtmt_ocs varchar(4000),
	trtmt_ics varchar(4000),
	trtmt_laba varchar(4000),
	trtmt_ltra varchar(4000),
	trtmt_corticosteroids varchar(4000),
	trtmt_anti_fibrotics varchar(4000),
	trtmt_immunosuppressive varchar(4000),
	trtmt_cytotoxic varchar(4000),
	trtmt_description varchar(4000),
	drug_inhibitor_common_name varchar(4000),
	drug_inhibitor_standard_name varchar(4000),
	drug_inhibitor_cas_id varchar(4000),
	drug_inhibitor_dose varchar(4000),
	drug_inhibitor_route_of_admin varchar(4000),
	drug_inhibitor_trtmt_regime varchar(4000),
	comparator_name varchar(4000),
	comparator_dose varchar(4000),
	comparator_time_period varchar(4000),
	comparator_route_of_admin varchar(4000),
	treatment_regime varchar(4000),
	placebo varchar(4000),
	experiment_description varchar(4000),
	primary_endpoint_type varchar(4000),
	primary_endpoint_definition varchar(4000),
	primary_endpoint_time_period varchar(4000),
	primary_endpoint_change varchar(4000),
	primary_endpoint_p_value varchar(4000),
	primary_endpoint_stat_test varchar(4000),
	secondary_type varchar(4000),
	secondary_type_definition varchar(4000),
	secondary_type_time_period varchar(4000),
	secondary_type_change varchar(4000),
	secondary_type_p_value varchar(4000),
	secondary_type_stat_test varchar(4000),
	clinical_variable_name varchar(4000),
	pct_change_from_baseline varchar(4000),
	abs_change_from_baseline varchar(4000),
	rate_of_change_from_baseline varchar(4000),
	average_over_treatment_period varchar(4000),
	within_group_changes varchar(4000),
	stat_measure_p_value varchar(4000),
	definition_of_the_event varchar(4000),
	number_of_events varchar(4000),
	event_rate varchar(4000),
	time_to_event varchar(4000),
	event_pct_reduction varchar(4000),
	event_p_value varchar(4000),
	event_description varchar(4000),
	discontinuation_rate varchar(4000),
	response_rate varchar(4000),
	downstream_signaling_effects varchar(4000),
	beneficial_effects varchar(4000),
	adverse_effects varchar(4000),
	pk_pd_parameter varchar(4000),
	pk_pd_value varchar(4000),
	effect_description varchar(4000),
	biomolecule_name varchar(4000),
	biomolecule_id varchar(4000),
	biomolecule_type varchar(4000),
	biomarker varchar(4000),
	biomarker_type varchar(4000),
	baseline_expr_pct varchar(4000),
	baseline_expr_number varchar(4000),
	baseline_expr_value_fold_mean varchar(4000),
	baseline_expr_sd varchar(4000),
	baseline_expr_sem varchar(4000),
	baseline_expr_unit varchar(4000),
	expr_after_trtmt_pct varchar(4000),
	expr_after_trtmt_number varchar(4000),
	expr_aftertrtmt_valuefold_mean varchar(4000),
	expr_after_trtmt_sd varchar(4000),
	expr_after_trtmt_sem varchar(4000),
	expr_after_trtmt_unit varchar(4000),
	expr_chg_source_type varchar(4000),
	expr_chg_technique varchar(4000),
	expr_chg_description varchar(4000),
	clinical_correlation varchar(4000),
	statistical_test varchar(4000),
	statistical_coefficient_value varchar(4000),
	statistical_test_p_value varchar(4000),
	statistical_test_description varchar(4000)
);
ALTER TABLE biomart.bio_clinical_trial_design OWNER TO biomart;
CREATE TABLE biomart.tmp_analysis_data_tea_rank (
	analysis_data_id bigint NOT NULL,
	analysis_id bigint NOT NULL,
	rank1 bigint
);
ALTER TABLE biomart.tmp_analysis_data_tea_rank OWNER TO biomart;
CREATE INDEX tmp_a_d_tea_r_index1 ON biomart.tmp_analysis_data_tea_rank (analysis_data_id);

CREATE TABLE biomart.bio_asy_data_stats_all (
	bio_assay_data_stats_id bigint NOT NULL,
	bio_sample_count bigint,
	quartile_1 double precision,
	quartile_2 double precision,
	quartile_3 double precision,
	max_value double precision,
	min_value double precision,
	bio_sample_id bigint,
	feature_group_name varchar(120),
	value_normalize_method varchar(50),
	bio_experiment_id bigint,
	mean_value double precision,
	std_dev_value double precision,
	bio_assay_dataset_id bigint
);
ALTER TABLE biomart.bio_asy_data_stats_all OWNER TO biomart;
ALTER TABLE biomart.bio_asy_data_stats_all ADD CONSTRAINT bio_asy_dt_stats_pk PRIMARY KEY (bio_assay_data_stats_id);
CREATE INDEX bio_a__d_s_f_g_idx ON biomart.bio_asy_data_stats_all (feature_group_name);
CREATE INDEX bio_a__d_s_ds_idx ON biomart.bio_asy_data_stats_all (bio_assay_dataset_id);
CREATE INDEX bio_a__d_s_exp_idx ON biomart.bio_asy_data_stats_all (bio_experiment_id);
CREATE TABLE biomart.ctd2_study (
	ctd_study_id bigint,
	ref_article_protocol_id varchar(1000),
	reference_id integer NOT NULL,
	pubmed_id varchar(250),
	pubmed_title varchar(2000),
	protocol_id varchar(1000),
	protocol_title varchar(2000)
);
ALTER TABLE biomart.ctd2_study OWNER TO biomart;
CREATE TABLE biomart.bio_lit_inh_data (
	bio_lit_inh_data_id bigint NOT NULL,
	bio_lit_ref_data_id bigint,
	etl_id varchar(50),
	trial_type varchar(250),
	trial_phase varchar(250),
	trial_status varchar(250),
	trial_experimental_model varchar(250),
	trial_tissue varchar(250),
	trial_body_substance varchar(250),
	trial_description varchar(1000),
	trial_designs varchar(250),
	trial_cell_line varchar(250),
	trial_cell_type varchar(250),
	trial_patients_number varchar(100),
	trial_inclusion_criteria varchar(2000),
	inhibitor varchar(250),
	inhibitor_standard_name varchar(250),
	casid varchar(250),
	description varchar(1000),
	concentration varchar(250),
	time_exposure varchar(500),
	administration varchar(250),
	treatment varchar(2000),
	techniques varchar(1000),
	effect_molecular varchar(250),
	effect_percent varchar(250),
	effect_number varchar(50),
	effect_value varchar(250),
	effect_sd varchar(250),
	effect_unit varchar(250),
	effect_response_rate varchar(250),
	effect_downstream varchar(2000),
	effect_beneficial varchar(2000),
	effect_adverse varchar(2000),
	effect_description varchar(2000),
	effect_pharmacos varchar(2000),
	effect_potentials varchar(2000)
);
ALTER TABLE biomart.bio_lit_inh_data OWNER TO biomart;
ALTER TABLE biomart.bio_lit_inh_data ADD CONSTRAINT bio_lit_inh_data_pk PRIMARY KEY (bio_lit_inh_data_id);
CREATE TABLE biomart.bio_lit_int_data (
	bio_lit_int_data_id bigint NOT NULL,
	bio_lit_ref_data_id bigint NOT NULL,
	in_vivo_model_id bigint,
	in_vitro_model_id bigint,
	etl_id varchar(50),
	source_component varchar(100),
	source_gene_id varchar(50),
	target_component varchar(100),
	target_gene_id varchar(50),
	interaction_mode varchar(250),
	regulation varchar(1000),
	mechanism varchar(250),
	effect varchar(500),
	localization varchar(500),
	region varchar(250),
	techniques varchar(1000)
);
ALTER TABLE biomart.bio_lit_int_data OWNER TO biomart;
ALTER TABLE biomart.bio_lit_int_data ADD CONSTRAINT bio_lit_int_data_pk PRIMARY KEY (bio_lit_int_data_id);
CREATE TABLE biomart.bio_assay_data_stats (
	bio_assay_data_stats_id bigint NOT NULL,
	bio_sample_count bigint,
	quartile_1 double precision,
	quartile_2 double precision,
	quartile_3 double precision,
	max_value double precision,
	min_value double precision,
	bio_sample_id bigint,
	feature_group_name varchar(120),
	value_normalize_method varchar(50),
	bio_experiment_id bigint,
	mean_value double precision,
	std_dev_value double precision,
	bio_assay_dataset_id bigint,
	bio_assay_feature_group_id bigint NOT NULL
);
ALTER TABLE biomart.bio_assay_data_stats OWNER TO biomart;
ALTER TABLE biomart.bio_assay_data_stats ADD CONSTRAINT bio_asy_dt_stats_s_pk PRIMARY KEY (bio_assay_data_stats_id);
CREATE INDEX bio_a_d_s_exp__s_idx ON biomart.bio_assay_data_stats (bio_experiment_id);
CREATE INDEX bio_a_d_s_f_g_s_idx ON biomart.bio_assay_data_stats (feature_group_name,bio_assay_data_stats_id);
CREATE INDEX bio_a_d_s_ds__s_idx ON biomart.bio_assay_data_stats (bio_assay_dataset_id);
CREATE INDEX bio_a_d_s_fgi_s_idx ON biomart.bio_assay_data_stats (bio_assay_feature_group_id,bio_assay_data_stats_id);
CREATE TABLE biomart.ctd_sec_endpts (
	ctd_study_id bigint,
	secondary_type varchar(4000),
	secondary_type_definition varchar(4000),
	secondary_type_time_period varchar(4000),
	secondary_type_change varchar(4000),
	secondary_type_p_value varchar(4000),
	id bigint
);
ALTER TABLE biomart.ctd_sec_endpts OWNER TO biomart;
CREATE TABLE biomart.bio_assay_sample (
	bio_assay_id bigint NOT NULL,
	bio_sample_id bigint NOT NULL,
	bio_clinic_trial_timepoint_id bigint NOT NULL
);
ALTER TABLE biomart.bio_assay_sample OWNER TO biomart;
ALTER TABLE biomart.bio_assay_sample ADD CONSTRAINT bio_assay_sample_pk PRIMARY KEY (bio_assay_id,bio_sample_id,bio_clinic_trial_timepoint_id);
CREATE TABLE biomart.ctd2_trial_details (
	ctd_td_seq bigint,
	ctd_study_id bigint,
	control varchar(2000),
	blinding_procedure varchar(2000),
	no_of_arms varchar(2000),
	sponsor varchar(2000),
	patient_studied varchar(2000),
	source_type varchar(2000),
	trial_description varchar(4000),
	arm_name varchar(250),
	patient_study varchar(250),
	class_type varchar(250),
	class_value varchar(250),
	asthma_duration varchar(250),
	region varchar(250),
	age varchar(100),
	gender varchar(100),
	minor_participation varchar(100),
	symptom_score varchar(100),
	rescue_medication varchar(2000),
	therapeutic_intervention varchar(255),
	smokers varchar(255),
	former_smokers varchar(255),
	never_smokers varchar(255),
	smoking_pack_years varchar(255),
	pulm_path_name varchar(255),
	pulm_path_pct varchar(50),
	pulm_path_value varchar(50),
	pulm_path_method varchar(255),
	allow_med_therapy_ocs varchar(1000),
	allow_med_therapy_ics varchar(1000),
	allow_med_therapy_laba varchar(1000),
	allow_med_therapy_ltra varchar(1000),
	allow_med_therapy_desc varchar(4000),
	allow_med_therapy_cortster varchar(1000),
	allow_med_therapy_immuno varchar(1000),
	allow_med_therapy_cyto varchar(1000),
	allow_med_treat_ocs varchar(1000),
	allow_med_treat_ics varchar(1000),
	allow_med_treat_laba varchar(1000),
	allow_med_treat_ltra varchar(1000),
	allow_med_treat_desc varchar(4000),
	allow_med_treat_cortster varchar(1000),
	allow_med_treat_immuno varchar(1000),
	allow_med_treat_cyto varchar(1000),
	pat_char_base_clin_var varchar(500),
	pat_char_base_clin_var_pct varchar(250),
	pat_char_base_clin_var_value varchar(250),
	biomarker_name_name varchar(250),
	pat_char_biomarker_pct varchar(250),
	pat_char_biomarker_value varchar(250),
	pat_char_cellinfo_name varchar(250),
	pat_char_cellinfo_type varchar(250),
	pat_char_cellinfo_count varchar(250),
	pat_char_priormed_name varchar(250),
	pat_char_priormed_pct varchar(500),
	pat_char_priormed_dose varchar(250),
	disease_phenotype_name varchar(1000),
	disease_severity_name varchar(500),
	incl_age varchar(2000),
	incl_difficult_to_treat varchar(2000),
	incl_disease_diagnosis varchar(2000),
	incl_steroid_dose varchar(2000),
	incl_laba varchar(2000),
	incl_ocs varchar(2000),
	incl_xolair varchar(2000),
	incl_ltra_inhibitor varchar(2000),
	incl_fev1 varchar(2000),
	incl_fev1_reversibility varchar(2000),
	incl_smoking varchar(2000),
	incl_tlc varchar(2000),
	incl_fvc varchar(2000),
	incl_dlco varchar(2000),
	incl_sgrq varchar(2000),
	incl_hrct varchar(2000),
	incl_biopsy varchar(2000),
	incl_dypsnea_on_exertion varchar(2000),
	incl_concomitant_med varchar(2000),
	incl_former_smokers varchar(2000),
	incl_never_smokers varchar(2000),
	incl_smoking_pack_years varchar(2000),
	incl_fev_fvc varchar(2000),
	trial_des_minimal_symptom varchar(2000),
	trial_des_rescue_med varchar(4000),
	trial_des_exclusion_criteria varchar(4000),
	trial_des_open_label_status varchar(250),
	trial_des_random_status varchar(250),
	trial_des_nature_of_trial varchar(250),
	trial_des_blinded_status varchar(250),
	trial_des_run_in_period varchar(2000),
	trial_des_treatment varchar(2000),
	trial_des_washout_period varchar(2000),
	trial_status_name varchar(2000),
	trial_phase_name varchar(2000)
);
ALTER TABLE biomart.ctd2_trial_details OWNER TO biomart;
CREATE TABLE biomart.bio_curation_dataset (
	bio_curation_dataset_id bigint NOT NULL,
	bio_asy_analysis_pltfm_id bigint,
	bio_source_import_id bigint,
	bio_curation_type varchar(200) NOT NULL,
	create_date timestamp,
	creator bigint,
	bio_curation_name varchar(500),
	data_type varchar(100)
);
ALTER TABLE biomart.bio_curation_dataset OWNER TO biomart;
ALTER TABLE biomart.bio_curation_dataset ADD CONSTRAINT bio_external_analysis_pk PRIMARY KEY (bio_curation_dataset_id);
CREATE UNIQUE INDEX bio_curation_dataset_pk ON biomart.bio_curation_dataset (bio_curation_dataset_id);
CREATE TABLE biomart.bio_lit_sum_data (
	bio_lit_sum_data_id bigint NOT NULL,
	etl_id varchar(50),
	disease_site varchar(250),
	target varchar(50),
	variant varchar(50),
	data_type varchar(50),
	alteration_type varchar(100),
	total_frequency varchar(50),
	total_affected_cases varchar(50),
	summary varchar(1000)
);
ALTER TABLE biomart.bio_lit_sum_data OWNER TO biomart;
ALTER TABLE biomart.bio_lit_sum_data ADD CONSTRAINT bio_lit_sum_data_pk PRIMARY KEY (bio_lit_sum_data_id);
CREATE TABLE biomart.ctd_primary_endpts (
	ctd_study_id bigint,
	primary_type varchar(4000),
	primary_type_definition varchar(4000),
	primary_type_time_period varchar(4000),
	primary_type_change varchar(4000),
	primary_type_p_value varchar(4000),
	id bigint
);
ALTER TABLE biomart.ctd_primary_endpts OWNER TO biomart;
CREATE TABLE biomart.bio_data_correl_descr (
	bio_data_correl_descr_id bigint NOT NULL,
	correlation varchar(510),
	description varchar(1000),
	type_name varchar(200),
	status varchar(200),
	source varchar(100),
	source_code varchar(200)
);
ALTER TABLE biomart.bio_data_correl_descr OWNER TO biomart;
ALTER TABLE biomart.bio_data_correl_descr ADD CONSTRAINT bio_marker_relationship_pk PRIMARY KEY (bio_data_correl_descr_id);
CREATE UNIQUE INDEX bio_data_correl_descr_pk ON biomart.bio_data_correl_descr (bio_data_correl_descr_id);
CREATE TABLE biomart.ctd_biomarker (
	ctd_study_id bigint,
	biomarker_name varchar(4000),
	biomarker_pct varchar(4000),
	biomarker_value varchar(4000)
);
ALTER TABLE biomart.ctd_biomarker OWNER TO biomart;
CREATE TABLE biomart.ctd_disease (
	ctd_study_id bigint,
	common_name varchar(4000),
	icd10 varchar(4000),
	mesh varchar(4000),
	disease_severity varchar(4000)
);
ALTER TABLE biomart.ctd_disease OWNER TO biomart;
CREATE TABLE biomart.bio_assay_analysis_data (
	bio_asy_analysis_data_id bigint NOT NULL,
	fold_change_ratio bigint,
	raw_pvalue double precision,
	adjusted_pvalue double precision,
	r_value double precision,
	rho_value double precision,
	bio_assay_analysis_id bigint NOT NULL,
	adjusted_p_value_code varchar(100),
	feature_group_name varchar(100) NOT NULL,
	bio_experiment_id bigint,
	bio_assay_platform_id bigint,
	etl_id varchar(100),
	preferred_pvalue double precision,
	cut_value double precision,
	results_value varchar(100),
	numeric_value double precision,
	numeric_value_code varchar(50),
	tea_normalized_pvalue double precision,
	bio_assay_feature_group_id bigint
);
ALTER TABLE biomart.bio_assay_analysis_data OWNER TO biomart;
CREATE INDEX baad_fgn_idx ON biomart.bio_assay_analysis_data (feature_group_name);
CREATE INDEX baad_idx6 ON biomart.bio_assay_analysis_data (bio_experiment_id,bio_assay_analysis_id);
CREATE INDEX bad_idx13 ON biomart.bio_assay_analysis_data (bio_assay_analysis_id,bio_assay_feature_group_id);
CREATE INDEX baad_idx4 ON biomart.bio_assay_analysis_data (bio_assay_platform_id);
CREATE UNIQUE INDEX pk_baad ON biomart.bio_assay_analysis_data (bio_asy_analysis_data_id);
CREATE INDEX baad_idx12 ON biomart.bio_assay_analysis_data (bio_experiment_id,bio_assay_analysis_id,bio_assay_feature_group_id);
CREATE INDEX baad_idx14 ON biomart.bio_assay_analysis_data (bio_assay_feature_group_id,bio_asy_analysis_data_id);
CREATE INDEX baad_idx11 ON biomart.bio_assay_analysis_data (bio_experiment_id,bio_assay_analysis_id,bio_asy_analysis_data_id);
CREATE INDEX baad_idx7 ON biomart.bio_assay_analysis_data (bio_assay_analysis_id,bio_asy_analysis_data_id);
CREATE TABLE biomart.ctd2_inhib_details (
	ctd_inhib_seq bigint,
	ctd_study_id bigint,
	common_name_name varchar(500),
	standard_name_name varchar(500),
	experimental_detail_dose varchar(4000),
	exp_detail_exposure_period varchar(4000),
	exp_detail_treatment_name varchar(4000),
	exp_detail_admin_route varchar(4000),
	exp_detail_description varchar(4000),
	exp_detail_placebo varchar(250),
	comparator_name_name varchar(250),
	comp_treatment_name varchar(4000),
	comp_admin_route varchar(4000),
	comp_dose varchar(2000),
	comp_exposure_period varchar(2000)
);
ALTER TABLE biomart.ctd2_inhib_details OWNER TO biomart;
CREATE TABLE biomart.bio_clinical_trial (
	trial_number varchar(510),
	study_owner varchar(510),
	study_phase varchar(100),
	blinding_procedure varchar(1000),
	studytype varchar(510),
	duration_of_study_weeks integer,
	number_of_patients integer,
	number_of_sites integer,
	route_of_administration varchar(510),
	dosing_regimen varchar(3500),
	group_assignment varchar(510),
	type_of_control varchar(510),
	completion_date timestamp,
	primary_end_points varchar(2000),
	secondary_end_points varchar(3500),
	inclusion_criteria text,
	exclusion_criteria text,
	subjects varchar(2000),
	gender_restriction_mfb varchar(510),
	min_age integer,
	max_age integer,
	secondary_ids varchar(510),
	bio_experiment_id bigint NOT NULL,
	development_partner varchar(100),
	geo_platform varchar(30),
	main_findings varchar(2000),
	platform_name varchar(200),
	search_area varchar(100)
);
ALTER TABLE biomart.bio_clinical_trial OWNER TO biomart;
ALTER TABLE biomart.bio_clinical_trial ADD CONSTRAINT clinicaltrialdim_pk PRIMARY KEY (bio_experiment_id);
CREATE UNIQUE INDEX bio_clinical_trial_pk ON biomart.bio_clinical_trial (bio_experiment_id);
CREATE TABLE biomart.bio_clinc_trial_pt_group (
	bio_experiment_id bigint NOT NULL,
	bio_clinical_trial_p_group_id bigint NOT NULL,
	name varchar(510),
	description varchar(1000),
	number_of_patients integer,
	patient_group_type_code varchar(200)
);
ALTER TABLE biomart.bio_clinc_trial_pt_group OWNER TO biomart;
ALTER TABLE biomart.bio_clinc_trial_pt_group ADD CONSTRAINT bio_clinical_trial_pt_group PRIMARY KEY (bio_clinical_trial_p_group_id);
CREATE UNIQUE INDEX bio_clinc_trial_pt_group_pk ON biomart.bio_clinc_trial_pt_group (bio_clinical_trial_p_group_id);
CREATE TABLE biomart.bio_patient (
	bio_patient_id bigint NOT NULL,
	first_name varchar(200),
	last_name varchar(200),
	middle_name varchar(200),
	birth_date timestamp,
	birth_date_orig varchar(200),
	gender_code varchar(200),
	race_code varchar(200),
	ethnic_group_code varchar(200),
	address_zip_code varchar(200),
	country_code varchar(200),
	informed_consent_code varchar(200),
	bio_experiment_id bigint,
	bio_clinical_trial_p_group_id bigint
);
ALTER TABLE biomart.bio_patient OWNER TO biomart;
ALTER TABLE biomart.bio_patient ADD CONSTRAINT bio_patient_pk PRIMARY KEY (bio_patient_id);
CREATE TABLE biomart.bio_concept_code (
	bio_concept_code varchar(200),
	code_name varchar(200),
	code_description varchar(1000),
	code_type_name varchar(200),
	bio_concept_code_id bigint NOT NULL
);
ALTER TABLE biomart.bio_concept_code OWNER TO biomart;
ALTER TABLE biomart.bio_concept_code ADD CONSTRAINT bio_concept_code_uk UNIQUE (bio_concept_code,code_type_name);
ALTER TABLE biomart.bio_concept_code ADD CONSTRAINT bio_concept_code_pk PRIMARY KEY (bio_concept_code_id);
CREATE INDEX bio_concept_code_type_index ON biomart.bio_concept_code (code_type_name);
CREATE TABLE biomart.bio_curated_data (
	statement text,
	statement_status varchar(200),
	bio_data_id bigint NOT NULL,
	bio_curation_dataset_id bigint NOT NULL,
	reference_id bigint,
	data_type varchar(200)
);
ALTER TABLE biomart.bio_curated_data OWNER TO biomart;
ALTER TABLE biomart.bio_curated_data ADD CONSTRAINT bio_externalanalysis_fact_pk PRIMARY KEY (bio_data_id);
CREATE UNIQUE INDEX bio_curated_data_pk ON biomart.bio_curated_data (bio_data_id);
CREATE TABLE biomart.bio_data_omic_marker (
	bio_data_id bigint,
	bio_marker_id bigint NOT NULL,
	data_table varchar(5)
);
ALTER TABLE biomart.bio_data_omic_marker OWNER TO biomart;
CREATE INDEX bio_data_o_m_did_idx ON biomart.bio_data_omic_marker (bio_data_id);
CREATE UNIQUE INDEX bio_d_o_m_marker2_pk ON biomart.bio_data_omic_marker (bio_marker_id,bio_data_id);
CREATE TABLE biomart.ctd_study (
	ctd_study_id bigint,
	ref_article_protocol_id varchar(4000),
	ref_article_pmid varchar(4000),
	ref_protocol_id varchar(4000)
);
ALTER TABLE biomart.ctd_study OWNER TO biomart;
CREATE TABLE biomart.bio_data_compound (
	bio_data_id bigint NOT NULL,
	bio_compound_id bigint NOT NULL,
	etl_source varchar(100)
);
ALTER TABLE biomart.bio_data_compound OWNER TO biomart;
ALTER TABLE biomart.bio_data_compound ADD CONSTRAINT bio_data_compound_pk PRIMARY KEY (bio_data_id,bio_compound_id);
CREATE TABLE biomart.bio_patient_event_attr (
	bio_patient_attr_code varchar(200) NOT NULL,
	attribute_text_value varchar(200),
	attribute_numeric_value varchar(200),
	bio_clinic_trial_attr_id bigint NOT NULL,
	bio_patient_attribute_id bigint NOT NULL,
	bio_patient_event_id bigint NOT NULL
);
ALTER TABLE biomart.bio_patient_event_attr OWNER TO biomart;
ALTER TABLE biomart.bio_patient_event_attr ADD CONSTRAINT bio_patient_attribute_pk PRIMARY KEY (bio_patient_attribute_id);
CREATE UNIQUE INDEX bio_patient_event_attr_pk ON biomart.bio_patient_event_attr (bio_patient_attribute_id);
CREATE TABLE biomart.bio_clinc_trial_attr (
	bio_clinc_trial_attr_id bigint NOT NULL,
	property_code varchar(200) NOT NULL,
	property_value varchar(200),
	bio_experiment_id bigint NOT NULL
);
ALTER TABLE biomart.bio_clinc_trial_attr OWNER TO biomart;
ALTER TABLE biomart.bio_clinc_trial_attr ADD CONSTRAINT bio_clinical_trial_patient_grp PRIMARY KEY (bio_clinc_trial_attr_id);
CREATE UNIQUE INDEX bio_clinc_trial_attr_pk ON biomart.bio_clinc_trial_attr (bio_clinc_trial_attr_id);
CREATE TABLE biomart.bio_assay_data_annotation (
	bio_assay_feature_group_id bigint,
	bio_marker_id bigint NOT NULL,
	data_table char(5)
);
ALTER TABLE biomart.bio_assay_data_annotation OWNER TO biomart;
CREATE INDEX bio_a_o_fg_id_idx ON biomart.bio_assay_data_annotation (bio_assay_feature_group_id);
CREATE UNIQUE INDEX bio_d_fg_m_marker2_pk ON biomart.bio_assay_data_annotation (bio_marker_id,bio_assay_feature_group_id);
CREATE INDEX BIO_A_O_AN_IDX2 ON biomart.BIO_ASSAY_DATA_ANNOTATION (BIO_ASSAY_FEATURE_GROUP_ID, BIO_MARKER_ID);
alter INDEX biomart.BIO_A_O_AN_IDX2 set tablespace INDX;


CREATE TABLE biomart.bio_sample (
	bio_sample_id bigint NOT NULL,
	bio_sample_type varchar(200) NOT NULL,
	characteristics varchar(1000),
	source_code varchar(200),
	experiment_id bigint,
	bio_subject_id bigint,
	source varchar(200),
	bio_bank_id bigint,
	bio_patient_event_id bigint,
	bio_cell_line_id bigint,
	bio_sample_name varchar(100)
);
ALTER TABLE biomart.bio_sample OWNER TO biomart;
ALTER TABLE biomart.bio_sample ADD CONSTRAINT biosample_pk PRIMARY KEY (bio_sample_id);
CREATE UNIQUE INDEX bio_sample_pk ON biomart.bio_sample (bio_sample_id);
CREATE TABLE biomart.bio_patient_event (
	bio_patient_event_id bigint NOT NULL,
	bio_patient_id bigint NOT NULL,
	event_code varchar(200),
	event_type_code varchar(200),
	event_date timestamp,
	site varchar(400),
	bio_clinic_trial_timepoint_id bigint NOT NULL
);
ALTER TABLE biomart.bio_patient_event OWNER TO biomart;
ALTER TABLE biomart.bio_patient_event ADD CONSTRAINT bio_patient_event_pk PRIMARY KEY (bio_patient_event_id);
CREATE TABLE biomart.ctd_full (
	clinical_trial_design_id bigint,
	ref_article_protocol_id varchar(4000),
	ref_record_id varchar(4000),
	ref_back_reference varchar(4000),
	ref_article_pmid varchar(4000),
	ref_protocol_id varchar(4000),
	ref_title varchar(4000),
	study_type varchar(4000),
	common_name varchar(4000),
	icd10 varchar(4000),
	mesh varchar(4000),
	disease_type varchar(4000),
	physiology_name varchar(4000),
	trial_status varchar(4000),
	trial_phase varchar(4000),
	nature_of_trial varchar(4000),
	randomization varchar(4000),
	blinded_trial varchar(4000),
	trial_type varchar(4000),
	run_in_period varchar(4000),
	treatment_period varchar(4000),
	washout_period varchar(4000),
	open_label_extension varchar(4000),
	sponsor varchar(4000),
	trial_nbr_of_patients_studied varchar(4000),
	source_type varchar(4000),
	trial_age varchar(4000),
	disease_severity varchar(4000),
	difficult_to_treat varchar(4000),
	asthma_diagnosis varchar(4000),
	inhaled_steroid_dose varchar(4000),
	laba varchar(4000),
	ocs varchar(4000),
	xolair varchar(4000),
	ltra_inhibitors varchar(4000),
	asthma_phenotype varchar(4000),
	fev1 varchar(4000),
	fev1_reversibility varchar(4000),
	tlc varchar(4000),
	fev1_fvc varchar(4000),
	fvc varchar(4000),
	dlco varchar(4000),
	sgrq varchar(4000),
	hrct varchar(4000),
	biopsy varchar(4000),
	dyspnea_on_exertion varchar(4000),
	concomitant_med varchar(4000),
	trial_smokers_pct varchar(4000),
	trial_former_smokers_pct varchar(4000),
	trial_never_smokers_pct varchar(4000),
	trial_pack_years varchar(4000),
	exclusion_criteria text,
	minimal_symptoms varchar(4000),
	rescue_medication_use varchar(4000),
	control_details varchar(4000),
	blinding_procedure varchar(4000),
	number_of_arms varchar(4000),
	description text,
	arm varchar(4000),
	arm_nbr_of_patients_studied varchar(4000),
	arm_classification_type varchar(4000),
	arm_classification_value varchar(4000),
	arm_asthma_duration varchar(4000),
	arm_geographic_region varchar(4000),
	arm_age varchar(4000),
	arm_gender varchar(4000),
	arm_smokers_pct varchar(4000),
	arm_former_smokers_pct varchar(4000),
	arm_never_smokers_pct varchar(4000),
	arm_pack_years varchar(4000),
	minority_participation varchar(4000),
	baseline_symptom_score varchar(4000),
	baseline_rescue_medication_use varchar(4000),
	clinical_variable varchar(4000),
	clinical_variable_pct varchar(4000),
	clinical_variable_value varchar(4000),
	prior_med_drug_name varchar(4000),
	prior_med_pct varchar(4000),
	prior_med_value varchar(4000),
	biomarker_name varchar(4000),
	biomarker_pct varchar(4000),
	biomarker_value varchar(4000),
	cellinfo_type varchar(4000),
	cellinfo_count varchar(4000),
	cellinfo_source varchar(4000),
	pulmonary_pathology_name varchar(4000),
	pulmpath_patient_pct varchar(4000),
	pulmpath_value_unit varchar(4000),
	pulmpath_method varchar(4000),
	runin_ocs varchar(4000),
	runin_ics varchar(4000),
	runin_laba varchar(4000),
	runin_ltra varchar(4000),
	runin_corticosteroids varchar(4000),
	runin_anti_fibrotics varchar(4000),
	runin_immunosuppressive varchar(4000),
	runin_cytotoxic varchar(4000),
	runin_description varchar(4000),
	trtmt_ocs varchar(4000),
	trtmt_ics varchar(4000),
	trtmt_laba varchar(4000),
	trtmt_ltra varchar(4000),
	trtmt_corticosteroids varchar(4000),
	trtmt_anti_fibrotics varchar(4000),
	trtmt_immunosuppressive varchar(4000),
	trtmt_cytotoxic varchar(4000),
	trtmt_description varchar(4000),
	drug_inhibitor_common_name varchar(4000),
	drug_inhibitor_standard_name varchar(4000),
	drug_inhibitor_cas_id varchar(4000),
	drug_inhibitor_dose varchar(4000),
	drug_inhibitor_route_of_admin varchar(4000),
	drug_inhibitor_trtmt_regime varchar(4000),
	comparator_name varchar(4000),
	comparator_dose varchar(4000),
	comparator_time_period varchar(4000),
	comparator_route_of_admin varchar(4000),
	treatment_regime varchar(4000),
	placebo varchar(4000),
	experiment_description varchar(4000),
	primary_endpoint_type varchar(4000),
	primary_endpoint_definition varchar(4000),
	primary_endpoint_change varchar(4000),
	primary_endpoint_time_period varchar(4000),
	primary_endpoint_stat_test varchar(4000),
	primary_endpoint_p_value varchar(4000),
	secondary_type varchar(4000),
	secondary_type_definition varchar(4000),
	secondary_type_change varchar(4000),
	secondary_type_time_period varchar(4000),
	secondary_type_p_value varchar(4000),
	secondary_type_stat_test varchar(4000),
	clinical_variable_name varchar(4000),
	pct_change_from_baseline varchar(4000),
	abs_change_from_baseline varchar(4000),
	rate_of_change_from_baseline varchar(4000),
	average_over_treatment_period varchar(4000),
	within_group_changes varchar(4000),
	stat_measure_p_value varchar(4000),
	definition_of_the_event varchar(4000),
	number_of_events varchar(4000),
	event_rate varchar(4000),
	time_to_event varchar(4000),
	event_pct_reduction varchar(4000),
	event_p_value varchar(4000),
	event_description varchar(4000),
	discontinuation_rate varchar(4000),
	response_rate varchar(4000),
	downstream_signaling_effects varchar(4000),
	beneficial_effects varchar(4000),
	adverse_effects varchar(4000),
	pk_pd_parameter varchar(4000),
	pk_pd_value varchar(4000),
	effect_description varchar(4000),
	biomolecule_name varchar(4000),
	biomolecule_id varchar(4000),
	biomolecule_type varchar(4000),
	biomarker varchar(4000),
	biomarker_type varchar(4000),
	baseline_expr_pct varchar(4000),
	baseline_expr_number varchar(4000),
	baseline_expr_value_fold_mean varchar(4000),
	baseline_expr_sd varchar(4000),
	baseline_expr_sem varchar(4000),
	baseline_expr_unit varchar(4000),
	expr_after_trtmt_pct varchar(4000),
	expr_after_trtmt_number varchar(4000),
	expr_aftertrtmt_valuefold_mean varchar(4000),
	expr_after_trtmt_sd varchar(4000),
	expr_after_trtmt_sem varchar(4000),
	expr_after_trtmt_unit varchar(4000),
	expr_chg_source_type varchar(4000),
	expr_chg_technique varchar(4000),
	expr_chg_description varchar(4000),
	clinical_correlation varchar(4000),
	statistical_test varchar(4000),
	statistical_coefficient_value varchar(4000),
	statistical_test_p_value varchar(4000),
	statistical_test_description varchar(4000),
	drug_inhibitor_time_period varchar(4000)
);
ALTER TABLE biomart.ctd_full OWNER TO biomart;
CREATE TABLE biomart.bio_data_literature (
	bio_data_id bigint NOT NULL,
	bio_lit_ref_data_id bigint,
	bio_curation_dataset_id bigint NOT NULL,
	statement text,
	statement_status varchar(200),
	data_type varchar(200)
);
ALTER TABLE biomart.bio_data_literature OWNER TO biomart;
ALTER TABLE biomart.bio_data_literature ADD CONSTRAINT bio_data_literature_pk PRIMARY KEY (bio_data_id);
CREATE TABLE biomart.bio_assay_analysis (
	analysis_name varchar(500),
	short_description varchar(510),
	analysis_create_date timestamp,
	analyst_id varchar(510),
	bio_assay_analysis_id bigint NOT NULL,
	analysis_version varchar(200),
	fold_change_cutoff double precision,
	pvalue_cutoff double precision,
	rvalue_cutoff double precision,
	bio_asy_analysis_pltfm_id bigint,
	bio_source_import_id bigint,
	analysis_type varchar(200),
	analyst_name varchar(250),
	analysis_method_cd varchar(50),
	bio_assay_data_type varchar(50),
	etl_id varchar(100),
	long_description varchar(4000),
	qa_criteria varchar(4000),
	data_count bigint,
	tea_data_count bigint
);
ALTER TABLE biomart.bio_assay_analysis OWNER TO biomart;
ALTER TABLE biomart.bio_assay_analysis ADD CONSTRAINT bio_data_anl_pk PRIMARY KEY (bio_assay_analysis_id);
CREATE UNIQUE INDEX bio_assay_analysis_pk ON biomart.bio_assay_analysis (bio_assay_analysis_id);
ALTER TABLE biomart.bio_content ADD CONSTRAINT ext_file_cnt_cnt_repo_fk FOREIGN KEY (repository_id) REFERENCES biomart.bio_content_repository (bio_content_repo_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_lit_amd_data ADD CONSTRAINT bio_lit_amd_alt_fk FOREIGN KEY (bio_lit_alt_data_id) REFERENCES biomart.bio_lit_alt_data (bio_lit_alt_data_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_lit_alt_data ADD CONSTRAINT bio_lit_alt_ref_fk FOREIGN KEY (bio_lit_ref_data_id) REFERENCES biomart.bio_lit_ref_data (bio_lit_ref_data_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_data_taxonomy ADD CONSTRAINT bio_taxon_fk FOREIGN KEY (bio_taxonomy_id) REFERENCES biomart.bio_taxonomy (bio_taxonomy_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_data_correlation ADD CONSTRAINT bio_marker_link_bio_marker_rel FOREIGN KEY (bio_data_correl_descr_id) REFERENCES biomart.bio_data_correl_descr (bio_data_correl_descr_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_analysis_data_tea ADD CONSTRAINT bio_assay_analysis_data_t_fk1 FOREIGN KEY (bio_assay_analysis_id) REFERENCES biomart.bio_assay_analysis (bio_assay_analysis_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_analysis_data_tea ADD CONSTRAINT bio_assay_analysis_data_t_fk2 FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_experiment (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_analysis_data_tea ADD CONSTRAINT bio_assay_analysis_data_t_fk3 FOREIGN KEY (bio_assay_platform_id) REFERENCES biomart.bio_assay_platform (bio_assay_platform_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_assay_analysis_data_tea ADD CONSTRAINT bio_asy_ad_tea_fg_fk FOREIGN KEY (bio_assay_feature_group_id) REFERENCES biomart.bio_assay_feature_group (bio_assay_feature_group_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_asy_analysis_dataset ADD CONSTRAINT bio_data_anl_ds_anl_fk FOREIGN KEY (bio_assay_analysis_id) REFERENCES biomart.bio_assay_analysis (bio_assay_analysis_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_asy_analysis_dataset ADD CONSTRAINT bio_data_anl_ds_fk FOREIGN KEY (bio_assay_dataset_id) REFERENCES biomart.bio_assay_dataset (bio_assay_dataset_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_content_reference ADD CONSTRAINT bio_content_ref_cont_fk FOREIGN KEY (bio_content_id) REFERENCES biomart.bio_content (bio_file_content_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_cell_line ADD CONSTRAINT cd_disease_fk FOREIGN KEY (bio_disease_id) REFERENCES biomart.bio_disease (bio_disease_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_lit_pe_data ADD CONSTRAINT bio_lit_pe_ref_fk FOREIGN KEY (bio_lit_ref_data_id) REFERENCES biomart.bio_lit_ref_data (bio_lit_ref_data_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_data ADD CONSTRAINT bio_asy_exp_fk FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_experiment (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_assay_data ADD CONSTRAINT bio_exp_data_fact_samp_fk FOREIGN KEY (bio_sample_id) REFERENCES biomart.bio_sample (bio_sample_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_assay_data ADD CONSTRAINT bio_asy_dt_ds_fk FOREIGN KEY (bio_assay_dataset_id) REFERENCES biomart.bio_assay_dataset (bio_assay_dataset_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay ADD CONSTRAINT dataset_experiment_fk FOREIGN KEY (experiment_id) REFERENCES biomart.bio_experiment (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_assay ADD CONSTRAINT bio_asy_asy_pfm_fk FOREIGN KEY (bio_assay_platform_id) REFERENCES biomart.bio_assay_platform (bio_assay_platform_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_data_disease ADD CONSTRAINT bio_df_disease_fk FOREIGN KEY (bio_disease_id) REFERENCES biomart.bio_disease (bio_disease_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_dataset ADD CONSTRAINT bio_dataset_experiment_fk FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_experiment (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_clinc_trial_time_pt ADD CONSTRAINT bio_cli_trial_time_trl_fk FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_clinical_trial (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_asy_data_stats_all ADD CONSTRAINT bio_asy_dt_stats_smp_fk FOREIGN KEY (bio_sample_id) REFERENCES biomart.bio_sample (bio_sample_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_lit_inh_data ADD CONSTRAINT bio_lit_inh_ref_fk FOREIGN KEY (bio_lit_ref_data_id) REFERENCES biomart.bio_lit_ref_data (bio_lit_ref_data_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_lit_int_data ADD CONSTRAINT bio_lit_int_ref_fk FOREIGN KEY (bio_lit_ref_data_id) REFERENCES biomart.bio_lit_ref_data (bio_lit_ref_data_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_data_stats ADD CONSTRAINT bio_asy_dt_stat_exp_s_fk FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_experiment (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_assay_data_stats ADD CONSTRAINT bio_asy_dt_stats_smp_s_fk FOREIGN KEY (bio_sample_id) REFERENCES biomart.bio_sample (bio_sample_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_assay_data_stats ADD CONSTRAINT bio_asy_dt_stats_ds_s_fk FOREIGN KEY (bio_assay_dataset_id) REFERENCES biomart.bio_assay_dataset (bio_assay_dataset_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_assay_data_stats ADD CONSTRAINT bio_asy_dt_fg_fk FOREIGN KEY (bio_assay_feature_group_id) REFERENCES biomart.bio_assay_feature_group (bio_assay_feature_group_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_sample ADD CONSTRAINT bio_assay_sample_bio_sample_fk FOREIGN KEY (bio_sample_id) REFERENCES biomart.bio_sample (bio_sample_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_assay_sample ADD CONSTRAINT bio_assay_sample_bio_assay_fk FOREIGN KEY (bio_assay_id) REFERENCES biomart.bio_assay (bio_assay_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_curation_dataset ADD CONSTRAINT bio_ext_anl_pltfm_fk FOREIGN KEY (bio_asy_analysis_pltfm_id) REFERENCES biomart.bio_asy_analysis_pltfm (bio_asy_analysis_pltfm_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_analysis_data ADD CONSTRAINT bio_assay_analysis_data_n_fk1 FOREIGN KEY (bio_assay_analysis_id) REFERENCES biomart.bio_assay_analysis (bio_assay_analysis_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_analysis_data ADD CONSTRAINT bio_assay_analysis_data_n_fk2 FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_experiment (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_analysis_data ADD CONSTRAINT bio_assay_analysis_data_n_fk3 FOREIGN KEY (bio_assay_platform_id) REFERENCES biomart.bio_assay_platform (bio_assay_platform_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_assay_analysis_data ADD CONSTRAINT bio_asy_ad_fg_fk FOREIGN KEY (bio_assay_feature_group_id) REFERENCES biomart.bio_assay_feature_group (bio_assay_feature_group_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_clinical_trial ADD CONSTRAINT bio_clinical_trial_bio_experim FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_experiment (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_clinc_trial_pt_group ADD CONSTRAINT bio_clinc_trl_pt_grp_exp_fk FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_clinical_trial (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_patient ADD CONSTRAINT bio_patient_bio_subject_fk FOREIGN KEY (bio_patient_id) REFERENCES biomart.bio_subject (bio_subject_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_patient ADD CONSTRAINT bio_patient_bio_clinic_tri_fk FOREIGN KEY (bio_clinical_trial_p_group_id) REFERENCES biomart.bio_clinc_trial_pt_group (bio_clinical_trial_p_group_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_patient ADD CONSTRAINT bio_patient_bio_clinical_trial FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_clinical_trial (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_curated_data ADD CONSTRAINT bio_ext_analys_ext_anl_fk FOREIGN KEY (bio_curation_dataset_id) REFERENCES biomart.bio_curation_dataset (bio_curation_dataset_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_data_compound ADD CONSTRAINT bio_df_cmp_fk FOREIGN KEY (bio_compound_id) REFERENCES biomart.bio_compound (bio_compound_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_patient_event_attr ADD CONSTRAINT bio_pt_attr_trl_attr_fk FOREIGN KEY (bio_clinic_trial_attr_id) REFERENCES biomart.bio_clinc_trial_attr (bio_clinc_trial_attr_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_patient_event_attr ADD CONSTRAINT bio_pt_event_attr_evt_fk FOREIGN KEY (bio_patient_event_id) REFERENCES biomart.bio_patient_event (bio_patient_event_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_clinc_trial_attr ADD CONSTRAINT bio_clinical_trial_property_bi FOREIGN KEY (bio_experiment_id) REFERENCES biomart.bio_clinical_trial (bio_experiment_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_sample ADD CONSTRAINT bio_sample_bio_subject_fk FOREIGN KEY (bio_subject_id) REFERENCES biomart.bio_subject (bio_subject_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_sample ADD CONSTRAINT bio_sample_cl_fk FOREIGN KEY (bio_cell_line_id) REFERENCES biomart.bio_cell_line (bio_cell_line_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_sample ADD CONSTRAINT bio_sample_pt_evt_fk FOREIGN KEY (bio_patient_event_id) REFERENCES biomart.bio_patient_event (bio_patient_event_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_patient_event ADD CONSTRAINT bio_pt_event_bio_trl_tp_fk FOREIGN KEY (bio_clinic_trial_timepoint_id) REFERENCES biomart.bio_clinc_trial_time_pt (bio_clinc_trial_tm_pt_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE biomart.bio_patient_event ADD CONSTRAINT bio_pt_event_bio_pt_fk FOREIGN KEY (bio_patient_id) REFERENCES biomart.bio_patient (bio_patient_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_data_literature ADD CONSTRAINT bio_lit_curation_dataset_fk FOREIGN KEY (bio_curation_dataset_id) REFERENCES biomart.bio_curation_dataset (bio_curation_dataset_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE biomart.bio_assay_analysis ADD CONSTRAINT bio_assay_ans_pltfm_fk FOREIGN KEY (bio_asy_analysis_pltfm_id) REFERENCES biomart.bio_asy_analysis_pltfm (bio_asy_analysis_pltfm_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- VIEWS
CREATE OR REPLACE VIEW biomart.ctd_arm_view (id, ref_article_protocol_id, arm, arm_nbr_of_patients_studied, arm_classification_type, arm_classification_value, arm_asthma_duration, arm_geographic_region, arm_age, arm_gender, arm_smokers_pct, arm_former_smokers_pct, arm_never_smokers_pct, arm_pack_years, minority_participation, baseline_symptom_score, baseline_rescue_medication_use) 
  AS SELECT  ROW_NUMBER() OVER (ORDER BY REF_ARTICLE_PROTOCOL_ID, ARM, ARM_NBR_OF_PATIENTS_STUDIED) as ID, v.ref_article_protocol_id,v.arm,v.arm_nbr_of_patients_studied,v.arm_classification_type,v.arm_classification_value,v.arm_asthma_duration,v.arm_geographic_region,v.arm_age,v.arm_gender,v.arm_smokers_pct,v.arm_former_smokers_pct,v.arm_never_smokers_pct,v.arm_pack_years,v.minority_participation,v.baseline_symptom_score,v.baseline_rescue_medication_use
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			ARM,
			to_number(ARM_NBR_OF_PATIENTS_STUDIED, '999999999999999') ARM_NBR_OF_PATIENTS_STUDIED,
			ARM_CLASSIFICATION_TYPE,
			ARM_CLASSIFICATION_VALUE,
			ARM_ASTHMA_DURATION,
			ARM_GEOGRAPHIC_REGION,
			ARM_AGE,
			ARM_GENDER,
			ARM_SMOKERS_PCT,
			ARM_FORMER_SMOKERS_PCT,
			ARM_NEVER_SMOKERS_PCT,
			ARM_PACK_YEARS,
			MINORITY_PARTICIPATION,
			BASELINE_SYMPTOM_SCORE,
			BASELINE_RESCUE_MEDICATION_USE
from biomart.ctd_full
where (ARM IS NOT NULL AND ARM::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, ARM, to_number(ARM_NBR_OF_PATIENTS_STUDIED, '999999999999999')
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_biomarker_view (id, ref_article_protocol_id, biomarker_name, biomarker_pct, biomarker_value) 
   AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, BIOMARKER_NAME) as ID, v.ref_article_protocol_id,v.biomarker_name,v.biomarker_pct,v.biomarker_value
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			BIOMARKER_NAME,
			BIOMARKER_PCT,
			BIOMARKER_VALUE
from biomart.ctd_full
where (BIOMARKER_NAME IS NOT NULL AND BIOMARKER_NAME::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, BIOMARKER_NAME
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_cell_info_view (id, ref_article_protocol_id, cellinfo_type, cellinfo_count, cellinfo_source) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, CELLINFO_TYPE) as ID, v.ref_article_protocol_id,v.cellinfo_type,v.cellinfo_count,v.cellinfo_source
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			CELLINFO_TYPE,
			CELLINFO_COUNT,
			CELLINFO_SOURCE
from biomart.ctd_full
where (CELLINFO_TYPE IS NOT NULL AND CELLINFO_TYPE::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, CELLINFO_TYPE
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_clinical_chars_view (id, ref_article_protocol_id, clinical_variable, clinical_variable_pct, clinical_variable_value) 
  AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, CLINICAL_VARIABLE) as ID, v.ref_article_protocol_id,v.clinical_variable,v.clinical_variable_pct,v.clinical_variable_value
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			CLINICAL_VARIABLE,
			CLINICAL_VARIABLE_PCT,
			CLINICAL_VARIABLE_VALUE
from biomart.ctd_full
where (CLINICAL_VARIABLE IS NOT NULL AND CLINICAL_VARIABLE::text <> '') 
order by REF_ARTICLE_PROTOCOL_ID, CLINICAL_VARIABLE
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_drug_effects_view (id, ref_article_protocol_id, discontinuation_rate, response_rate, downstream_signaling_effects, beneficial_effects, adverse_effects, pk_pd_parameter, pk_pd_value, effect_description) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, BENEFICIAL_EFFECTS, ADVERSE_EFFECTS) as ID, v.ref_article_protocol_id,v.discontinuation_rate,v.response_rate,v.downstream_signaling_effects,v.beneficial_effects,v.adverse_effects,v.pk_pd_parameter,v.pk_pd_value,v.effect_description
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			DISCONTINUATION_RATE,
			RESPONSE_RATE,
			DOWNSTREAM_SIGNALING_EFFECTS,
			BENEFICIAL_EFFECTS,
			ADVERSE_EFFECTS,
			PK_PD_PARAMETER,
			PK_PD_VALUE,
			EFFECT_DESCRIPTION
from biomart.ctd_full
order by REF_ARTICLE_PROTOCOL_ID, BENEFICIAL_EFFECTS, ADVERSE_EFFECTS
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_drug_inhibitor_view (id, ref_article_protocol_id, drug_inhibitor_common_name, drug_inhibitor_standard_name, drug_inhibitor_cas_id) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, DRUG_INHIBITOR_COMMON_NAME) as ID, v.ref_article_protocol_id,v.drug_inhibitor_common_name,v.drug_inhibitor_standard_name,v.drug_inhibitor_cas_id
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
  	DRUG_INHIBITOR_COMMON_NAME,
	DRUG_INHIBITOR_STANDARD_NAME,
	DRUG_INHIBITOR_CAS_ID
from biomart.ctd_full
order by REF_ARTICLE_PROTOCOL_ID, DRUG_INHIBITOR_COMMON_NAME
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_events_view (id, ref_article_protocol_id, definition_of_the_event, number_of_events, event_rate, time_to_event, event_pct_reduction, event_p_value, event_description) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, DEFINITION_OF_THE_EVENT) as ID, v.ref_article_protocol_id,v.definition_of_the_event,v.number_of_events,v.event_rate,v.time_to_event,v.event_pct_reduction,v.event_p_value,v.event_description
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			DEFINITION_OF_THE_EVENT,
			NUMBER_OF_EVENTS,
			EVENT_RATE,
			TIME_TO_EVENT,
			EVENT_PCT_REDUCTION,
			EVENT_P_VALUE,
			EVENT_DESCRIPTION
from biomart.ctd_full
where (DEFINITION_OF_THE_EVENT IS NOT NULL AND DEFINITION_OF_THE_EVENT::text <> '') or (EVENT_DESCRIPTION IS NOT NULL AND EVENT_DESCRIPTION::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, DEFINITION_OF_THE_EVENT
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_experiments_view (id, ref_article_protocol_id, drug_inhibitor_common_name, drug_inhibitor_dose, drug_inhibitor_time_period, drug_inhibitor_route_of_admin, 
   drug_inhibitor_trtmt_regime, comparator_name, comparator_dose, comparator_time_period, comparator_route_of_admin, treatment_regime, placebo, experiment_description)  
AS SELECT    row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID,
                        DRUG_INHIBITOR_COMMON_NAME,
                        DRUG_INHIBITOR_TRTMT_REGIME) AS ID,
            v.ref_article_protocol_id,
            v.drug_inhibitor_common_name,
            v.drug_inhibitor_dose,
            v.drug_inhibitor_time_period,
            v.drug_inhibitor_route_of_admin,
            v.drug_inhibitor_trtmt_regime,
            v.comparator_name,
            v.comparator_dose,
            v.comparator_time_period,
            v.comparator_route_of_admin,
            v.treatment_regime,
            v.placebo,
            v.experiment_description
      FROM   (  SELECT   DISTINCT REF_ARTICLE_PROTOCOL_ID,
                                 DRUG_INHIBITOR_COMMON_NAME,
                                 DRUG_INHIBITOR_TIME_PERIOD,
                                 DRUG_INHIBITOR_DOSE,
                                 DRUG_INHIBITOR_ROUTE_OF_ADMIN,
                                 DRUG_INHIBITOR_TRTMT_REGIME,
                                 COMPARATOR_NAME,
                                 COMPARATOR_DOSE,
                                 COMPARATOR_TIME_PERIOD,
                                 COMPARATOR_ROUTE_OF_ADMIN,
                                 TREATMENT_REGIME,
                                 PLACEBO,
                                 EXPERIMENT_DESCRIPTION
                 FROM   biomart.ctd_full
             ORDER BY   REF_ARTICLE_PROTOCOL_ID,
                        DRUG_INHIBITOR_COMMON_NAME,
                        DRUG_INHIBITOR_TRTMT_REGIME) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_expr_after_view (id, ref_article_protocol_id, biomolecule_name, expr_after_trtmt_pct, expr_after_trtmt_number, expr_aftertrtmt_valuefold_mean, 
   expr_after_trtmt_sd, expr_after_trtmt_sem, expr_after_trtmt_unit) 
   AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME) as ID, v.ref_article_protocol_id,v.biomolecule_name,v.expr_after_trtmt_pct,
   v.expr_after_trtmt_number,v.expr_aftertrtmt_valuefold_mean,v.expr_after_trtmt_sd,v.expr_after_trtmt_sem,v.expr_after_trtmt_unit
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			BIOMOLECULE_NAME,
			EXPR_AFTER_TRTMT_PCT,
			EXPR_AFTER_TRTMT_NUMBER,
			EXPR_AFTERTRTMT_VALUEFOLD_MEAN,
			EXPR_AFTER_TRTMT_SD,
			EXPR_AFTER_TRTMT_SEM,
			EXPR_AFTER_TRTMT_UNIT
from biomart.ctd_full
where (BIOMOLECULE_NAME IS NOT NULL AND BIOMOLECULE_NAME::text <> '') or (EXPR_AFTERTRTMT_VALUEFOLD_MEAN IS NOT NULL AND EXPR_AFTERTRTMT_VALUEFOLD_MEAN::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_expr_baseline_view (id, ref_article_protocol_id, biomolecule_name, baseline_expr_pct, baseline_expr_number, baseline_expr_value_fold_mean, 
baseline_expr_sd, baseline_expr_sem, baseline_expr_unit) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME) as ID, v.ref_article_protocol_id,v.biomolecule_name,v.baseline_expr_pct,v.baseline_expr_number,v.baseline_expr_value_fold_mean,v.baseline_expr_sd,v.baseline_expr_sem,v.baseline_expr_unit
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			BIOMOLECULE_NAME,
			BASELINE_EXPR_PCT,
			BASELINE_EXPR_NUMBER,
			BASELINE_EXPR_VALUE_FOLD_MEAN,
			BASELINE_EXPR_SD,
			BASELINE_EXPR_SEM,
			BASELINE_EXPR_UNIT
from biomart.ctd_full
where (BIOMOLECULE_NAME IS NOT NULL AND BIOMOLECULE_NAME::text <> '') or  (BASELINE_EXPR_VALUE_FOLD_MEAN IS NOT NULL AND BASELINE_EXPR_VALUE_FOLD_MEAN::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_expr_bio_view (id, ref_article_protocol_id, biomolecule_name, biomolecule_id, biomolecule_type, biomarker, biomarker_type) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME) as ID, v.ref_article_protocol_id,v.biomolecule_name,v.biomolecule_id,v.biomolecule_type,v.biomarker,v.biomarker_type
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			BIOMOLECULE_NAME,
			BIOMOLECULE_ID,
			BIOMOLECULE_TYPE,
			BIOMARKER,
			BIOMARKER_TYPE
from biomart.ctd_full
where (BIOMOLECULE_NAME IS NOT NULL AND BIOMOLECULE_NAME::text <> '') or (BIOMOLECULE_ID IS NOT NULL AND BIOMOLECULE_ID::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME
) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_expr_source_view (id, ref_article_protocol_id, expr_chg_source_type, expr_chg_technique, expr_chg_description) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, EXPR_CHG_SOURCE_TYPE) as ID, v.ref_article_protocol_id,v.expr_chg_source_type,v.expr_chg_technique,v.expr_chg_description
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
      			EXPR_CHG_SOURCE_TYPE,
			EXPR_CHG_TECHNIQUE,
			EXPR_CHG_DESCRIPTION
from biomart.ctd_full
where (EXPR_CHG_SOURCE_TYPE IS NOT NULL AND EXPR_CHG_SOURCE_TYPE::text <> '') or (EXPR_CHG_DESCRIPTION IS NOT NULL AND EXPR_CHG_DESCRIPTION::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, EXPR_CHG_SOURCE_TYPE
) v
;

CREATE OR REPLACE VIEW biomart.ctd_full_clinical_endpts_view (id, ref_article_protocol_id, primary_endpoint_type, primary_endpoint_definition, primary_endpoint_change, 
primary_endpoint_time_period, primary_endpoint_p_value, primary_endpoint_stat_test, secondary_type, secondary_type_definition, secondary_type_change, secondary_type_time_period, 
secondary_type_p_value, secondary_type_stat_test) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID) as ID, v.ref_article_protocol_id,v.primary_endpoint_type,v.primary_endpoint_definition,v.primary_endpoint_change,v.primary_endpoint_time_period,v.primary_endpoint_p_value,v.primary_endpoint_stat_test,v.secondary_type,v.secondary_type_definition,v.secondary_type_change,v.secondary_type_time_period,v.secondary_type_p_value,v.secondary_type_stat_test
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			PRIMARY_ENDPOINT_TYPE,
			PRIMARY_ENDPOINT_DEFINITION,
			PRIMARY_ENDPOINT_CHANGE,
			PRIMARY_ENDPOINT_TIME_PERIOD,
			PRIMARY_ENDPOINT_P_VALUE,
			PRIMARY_ENDPOINT_STAT_TEST,
			SECONDARY_TYPE,
			SECONDARY_TYPE_DEFINITION,
			SECONDARY_TYPE_CHANGE,
			SECONDARY_TYPE_TIME_PERIOD,
			SECONDARY_TYPE_P_VALUE,
			SECONDARY_TYPE_STAT_TEST
from biomart.CTD_FULL
order by REF_ARTICLE_PROTOCOL_ID
) v
;

CREATE OR REPLACE VIEW biomart.ctd_full_search_view (fact_id, ref_article_protocol_id, mesh, common_name, drug_inhibitor_standard_name, primary_endpoint_type, 
secondary_type, biomarker_name, disease_severity, inhaled_steroid_dose, fev1, primary_endpoint_time_period, primary_endpoint_change, primary_endpoint_p_value) 
AS SELECT  row_number() over (ORDER BY ref_Article_Protocol_Id) as fact_id, t.ref_article_protocol_id,t.mesh,t.common_name,t.drug_inhibitor_standard_name,t.primary_endpoint_type,t.secondary_type,t.biomarker_name,t.disease_severity,t.inhaled_steroid_dose,t.fev1,t.primary_endpoint_time_period,t.primary_endpoint_change,t.primary_endpoint_p_value
 FROM 
(
SELECT distinct ref_Article_Protocol_Id, mesh, common_Name, drug_Inhibitor_Standard_Name,
	   primary_Endpoint_Type, secondary_Type, biomarker_Name, disease_Severity,
	   inhaled_Steroid_Dose, fev1, primary_Endpoint_Time_Period, primary_Endpoint_Change,  primary_Endpoint_P_Value     
FROM BIOMART.CTD_FULL
) t
;

CREATE OR REPLACE VIEW biomart.ctd_primary_endpts_view (id, ref_article_protocol_id, primary_endpoint_type, primary_endpoint_definition, primary_endpoint_change, 
primary_endpoint_time_period, primary_endpoint_p_value, primary_endpoint_stat_test) 
AS SELECT  row_number() over (ORDER BY  REF_ARTICLE_PROTOCOL_ID, PRIMARY_ENDPOINT_TYPE) as ID, v.ref_article_protocol_id,v.primary_endpoint_type,v.primary_endpoint_definition,v.primary_endpoint_change,v.primary_endpoint_time_period,
v.primary_endpoint_p_value,v.primary_endpoint_stat_test
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			PRIMARY_ENDPOINT_TYPE,
			PRIMARY_ENDPOINT_DEFINITION,
			PRIMARY_ENDPOINT_CHANGE,
			PRIMARY_ENDPOINT_TIME_PERIOD,
			PRIMARY_ENDPOINT_P_VALUE,
			PRIMARY_ENDPOINT_STAT_TEST
from biomart.CTD_FULL
where (PRIMARY_ENDPOINT_TYPE IS NOT NULL AND PRIMARY_ENDPOINT_TYPE::text <> '') or (PRIMARY_ENDPOINT_DEFINITION IS NOT NULL AND PRIMARY_ENDPOINT_DEFINITION::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, PRIMARY_ENDPOINT_TYPE
) v
;
 
CREATE OR REPLACE VIEW biomart.ctd_prior_med_use_view (id, ref_article_protocol_id, prior_med_drug_name, prior_med_pct, prior_med_value) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, PRIOR_MED_DRUG_NAME) as ID, v.ref_article_protocol_id,v.prior_med_drug_name,v.prior_med_pct,v.prior_med_value
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			PRIOR_MED_DRUG_NAME,
			PRIOR_MED_PCT,
			PRIOR_MED_VALUE
from biomart.ctd_full
where (PRIOR_MED_DRUG_NAME IS NOT NULL AND PRIOR_MED_DRUG_NAME::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, PRIOR_MED_DRUG_NAME
) v
;

CREATE OR REPLACE VIEW biomart.ctd_pulmonary_path_view (id, ref_article_protocol_id, pulmonary_pathology_name, pulmpath_patient_pct, pulmpath_value_unit, pulmpath_method) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, PULMONARY_PATHOLOGY_NAME) as ID, v.ref_article_protocol_id,v.pulmonary_pathology_name,v.pulmpath_patient_pct,v.pulmpath_value_unit,v.pulmpath_method
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			PULMONARY_PATHOLOGY_NAME,
			PULMPATH_PATIENT_PCT,
			PULMPATH_VALUE_UNIT,
			PULMPATH_METHOD
from biomart.ctd_full
where (PULMONARY_PATHOLOGY_NAME IS NOT NULL AND PULMONARY_PATHOLOGY_NAME::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, PULMONARY_PATHOLOGY_NAME
) v;

CREATE OR REPLACE VIEW biomart.ctd_quant_params_view (id, ref_article_protocol_id, clinical_variable_name, pct_change_from_baseline, abs_change_from_baseline, 
rate_of_change_from_baseline, average_over_treatment_period, within_group_changes, stat_measure_p_value) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID) as ID,  
REF_ARTICLE_PROTOCOL_ID,CLINICAL_VARIABLE_NAME,PCT_CHANGE_FROM_BASELINE,ABS_CHANGE_FROM_BASELINE,
RATE_OF_CHANGE_FROM_BASELINE,AVERAGE_OVER_TREATMENT_PERIOD,WITHIN_GROUP_CHANGES,STAT_MEASURE_P_VALUE
from 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			CLINICAL_VARIABLE_NAME,
			PCT_CHANGE_FROM_BASELINE,
			ABS_CHANGE_FROM_BASELINE,
			RATE_OF_CHANGE_FROM_BASELINE,
			AVERAGE_OVER_TREATMENT_PERIOD,
			WITHIN_GROUP_CHANGES,
			STAT_MEASURE_P_VALUE
from biomart.ctd_full
where (CLINICAL_VARIABLE_NAME IS NOT NULL AND CLINICAL_VARIABLE_NAME::text <> '')
order by REF_ARTICLE_PROTOCOL_ID
) v;
 
CREATE OR REPLACE VIEW biomart.ctd_reference_view (id, ref_article_protocol_id, ref_article_pmid, ref_protocol_id, ref_title, ref_record_id, ref_back_reference) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, REF_RECORD_ID) as ID, v.ref_article_protocol_id,v.ref_article_pmid,v.ref_protocol_id,v.ref_title,v.ref_record_id,v.ref_back_reference
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			REF_ARTICLE_PMID,
			REF_PROTOCOL_ID,
			REF_TITLE,			
     			REF_RECORD_ID,
			REF_BACK_REFERENCE
from biomart.ctd_full
order by REF_ARTICLE_PROTOCOL_ID, REF_RECORD_ID
) v
;

CREATE OR REPLACE VIEW biomart.ctd_runin_therapies_view (id, ref_article_protocol_id, runin_ocs, runin_ics, runin_laba, runin_ltra, runin_corticosteroids, 
runin_anti_fibrotics, runin_immunosuppressive, runin_cytotoxic, runin_description) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, RUNIN_DESCRIPTION, RUNIN_DESCRIPTION) as ID, v.ref_article_protocol_id,v.runin_ocs,v.runin_ics,v.runin_laba,v.runin_ltra,v.runin_corticosteroids,v.runin_anti_fibrotics,v.runin_immunosuppressive,v.runin_cytotoxic,v.runin_description
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			RUNIN_OCS,
			RUNIN_ICS,
			RUNIN_LABA,
			RUNIN_LTRA,
			RUNIN_CORTICOSTEROIDS,
			RUNIN_ANTI_FIBROTICS,
			RUNIN_IMMUNOSUPPRESSIVE,
			RUNIN_CYTOTOXIC,
			RUNIN_DESCRIPTION
from biomart.ctd_full
where (RUNIN_OCS IS NOT NULL AND RUNIN_OCS::text <> '') or (RUNIN_DESCRIPTION IS NOT NULL AND RUNIN_DESCRIPTION::text <> '') or (RUNIN_IMMUNOSUPPRESSIVE IS NOT NULL AND RUNIN_IMMUNOSUPPRESSIVE::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, RUNIN_DESCRIPTION, RUNIN_DESCRIPTION
) v;

CREATE OR REPLACE VIEW biomart.ctd_secondary_endpts_view (id, ref_article_protocol_id, secondary_type, secondary_type_definition, secondary_type_change, secondary_type_time_period, 
secondary_type_p_value, secondary_type_stat_test) AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, SECONDARY_TYPE) as ID, v.ref_article_protocol_id,v.secondary_type,v.secondary_type_definition,v.secondary_type_change,v.secondary_type_time_period,v.secondary_type_p_value,v.secondary_type_stat_test
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			SECONDARY_TYPE,
			SECONDARY_TYPE_DEFINITION,
			SECONDARY_TYPE_CHANGE,
			SECONDARY_TYPE_TIME_PERIOD,
			SECONDARY_TYPE_P_VALUE,
			SECONDARY_TYPE_STAT_TEST
from biomart.CTD_FULL
where (SECONDARY_TYPE IS NOT NULL AND SECONDARY_TYPE::text <> '') or (SECONDARY_TYPE_DEFINITION IS NOT NULL AND SECONDARY_TYPE_DEFINITION::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, SECONDARY_TYPE
) v;
 
CREATE OR REPLACE VIEW biomart.ctd_stats_view (id, ref_article_protocol_id, clinical_correlation, statistical_test, statistical_coefficient_value, statistical_test_p_value, 
statistical_test_description) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, STATISTICAL_TEST) as ID, v.ref_article_protocol_id,v.clinical_correlation,v.statistical_test,v.statistical_coefficient_value,v.statistical_test_p_value,v.statistical_test_description
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			CLINICAL_CORRELATION,
			STATISTICAL_TEST,
			STATISTICAL_COEFFICIENT_VALUE,
			STATISTICAL_TEST_P_VALUE,
			STATISTICAL_TEST_DESCRIPTION
from biomart.ctd_full
where (STATISTICAL_TEST_DESCRIPTION IS NOT NULL AND STATISTICAL_TEST_DESCRIPTION::text <> '') or (STATISTICAL_TEST IS NOT NULL AND STATISTICAL_TEST::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, STATISTICAL_TEST
) v;

CREATE OR REPLACE VIEW biomart.ctd_study_details_view (id, ref_article_protocol_id, study_type, common_name, icd10, mesh, disease_type, physiology_name) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, COMMON_NAME) as ID, v.ref_article_protocol_id,v.study_type,v.common_name,v.icd10,v.mesh,v.disease_type,v.physiology_name
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
      STUDY_TYPE,
			COMMON_NAME,
			ICD10,
			MESH,
			DISEASE_TYPE,
			PHYSIOLOGY_NAME
from biomart.ctd_full
where (COMMON_NAME IS NOT NULL AND COMMON_NAME::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, COMMON_NAME
) v
;
 
CREATE OR REPLACE VIEW biomart.ctd_td_design_view (id, ref_article_protocol_id, nature_of_trial, randomization, blinded_trial, trial_type, run_in_period, treatment_period, 
washout_period, open_label_extension) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, NATURE_OF_TRIAL, TRIAL_TYPE) as ID, v.ref_article_protocol_id,v.nature_of_trial,v.randomization,v.blinded_trial,v.trial_type,v.run_in_period,v.treatment_period,v.washout_period,v.open_label_extension
   FROM (
  select distinct REF_ARTICLE_PROTOCOL_ID,
        NATURE_OF_TRIAL,
        RANDOMIZATION,
        BLINDED_TRIAL,
        TRIAL_TYPE,
        RUN_IN_PERIOD,
        TREATMENT_PERIOD,
        WASHOUT_PERIOD,
        OPEN_LABEL_EXTENSION
  from biomart.ctd_full
  where (TRIAL_TYPE IS NOT NULL AND TRIAL_TYPE::text <> '') or (NATURE_OF_TRIAL IS NOT NULL AND NATURE_OF_TRIAL::text <> '')
  order by REF_ARTICLE_PROTOCOL_ID, NATURE_OF_TRIAL, TRIAL_TYPE
  ) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_td_excl_view (id, ref_article_protocol_id, exclusion_criteria1, exclusion_criteria2, minimal_symptoms, rescue_medication_use, control_details, 
blinding_procedure, number_of_arms, description1, description2) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID) as ID, v.ref_article_protocol_id,v.exclusion_criteria1,v.exclusion_criteria2,v.minimal_symptoms,
v.rescue_medication_use,v.control_details,v.blinding_procedure,v.number_of_arms,v.description1,v.description2
 FROM (
  select distinct REF_ARTICLE_PROTOCOL_ID,
     	substring(EXCLUSION_CRITERIA from 1 for 4000) as EXCLUSION_CRITERIA1, 
	substring(EXCLUSION_CRITERIA from 4001 for 2000) as EXCLUSION_CRITERIA2,       
	MINIMAL_SYMPTOMS,
	RESCUE_MEDICATION_USE,
	CONTROL_DETAILS,
	BLINDING_PROCEDURE,
	NUMBER_OF_ARMS,
      	substring(DESCRIPTION from 1 for 4000) as DESCRIPTION1,
	substring(DESCRIPTION from 4001 for 2000) as DESCRIPTION2  
  from biomart.ctd_full
  where (BLINDING_PROCEDURE IS NOT NULL AND BLINDING_PROCEDURE::text <> '') or (NUMBER_OF_ARMS IS NOT NULL AND NUMBER_OF_ARMS::text <> '')
  order by REF_ARTICLE_PROTOCOL_ID
  ) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_td_inclusion_view (id, ref_article_protocol_id, trial_age, disease_severity, difficult_to_treat, asthma_diagnosis, inhaled_steroid_dose, laba, ocs, 
xolair, ltra_inhibitors, asthma_phenotype, fev1, fev1_reversibility, tlc, fev1_fvc, fvc, dlco, sgrq, hrct, biopsy, dyspnea_on_exertion, concomitant_med) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, DISEASE_SEVERITY, FEV1) as ID, v.ref_article_protocol_id,v.trial_age,v.disease_severity,v.difficult_to_treat,v.asthma_diagnosis,v.inhaled_steroid_dose,v.laba,v.ocs,v.xolair,v.ltra_inhibitors,v.asthma_phenotype,v.fev1,v.fev1_reversibility,v.tlc,v.fev1_fvc,v.fvc,v.dlco,v.sgrq,v.hrct,v.biopsy,v.dyspnea_on_exertion,v.concomitant_med
   FROM (
  select distinct REF_ARTICLE_PROTOCOL_ID,
        TRIAL_AGE,
        DISEASE_SEVERITY,
        DIFFICULT_TO_TREAT,
        ASTHMA_DIAGNOSIS,
        INHALED_STEROID_DOSE,
        LABA,
        OCS,
        XOLAIR,
        LTRA_INHIBITORS,
        ASTHMA_PHENOTYPE,
        FEV1,
        FEV1_REVERSIBILITY,
        TLC,
        FEV1_FVC,
        FVC,
        DLCO,
        SGRQ,
        HRCT,
        BIOPSY,
        DYSPNEA_ON_EXERTION,
        CONCOMITANT_MED
  from biomart.ctd_full
  where (FEV1 IS NOT NULL AND FEV1::text <> '') or  (DISEASE_SEVERITY IS NOT NULL AND DISEASE_SEVERITY::text <> '') or (TRIAL_AGE IS NOT NULL AND TRIAL_AGE::text <> '')
  order by REF_ARTICLE_PROTOCOL_ID, DISEASE_SEVERITY, FEV1
  ) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_td_smoker_view (id, ref_article_protocol_id, trial_smokers_pct, trial_former_smokers_pct, trial_never_smokers_pct, trial_pack_years) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, TRIAL_SMOKERS_PCT) as ID, v.ref_article_protocol_id,v.trial_smokers_pct,v.trial_former_smokers_pct,v.trial_never_smokers_pct,v.trial_pack_years
   FROM (
  select distinct REF_ARTICLE_PROTOCOL_ID,
        TRIAL_SMOKERS_PCT,
        TRIAL_FORMER_SMOKERS_PCT,
        TRIAL_NEVER_SMOKERS_PCT,
        TRIAL_PACK_YEARS	
  from biomart.ctd_full
  where (TRIAL_SMOKERS_PCT IS NOT NULL AND TRIAL_SMOKERS_PCT::text <> '') or (TRIAL_NEVER_SMOKERS_PCT IS NOT NULL AND TRIAL_NEVER_SMOKERS_PCT::text <> '')
  order by REF_ARTICLE_PROTOCOL_ID, TRIAL_SMOKERS_PCT
  ) v;
  
CREATE OR REPLACE VIEW biomart.ctd_td_sponsor_view (id, ref_article_protocol_id, sponsor, trial_nbr_of_patients_studied, source_type)
 AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, SPONSOR, TRIAL_NBR_OF_PATIENTS_STUDIED) as ID, v.ref_article_protocol_id,v.sponsor,v.trial_nbr_of_patients_studied,v.source_type
   FROM (
  select distinct REF_ARTICLE_PROTOCOL_ID,
      SPONSOR,
      TRIAL_NBR_OF_PATIENTS_STUDIED,
      SOURCE_TYPE
  from biomart.ctd_full
  where (SPONSOR IS NOT NULL AND SPONSOR::text <> '') or (TRIAL_NBR_OF_PATIENTS_STUDIED IS NOT NULL AND TRIAL_NBR_OF_PATIENTS_STUDIED::text <> '')
  order by REF_ARTICLE_PROTOCOL_ID, SPONSOR, TRIAL_NBR_OF_PATIENTS_STUDIED
  ) v;
  
CREATE OR REPLACE VIEW biomart.ctd_td_status_view (id, ref_article_protocol_id, trial_status, trial_phase) 
AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID) as ID, v.ref_article_protocol_id,v.trial_status,v.trial_phase
   FROM (
  select distinct REF_ARTICLE_PROTOCOL_ID,
        TRIAL_STATUS,
        TRIAL_PHASE   
  from biomart.ctd_full
  where (TRIAL_STATUS IS NOT NULL AND TRIAL_STATUS::text <> '') or (TRIAL_PHASE IS NOT NULL AND TRIAL_PHASE::text <> '')
  order by REF_ARTICLE_PROTOCOL_ID
  ) v
 ;
 
CREATE OR REPLACE VIEW biomart.ctd_treatment_phases_view (id, ref_article_protocol_id, trtmt_ocs, trtmt_ics, trtmt_laba, trtmt_ltra, trtmt_corticosteroids, trtmt_anti_fibrotics,
 trtmt_immunosuppressive, trtmt_cytotoxic, trtmt_description) 
 AS SELECT  row_number() over (ORDER BY REF_ARTICLE_PROTOCOL_ID, TRTMT_DESCRIPTION, TRTMT_OCS) as ID, v.ref_article_protocol_id,v.trtmt_ocs,v.trtmt_ics,v.trtmt_laba,v.trtmt_ltra,v.trtmt_corticosteroids,v.trtmt_anti_fibrotics,v.trtmt_immunosuppressive,v.trtmt_cytotoxic,v.trtmt_description
 FROM 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			TRTMT_OCS,
			TRTMT_ICS,
			TRTMT_LABA,
			TRTMT_LTRA,
			TRTMT_CORTICOSTEROIDS,
			TRTMT_ANTI_FIBROTICS,
			TRTMT_IMMUNOSUPPRESSIVE,
			TRTMT_CYTOTOXIC,
			TRTMT_DESCRIPTION
from biomart.ctd_full
where (TRTMT_OCS IS NOT NULL AND TRTMT_OCS::text <> '') or (TRTMT_DESCRIPTION IS NOT NULL AND TRTMT_DESCRIPTION::text <> '') or (TRTMT_IMMUNOSUPPRESSIVE IS NOT NULL AND TRTMT_IMMUNOSUPPRESSIVE::text <> '')
order by REF_ARTICLE_PROTOCOL_ID, TRTMT_DESCRIPTION, TRTMT_OCS
) v
 ;


ALTER TABLE biomart.bio_assay OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_analysis OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_analysis_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_analysis_data_tea OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_dataset OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_data_annotation OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_data_stats OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_feature_group OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_platform OWNER TO BIOMART;
ALTER TABLE biomart.bio_assay_sample OWNER TO BIOMART;
ALTER TABLE biomart.bio_asy_analysis_dataset OWNER TO BIOMART;
ALTER TABLE biomart.bio_asy_analysis_pltfm OWNER TO BIOMART;
ALTER TABLE biomart.bio_asy_data_stats_all OWNER TO BIOMART;
ALTER TABLE biomart.bio_cell_line OWNER TO BIOMART;
ALTER TABLE biomart.bio_cgdcp_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_clinc_trial_attr OWNER TO BIOMART;
ALTER TABLE biomart.bio_clinc_trial_pt_group OWNER TO BIOMART;
ALTER TABLE biomart.bio_clinc_trial_time_pt OWNER TO BIOMART;
ALTER TABLE biomart.bio_clinical_trial OWNER TO BIOMART;
ALTER TABLE biomart.bio_clinical_trial_design OWNER TO BIOMART;
ALTER TABLE biomart.bio_compound OWNER TO BIOMART;
ALTER TABLE biomart.bio_concept_code OWNER TO BIOMART;
ALTER TABLE biomart.bio_content OWNER TO BIOMART;
ALTER TABLE biomart.bio_content_reference OWNER TO BIOMART;
ALTER TABLE biomart.bio_content_repository OWNER TO BIOMART;
ALTER TABLE biomart.bio_curated_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_curation_dataset OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_attribute OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_compound OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_correlation OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_correl_descr OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_disease OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_ext_code OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_literature OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_omic_marker OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_taxonomy OWNER TO BIOMART;
ALTER TABLE biomart.bio_data_uid OWNER TO BIOMART;
ALTER TABLE biomart.bio_disease OWNER TO BIOMART;
ALTER TABLE biomart.bio_experiment OWNER TO BIOMART;
ALTER TABLE biomart.bio_lit_alt_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_lit_amd_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_lit_inh_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_lit_int_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_lit_model_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_lit_pe_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_lit_ref_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_lit_sum_data OWNER TO BIOMART;
ALTER TABLE biomart.bio_marker OWNER TO BIOMART;
ALTER TABLE biomart.bio_patient OWNER TO BIOMART;
ALTER TABLE biomart.bio_patient_event OWNER TO BIOMART;
ALTER TABLE biomart.bio_patient_event_attr OWNER TO BIOMART;
ALTER TABLE biomart.bio_sample OWNER TO BIOMART;
ALTER TABLE biomart.bio_stats_exp_marker OWNER TO BIOMART;
ALTER TABLE biomart.bio_subject OWNER TO BIOMART;
ALTER TABLE biomart.bio_taxonomy OWNER TO BIOMART;
ALTER TABLE biomart.ctd2_clin_inhib_effect OWNER TO BIOMART;
ALTER TABLE biomart.ctd2_disease OWNER TO BIOMART;
ALTER TABLE biomart.ctd2_inhib_details OWNER TO BIOMART;
ALTER TABLE biomart.ctd2_study OWNER TO BIOMART;
ALTER TABLE biomart.ctd2_trial_details OWNER TO BIOMART;
ALTER TABLE biomart.ctd_allowed_meds_treatment OWNER TO BIOMART;
ALTER VIEW biomart.ctd_arm_view OWNER TO BIOMART;
ALTER TABLE biomart.ctd_biomarker OWNER TO BIOMART;
ALTER view biomart.ctd_biomarker_view OWNER TO BIOMART;
ALTER view biomart.ctd_cell_info_view OWNER TO BIOMART;
ALTER view biomart.ctd_clinical_chars_view OWNER TO BIOMART;
ALTER TABLE biomart.ctd_disease OWNER TO BIOMART;
ALTER TABLE biomart.ctd_drug_effects_view OWNER TO BIOMART;
ALTER TABLE biomart.ctd_drug_inhib OWNER TO BIOMART;
ALTER TABLE biomart.ctd_drug_inhibitor_view OWNER TO BIOMART;
ALTER view biomart.ctd_events_view OWNER TO BIOMART;
ALTER view biomart.ctd_experiments_view OWNER TO BIOMART;
ALTER view biomart.ctd_expr_after_view OWNER TO BIOMART;
ALTER view biomart.ctd_expr_baseline_view OWNER TO BIOMART;
ALTER view biomart.ctd_expr_bio_view OWNER TO BIOMART;
ALTER view biomart.ctd_expr_source_view OWNER TO BIOMART;
ALTER TABLE biomart.ctd_full OWNER TO BIOMART;
ALTER view biomart.ctd_full_clinical_endpts_view OWNER TO BIOMART;
ALTER view biomart.ctd_full_search_view OWNER TO BIOMART;
ALTER TABLE biomart.ctd_inclusion_criteria OWNER TO BIOMART;
ALTER TABLE biomart.ctd_primary_endpts OWNER TO BIOMART;
ALTER view biomart.ctd_primary_endpts_view OWNER TO BIOMART;
ALTER view biomart.ctd_prior_med_use_view OWNER TO BIOMART;
ALTER view biomart.ctd_pulmonary_path_view OWNER TO BIOMART;
ALTER view biomart.ctd_quant_params_view OWNER TO BIOMART;
ALTER view biomart.ctd_reference_view OWNER TO BIOMART;
ALTER view biomart.ctd_runin_therapies_view OWNER TO BIOMART;
ALTER view biomart.ctd_secondary_endpts_view OWNER TO BIOMART;
ALTER TABLE biomart.ctd_sec_endpts OWNER TO BIOMART;
ALTER view biomart.ctd_stats_view OWNER TO BIOMART;
ALTER TABLE biomart.ctd_study OWNER TO BIOMART;
ALTER view biomart.ctd_study_details_view OWNER TO BIOMART;
ALTER view biomart.ctd_td_design_view OWNER TO BIOMART;
ALTER view biomart.ctd_td_excl_view OWNER TO BIOMART;
ALTER view biomart.ctd_td_inclusion_view OWNER TO BIOMART;
ALTER view biomart.ctd_td_smoker_view OWNER TO BIOMART;
ALTER view biomart.ctd_td_sponsor_view OWNER TO BIOMART;
ALTER view biomart.ctd_td_status_view OWNER TO BIOMART;
ALTER view biomart.ctd_treatment_phases_view OWNER TO BIOMART;

-- SEQUENCES
CREATE SEQUENCE biomart.bio_assay_data_stats_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE biomart.bio_assay_data_stats_seq OWNER TO biomart;
CREATE SEQUENCE biomart.hibernate_sequence INCREMENT 1 MINVALUE 1 NO MAXVALUE START 226 CACHE 20;
ALTER SEQUENCE biomart.hibernate_sequence OWNER TO biomart;
CREATE SEQUENCE biomart.seq_bio_data_fact_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE biomart.seq_bio_data_fact_id OWNER TO biomart;
CREATE SEQUENCE biomart.seq_bio_data_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1082041 CACHE 20;
ALTER SEQUENCE biomart.seq_bio_data_id OWNER TO biomart;
CREATE SEQUENCE biomart.seq_clinical_trial_design_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE biomart.seq_clinical_trial_design_id OWNER TO biomart;


-- TRUGGERS
-- trg_bio_concept_code_id
DROP TRIGGER IF EXISTS trg_bio_concept_code_id ON biomart.bio_concept_code CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_concept_code_id () RETURNS trigger AS $BODY$
begin     if NEW.BIO_CONCEPT_CODE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CONCEPT_CODE_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_concept_code_id
	BEFORE INSERT ON biomart.bio_concept_code FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_concept_code_id();
	

-- trg_bio_assay_analysis_id
DROP TRIGGER IF EXISTS trg_bio_assay_analysis_id ON biomart.bio_assay_analysis CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_assay_analysis_id () RETURNS trigger AS $BODY$
begin     if NEW.BIO_ASSAY_ANALYSIS_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_ANALYSIS_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_assay_analysis_id
	BEFORE INSERT ON biomart.bio_assay_analysis FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_assay_analysis_id();

-- trg_bio_assay_dataset_id	
DROP TRIGGER IF EXISTS trg_bio_assay_dataset_id ON biomart.bio_assay_dataset CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_assay_dataset_id () RETURNS trigger AS $BODY$
begin     if NEW.BIO_ASSAY_DATASET_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_DATASET_ID ;       end if; RETURN NEW;  end;

$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_assay_dataset_id
	BEFORE INSERT ON biomart.bio_assay_dataset FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_assay_dataset_id();


-- trg_bio_assay_data_id
DROP TRIGGER IF EXISTS trg_bio_assay_data_id ON biomart.bio_assay_data CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_assay_data_id () RETURNS trigger AS $BODY$
begin    if NEW.BIO_ASSAY_DATA_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_DATA_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_assay_data_id
	BEFORE INSERT ON biomart.bio_assay_data FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_assay_data_id();

-- trg_bio_assay_f_g_id
DROP TRIGGER IF EXISTS trg_bio_assay_f_g_id ON biomart.bio_assay_feature_group CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_assay_f_g_id () RETURNS trigger AS $BODY$
begin     if NEW.BIO_ASSAY_FEATURE_GROUP_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_FEATURE_GROUP_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_assay_f_g_id
	BEFORE INSERT ON biomart.bio_assay_feature_group FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_assay_f_g_id();


-- trg_bio_assay_id
DROP TRIGGER IF EXISTS trg_bio_assay_id ON biomart.bio_assay CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_assay_id () RETURNS trigger AS $BODY$
begin   if NEW.BIO_ASSAY_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_assay_id
	BEFORE INSERT ON biomart.bio_assay FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_assay_id();

-- trg_bio_assay_platform_id
DROP TRIGGER IF EXISTS trg_bio_assay_platform_id ON biomart.bio_assay_platform CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_assay_platform_id () RETURNS trigger AS $BODY$
begin     if NEW.BIO_ASSAY_PLATFORM_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_PLATFORM_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_assay_platform_id
	BEFORE INSERT ON biomart.bio_assay_platform FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_assay_platform_id();

-- trg_bio_asy_analysis_pltfm_id
DROP TRIGGER IF EXISTS trg_bio_asy_analysis_pltfm_id ON biomart.bio_asy_analysis_pltfm CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_asy_analysis_pltfm_id () RETURNS trigger AS $BODY$
begin  if NEW.BIO_ASY_ANALYSIS_PLTFM_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASY_ANALYSIS_PLTFM_ID ;       end if; RETURN NEW;   end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_asy_analysis_pltfm_id
	BEFORE INSERT ON biomart.bio_asy_analysis_pltfm FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_asy_analysis_pltfm_id();

-- trg_bio_asy_dt_stats_id
DROP TRIGGER IF EXISTS trg_bio_asy_dt_stats_id ON biomart.bio_asy_data_stats_all CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_asy_dt_stats_id () RETURNS trigger AS $BODY$
begin    if NEW.BIO_ASSAY_DATA_STATS_ID is null then          select nextval('biomart.SEQ_BIO_DATA_FACT_ID') into NEW.BIO_ASSAY_DATA_STATS_ID ;       end if;  RETURN NEW; end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_asy_dt_stats_id
	BEFORE INSERT ON biomart.bio_asy_data_stats_all FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_asy_dt_stats_id();

-- trg_bio_cell_line_id
DROP TRIGGER IF EXISTS trg_bio_cell_line_id ON biomart.bio_cell_line CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_cell_line_id () RETURNS trigger AS $BODY$
begin   if NEW.BIO_CELL_LINE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CELL_LINE_ID ;       end if; RETURN NEW;   end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_cell_line_id
	BEFORE INSERT ON biomart.bio_cell_line FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_cell_line_id();

-- trg_bio_clin_trl_pt_grp_id
DROP TRIGGER IF EXISTS trg_bio_clin_trl_pt_grp_id ON biomart.bio_clinc_trial_pt_group CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_clin_trl_pt_grp_id () RETURNS trigger AS $BODY$
begin   if NEW.BIO_CLINICAL_TRIAL_P_GROUP_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CLINICAL_TRIAL_P_GROUP_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_clin_trl_pt_grp_id
	BEFORE INSERT ON biomart.bio_clinc_trial_pt_group FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_clin_trl_pt_grp_id();

-- trg_bio_cln_trl_attr_id
DROP TRIGGER IF EXISTS trg_bio_cln_trl_attr_id ON biomart.bio_clinc_trial_attr CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_cln_trl_attr_id () RETURNS trigger AS $BODY$
begin   if NEW.BIO_CLINC_TRIAL_ATTR_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CLINC_TRIAL_ATTR_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_cln_trl_attr_id
	BEFORE INSERT ON biomart.bio_clinc_trial_attr FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_cln_trl_attr_id();

-- trg_bio_cl_trl_time_pt_id
DROP TRIGGER IF EXISTS trg_bio_cl_trl_time_pt_id ON biomart.bio_clinc_trial_time_pt CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_cl_trl_time_pt_id () RETURNS trigger AS $BODY$
begin  if NEW.BIO_CLINC_TRIAL_TM_PT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CLINC_TRIAL_TM_PT_ID ;       end if; RETURN NEW;   end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_cl_trl_time_pt_id
	BEFORE INSERT ON biomart.bio_clinc_trial_time_pt FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_cl_trl_time_pt_id();

-- trg_bio_compound_id
DROP TRIGGER IF EXISTS trg_bio_compound_id ON biomart.bio_compound CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_compound_id () RETURNS trigger AS $BODY$
begin if NEW.BIO_COMPOUND_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_COMPOUND_ID ;       end if; RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_compound_id
	BEFORE INSERT ON biomart.bio_compound FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_compound_id();

-- trg_bio_content_ref_id
DROP TRIGGER IF EXISTS trg_bio_content_ref_id ON biomart.bio_content_reference CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_content_ref_id () RETURNS trigger AS $BODY$
begin      if NEW.BIO_CONTENT_REFERENCE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CONTENT_REFERENCE_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_content_ref_id
	BEFORE INSERT ON biomart.bio_content_reference FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_content_ref_id();

-- trg_bio_content_repo_id
DROP TRIGGER IF EXISTS trg_bio_content_repo_id ON biomart.bio_content_repository CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_content_repo_id () RETURNS trigger AS $BODY$
begin if NEW.BIO_CONTENT_REPO_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CONTENT_REPO_ID ;       end if; RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_content_repo_id
	BEFORE INSERT ON biomart.bio_content_repository FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_content_repo_id();

-- trg_bio_curation_dataset_id
DROP TRIGGER IF EXISTS trg_bio_curation_dataset_id ON biomart.bio_curation_dataset CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_curation_dataset_id () RETURNS trigger AS $BODY$
begin      if NEW.BIO_CURATION_DATASET_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CURATION_DATASET_ID ;       end if; RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_curation_dataset_id
	BEFORE INSERT ON biomart.bio_curation_dataset FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_curation_dataset_id();

-- trg_bio_data_attr_id
DROP TRIGGER IF EXISTS trg_bio_data_attr_id ON biomart.bio_data_attribute CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_data_attr_id () RETURNS trigger AS $BODY$
begin if NEW.BIO_DATA_ATTRIBUTE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DATA_ATTRIBUTE_ID ;       end if; RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_data_attr_id
	BEFORE INSERT ON biomart.bio_data_attribute FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_data_attr_id();

-- trg_bio_data_correl_id
DROP TRIGGER IF EXISTS trg_bio_data_correl_id ON biomart.bio_data_correlation CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_data_correl_id () RETURNS trigger AS $BODY$
begin       if NEW.BIO_DATA_CORREL_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DATA_CORREL_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_data_correl_id
	BEFORE INSERT ON biomart.bio_data_correlation FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_data_correl_id();

-- trg_bio_data_ext_code_id
DROP TRIGGER IF EXISTS trg_bio_data_ext_code_id ON biomart.bio_data_ext_code CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_data_ext_code_id () RETURNS trigger AS $BODY$
begin    if NEW.BIO_DATA_EXT_CODE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DATA_EXT_CODE_ID ;       end if;   RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_data_ext_code_id
	BEFORE INSERT ON biomart.bio_data_ext_code FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_data_ext_code_id();

-- trg_bio_disease_id
DROP TRIGGER IF EXISTS trg_bio_disease_id ON biomart.bio_disease CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_disease_id () RETURNS trigger AS $BODY$
begin     if NEW.BIO_DISEASE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DISEASE_ID ;       end if;   RETURN NEW; end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_disease_id
	BEFORE INSERT ON biomart.bio_disease FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_disease_id();

-- trg_bio_experiment_id
DROP TRIGGER IF EXISTS trg_bio_experiment_id ON biomart.bio_experiment CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_experiment_id () RETURNS trigger AS $BODY$
begin         if NEW.BIO_EXPERIMENT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_EXPERIMENT_ID ;       end if; RETURN NEW;   end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_experiment_id
	BEFORE INSERT ON biomart.bio_experiment FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_experiment_id();

-- trg_bio_file_content_id
DROP TRIGGER IF EXISTS trg_bio_file_content_id ON biomart.bio_content CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_file_content_id () RETURNS trigger AS $BODY$
begin       if NEW.BIO_FILE_CONTENT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_FILE_CONTENT_ID ;       end if;   RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_file_content_id
	BEFORE INSERT ON biomart.bio_content FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_file_content_id();


-- trg_bio_lit_alt_data_id
DROP TRIGGER IF EXISTS trg_bio_lit_alt_data_id ON biomart.bio_lit_alt_data CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_lit_alt_data_id () RETURNS trigger AS $BODY$
begin
       if NEW.BIO_LIT_ALT_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_ALT_DATA_ID ;
       end if;
       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_lit_alt_data_id
	BEFORE INSERT ON biomart.bio_lit_alt_data FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_lit_alt_data_id();

-- trg_bio_lit_amd_data_id
DROP TRIGGER IF EXISTS trg_bio_lit_amd_data_id ON biomart.bio_lit_amd_data CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_lit_amd_data_id () RETURNS trigger AS $BODY$
begin
       if NEW.BIO_LIT_AMD_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_AMD_DATA_ID ;
       end if;
       RETURN NEW;
    end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_lit_amd_data_id
	BEFORE INSERT ON biomart.bio_lit_amd_data FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_lit_amd_data_id();

-- trg_bio_lit_inh_data_id
DROP TRIGGER IF EXISTS trg_bio_lit_inh_data_id ON biomart.bio_lit_inh_data CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_lit_inh_data_id () RETURNS trigger AS $BODY$
begin
       if NEW.BIO_LIT_INH_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_INH_DATA_ID ;
       end if; 
       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_lit_inh_data_id
	BEFORE INSERT ON biomart.bio_lit_inh_data FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_lit_inh_data_id();

-- trg_bio_lit_int_data_id
DROP TRIGGER IF EXISTS trg_bio_lit_int_data_id ON biomart.bio_lit_int_data CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_lit_int_data_id () RETURNS trigger AS $BODY$
begin
       if NEW.BIO_LIT_INT_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_INT_DATA_ID ;
       end if; 
       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_lit_int_data_id
	BEFORE INSERT ON biomart.bio_lit_int_data FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_lit_int_data_id();

-- trg_bio_lit_model_data_id
DROP TRIGGER IF EXISTS trg_bio_lit_model_data_id ON biomart.bio_lit_model_data CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_lit_model_data_id () RETURNS trigger AS $BODY$
begin
       if NEW.BIO_LIT_MODEL_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_MODEL_DATA_ID ;
       end if;
       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_lit_model_data_id
	BEFORE INSERT ON biomart.bio_lit_model_data FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_lit_model_data_id();

-- trg_bio_lit_pe_data_id
DROP TRIGGER IF EXISTS trg_bio_lit_pe_data_id ON biomart.bio_lit_pe_data CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_lit_pe_data_id () RETURNS trigger AS $BODY$
begin
       if NEW.BIO_LIT_PE_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_PE_DATA_ID ;
       end if;
       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_lit_pe_data_id
	BEFORE INSERT ON biomart.bio_lit_pe_data FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_lit_pe_data_id();

-- trg_bio_lit_ref_data_id
DROP TRIGGER IF EXISTS trg_bio_lit_ref_data_id ON biomart.bio_lit_ref_data CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_lit_ref_data_id () RETURNS trigger AS $BODY$
begin
       if NEW.BIO_LIT_REF_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_REF_DATA_ID ;
       end if;
       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_lit_ref_data_id
	BEFORE INSERT ON biomart.bio_lit_ref_data FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_lit_ref_data_id();

-- trg_bio_lit_sum_data_id
DROP TRIGGER IF EXISTS trg_bio_lit_sum_data_id ON biomart.bio_lit_sum_data CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_lit_sum_data_id () RETURNS trigger AS $BODY$
begin
       if NEW.BIO_LIT_SUM_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_SUM_DATA_ID ;
       end if;
       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_lit_sum_data_id
	BEFORE INSERT ON biomart.bio_lit_sum_data FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_lit_sum_data_id();

-- trg_bio_marker_id
DROP TRIGGER IF EXISTS trg_bio_marker_id ON biomart.bio_marker CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_marker_id () RETURNS trigger AS $BODY$
begin  if NEW.BIO_MARKER_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_MARKER_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_marker_id
	BEFORE INSERT ON biomart.bio_marker FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_marker_id();

-- trg_bio_mkr_correl_descr_id
DROP TRIGGER IF EXISTS trg_bio_mkr_correl_descr_id ON biomart.bio_data_correl_descr CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_mkr_correl_descr_id () RETURNS trigger AS $BODY$
begin   if NEW.BIO_DATA_CORREL_DESCR_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DATA_CORREL_DESCR_ID ;       end if;  RETURN NEW;  end;

$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_mkr_correl_descr_id
	BEFORE INSERT ON biomart.bio_data_correl_descr FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_mkr_correl_descr_id();

-- trg_bio_patient_event_id
DROP TRIGGER IF EXISTS trg_bio_patient_event_id ON biomart.bio_patient_event CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_patient_event_id () RETURNS trigger AS $BODY$
begin  if NEW.BIO_PATIENT_EVENT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_PATIENT_EVENT_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_patient_event_id
	BEFORE INSERT ON biomart.bio_patient_event FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_patient_event_id();

-- trg_bio_patient_id
DROP TRIGGER IF EXISTS trg_bio_patient_id ON biomart.bio_patient CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_patient_id () RETURNS trigger AS $BODY$
begin  if NEW.BIO_PATIENT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_PATIENT_ID ;       end if; RETURN NEW;   end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_patient_id
	BEFORE INSERT ON biomart.bio_patient FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_patient_id();

-- trg_bio_pt_evt_attr_id
DROP TRIGGER IF EXISTS trg_bio_pt_evt_attr_id ON biomart.bio_patient_event_attr CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_pt_evt_attr_id () RETURNS trigger AS $BODY$
begin if NEW.BIO_CLINIC_TRIAL_ATTRIBUTE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CLINIC_TRIAL_ATTRIBUTE_ID ;       end if; RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_pt_evt_attr_id
	BEFORE INSERT ON biomart.bio_patient_event_attr FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_pt_evt_attr_id();

-- trg_bio_sample_id
DROP TRIGGER IF EXISTS trg_bio_sample_id ON biomart.bio_sample CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_sample_id () RETURNS trigger AS $BODY$
begin   if NEW.BIO_SAMPLE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_SAMPLE_ID ;       end if; RETURN NEW;   end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_sample_id
	BEFORE INSERT ON biomart.bio_sample FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_sample_id();

-- trg_bio_subject_id
DROP TRIGGER IF EXISTS trg_bio_subject_id ON biomart.bio_subject CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_subject_id () RETURNS trigger AS $BODY$
begin if NEW.BIO_SUBJECT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_SUBJECT_ID ;       end if;  RETURN NEW;  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_subject_id
	BEFORE INSERT ON biomart.bio_subject FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_subject_id();

-- trg_bio_taxon_id
DROP TRIGGER IF EXISTS trg_bio_taxon_id ON biomart.bio_taxonomy CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_bio_taxon_id () RETURNS trigger AS $BODY$
BEGIN IF NEW.BIO_TAXONOMY_ID IS NULL THEN
  select nextval('biomart.SEQ_BIO_DATA_ID') INTO NEW.BIO_TAXONOMY_ID ;
END IF;
RETURN NEW;
END;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_bio_taxon_id
	BEFORE INSERT ON biomart.bio_taxonomy FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_bio_taxon_id();

-- trg_ctd2_clin_inhib_effect
DROP TRIGGER IF EXISTS trg_ctd2_clin_inhib_effect ON biomart.ctd2_clin_inhib_effect CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_ctd2_clin_inhib_effect () RETURNS trigger AS $BODY$
BEGIN     
 	IF NEW.CTD_CIE_SEQ IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_CIE_SEQ ;  
	END IF;  
	RETURN NEW;  
END;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_ctd2_clin_inhib_effect
	BEFORE INSERT ON biomart.ctd2_clin_inhib_effect FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_ctd2_clin_inhib_effect();

-- trg_ctd2_disease
DROP TRIGGER IF EXISTS trg_ctd2_disease ON biomart.ctd2_disease CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_ctd2_disease () RETURNS trigger AS $BODY$
BEGIN     
	IF NEW.CTD_DISEASE_SEQ IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_DISEASE_SEQ ;  
	END IF;    
	RETURN NEW;
END;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_ctd2_disease
	BEFORE INSERT ON biomart.ctd2_disease FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_ctd2_disease();

-- trg_ctd2_inhib_details
DROP TRIGGER IF EXISTS trg_ctd2_inhib_details ON biomart.ctd2_inhib_details CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_ctd2_inhib_details () RETURNS trigger AS $BODY$
BEGIN     
	IF NEW.CTD_INHIB_SEQ IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_INHIB_SEQ ;  
	END IF;    
	RETURN NEW;
END;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_ctd2_inhib_details
	BEFORE INSERT ON biomart.ctd2_inhib_details FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_ctd2_inhib_details();

-- trg_ctd2_study_id
DROP TRIGGER IF EXISTS trg_ctd2_study_id ON biomart.ctd2_study CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_ctd2_study_id () RETURNS trigger AS $BODY$
BEGIN     
	IF NEW.CTD_STUDY_ID IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_STUDY_ID ;  
	END IF;    
	RETURN NEW;
END;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_ctd2_study_id
	BEFORE INSERT ON biomart.ctd2_study FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_ctd2_study_id();

-- trg_ctd2_trial_details
DROP TRIGGER IF EXISTS trg_ctd2_trial_details ON biomart.ctd2_trial_details CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trg_ctd2_trial_details () RETURNS trigger AS $BODY$
BEGIN     
	IF NEW.CTD_TD_SEQ IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_TD_SEQ ;  
	END IF;   
	RETURN NEW; 
END;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_ctd2_trial_details
	BEFORE INSERT ON biomart.ctd2_trial_details FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trg_ctd2_trial_details();

-- trig_clinical_trial_design_id
DROP TRIGGER IF EXISTS trig_clinical_trial_design_id  ON biomart.ctd_full CASCADE;
CREATE OR REPLACE FUNCTION biomart.tf_trig_clinical_trial_design_id  () RETURNS trigger AS $BODY$
begin     
    if NEW.CLINICAL_TRIAL_DESIGN_ID is null then          
      select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') into NEW.CLINICAL_TRIAL_DESIGN_ID ;  
    end if; 
    RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trig_clinical_trial_design_id 
	BEFORE INSERT ON biomart.ctd_full FOR EACH ROW
	EXECUTE PROCEDURE biomart.tf_trig_clinical_trial_design_id ();



-- FUNCTIONS
CREATE OR REPLACE FUNCTION biomart.BIOMARKER_GENE_UID (
  GENE_ID text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'GENE:' || coalesce(GENE_ID, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;

alter function biomart.biomarker_gene_uid(text) owner to biomart;


CREATE OR REPLACE FUNCTION biomart.BIOMARKER_PATHWAY_UID (
  P_SOURCE IN text ,
  PATHWAY_ID  IN text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'PATHWAY:'|| P_SOURCE || ':' || coalesce(PATHWAY_ID, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;

alter function biomart.BIOMARKER_PATHWAY_UID(text, text) owner to biomart;


CREATE OR REPLACE FUNCTION biomart.BIO_ASSAY_ANALYSIS_UID (
  ANALYSIS_NAME text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BAA:' || coalesce(ANALYSIS_NAME, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;

alter function biomart.BIO_ASSAY_ANALYSIS_UID(text) owner to biomart;


CREATE OR REPLACE FUNCTION biomart.BIO_ASSAY_PLATFORM_UID (
  PLATFORM_NAME text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BAP:' || coalesce(PLATFORM_NAME, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.BIO_ASSAY_PLATFORM_UID(text) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.BIO_ASY_ANALYSIS_PLTFM_UID (
  PLATFORM_NAME text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BAAP:' || coalesce(PLATFORM_NAME, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.BIO_ASY_ANALYSIS_PLTFM_UID(text) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.BIO_COMPOUND_UID ( CAS_REGISTRY IN text,
  JNJ_NUMBER IN text,
  CNTO_NUMBER IN text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Function to create compound_uid.

  RETURN 'COM:' || coalesce(CAS_REGISTRY, coalesce(JNJ_NUMBER, coalesce(CNTO_NUMBER, 'ERROR')));
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.BIO_COMPOUND_UID(text, text, text) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.BIO_CURATION_DATASET_UID (
  BIO_CURATION_TYPE text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BCD:' || coalesce(BIO_CURATION_TYPE, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.BIO_CURATION_DATASET_UID(text) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.BIO_DISEASE_UID (
  MESH_CODE text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates bio_disease_uid.

  RETURN 'DIS:' || coalesce(MESH_CODE, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.BIO_DISEASE_UID(text) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.BIO_EXPERIMENT_UID (
  PRIMARY_ID text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'EXP:' || coalesce(PRIMARY_ID, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.BIO_EXPERIMENT_UID(text) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.BIO_JUB_ONCOL_DATA_UID (
  RECORD_ID bigint,
  BIO_CURATION_NAME text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BJOD:' || coalesce(trim(TO_CHAR(RECORD_ID, '9999999999999999999')), 'ERROR') || ':' || coalesce(BIO_CURATION_NAME, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.BIO_JUB_ONCOL_DATA_UID(bigint, text) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.BIO_JUB_ONCOL_SUM_DATA_UID (
  RECORD_ID bigint,
  BIO_CURATION_NAME text
)  RETURNS varchar AS $body$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BJOS:' || coalesce(trim(TO_CHAR(RECORD_ID, '9999999999999999999')), 'ERROR') || ':' || coalesce(BIO_CURATION_NAME, 'ERROR');
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.BIO_JUB_ONCOL_SUM_DATA_UID(bigint, text) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.CUM_NORMAL_DIST ( 
  foldChg IN decimal, 
  mu IN decimal, 
  sigma IN decimal
)  RETURNS decimal AS $body$
DECLARE

 -------------------------------------------------------------------------------
  -- implementation of a cumalative normal distribution
  -- JWS@20090601 - First rev.
  -- param foldChg: fold change ratio from from analysis_data table
  -- param mu: mean of all analsyis_data records for a given analysis
  -- param sigma: std dev of all analsyis_data records for a given analysis
  -------------------------------------------------------------------------------

  -- temporary vars  
  t1 decimal;
  
  -- fractional error dist input
  fract_error_input decimal;
  
  -- return result (i.e. Prob [X<=x])
  ans decimal;  


BEGIN
  t1:= (foldChg-mu)/sigma;  
  fract_error_input:= t1/SQRT(2);
  ans:= 0.5 * (1.0 + biomart.fract_error_dist(fract_error_input));
  return ans; 
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.CUM_NORMAL_DIST(decimal, decimal, decimal) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.FRACT_ERROR_DIST ( normInput IN decimal
)  RETURNS decimal AS $body$
DECLARE


 -------------------------------------------------------------------------------
  -- implementation of fractional error distribution
  -- JWS@20090601 - First rev.
  -------------------------------------------------------------------------------
  -- temp var
  t1 decimal:= 1.0 / (1.0 + 0.5 * ABS(normInput));
  
  -- exponent input to next equation
  exponent_input decimal:= -normInput*normInput - 1.26551223 + 
                           t1*(1.00002368 + t1*(0.37409196 + t1*(0.09678418 + t1*(-0.18628806 + t1*(0.27886807 + t1*(-1.13520398 + t1*(1.48851587 + t1*(-0.82215223 + t1*(0.17087277)))))))));
  -- Horner's method
  ans decimal:= 1 - t1 * EXP(exponent_input);

  fractError decimal;


BEGIN
  -- handle sign
  IF normInput>0.0 THEN fractError:= ans; ELSE fractError:= -ans; END IF;
  return fractError;

END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.FRACT_ERROR_DIST(decimal) owner to biomart;



CREATE OR REPLACE FUNCTION biomart.TEA_NPV_PRECOMPUTE ( 
  foldChg IN decimal, 
  mu IN decimal, 
  sigma IN decimal
)  RETURNS decimal AS $body$
DECLARE


 -------------------------------------------------------------------------------
  -- used for gene signature TEA algorithm which precomputes normalized p-values
  -- based ON biomart.fold change ratio from analysis_data records
  -- JWS@20090601 - First rev.
  -- param foldChg: input is fold change ratio from from analysis_data table
  -- param mu: mean of all analsyis_data records for a given analysis
  -- param sigma: std dev of all analsyis_data records for a given analysis
  -------------------------------------------------------------------------------
  npv decimal;
  outlier_cutoff decimal:=1.0e-5;
  

BEGIN
  -- normalized p-value 
  npv:= 1.0 - cum_normal_dist(abs(foldChg),mu,sigma);
  
  -- cap outliers to minimum value
  IF npv<outlier_cutoff THEN npv:= outlier_cutoff; END IF;
  
  RETURN npv;
  
END;
$body$
LANGUAGE PLPGSQL;
alter function biomart.TEA_NPV_PRECOMPUTE(decimal, decimal, decimal) owner to biomart;



ALTER INDEX biomart.TMP_A_D_TEA_R_INDEX1 SET TABLESPACE BIOMART;
ALTER INDEX biomart.SYS_C0020430 SET TABLESPACE BIOMART;
ALTER INDEX biomart.BIO_TAXON_PK SET TABLESPACE BIOMART;
ALTER INDEX biomart.BIO_COMPOUND_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CONCEPT_CODE_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CONCEPT_CODE_UK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CONCEPT_CODE_TYPE_INDEX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CONTENT_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CONTENT_REFERENCE_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CONTENT_REPOSITORY_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CURATION_DATASET_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_ATTRIBUTE_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_COMPOUND_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_CORRELATION_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BDC_INDEX1 SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_SAMPLE_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_LIT_INH_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_LIT_INT_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_LIT_MODEL_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_LIT_PE_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_LIT_REF_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_LIT_SUM_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_MKR_TYPE_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_MKR_EXT_ID SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_MARKER_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_PATIENT_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_PATIENT_EVENT_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_PATIENT_EVENT_ATTR_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASSAY_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASSAY_ANALYSIS_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BAAD_IDX7 SET TABLESPACE INDX;
ALTER INDEX biomart.BAAD_IDX4 SET TABLESPACE INDX;
ALTER INDEX biomart.PK_BAAD SET TABLESPACE INDX;
ALTER INDEX biomart.BAAD_FGN_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BAAD_IDX11 SET TABLESPACE INDX;
ALTER INDEX biomart.BAAD_IDX12 SET TABLESPACE INDX;
ALTER INDEX biomart.BAD_IDX13 SET TABLESPACE INDX;
ALTER INDEX biomart.BAAD_IDX14 SET TABLESPACE INDX;
ALTER INDEX biomart.BAAD_IDX6 SET TABLESPACE INDX;
ALTER INDEX biomart.IDX_BAADT_IDX10 SET TABLESPACE INDX;
ALTER INDEX biomart.BAADT_F_IDX13 SET TABLESPACE INDX;
ALTER INDEX biomart.BAADT_IDEX12 SET TABLESPACE INDX;
ALTER INDEX biomart.BAADT_IDX11 SET TABLESPACE INDX;
ALTER INDEX biomart.BAADT_IDX6 SET TABLESPACE INDX;
ALTER INDEX biomart.BAADT_IDX7 SET TABLESPACE INDX;
ALTER INDEX biomart.IDX_BAADT_FG_AD SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_AA_DATA_T_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BAADT_IDX17 SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASSAY_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASY_FEATURE_GRP_NAME_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASY_FEATURE_GRP_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASSAY_PLATFORM_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASSAY_SAMPLE_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASY_ANALYSIS_DATASET_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_CORREL_DESCR_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DT_DIS_DID_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DD_IDX2 SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_DISEASE_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_D_E_C_DID_CT_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_E_C_T_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_E_C_C_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_EXT_CODE_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_UID_UK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_UID_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_O_M_DID_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_D_O_M_MARKER2_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASY_ANALYSIS_PLTFM_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CLINC_TRIAL_TIME_PT_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CLINICAL_TRIAL_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CURATED_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DATA_LITERATURE_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_DISEASE_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_EXP_TYPE_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_EXP_ACEN_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_EXPERIMENT_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_LIT_ALT_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_LIT_AMD_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_S_E_M_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_STATS_EXP_MK_MK_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_STATS_EXP_MK_EXP_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_SUBJECT_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_A__D_S_F_G_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_A__D_S_EXP_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_A__D_S_DS_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASY_DT_STATS_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CELL_LINE_DICT_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CELL_LINE_NAME_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CGDCP_DATA_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CLINC_TRIAL_ATTR_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_CLINC_TRIAL_PT_GROUP_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASSAY_DATASET_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_A_O_FG_ID_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_D_FG_M_MARKER2_PK SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_A_D_S_DS__S_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_A_D_S_EXP__S_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_A_D_S_F_G_S_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_A_D_S_FGI_S_IDX SET TABLESPACE INDX;
ALTER INDEX biomart.BIO_ASY_DT_STATS_S_PK SET TABLESPACE INDX;
ALTER TABLE biomart.BIO_LIT_REF_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_LIT_SUM_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_MARKER SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_PATIENT SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_PATIENT_EVENT SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_PATIENT_EVENT_ATTR SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_SAMPLE SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_STATS_EXP_MARKER SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_ANALYSIS SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASY_ANALYSIS_DATASET SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASY_ANALYSIS_PLTFM SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CLINC_TRIAL_TIME_PT SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CLINICAL_TRIAL_DESIGN SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_ANALYSIS_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_ANALYSIS_DATA_TEA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_DATASET SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DISEASE SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_EXPERIMENT SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_LIT_ALT_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_LIT_AMD_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_LIT_INH_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_LIT_INT_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_LIT_MODEL_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_LIT_PE_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD_STUDY SET TABLESPACE BIOMART;
ALTER TABLE biomart.TMP_ANALYSIS_DATA_TEA_RANK SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD2_DISEASE SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD2_INHIB_DETAILS SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD2_STUDY SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD2_TRIAL_DETAILS SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASY_DATA_STATS_ALL SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CELL_LINE SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CGDCP_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CLINC_TRIAL_ATTR SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CLINC_TRIAL_PT_GROUP SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_DATA_ANNOTATION SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_DATA_STATS SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_FEATURE_GROUP SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_PLATFORM SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY_SAMPLE SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_TAXONOMY SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD2_CLIN_INHIB_EFFECT SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_ASSAY SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CLINICAL_TRIAL SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CURATED_DATA SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_LITERATURE SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD_FULL SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD_ALLOWED_MEDS_TREATMENT SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD_BIOMARKER SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD_DISEASE SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD_DRUG_INHIB SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD_INCLUSION_CRITERIA SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD_PRIMARY_ENDPTS SET TABLESPACE BIOMART;
ALTER TABLE biomart.CTD_SEC_ENDPTS SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_COMPOUND SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CONCEPT_CODE SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CONTENT SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CONTENT_REFERENCE SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CONTENT_REPOSITORY SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_CURATION_DATASET SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_ATTRIBUTE SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_COMPOUND SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_CORRELATION SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_CORREL_DESCR SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_DISEASE SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_EXT_CODE SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_OMIC_MARKER SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_TAXONOMY SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_DATA_UID SET TABLESPACE BIOMART;
ALTER TABLE biomart.BIO_SUBJECT SET TABLESPACE BIOMART;



GRANT ALL ON SCHEMA biomart to BIOMART_USER;
REVOKE ALL ON SCHEMA biomart from PUBLIC;

-- MATERIALIZED VIEWS
-- biomart.bio_lit_int_model_mv
create TABLE biomart.bio_lit_int_model_mv
(
	BIO_LIT_INT_DATA_ID bigint,
	EXPERIMENTAL_MODEL varchar(250)
);
ALTER TABLE biomart.bio_lit_int_model_mv OWNER TO BIOMART;
ALTER TABLE biomart.BIO_LIT_INT_MODEL_MV SET TABLESPACE BIOMART;
create or replace view biomart.bio_lit_int_model_view
as   select distinct
  bio_lit_int_data_id, experimental_model
from (select
    a.bio_lit_int_data_id,
    b.experimental_model
  from
    biomart.bio_lit_int_data a
    inner join biomart.bio_lit_model_data b on a.in_vivo_model_id = b.bio_lit_model_data_id
  where
    b.experimental_model is not null
  UNION
  select
    a.bio_lit_int_data_id,
    b.experimental_model
  from
    biomart.bio_lit_int_data a
    inner join biomart.bio_lit_model_data b on a.in_vitro_model_id = b.bio_lit_model_data_id
  where
    b.experimental_model is not null
) s
;

CREATE OR REPLACE FUNCTION biomart.refresh_bio_lit_int_model_mv()
  RETURNS character varying AS
$BODY$
BEGIN

  -- populate the fake "materialized view" (i.e. actually a table) by deleting everything from it and then re-populating
  -- eventually we need a smarter algorithm for doing this

    delete from biomart.bio_lit_int_model_mv;

    insert into biomart.bio_lit_int_model_mv
    (bio_lit_int_data_id, experimental_model)    
    select bio_lit_int_data_id, experimental_model
       from biomart.bio_lit_int_model_view;  

    return true;
END;
 
 
 
$BODY$
  LANGUAGE plpgsql VOLATILE
  ;
alter function biomart.refresh_bio_lit_int_model_mv() owner to biomart;
alter view biomart.bio_lit_int_model_view owner to biomart;





-- biomart.bio_marker_correl_mv
create TABLE biomart.bio_marker_correl_mv
(
	BIO_MARKER_ID bigint,
	ASSO_BIO_MARKER_ID bigint, 
	CORREL_TYPE varchar(15),
	mv_id bigint
);
ALTER TABLE biomart.bio_marker_correl_mv OWNER TO BIOMART;
ALTER TABLE biomart.bio_marker_correl_mv SET TABLESPACE BIOMART;
create or replace view biomart.bio_marker_correl_view
as   SELECT DISTINCT b.bio_marker_id AS bio_marker_id,
    b.bio_marker_id               AS asso_bio_marker_id,
    'GENE'                        AS correl_type,
    1                             AS mv_id
  FROM biomart.bio_marker b
  WHERE b.bio_marker_type = 'GENE'
  UNION
  SELECT DISTINCT c.bio_data_id AS bio_marker_id,
    c.asso_bio_data_id          AS asso_bio_marker_id,
    'PATHWAY_GENE'              AS correl_type,
    2                           AS mv_id
  FROM biomart.bio_marker b,
    biomart.bio_data_correlation c,
    biomart.bio_data_correl_descr d
  WHERE b.bio_marker_id          = c.bio_data_id
  AND c.bio_data_correl_descr_id = d.bio_data_correl_descr_id
  AND b.primary_source_code     != 'ARIADNE'
  AND d.correlation              = 'PATHWAY GENE'
  UNION
  SELECT DISTINCT c.bio_data_id AS bio_marker_id,
    c.asso_bio_data_id          AS asso_bio_marker_id,
    'HOMOLOGENE_GENE'           AS correl_type,
    3                           AS mv_id
  FROM biomart.bio_marker b,
    biomart.bio_data_correlation c,
    biomart.bio_data_correl_descr d
  WHERE b.bio_marker_id          = c.bio_data_id
  AND c.bio_data_correl_descr_id = d.bio_data_correl_descr_id
  AND d.correlation              = 'HOMOLOGENE GENE'
;

CREATE OR REPLACE FUNCTION biomart.refresh_bio_marker_correl_mv()
  RETURNS character varying AS
$BODY$
BEGIN

  -- populate the fake "materialized view" (i.e. actually a table) by deleting everything from it and then re-populating
  -- eventually we need a smarter algorithm for doing this

    delete from biomart.bio_marker_correl_mv;

    insert into biomart.bio_marker_correl_mv
    (BIO_MARKER_ID, ASSO_BIO_MARKER_ID, CORREL_TYPE, mv_id)    
    select BIO_MARKER_ID, ASSO_BIO_MARKER_ID, CORREL_TYPE, mv_id
       from biomart.bio_marker_correl_view;  

    return true;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  ;
alter function biomart.refresh_bio_marker_correl_mv() owner to biomart;
alter view biomart.bio_marker_correl_view owner to biomart;

ALTER TABLE biomart.bio_marker_correl_mv OWNER TO BIOMART;
ALTER TABLE biomart.BIO_MARKER_CORREL_MV SET TABLESPACE BIOMART;

CREATE INDEX bio_marker_c_Mv_idx1 ON biomart.bio_marker_correl_mv (bio_marker_id, asso_bio_marker_id);
CREATE INDEX bio_marker_c_Mv_idx2 ON biomart.bio_marker_correl_mv (asso_bio_marker_id, bio_marker_id);

ALTER INDEX biomart.bio_marker_c_Mv_idx1 SET TABLESPACE BIOMART;
ALTER INDEX biomart.bio_marker_c_Mv_idx2 SET TABLESPACE BIOMART;
