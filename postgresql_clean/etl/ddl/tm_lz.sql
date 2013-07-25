\set ON_ERROR_STOP ON

CREATE TABLE tm_lz.lt_src_sample_categories (
	trial_cd varchar(200),
	site_cd varchar(200),
	subject_cd varchar(200),
	sample_cd varchar(200),
	category_cd varchar(200),
	category_value varchar(200)
);
ALTER TABLE tm_lz.lt_src_sample_categories OWNER TO tm_lz;
CREATE TABLE tm_lz.lz_src_sample_categories_bkup (
	trial_cd varchar(200),
	site_cd varchar(200),
	subject_cd varchar(200),
	sample_cd varchar(200),
	category_cd varchar(200),
	category_value varchar(200)
);
ALTER TABLE tm_lz.lz_src_sample_categories_bkup OWNER TO tm_lz;
CREATE TABLE tm_lz.wt_snp_nodes (
	leaf_node varchar(2000),
	category_cd varchar(500),
	platform varchar(500),
	sample_type varchar(200),
	timepoint varchar(200),
	node_type varchar(100)
);
ALTER TABLE tm_lz.wt_snp_nodes OWNER TO tm_lz;
CREATE TABLE tm_lz.lt_src_mrna_data (
	trial_name varchar(25),
	probeset varchar(100),
	expr_id varchar(100),
	intensity_value varchar(50)
);
ALTER TABLE tm_lz.lt_src_mrna_data OWNER TO tm_lz;
CREATE TABLE tm_lz.lz_src_mrna_subj_samp_map (
	trial_name varchar(100),
	site_id varchar(100),
	subject_id varchar(100),
	sample_cd varchar(100),
	platform varchar(100),
	tissue_type varchar(100),
	attribute_1 varchar(256),
	attribute_2 varchar(200),
	category_cd varchar(200),
	source_cd varchar(50)
);
ALTER TABLE tm_lz.lz_src_mrna_subj_samp_map OWNER TO tm_lz;
CREATE INDEX lz_src_mrna_subj_samp_idx1 ON tm_lz.lz_src_mrna_subj_samp_map (trial_name,source_cd);
CREATE TABLE tm_lz.lz_src_sample_categories (
	trial_cd varchar(200),
	site_cd varchar(200),
	subject_cd varchar(200),
	sample_cd varchar(200),
	category_cd varchar(200),
	category_value varchar(200)
);
ALTER TABLE tm_lz.lz_src_sample_categories OWNER TO tm_lz;
CREATE TABLE tm_lz.lz_src_mrna_data (
	trial_name varchar(25),
	probeset varchar(100),
	expr_id varchar(100),
	intensity_value varchar(50),
	source_cd varchar(200)
);
ALTER TABLE tm_lz.lz_src_mrna_data OWNER TO tm_lz;
CREATE TABLE tm_lz.lt_src_mrna_subj_samp_map (
	trial_name varchar(100),
	site_id varchar(100),
	subject_id varchar(100),
	sample_cd varchar(100),
	platform varchar(100),
	tissue_type varchar(100),
	attribute_1 varchar(256),
	attribute_2 varchar(200),
	category_cd varchar(200),
	source_cd varchar(200)
);
ALTER TABLE tm_lz.lt_src_mrna_subj_samp_map OWNER TO tm_lz;
CREATE TABLE tm_lz.lt_src_deapp_annot (
	gpl_id varchar(100),
	probe_id varchar(100),
	gene_symbol varchar(100),
	gene_id varchar(250),
	organism varchar(200)
);
ALTER TABLE tm_lz.lt_src_deapp_annot OWNER TO tm_lz;
CREATE TABLE tm_lz.lt_src_study_metadata (
	study_title varchar(500),
	study_date varchar(50),
	study_owner varchar(500),
	study_institution varchar(500),
	study_country varchar(500),
	study_related_publication varchar(500),
	study_description varchar(2000),
	study_access_type varchar(500),
	study_phase varchar(500),
	study_objective varchar(2000),
	study_biomarker_type varchar(500),
	study_compound varchar(500),
	study_design_factors varchar(2000),
	study_nbr_subjects varchar(20),
	study_organism varchar(500),
	study_id varchar(50)
);
ALTER TABLE tm_lz.lt_src_study_metadata OWNER TO tm_lz;
CREATE TABLE tm_lz.wt_snp_node_values (
	category_cd varchar(500),
	sample_type varchar(200),
	timepoint varchar(200),
	title varchar(500)
);
ALTER TABLE tm_lz.wt_snp_node_values OWNER TO tm_lz;
CREATE TABLE tm_lz.lz_src_clinical_data (
	study_id varchar(25),
	site_id varchar(50),
	subject_id varchar(20),
	visit_name varchar(100),
	data_label varchar(500),
	data_value varchar(500),
	category_cd varchar(250),
	etl_job_id bigint,
	etl_date timestamp,
	ctrl_vocab_code varchar(200)
);
ALTER TABLE tm_lz.lz_src_clinical_data OWNER TO tm_lz;
CREATE TABLE tm_lz.lt_src_clinical_data (
	study_id varchar(25),
	site_id varchar(50),
	subject_id varchar(20),
	visit_name varchar(100),
	data_label varchar(500),
	data_value varchar(500),
	category_cd varchar(250),
	ctrl_vocab_code varchar(200)
);
ALTER TABLE tm_lz.lt_src_clinical_data OWNER TO tm_lz;

ALTER TABLE tm_lz.lt_src_clinical_data OWNER TO TM_LZ;
ALTER TABLE tm_lz.lt_src_deapp_annot OWNER TO TM_LZ;
ALTER TABLE tm_lz.lt_src_mrna_data OWNER TO TM_LZ;
ALTER TABLE tm_lz.lt_src_mrna_subj_samp_map OWNER TO TM_LZ;
ALTER TABLE tm_lz.lt_src_sample_categories OWNER TO TM_LZ;
ALTER TABLE tm_lz.lt_src_study_metadata OWNER TO TM_LZ;
ALTER TABLE tm_lz.lz_src_clinical_data OWNER TO TM_LZ;
ALTER TABLE tm_lz.lz_src_mrna_data OWNER TO TM_LZ;
ALTER TABLE tm_lz.lz_src_mrna_subj_samp_map OWNER TO TM_LZ;
ALTER TABLE tm_lz.lz_src_sample_categories OWNER TO TM_LZ;
ALTER TABLE tm_lz.lz_src_sample_categories_bkup OWNER TO TM_LZ;
ALTER TABLE tm_lz.wt_snp_nodes OWNER TO TM_LZ;
ALTER TABLE tm_lz.wt_snp_node_values OWNER TO TM_LZ;


ALTER INDEX tm_lz.LZ_SRC_MRNA_SUBJ_SAMP_IDX1 SET TABLESPACE INDX;
ALTER TABLE tm_lz.LZ_SRC_SAMPLE_CATEGORIES_BKUP SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.WT_SNP_NODES SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.WT_SNP_NODE_VALUES SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LZ_SRC_MRNA_DATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LT_SRC_CLINICAL_DATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LT_SRC_DEAPP_ANNOT SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LT_SRC_MRNA_DATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LT_SRC_MRNA_SUBJ_SAMP_MAP SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LT_SRC_SAMPLE_CATEGORIES SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LT_SRC_STUDY_METADATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LZ_SRC_CLINICAL_DATA SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LZ_SRC_MRNA_SUBJ_SAMP_MAP SET TABLESPACE TRANSMART;
ALTER TABLE tm_lz.LZ_SRC_SAMPLE_CATEGORIES SET TABLESPACE TRANSMART;

REVOKE ALL ON SCHEMA TM_LZ FROM PUBLIC;
GRANT ALL ON SCHEMA TM_LZ TO TM_CZ;