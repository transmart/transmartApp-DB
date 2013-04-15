\set ON_ERROR_STOP ON

CREATE TABLE tm_cz.de_mrna_annotation_release (
	gpl_id varchar(100),
	probe_id varchar(100),
	gene_symbol varchar(100),
	gene_id varchar(100),
	probeset_id bigint
);
ALTER TABLE tm_cz.de_mrna_annotation_release OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_job_audit (
	seq_id bigint NOT NULL,
	job_id bigint NOT NULL,
	database_name varchar(50),
	procedure_name varchar(100),
	step_desc varchar(1000),
	step_status varchar(50),
	records_manipulated bigint,
	step_number bigint,
	job_date timestamp,
	time_elapsed_secs double precision DEFAULT 0
);
ALTER TABLE tm_cz.cz_job_audit OWNER TO tm_cz;
ALTER TABLE tm_cz.cz_job_audit ADD CONSTRAINT cz_job_audit_pk PRIMARY KEY (seq_id);
CREATE TABLE tm_cz.de_subject_rbm_data_release (
	trial_name varchar(15),
	antigen_name varchar(100),
	n_value bigint,
	patient_id bigint,
	gene_symbol varchar(100),
	gene_id integer,
	assay_id bigint,
	normalized_value double precision,
	concept_cd varchar(100),
	timepoint varchar(100),
	data_uid varchar(100),
	value bigint,
	log_intensity bigint,
	mean_intensity bigint,
	stddev_intensity bigint,
	median_intensity bigint,
	zscore bigint,
	rbm_panel varchar(50),
	release_study varchar(15)
);
ALTER TABLE tm_cz.de_subject_rbm_data_release OWNER TO tm_cz;
CREATE TABLE tm_cz.sample_categories_release (
	trial_cd varchar(200),
	site_cd varchar(200),
	subject_cd varchar(200),
	sample_cd varchar(200),
	category_cd varchar(200),
	category_value varchar(200),
	release_study varchar(50)
);
ALTER TABLE tm_cz.sample_categories_release OWNER TO tm_cz;
CREATE TABLE tm_cz.de_snp_gene_map_release (
	snp_id bigint,
	snp_name varchar(255),
	entrez_gene_id bigint
);
ALTER TABLE tm_cz.de_snp_gene_map_release OWNER TO tm_cz;
CREATE TABLE tm_cz.category_path_excluded_words (
	excluded_text varchar(100)
);
ALTER TABLE tm_cz.category_path_excluded_words OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_test (
	test_id bigint NOT NULL,
	test_name varchar(200),
	test_desc varchar(1000),
	test_schema varchar(255),
	test_table varchar(255),
	test_column varchar(255),
	test_type varchar(255),
	test_sql varchar(2000),
	test_param1 varchar(2000),
	test_param2 varchar(2000),
	test_param3 varchar(2000),
	test_min_value double precision,
	test_max_value double precision,
	test_category_id bigint,
	test_severity_cd varchar(20),
	table_type varchar(100)
);
ALTER TABLE tm_cz.cz_test OWNER TO tm_cz;
ALTER TABLE tm_cz.cz_test ADD CONSTRAINT cz_test_pk PRIMARY KEY (test_id);
CREATE TABLE tm_cz.de_snp_data_ds_loc_release (
	snp_data_dataset_loc_id bigint,
	trial_name varchar(255),
	snp_dataset_id bigint,
	location bigint,
	release_study varchar(200)
);
ALTER TABLE tm_cz.de_snp_data_ds_loc_release OWNER TO tm_cz;
CREATE TABLE tm_cz.tmp_trial_nodes (
	leaf_node varchar(4000),
	category_cd varchar(200),
	visit_name varchar(100),
	sample_type varchar(100),
	period varchar(100),
	data_label varchar(500),
	node_name varchar(500),
	data_value varchar(500)
);
ALTER TABLE tm_cz.tmp_trial_nodes OWNER TO tm_cz;
CREATE TABLE tm_cz.tmp_trial_data (
	usubjid varchar(50),
	study_id varchar(25),
	data_type char(1),
	visit_name varchar(100),
	data_label varchar(500),
	data_value varchar(500),
	unit_cd varchar(50),
	category_path varchar(250),
	sub_category_path_1 varchar(250),
	sub_category_path_2 varchar(250),
	patient_num bigint,
	sourcesystem_cd varchar(50),
	base_path varchar(1250)
);
ALTER TABLE tm_cz.tmp_trial_data OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_test_category (
	test_category_id bigint NOT NULL,
	test_category varchar(255),
	test_sub_category1 varchar(255),
	test_sub_category2 varchar(255)
);
ALTER TABLE tm_cz.cz_test_category OWNER TO tm_cz;
ALTER TABLE tm_cz.cz_test_category ADD CONSTRAINT cz_test_category_pk PRIMARY KEY (test_category_id);
CREATE TABLE tm_cz.observation_fact_release (
	encounter_num bigint,
	patient_num bigint,
	concept_cd varchar(50) NOT NULL,
	provider_id varchar(50) NOT NULL,
	start_date timestamp,
	modifier_cd varchar(100),
	valtype_cd varchar(50),
	tval_char varchar(255),
	nval_num double precision,
	valueflag_cd varchar(50),
	quantity_num double precision,
	units_cd varchar(50),
	end_date timestamp,
	location_cd varchar(50) NOT NULL,
	confidence_num bigint,
	update_date timestamp,
	download_date timestamp,
	import_date timestamp,
	sourcesystem_cd varchar(50),
	upload_id bigint,
	observation_blob text,
	release_study varchar(100)
);
ALTER TABLE tm_cz.observation_fact_release OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_xtrial_exclusion (
	trial_id varchar(200)
);
ALTER TABLE tm_cz.cz_xtrial_exclusion OWNER TO tm_cz;
CREATE TABLE tm_cz.tmp_num_data_types (
	category_cd varchar(200),
	data_label varchar(500),
	period varchar(100),
	sample_type varchar(100),
	visit_name varchar(100)
);
ALTER TABLE tm_cz.tmp_num_data_types OWNER TO tm_cz;
CREATE TABLE tm_cz.haploview_data_release (
	i2b2_id bigint,
	jnj_id varchar(30),
	father_id integer,
	mother_id integer,
	sex smallint,
	affection_status smallint,
	chromosome varchar(10),
	gene varchar(50),
	release smallint,
	release_date timestamp,
	trial_name varchar(50),
	snp_data text,
	release_study varchar(30)
);
ALTER TABLE tm_cz.haploview_data_release OWNER TO tm_cz;
CREATE TABLE tm_cz.de_subj_sample_map_release (
	patient_id bigint,
	site_id varchar(100),
	subject_id varchar(100),
	subject_type varchar(100),
	concept_code varchar(1000),
	assay_id bigint,
	patient_uid varchar(50),
	sample_type varchar(100),
	assay_uid varchar(100),
	trial_name varchar(30),
	timepoint varchar(100),
	timepoint_cd varchar(50),
	sample_type_cd varchar(50),
	tissue_type_cd varchar(50),
	platform varchar(50),
	platform_cd varchar(50),
	tissue_type varchar(100),
	data_uid varchar(100),
	gpl_id varchar(20),
	rbm_panel varchar(50),
	sample_id bigint,
	sample_cd varchar(200),
	category_cd varchar(1000),
	release_study varchar(30)
);
ALTER TABLE tm_cz.de_subj_sample_map_release OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_xtrial_ctrl_vocab (
	ctrl_vocab_code varchar(200) NOT NULL,
	ctrl_vocab_name varchar(200) NOT NULL,
	ctrl_vocab_category varchar(200),
	ctrl_vocab_id bigint NOT NULL
);
ALTER TABLE tm_cz.cz_xtrial_ctrl_vocab OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_data_profile_column_exclusi (
	table_name varchar(500) NOT NULL,
	column_name varchar(500) NOT NULL,
	exclusion_reason varchar(2000),
	etl_date timestamp DEFAULT LOCALTIMESTAMP
);
ALTER TABLE tm_cz.cz_data_profile_column_exclusi OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_job_message (
	job_id bigint NOT NULL,
	message_id bigint,
	message_line bigint,
	message_procedure varchar(100),
	info_message varchar(2000),
	seq_id bigint NOT NULL
);
ALTER TABLE tm_cz.cz_job_message OWNER TO tm_cz;
CREATE TABLE tm_cz.de_subj_protein_data_release (
	trial_name varchar(15),
	component varchar(15),
	intensity bigint,
	patient_id bigint,
	subject_id varchar(10),
	gene_symbol varchar(100),
	gene_id integer,
	assay_id bigint,
	timepoint varchar(20),
	n_value bigint,
	mean_intensity bigint,
	stddev_intensity bigint,
	median_intensity bigint,
	zscore bigint,
	release_study varchar(15)
);
ALTER TABLE tm_cz.de_subj_protein_data_release OWNER TO tm_cz;
CREATE TABLE tm_cz.de_subject_mrna_data_release (
	trial_name varchar(50),
	probeset_id bigint,
	assay_id bigint,
	patient_id bigint,
	timepoint varchar(100),
	pvalue double precision,
	refseq varchar(50),
	subject_id varchar(50),
	raw_intensity bigint,
	mean_intensity double precision,
	stddev_intensity double precision,
	median_intensity double precision,
	log_intensity double precision,
	zscore double precision,
	sample_id bigint,
	release_study varchar(50)
);
ALTER TABLE tm_cz.de_subject_mrna_data_release OWNER TO tm_cz;
CREATE TABLE tm_cz.probeset_deapp_20120206 (
	probeset_id bigint NOT NULL,
	probeset varchar(100) NOT NULL,
	platform varchar(100) NOT NULL
);
ALTER TABLE tm_cz.probeset_deapp_20120206 OWNER TO tm_cz;
CREATE TABLE tm_cz.node_curation (
	node_type varchar(25),
	node_name varchar(250),
	display_name varchar(250),
	display_in_ui char(1),
	data_type char(1),
	global_flag char(1),
	study_id varchar(30),
	curator_name varchar(250),
	curation_date timestamp,
	active_flag char(1)
);
ALTER TABLE tm_cz.node_curation OWNER TO tm_cz;
CREATE UNIQUE INDEX node_curation_pk ON tm_cz.node_curation (node_type,node_name,study_id);
CREATE TABLE tm_cz.de_snp_info_release (
	snp_info_id bigint,
	name varchar(255),
	chrom varchar(16),
	chrom_pos bigint
);
ALTER TABLE tm_cz.de_snp_info_release OWNER TO tm_cz;
CREATE TABLE tm_cz.i2b2_release (
	c_hlevel bigint,
	c_fullname varchar(900) NOT NULL,
	c_name varchar(2000),
	c_synonym_cd char(1),
	c_visualattributes char(3),
	c_totalnum bigint,
	c_basecode varchar(450),
	c_metadataxml text,
	c_facttablecolumn varchar(50),
	c_tablename varchar(50),
	c_columnname varchar(50),
	c_columndatatype varchar(50),
	c_operator varchar(10),
	c_dimcode varchar(900),
	c_comment text,
	c_tooltip varchar(900),
	update_date timestamp,
	download_date timestamp,
	import_date timestamp,
	sourcesystem_cd varchar(50),
	valuetype_cd varchar(50),
	i2b2_id bigint,
	release_study varchar(50)
);
ALTER TABLE tm_cz.i2b2_release OWNER TO tm_cz;
CREATE TABLE tm_cz.de_snp_data_by_probe_release (
	snp_data_by_probe_id bigint,
	probe_id bigint,
	probe_name varchar(255),
	snp_id bigint,
	snp_name varchar(255),
	trial_name varchar(255),
	data_by_probe text,
	release_study varchar(200)
);
ALTER TABLE tm_cz.de_snp_data_by_probe_release OWNER TO tm_cz;
CREATE TABLE tm_cz.tmp_subject_info (
	usubjid varchar(100),
	age_in_years_num smallint,
	sex_cd varchar(50),
	race_cd varchar(50)
);
ALTER TABLE tm_cz.tmp_subject_info OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_data_profile_stats (
	table_name varchar(500) NOT NULL,
	column_name varchar(500) NOT NULL,
	data_type varchar(500),
	column_length integer,
	column_precision integer,
	column_scale integer NOT NULL,
	total_count bigint,
	percentage_null real,
	null_count bigint,
	non_null_count bigint,
	distinct_count bigint,
	max_length integer,
	min_length integer,
	first_value varchar(4000),
	last_value varchar(4000),
	max_length_value varchar(4000),
	min_length_value varchar(4000),
	etl_date timestamp DEFAULT LOCALTIMESTAMP
);
ALTER TABLE tm_cz.cz_data_profile_stats OWNER TO tm_cz;
CREATE TABLE tm_cz.de_snp_probe_sort_def_release (
	snp_probe_sorted_def_id bigint,
	platform_name varchar(255),
	num_probe bigint,
	chrom varchar(16),
	probe_def text,
	snp_id_def text
);
ALTER TABLE tm_cz.de_snp_probe_sort_def_release OWNER TO tm_cz;
CREATE TABLE tm_cz.i2b2_tags_release (
	tag_id bigint NOT NULL,
	path varchar(200),
	tag varchar(200),
	tag_type varchar(200),
	release_study varchar(200)
);
ALTER TABLE tm_cz.i2b2_tags_release OWNER TO tm_cz;
CREATE TABLE tm_cz.concept_dimension_release (
	concept_cd varchar(50) NOT NULL,
	concept_path varchar(700) NOT NULL,
	name_char varchar(2000),
	concept_blob text,
	update_date timestamp,
	download_date timestamp,
	import_date timestamp,
	sourcesystem_cd varchar(50),
	upload_id bigint,
	table_name varchar(255),
	release_study varchar(50)
);
ALTER TABLE tm_cz.concept_dimension_release OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_data_profile_column_sample (
	table_name varchar(500),
	column_name varchar(500),
	value varchar(4000),
	count bigint,
	etl_date timestamp DEFAULT LOCALTIMESTAMP
);
ALTER TABLE tm_cz.cz_data_profile_column_sample OWNER TO tm_cz;
CREATE TABLE tm_cz.bio_clinical_trial_release (
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
	bio_experiment_id bigint,
	development_partner varchar(100),
	geo_platform varchar(30),
	main_findings varchar(2000),
	platform_name varchar(200),
	search_area varchar(100),
	release_study varchar(510)
);
ALTER TABLE tm_cz.bio_clinical_trial_release OWNER TO tm_cz;
CREATE TABLE tm_cz.probeset_deapp (
	probeset_id bigint NOT NULL,
	probeset varchar(100) NOT NULL,
	platform varchar(100) NOT NULL,
	organism varchar(200)
);
ALTER TABLE tm_cz.probeset_deapp OWNER TO tm_cz;
CREATE INDEX probeset_deapp_i1 ON tm_cz.probeset_deapp (probeset_id);
CREATE INDEX probeset_deapp_i2 ON tm_cz.probeset_deapp (probeset,platform);
CREATE TABLE tm_cz.bio_data_compound_release (
	bio_data_id bigint NOT NULL,
	bio_compound_id bigint NOT NULL,
	etl_source varchar(100),
	release_study varchar(100)
);
ALTER TABLE tm_cz.bio_data_compound_release OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_job_error (
	job_id bigint NOT NULL,
	error_number varchar(50),
	error_message varchar(1000),
	error_stack varchar(2000),
	seq_id bigint NOT NULL,
	error_backtrace varchar(2000)
);
ALTER TABLE tm_cz.cz_job_error OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_test_result (
	test_id bigint NOT NULL,
	test_result_id bigint NOT NULL,
	test_result_text varchar(2000),
	test_result_nbr bigint,
	test_run_id bigint,
	external_location varchar(2000),
	run_date timestamp,
	study_id varchar(2000)
);
ALTER TABLE tm_cz.cz_test_result OWNER TO tm_cz;
CREATE TABLE tm_cz.bio_data_uid_release (
	bio_data_id bigint NOT NULL,
	unique_id varchar(200) NOT NULL,
	bio_data_type varchar(100) NOT NULL,
	release_study varchar(200) NOT NULL
);
ALTER TABLE tm_cz.bio_data_uid_release OWNER TO tm_cz;
CREATE TABLE tm_cz.de_snp_data_by_patient_release (
	snp_data_by_patient_id bigint,
	snp_dataset_id bigint,
	trial_name varchar(255),
	patient_num bigint,
	chrom varchar(16),
	data_by_patient_chr text,
	ped_by_patient_chr text,
	release_study varchar(255)
);
ALTER TABLE tm_cz.de_snp_data_by_patient_release OWNER TO tm_cz;
CREATE TABLE tm_cz.de_snp_probe_release (
	snp_probe_id bigint,
	probe_name varchar(255),
	snp_id bigint,
	snp_name varchar(255),
	vendor_name varchar(255)
);
ALTER TABLE tm_cz.de_snp_probe_release OWNER TO tm_cz;
CREATE TABLE tm_cz.de_gpl_info_release (
	platform varchar(10),
	title varchar(500),
	organism varchar(100),
	annotation_date timestamp
);
ALTER TABLE tm_cz.de_gpl_info_release OWNER TO tm_cz;
CREATE TABLE tm_cz.patient_dimension_release (
	patient_num bigint,
	vital_status_cd varchar(50),
	birth_date timestamp,
	death_date timestamp,
	sex_cd varchar(50),
	age_in_years_num bigint,
	language_cd varchar(50),
	race_cd varchar(50),
	marital_status_cd varchar(50),
	religion_cd varchar(50),
	zip_cd varchar(50),
	statecityzip_path varchar(700),
	update_date timestamp,
	download_date timestamp,
	import_date timestamp,
	sourcesystem_cd varchar(50),
	upload_id bigint,
	patient_blob text,
	release_study varchar(50)
);
ALTER TABLE tm_cz.patient_dimension_release OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_job_master (
	job_id bigint DEFAULT NULL,
	start_date timestamp,
	end_date timestamp,
	active varchar(1),
	time_elapsed_secs double precision DEFAULT 0,
	build_id bigint,
	session_id bigint,
	database_name varchar(50),
	job_status varchar(50),
	job_name varchar(500)
);
ALTER TABLE tm_cz.cz_job_master OWNER TO tm_cz;
ALTER TABLE tm_cz.cz_job_master ADD CONSTRAINT cz_job_master_pk PRIMARY KEY (job_id);
CREATE TABLE tm_cz.bio_experiment_release (
	bio_experiment_id bigint,
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
	access_type varchar(100),
	release_study varchar(100)
);
ALTER TABLE tm_cz.bio_experiment_release OWNER TO tm_cz;
CREATE TABLE tm_cz.annotation_deapp (
	gpl_id varchar(100),
	probe_id varchar(100),
	gene_symbol varchar(100),
	gene_id varchar(100),
	probeset_id bigint,
	organism varchar(200)
);
ALTER TABLE tm_cz.annotation_deapp OWNER TO tm_cz;
CREATE TABLE tm_cz.annotation_deapp_20120206 (
	gpl_id varchar(100),
	probe_id varchar(100),
	gene_symbol varchar(100),
	gene_id varchar(100),
	probeset_id bigint
);
ALTER TABLE tm_cz.annotation_deapp_20120206 OWNER TO tm_cz;
CREATE TABLE tm_cz.search_secure_object_release (
	search_secure_object_id bigint,
	bio_data_id bigint,
	display_name varchar(100),
	data_type varchar(200),
	bio_data_unique_id varchar(200),
	release_study varchar(100)
);
ALTER TABLE tm_cz.search_secure_object_release OWNER TO tm_cz;
CREATE TABLE tm_cz.cz_person (
	person_id bigint NOT NULL,
	f_name varchar(200),
	l_name varchar(200),
	m_name varchar(200),
	user_name varchar(20),
	role_code varchar(20),
	email_address varchar(100),
	mail_address varchar(200),
	cell_phone varchar(20),
	work_phone varchar(20)
);
ALTER TABLE tm_cz.cz_person OWNER TO tm_cz;
ALTER TABLE tm_cz.cz_person ADD CONSTRAINT cz_person_pk PRIMARY KEY (person_id);
ALTER TABLE tm_cz.cz_test ADD CONSTRAINT cz_test_cz_test_category_fk1 FOREIGN KEY (test_category_id) REFERENCES tm_cz.cz_test_category (test_category_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;


ALTER TABLE tm_cz.bio_clinical_trial_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.bio_data_compound_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.bio_data_uid_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.category_path_excluded_words OWNER TO TM_CZ;
ALTER TABLE tm_cz.concept_dimension_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.cz_job_audit OWNER TO TM_CZ;
ALTER TABLE tm_cz.cz_job_error OWNER TO TM_CZ;
ALTER TABLE tm_cz.cz_job_master OWNER TO TM_CZ;
ALTER TABLE tm_cz.cz_job_message OWNER TO TM_CZ;
ALTER TABLE tm_cz.cz_person OWNER TO TM_CZ;
ALTER TABLE tm_cz.de_gpl_info_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.de_subject_rbm_data_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.haploview_data_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.i2b2_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.i2b2_tags_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.observation_fact_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.patient_dimension_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.search_secure_object_release OWNER TO TM_CZ;
ALTER TABLE tm_cz.tmp_num_data_types OWNER TO TM_CZ;
ALTER TABLE tm_cz.tmp_subject_info OWNER TO TM_CZ;
ALTER TABLE tm_cz.tmp_trial_data OWNER TO TM_CZ;
ALTER TABLE tm_cz.tmp_trial_nodes OWNER TO TM_CZ;


CREATE SEQUENCE tm_cz.emt_temp_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 11621 CACHE 20;
ALTER SEQUENCE tm_cz.emt_temp_seq OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.rtqalimits_testid_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE tm_cz.rtqalimits_testid_seq OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.rtqastatslist_testid_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 80000 CACHE 20;
ALTER SEQUENCE tm_cz.rtqastatslist_testid_seq OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_child_rollup_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1681 CACHE 20;
ALTER SEQUENCE tm_cz.seq_child_rollup_id OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz INCREMENT 1 MINVALUE 1 MAXVALUE 9999999999 START 141 CACHE 20;
ALTER SEQUENCE tm_cz.seq_cz OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_data INCREMENT 1 MINVALUE 1 NO MAXVALUE START 5 CACHE 2;
ALTER SEQUENCE tm_cz.seq_cz_data OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_data_file INCREMENT 1 MINVALUE 1 NO MAXVALUE START 6 CACHE 2;
ALTER SEQUENCE tm_cz.seq_cz_data_file OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_dw_version_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 41 CACHE 2;
ALTER SEQUENCE tm_cz.seq_cz_dw_version_id OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_job_audit INCREMENT 1 MINVALUE 1 NO MAXVALUE START 123843 CACHE 2;
ALTER SEQUENCE tm_cz.seq_cz_job_audit OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_job_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 413 CACHE 20;
ALTER SEQUENCE tm_cz.seq_cz_job_id OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_job_master INCREMENT 1 MINVALUE 1 NO MAXVALUE START 12627 CACHE 2;
ALTER SEQUENCE tm_cz.seq_cz_job_master OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_job_message INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 2;
ALTER SEQUENCE tm_cz.seq_cz_job_message OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_person_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 41 CACHE 2;
ALTER SEQUENCE tm_cz.seq_cz_person_id OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_test INCREMENT 1 MINVALUE 1 NO MAXVALUE START 8259 CACHE 2;
ALTER SEQUENCE tm_cz.seq_cz_test OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_cz_test_category INCREMENT 1 MINVALUE 1 NO MAXVALUE START 5 CACHE 2;
ALTER SEQUENCE tm_cz.seq_cz_test_category OWNER TO tm_cz;
CREATE SEQUENCE tm_cz.seq_probeset_id INCREMENT 1 MINVALUE 1 MAXVALUE 99999999 START 5461 CACHE 20;
ALTER SEQUENCE tm_cz.seq_probeset_id OWNER TO tm_cz;

DROP TRIGGER IF EXISTS trg_cz_job_id ON tm_cz.cz_job_master CASCADE;
CREATE OR REPLACE FUNCTION tm_cz.tf_trg_cz_job_id () RETURNS trigger AS $BODY$
begin     
      if coalesce(NEW.JOB_ID::text, '') = '' then          
        select nextval('tm_cz.SEQ_CZ_JOB_MASTER') into NEW.JOB_ID ;       
      end if;       
       RETURN NEW;
  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_cz_job_id
	BEFORE INSERT ON tm_cz.cz_job_master FOR EACH ROW
	EXECUTE PROCEDURE tm_cz.tf_trg_cz_job_id();

	
DROP TRIGGER IF EXISTS trg_cz_personid ON tm_cz.cz_person CASCADE;
CREATE OR REPLACE FUNCTION tm_cz.tf_trg_cz_personid () RETURNS trigger AS $BODY$
begin            
if NEW.PERSON_ID is null then          
select nextval('tm_cz.SEQ_CZ_PERSON_ID') into NEW.PERSON_ID ;       end if;      RETURN NEW; end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_cz_personid
	BEFORE INSERT ON tm_cz.cz_person FOR EACH ROW
	EXECUTE PROCEDURE tm_cz.tf_trg_cz_personid();

DROP TRIGGER IF EXISTS trg_cz_seq_id ON tm_cz.cz_job_audit CASCADE;
CREATE OR REPLACE FUNCTION tm_cz.tf_trg_cz_seq_id () RETURNS trigger AS $BODY$
begin     
      if coalesce(NEW.SEQ_ID::text, '') = '' then          
        select nextval('tm_cz.SEQ_CZ_JOB_AUDIT') into NEW.SEQ_ID ;       
      end if;       
       RETURN NEW;
  end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_cz_seq_id
	BEFORE INSERT ON tm_cz.cz_job_audit FOR EACH ROW
	EXECUTE PROCEDURE tm_cz.tf_trg_cz_seq_id();

DROP TRIGGER IF EXISTS trg_cz_test_category_id ON tm_cz.cz_test_category CASCADE;
CREATE OR REPLACE FUNCTION tm_cz.tf_trg_cz_test_category_id () RETURNS trigger AS $BODY$
begin            
if NEW.TEST_CATEGORY_ID is null then          
select nextval('tm_cz.SEQ_CZ') into NEW.TEST_CATEGORY_ID ;       end if;       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_cz_test_category_id
	BEFORE INSERT ON tm_cz.cz_test_category FOR EACH ROW
	EXECUTE PROCEDURE tm_cz.tf_trg_cz_test_category_id();

DROP TRIGGER IF EXISTS trg_cz_test_id ON tm_cz.cz_test CASCADE;
CREATE OR REPLACE FUNCTION tm_cz.tf_trg_cz_test_id () RETURNS trigger AS $BODY$
begin      
if NEW.TEST_ID is null then          
select nextval('tm_cz.SEQ_CZ') into NEW.TEST_ID ;       end if;       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_cz_test_id
	BEFORE INSERT ON tm_cz.cz_test FOR EACH ROW
	EXECUTE PROCEDURE tm_cz.tf_trg_cz_test_id();

DROP TRIGGER IF EXISTS trg_cz_test_result_id ON tm_cz.cz_test_result CASCADE;
CREATE OR REPLACE FUNCTION tm_cz.tf_trg_cz_test_result_id () RETURNS trigger AS $BODY$
begin     
if NEW.TEST_RESULT_ID is null then          
select nextval('tm_cz.SEQ_CZ') into NEW.TEST_RESULT_ID ;       end if;       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_cz_test_result_id
	BEFORE INSERT ON tm_cz.cz_test_result FOR EACH ROW
	EXECUTE PROCEDURE tm_cz.tf_trg_cz_test_result_id();

DROP TRIGGER IF EXISTS trg_probeset_deapp ON tm_cz.probeset_deapp CASCADE;
CREATE OR REPLACE FUNCTION tm_cz.tf_trg_probeset_deapp () RETURNS trigger AS $BODY$
begin     
			if NEW.PROBESET_ID is null then
				select nextval('tm_cz.SEQ_PROBESET_ID') into NEW.PROBESET_ID ;       
			end if;   
	RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_probeset_deapp
	BEFORE INSERT ON tm_cz.probeset_deapp FOR EACH ROW
	EXECUTE PROCEDURE tm_cz.tf_trg_probeset_deapp();

DROP TRIGGER IF EXISTS trg_xtrial_ctrl_vocab_id ON tm_cz.cz_xtrial_ctrl_vocab CASCADE;
CREATE OR REPLACE FUNCTION tm_cz.tf_trg_xtrial_ctrl_vocab_id () RETURNS trigger AS $BODY$
begin     
if NEW.CTRL_VOCAB_ID is null then          
select nextval('tm_cz.SEQ_CZ') into NEW.CTRL_VOCAB_ID ;       end if;       RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_xtrial_ctrl_vocab_id
	BEFORE INSERT ON tm_cz.cz_xtrial_ctrl_vocab FOR EACH ROW
	EXECUTE PROCEDURE tm_cz.tf_trg_xtrial_ctrl_vocab_id();




ALTER INDEX tm_cz.NODE_CURATION_PK SET TABLESPACE INDX;
ALTER INDEX tm_cz.CZ_JOB_AUDIT_PK SET TABLESPACE TRANSMART;
ALTER INDEX tm_cz.CZ_JOB_MASTER_PK SET TABLESPACE TRANSMART;
ALTER INDEX tm_cz.CZ_PERSON_PK SET TABLESPACE TRANSMART;
ALTER INDEX tm_cz.CZ_TEST_PK SET TABLESPACE TRANSMART;
ALTER INDEX tm_cz.CZ_TEST_CATEGORY_PK SET TABLESPACE TRANSMART;
ALTER INDEX tm_cz.PROBESET_DEAPP_I1 SET TABLESPACE TRANSMART;
ALTER INDEX tm_cz.PROBESET_DEAPP_I2 SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.BIO_CLINICAL_TRIAL_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CONCEPT_DIMENSION_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SNP_DATA_BY_PATIENT_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SNP_DATA_BY_PROBE_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SNP_PROBE_SORT_DEF_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.HAPLOVIEW_DATA_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.I2B2_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_GPL_INFO_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_MRNA_ANNOTATION_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SNP_DATA_DS_LOC_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SNP_GENE_MAP_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SNP_INFO_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SNP_PROBE_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SUBJECT_MRNA_DATA_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SUBJECT_RBM_DATA_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SUBJ_PROTEIN_DATA_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.DE_SUBJ_SAMPLE_MAP_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_JOB_AUDIT SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_JOB_ERROR SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_JOB_MASTER SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_JOB_MESSAGE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_PERSON SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_TEST SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_TEST_CATEGORY SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_TEST_RESULT SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_XTRIAL_CTRL_VOCAB SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_XTRIAL_EXCLUSION SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.ANNOTATION_DEAPP SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.ANNOTATION_DEAPP_20120206 SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.BIO_DATA_COMPOUND_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.BIO_DATA_UID_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.BIO_EXPERIMENT_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CATEGORY_PATH_EXCLUDED_WORDS SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_DATA_PROFILE_COLUMN_EXCLUSI SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_DATA_PROFILE_COLUMN_SAMPLE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.CZ_DATA_PROFILE_STATS SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.OBSERVATION_FACT_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.PATIENT_DIMENSION_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.I2B2_TAGS_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.NODE_CURATION SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.PROBESET_DEAPP SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.PROBESET_DEAPP_20120206 SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.SAMPLE_CATEGORIES_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.SEARCH_SECURE_OBJECT_RELEASE SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.TMP_NUM_DATA_TYPES SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.TMP_SUBJECT_INFO SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.TMP_TRIAL_DATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_cz.TMP_TRIAL_NODES SET TABLESPACE TRANSMART;

REVOKE ALL ON SCHEMA TM_CZ FROM PUBLIC;
GRANT ALL ON SCHEMA TM_CZ TO BIOMART_USER;
