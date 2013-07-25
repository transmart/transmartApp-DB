\set ON_ERROR_STOP ON

CREATE TABLE tm_wz.wt_subject_mrna_data (
	probeset varchar(500),
	expr_id varchar(500),
	intensity_value bigint,
	assay_id bigint,
	patient_id bigint,
	sample_id bigint,
	subject_id varchar(100),
	trial_name varchar(200),
	timepoint varchar(200),
	sample_type varchar(200),
	platform varchar(200),
	tissue_type varchar(200)
);
ALTER TABLE tm_wz.wt_subject_mrna_data OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_subject_mrna_probeset (
	probeset_id bigint,
	expr_id varchar(500),
	intensity_value numeric,
	num_calls numeric,
	pvalue numeric,
	assay_id bigint,
	patient_id bigint,
	sample_id bigint,
	subject_id varchar(100),
	trial_name varchar(200),
	timepoint varchar(200),
	sample_type varchar(200),
	platform varchar(200),
	tissue_type varchar(200)
);
ALTER TABLE tm_wz.wt_subject_mrna_probeset OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_clinical_data_dups (
	site_id varchar(50),
	subject_id varchar(20),
	visit_name varchar(100),
	data_label varchar(500),
	category_cd varchar(250)
);
ALTER TABLE tm_wz.wt_clinical_data_dups OWNER TO tm_wz;
CREATE TABLE tm_wz.wrk_mrna_data (
	probeset varchar(100),
	expr_id varchar(100),
	raw_intensity varchar(50)
);
ALTER TABLE tm_wz.wrk_mrna_data OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_trial_nodes (
	leaf_node varchar(4000),
	category_cd varchar(200),
	visit_name varchar(100),
	sample_type varchar(100),
	data_label varchar(500),
	node_name varchar(500),
	data_value varchar(500),
	data_type varchar(20)
);
ALTER TABLE tm_wz.wt_trial_nodes OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_xtrial_nodes (
	xtrial_cd varchar(200),
	trial_name varchar(200),
	leaf_name varchar(200),
	data_type varchar(10),
	concept_cd varchar(200),
	leaf_node varchar(2000)
);
ALTER TABLE tm_wz.wt_xtrial_nodes OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_subject_microarray_med (
	probeset_id bigint,
	intensity_value bigint,
	log_intensity bigint,
	assay_id bigint,
	patient_id bigint,
	sample_id bigint,
	subject_id varchar(50),
	trial_name varchar(50),
	timepoint varchar(100),
	pvalue double precision,
	num_calls bigint,
	mean_intensity bigint,
	stddev_intensity bigint,
	median_intensity bigint,
	zscore bigint
);
ALTER TABLE tm_wz.wt_subject_microarray_med OWNER TO tm_wz;
CREATE TABLE tm_wz.wrk_clinical_data (
	study_id varchar(25),
	site_id varchar(50),
	subject_id varchar(20),
	visit_name varchar(100),
	data_label varchar(500),
	data_value varchar(500),
	category_cd varchar(250),
	etl_job_id bigint,
	etl_date timestamp,
	usubjid varchar(200),
	category_path varchar(1000),
	data_type varchar(10),
	ctrl_vocab_code varchar(200)
);
ALTER TABLE tm_wz.wrk_clinical_data OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_subject_microarray_calcs (
	trial_name varchar(50),
	probeset_id bigint,
	mean_intensity bigint,
	median_intensity bigint,
	stddev_intensity bigint
);
ALTER TABLE tm_wz.wt_subject_microarray_calcs OWNER TO tm_wz;
CREATE INDEX wt_subject_mrna_calcs_i1 ON tm_wz.wt_subject_microarray_calcs (trial_name,probeset_id);
CREATE TABLE tm_wz.wt_subject_info (
	usubjid varchar(100),
	age_in_years_num smallint,
	sex_cd varchar(50),
	race_cd varchar(50)
);
ALTER TABLE tm_wz.wt_subject_info OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_num_data_types (
	category_cd varchar(200),
	data_label varchar(500),
	sample_type varchar(100),
	visit_name varchar(100)
);
ALTER TABLE tm_wz.wt_num_data_types OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_subject_microarray_logs (
	probeset_id bigint,
	intensity_value bigint,
	pvalue double precision,
	num_calls bigint,
	assay_id bigint,
	patient_id bigint,
	sample_id bigint,
	subject_id varchar(50),
	trial_name varchar(50),
	timepoint varchar(100),
	log_intensity numeric,
	raw_intensity numeric
);
ALTER TABLE tm_wz.wt_subject_microarray_logs OWNER TO tm_wz;
CREATE INDEX wt_subject_mrna_logs_i1 ON tm_wz.wt_subject_microarray_logs (trial_name,probeset_id);
CREATE TABLE tm_wz.wt_mrna_data (
	probeset varchar(100),
	expr_id varchar(100),
	intensity_value varchar(50)
);
ALTER TABLE tm_wz.wt_mrna_data OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_mrna_nodes (
	leaf_node varchar(2000),
	category_cd varchar(2000),
	platform varchar(2000),
	tissue_type varchar(2000),
	attribute_1 varchar(2000),
	attribute_2 varchar(2000),
	title varchar(2000),
	node_name varchar(2000),
	concept_cd varchar(100),
	transform_method varchar(2000),
	node_type varchar(50)
);
ALTER TABLE tm_wz.wt_mrna_nodes OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_mrna_node_values (
	category_cd varchar(2000),
	platform varchar(2000),
	tissue_type varchar(2000),
	attribute_1 varchar(2000),
	attribute_2 varchar(2000),
	title varchar(2000),
	transform_method varchar(2000)
);
ALTER TABLE tm_wz.wt_mrna_node_values OWNER TO tm_wz;
CREATE TABLE tm_wz.wt_mrna_subj_sample_map (
	trial_name varchar(100),
	site_id varchar(100),
	subject_id varchar(100),
	sample_cd varchar(100),
	platform varchar(100),
	tissue_type varchar(100),
	attribute_1 varchar(256),
	attribute_2 varchar(200),
	category_cd varchar(200)
);

ALTER TABLE tm_wz.wt_mrna_subj_sample_map OWNER TO TM_WZ;
ALTER TABLE tm_wz.wrk_clinical_data OWNER TO TM_WZ;
ALTER TABLE tm_wz.wrk_mrna_data OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_clinical_data_dups OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_mrna_data OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_mrna_nodes OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_mrna_node_values OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_mrna_subj_sample_map OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_num_data_types OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_subject_info OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_subject_microarray_calcs OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_subject_microarray_logs OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_subject_microarray_med OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_subject_mrna_data OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_subject_mrna_probeset OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_trial_nodes OWNER TO TM_WZ;
ALTER TABLE tm_wz.wt_xtrial_nodes OWNER TO TM_WZ;
ALTER INDEX tm_wz.WT_SUBJECT_MRNA_LOGS_I1 SET TABLESPACE INDX;
ALTER INDEX tm_wz.WT_SUBJECT_MRNA_CALCS_I1 SET TABLESPACE INDX;
ALTER TABLE tm_wz.WT_SUBJECT_INFO SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_SUBJECT_MICROARRAY_CALCS SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_SUBJECT_MICROARRAY_LOGS SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_SUBJECT_MICROARRAY_MED SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_SUBJECT_MRNA_DATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WRK_CLINICAL_DATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WRK_MRNA_DATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_CLINICAL_DATA_DUPS SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_MRNA_DATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_MRNA_NODES SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_MRNA_NODE_VALUES SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_MRNA_SUBJ_SAMPLE_MAP SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_NUM_DATA_TYPES SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_SUBJECT_MRNA_PROBESET SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_TRIAL_NODES SET TABLESPACE TRANSMART;
ALTER TABLE tm_wz.WT_XTRIAL_NODES SET TABLESPACE TRANSMART;

REVOKE ALL ON SCHEMA TM_WZ FROM PUBLIC;
GRANT ALL ON SCHEMA TM_WZ TO TM_CZ;
