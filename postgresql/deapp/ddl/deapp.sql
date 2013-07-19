\set ON_ERROR_STOP ON

CREATE TABLE deapp.de_pathway_gene (
	id bigint NOT NULL,
	pathway_id bigint,
	gene_symbol varchar(200),
	gene_id varchar(200)
);
ALTER TABLE deapp.de_pathway_gene OWNER TO deapp;

CREATE TABLE deapp.de_mrna_annotation (
	gpl_id varchar(100),
	probe_id varchar(100),
	gene_symbol varchar(100),
	probeset_id bigint,
	gene_id bigint,
	organism varchar(200)
);
ALTER TABLE deapp.de_mrna_annotation OWNER TO deapp;
CREATE INDEX de_mrna_annotation_index1 ON deapp.de_mrna_annotation (probeset_id);

CREATE TABLE deapp.de_subject_rbm_data (
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
	rbm_panel varchar(50)
);
ALTER TABLE deapp.de_subject_rbm_data OWNER TO deapp;

CREATE TABLE deapp.de_snp_info (
	snp_info_id bigint NOT NULL,
	name varchar(255),
	chrom varchar(16),
	chrom_pos bigint
);
ALTER TABLE deapp.de_snp_info OWNER TO deapp;
ALTER TABLE deapp.de_snp_info ADD CONSTRAINT u_snp_info_name UNIQUE (name);
ALTER TABLE deapp.de_snp_info ADD CONSTRAINT sys_c0020611 PRIMARY KEY (snp_info_id);

CREATE TABLE deapp.de_subject_protein_data (
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
	zscore bigint
);
ALTER TABLE deapp.de_subject_protein_data OWNER TO deapp;

CREATE TABLE deapp.de_snp_copy_number (
	patient_num bigint,
	snp_name varchar(50),
	chrom varchar(2),
	chrom_pos bigint,
	copy_number smallint
);
ALTER TABLE deapp.de_snp_copy_number OWNER TO deapp;

CREATE TABLE deapp.de_subject_microarray_data (
	trial_name varchar(50),
	probeset_id bigint,
	assay_id bigint,
	patient_id bigint,
	raw_intensity double precision,
	log_intensity double precision,
	zscore double precision,
	raw_intensity_4 double precision,
	partition_id numeric
);
ALTER TABLE deapp.de_subject_microarray_data OWNER TO deapp;
CREATE INDEX de_microarray_data_idx1 ON deapp.de_subject_microarray_data (trial_name,assay_id,probeset_id);
CREATE INDEX de_microarray_data_idx5 ON deapp.de_subject_microarray_data (assay_id,patient_id,probeset_id);
CREATE INDEX de_microarray_data_idx2 ON deapp.de_subject_microarray_data (assay_id,probeset_id);
CREATE INDEX de_microarray_data_idx4 ON deapp.de_subject_microarray_data (trial_name);

CREATE TABLE deapp.de_snp_probe (
	snp_probe_id bigint NOT NULL,
	probe_name varchar(255),
	snp_id bigint,
	snp_name varchar(255),
	vendor_name varchar(255)
);
ALTER TABLE deapp.de_snp_probe OWNER TO deapp;
ALTER TABLE deapp.de_snp_probe ADD CONSTRAINT sys_c0020609 PRIMARY KEY (snp_probe_id);
ALTER TABLE deapp.de_snp_probe ADD CONSTRAINT u_snp_probe_name UNIQUE (probe_name);

CREATE TABLE deapp.de_snp_probe_sorted_def (
	snp_probe_sorted_def_id bigint NOT NULL,
	platform_name varchar(255),
	num_probe bigint,
	chrom varchar(16),
	probe_def text,
	snp_id_def text
);
ALTER TABLE deapp.de_snp_probe_sorted_def OWNER TO deapp;
ALTER TABLE deapp.de_snp_probe_sorted_def ADD CONSTRAINT sys_c0020600 PRIMARY KEY (snp_probe_sorted_def_id);

CREATE TABLE deapp.de_snp_data_by_patient (
	snp_data_by_patient_id bigint NOT NULL,
	snp_dataset_id bigint,
	trial_name varchar(255),
	patient_num bigint,
	chrom varchar(16),
	data_by_patient_chr text,
	ped_by_patient_chr text
);
ALTER TABLE deapp.de_snp_data_by_patient OWNER TO deapp;
ALTER TABLE deapp.de_snp_data_by_patient ADD CONSTRAINT sys_c0020602 PRIMARY KEY (snp_data_by_patient_id);

CREATE TABLE deapp.deapp_annotation (
	annotation_type varchar(50),
	annotation_value varchar(100),
	gene_id bigint,
	gene_symbol varchar(200)
);
ALTER TABLE deapp.deapp_annotation OWNER TO deapp;

CREATE TABLE deapp.de_xtrial_parent_names (
	parent_cd bigint NOT NULL,
	across_path varchar(500),
	manually_created bigint
);
ALTER TABLE deapp.de_xtrial_parent_names OWNER TO deapp;
ALTER TABLE deapp.de_xtrial_parent_names ADD CONSTRAINT dextpn_parent_node_u UNIQUE (across_path);
ALTER TABLE deapp.de_xtrial_parent_names ADD CONSTRAINT sys_c0020604 PRIMARY KEY (parent_cd);

CREATE TABLE deapp.de_snp_subject_sorted_def (
	snp_subject_sorted_def_id bigint NOT NULL,
	trial_name varchar(255),
	patient_position integer,
	patient_num bigint,
	subject_id varchar(255)
);
ALTER TABLE deapp.de_snp_subject_sorted_def OWNER TO deapp;
ALTER TABLE deapp.de_snp_subject_sorted_def ADD CONSTRAINT sys_c0020607 PRIMARY KEY (snp_subject_sorted_def_id);

CREATE TABLE deapp.de_snp_data_by_probe (
	snp_data_by_probe_id bigint NOT NULL,
	probe_id bigint,
	probe_name varchar(255),
	snp_id bigint,
	snp_name varchar(255),
	trial_name varchar(255),
	data_by_probe text
);
ALTER TABLE deapp.de_snp_data_by_probe OWNER TO deapp;
ALTER TABLE deapp.de_snp_data_by_probe ADD CONSTRAINT sys_c0020601 PRIMARY KEY (snp_data_by_probe_id);

CREATE TABLE deapp.de_gpl_info (
	platform varchar(50),
	title varchar(500),
	organism varchar(100),
	annotation_date timestamp,
	marker_type varchar(100),
	release_nbr numeric
);
ALTER TABLE deapp.de_gpl_info OWNER TO deapp;

CREATE TABLE deapp.de_subject_sample_mapping (
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
	source_cd varchar(50),
  	omic_source_study varchar(200),
  	omic_patient_id bigint,
  	partition_id numeric
);
ALTER TABLE deapp.de_subject_sample_mapping OWNER TO deapp;
CREATE INDEX de_subject_smpl_mpng_idx2 ON deapp.de_subject_sample_mapping (patient_id,timepoint_cd,platform_cd,assay_id,trial_name);
CREATE INDEX de_subject_smpl_mpng_idx1 ON deapp.de_subject_sample_mapping (timepoint,patient_id,trial_name);

CREATE TABLE deapp.de_xtrial_child_map (
	concept_cd varchar(50) NOT NULL,
	parent_cd bigint NOT NULL,
	manually_mapped bigint,
	study_id varchar(50)
);
ALTER TABLE deapp.de_xtrial_child_map OWNER TO deapp;
ALTER TABLE deapp.de_xtrial_child_map ADD CONSTRAINT sys_c0020605 PRIMARY KEY (concept_cd);

CREATE TABLE deapp.de_saved_comparison (
	comparison_id bigint NOT NULL,
	query_id1 bigint,
	query_id2 bigint
);
ALTER TABLE deapp.de_saved_comparison OWNER TO deapp;

CREATE TABLE deapp.de_subject_microarray_med (
	probeset varchar(50),
	raw_intensity bigint,
	log_intensity bigint,
	gene_symbol varchar(50),
	assay_id bigint,
	patient_id bigint,
	subject_id varchar(20),
	trial_name varchar(15),
	timepoint varchar(30),
	pvalue double precision,
	refseq varchar(50),
	mean_intensity bigint,
	stddev_intensity bigint,
	median_intensity bigint,
	zscore bigint
);
ALTER TABLE deapp.de_subject_microarray_med OWNER TO deapp;

CREATE TABLE deapp.de_subject_snp_dataset (
	subject_snp_dataset_id bigint NOT NULL,
	dataset_name varchar(255),
	concept_cd varchar(255),
	platform_name varchar(255),
	trial_name varchar(255),
	patient_num bigint,
	timepoint varchar(255),
	subject_id varchar(255),
	sample_type varchar(255),
	paired_dataset_id bigint,
	patient_gender varchar(1)
);
ALTER TABLE deapp.de_subject_snp_dataset OWNER TO deapp;
ALTER TABLE deapp.de_subject_snp_dataset ADD CONSTRAINT sys_c0020606 PRIMARY KEY (subject_snp_dataset_id);

CREATE TABLE deapp.de_snp_data_dataset_loc (
	snp_data_dataset_loc_id bigint,
	trial_name varchar(255),
	snp_dataset_id bigint,
	location bigint
);
ALTER TABLE deapp.de_snp_data_dataset_loc OWNER TO deapp;

CREATE TABLE deapp.de_snp_calls_by_gsm (
	gsm_num varchar(10),
	patient_num bigint,
	snp_name varchar(100),
	snp_calls varchar(4)
);
ALTER TABLE deapp.de_snp_calls_by_gsm OWNER TO deapp;

CREATE TABLE deapp.de_subject_microarray_logs (
	probeset varchar(50),
	raw_intensity bigint,
	pvalue double precision,
	refseq varchar(50),
	gene_symbol varchar(50),
	assay_id bigint,
	patient_id bigint,
	subject_id varchar(20),
	trial_name varchar(15),
	timepoint varchar(30),
	log_intensity bigint
);
ALTER TABLE deapp.de_subject_microarray_logs OWNER TO deapp;

CREATE TABLE deapp.de_snp_gene_map (
	snp_id bigint,
	snp_name varchar(255),
	entrez_gene_id bigint
);
ALTER TABLE deapp.de_snp_gene_map OWNER TO deapp;

CREATE TABLE deapp.haploview_data (
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
	snp_data text
);
ALTER TABLE deapp.haploview_data OWNER TO deapp;

CREATE TABLE deapp.de_pathway (
	name varchar(300),
	description varchar(510),
	id bigint NOT NULL,
	type varchar(100),
	source varchar(100),
	externalid varchar(100),
	pathway_uid varchar(200),
	user_id bigint
);
ALTER TABLE deapp.de_pathway OWNER TO deapp;

CREATE SEQUENCE deapp.de_parent_cd_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE deapp.de_parent_cd_seq OWNER TO deapp;
CREATE SEQUENCE deapp.seq_assay_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 41 CACHE 20;
ALTER SEQUENCE deapp.seq_assay_id OWNER TO deapp;
CREATE SEQUENCE deapp.seq_data_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE deapp.seq_data_id OWNER TO deapp;
create sequence deapp.seq_mrna_partition_id;
ALTER SEQUENCE deapp.seq_mrna_partition_id OWNER TO deapp;


DROP TRIGGER IF EXISTS de_parent_cd_trg ON deapp.de_xtrial_parent_names CASCADE;
CREATE OR REPLACE FUNCTION deapp.tf_de_parent_cd_trg () RETURNS trigger AS $BODY$
BEGIN
  SELECT nextval('deapp.de_parent_cd_seq')
  INTO new.parent_cd
  ;
RETURN NEW;
END;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER DE_PARENT_CD_TRG 
BEFORE INSERT ON deapp.de_xtrial_parent_names
FOR EACH ROW
   
	WHEN (
          coalesce(new.parent_cd::text, '') = ''
      )
	EXECUTE PROCEDURE deapp.tf_de_parent_cd_trg();

DROP TRIGGER IF EXISTS trg_de_snp_info_id ON deapp.de_snp_info CASCADE;
CREATE OR REPLACE FUNCTION deapp.tf_trg_de_snp_info_id () RETURNS trigger AS $BODY$
begin
      if coalesce(NEW.SNP_INFO_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_INFO_ID ;
      end if;
RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_de_snp_info_id
	BEFORE INSERT ON deapp.de_snp_info FOR EACH ROW
	EXECUTE PROCEDURE deapp.tf_trg_de_snp_info_id();

DROP TRIGGER IF EXISTS trg_de_snp_probe_id ON deapp.de_snp_probe CASCADE;
CREATE OR REPLACE FUNCTION deapp.tf_trg_de_snp_probe_id () RETURNS trigger AS $BODY$
begin
      if coalesce(NEW.SNP_PROBE_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_PROBE_ID ;
      end if;
RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_de_snp_probe_id
	BEFORE INSERT ON deapp.de_snp_probe FOR EACH ROW
	EXECUTE PROCEDURE deapp.tf_trg_de_snp_probe_id();

DROP TRIGGER IF EXISTS trg_de_snp_probe_sorted_def_id ON deapp.de_snp_probe_sorted_def CASCADE;
CREATE OR REPLACE FUNCTION deapp.tf_trg_de_snp_probe_sorted_def_id () RETURNS trigger AS $BODY$
begin
      if coalesce(NEW.SNP_PROBE_SORTED_DEF_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_PROBE_SORTED_DEF_ID ;
      end if;
RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_de_snp_probe_sorted_def_id
	BEFORE INSERT ON deapp.de_snp_probe_sorted_def FOR EACH ROW
	EXECUTE PROCEDURE deapp.tf_trg_de_snp_probe_sorted_def_id();

DROP TRIGGER IF EXISTS trg_de_subject_snp_dataset_id ON deapp.de_subject_snp_dataset CASCADE;
CREATE OR REPLACE FUNCTION deapp.tf_trg_de_subject_snp_dataset_id () RETURNS trigger AS $BODY$
begin
      if coalesce(NEW.SUBJECT_SNP_DATASET_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SUBJECT_SNP_DATASET_ID ;
      end if;
RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_de_subject_snp_dataset_id
	BEFORE INSERT ON deapp.de_subject_snp_dataset FOR EACH ROW
	EXECUTE PROCEDURE deapp.tf_trg_de_subject_snp_dataset_id();

DROP TRIGGER IF EXISTS trg_de_subject_sorted_def_id ON deapp.de_snp_subject_sorted_def CASCADE;
CREATE OR REPLACE FUNCTION deapp.tf_trg_de_subject_sorted_def_id () RETURNS trigger AS $BODY$
begin
if coalesce(NEW.SNP_SUBJECT_SORTED_DEF_ID::text, '') = '' then
select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_SUBJECT_SORTED_DEF_ID ;
end if;
RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_de_subject_sorted_def_id
	BEFORE INSERT ON deapp.de_snp_subject_sorted_def FOR EACH ROW
	EXECUTE PROCEDURE deapp.tf_trg_de_subject_sorted_def_id();

DROP TRIGGER IF EXISTS trg_snp_data_by_patient_id ON deapp.de_snp_data_by_patient CASCADE;
CREATE OR REPLACE FUNCTION deapp.tf_trg_snp_data_by_patient_id () RETURNS trigger AS $BODY$
begin
      if coalesce(NEW.SNP_DATA_BY_PATIENT_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_DATA_BY_PATIENT_ID ;
  end if;
RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_snp_data_by_patient_id
	BEFORE INSERT ON deapp.de_snp_data_by_patient FOR EACH ROW
	EXECUTE PROCEDURE deapp.tf_trg_snp_data_by_patient_id();

DROP TRIGGER IF EXISTS trg_snp_data_by_pprobe_id ON deapp.de_snp_data_by_probe CASCADE;
CREATE OR REPLACE FUNCTION deapp.tf_trg_snp_data_by_pprobe_id () RETURNS trigger AS $BODY$
begin
      if coalesce(NEW.SNP_DATA_BY_PROBE_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_DATA_BY_PROBE_ID ;
      end if;
RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_snp_data_by_pprobe_id
	BEFORE INSERT ON deapp.de_snp_data_by_probe FOR EACH ROW
	EXECUTE PROCEDURE deapp.tf_trg_snp_data_by_pprobe_id();

DROP TRIGGER IF EXISTS trg_snp_subject_sorted_def_id ON deapp.de_snp_subject_sorted_def CASCADE;
CREATE OR REPLACE FUNCTION deapp.tf_trg_snp_subject_sorted_def_id () RETURNS trigger AS $BODY$
begin
if coalesce(NEW.SNP_SUBJECT_SORTED_DEF_ID::text, '') = '' then
select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_SUBJECT_SORTED_DEF_ID ;
end if;
RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trg_snp_subject_sorted_def_id
	BEFORE INSERT ON deapp.de_snp_subject_sorted_def FOR EACH ROW
	EXECUTE PROCEDURE deapp.tf_trg_snp_subject_sorted_def_id();


ALTER INDEX deapp.U_SNP_INFO_NAME SET TABLESPACE DEAPP;
ALTER INDEX deapp.DE_MRNA_ANNOTATION_INDEX1 SET TABLESPACE DEAPP;
ALTER INDEX deapp.SYS_C0020611 SET TABLESPACE DEAPP;
ALTER INDEX deapp.DE_SUBJECT_SMPL_MPNG_IDX2 SET TABLESPACE DEAPP;
ALTER INDEX deapp.DE_SUBJECT_SMPL_MPNG_IDX1 SET TABLESPACE DEAPP;
ALTER INDEX deapp.DEXTPN_PARENT_NODE_U SET TABLESPACE DEAPP;
ALTER INDEX deapp.DE_MICROARRAY_DATA_IDX1 SET TABLESPACE DEAPP;
ALTER INDEX deapp.DE_MICROARRAY_DATA_IDX2 SET TABLESPACE DEAPP;
ALTER INDEX deapp.DE_MICROARRAY_DATA_IDX5 SET TABLESPACE DEAPP;
ALTER INDEX deapp.DE_MICROARRAY_DATA_IDX4 SET TABLESPACE DEAPP;
ALTER INDEX deapp.SYS_C0020600 SET TABLESPACE DEAPP;
ALTER INDEX deapp.SYS_C0020601 SET TABLESPACE DEAPP;
ALTER INDEX deapp.SYS_C0020602 SET TABLESPACE DEAPP;
ALTER INDEX deapp.SYS_C0020604 SET TABLESPACE DEAPP;
ALTER INDEX deapp.SYS_C0020605 SET TABLESPACE DEAPP;
ALTER INDEX deapp.SYS_C0020606 SET TABLESPACE DEAPP;
ALTER INDEX deapp.SYS_C0020607 SET TABLESPACE DEAPP;
ALTER INDEX deapp.U_SNP_PROBE_NAME SET TABLESPACE INDX;
ALTER INDEX deapp.SYS_C0020609 SET TABLESPACE TRANSMART;
ALTER TABLE deapp.DEAPP_ANNOTATION SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_GPL_INFO SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_MRNA_ANNOTATION SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_PATHWAY SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_PATHWAY_GENE SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SAVED_COMPARISON SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_DATA_DATASET_LOC SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_GENE_MAP SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_INFO SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_PROBE SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_SUBJECT_SORTED_DEF SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SUBJECT_MICROARRAY_LOGS SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SUBJECT_MICROARRAY_MED SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SUBJECT_PROTEIN_DATA SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SUBJECT_RBM_DATA SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SUBJECT_SAMPLE_MAPPING SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SUBJECT_SNP_DATASET SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_XTRIAL_CHILD_MAP SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_XTRIAL_PARENT_NAMES SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SUBJECT_MICROARRAY_DATA SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_COPY_NUMBER SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_CALLS_BY_GSM SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_DATA_BY_PATIENT SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_DATA_BY_PROBE SET TABLESPACE DEAPP;
ALTER TABLE deapp.DE_SNP_PROBE_SORTED_DEF SET TABLESPACE DEAPP;
ALTER TABLE deapp.HAPLOVIEW_DATA SET TABLESPACE DEAPP;
