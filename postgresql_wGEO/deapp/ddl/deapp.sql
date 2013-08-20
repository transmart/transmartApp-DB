--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-24 09:36:34 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 10 (class 2615 OID 24066)
-- Name: deapp; Type: SCHEMA; Schema: -; Owner: deapp
--

CREATE SCHEMA deapp;


ALTER SCHEMA deapp OWNER TO deapp;

SET search_path = deapp, pg_catalog;

--
-- TOC entry 706 (class 1255 OID 24155)
-- Name: tf_de_parent_cd_trg(); Type: FUNCTION; Schema: deapp; Owner: deapp
--

CREATE FUNCTION tf_de_parent_cd_trg() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  SELECT nextval('deapp.de_parent_cd_seq')
  INTO new.parent_cd
  ;
RETURN NEW;
END;
$$;


ALTER FUNCTION deapp.tf_de_parent_cd_trg() OWNER TO deapp;

--
-- TOC entry 707 (class 1255 OID 24156)
-- Name: tf_trg_de_snp_info_id(); Type: FUNCTION; Schema: deapp; Owner: deapp
--

CREATE FUNCTION tf_trg_de_snp_info_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
      if coalesce(NEW.SNP_INFO_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_INFO_ID ;
      end if;
RETURN NEW;
end;
$$;


ALTER FUNCTION deapp.tf_trg_de_snp_info_id() OWNER TO deapp;

--
-- TOC entry 708 (class 1255 OID 24157)
-- Name: tf_trg_de_snp_probe_id(); Type: FUNCTION; Schema: deapp; Owner: deapp
--

CREATE FUNCTION tf_trg_de_snp_probe_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
      if coalesce(NEW.SNP_PROBE_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_PROBE_ID ;
      end if;
RETURN NEW;
end;
$$;


ALTER FUNCTION deapp.tf_trg_de_snp_probe_id() OWNER TO deapp;

--
-- TOC entry 709 (class 1255 OID 24158)
-- Name: tf_trg_de_snp_probe_sorted_def_id(); Type: FUNCTION; Schema: deapp; Owner: deapp
--

CREATE FUNCTION tf_trg_de_snp_probe_sorted_def_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
      if coalesce(NEW.SNP_PROBE_SORTED_DEF_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_PROBE_SORTED_DEF_ID ;
      end if;
RETURN NEW;
end;
$$;


ALTER FUNCTION deapp.tf_trg_de_snp_probe_sorted_def_id() OWNER TO deapp;

--
-- TOC entry 710 (class 1255 OID 24159)
-- Name: tf_trg_de_subject_snp_dataset_id(); Type: FUNCTION; Schema: deapp; Owner: deapp
--

CREATE FUNCTION tf_trg_de_subject_snp_dataset_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
      if coalesce(NEW.SUBJECT_SNP_DATASET_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SUBJECT_SNP_DATASET_ID ;
      end if;
RETURN NEW;
end;
$$;


ALTER FUNCTION deapp.tf_trg_de_subject_snp_dataset_id() OWNER TO deapp;

--
-- TOC entry 711 (class 1255 OID 24160)
-- Name: tf_trg_de_subject_sorted_def_id(); Type: FUNCTION; Schema: deapp; Owner: deapp
--

CREATE FUNCTION tf_trg_de_subject_sorted_def_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
if coalesce(NEW.SNP_SUBJECT_SORTED_DEF_ID::text, '') = '' then
select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_SUBJECT_SORTED_DEF_ID ;
end if;
RETURN NEW;
end;
$$;


ALTER FUNCTION deapp.tf_trg_de_subject_sorted_def_id() OWNER TO deapp;

--
-- TOC entry 712 (class 1255 OID 24161)
-- Name: tf_trg_snp_data_by_patient_id(); Type: FUNCTION; Schema: deapp; Owner: deapp
--

CREATE FUNCTION tf_trg_snp_data_by_patient_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
      if coalesce(NEW.SNP_DATA_BY_PATIENT_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_DATA_BY_PATIENT_ID ;
  end if;
RETURN NEW;
end;
$$;


ALTER FUNCTION deapp.tf_trg_snp_data_by_patient_id() OWNER TO deapp;

--
-- TOC entry 640 (class 1255 OID 24162)
-- Name: tf_trg_snp_data_by_pprobe_id(); Type: FUNCTION; Schema: deapp; Owner: deapp
--

CREATE FUNCTION tf_trg_snp_data_by_pprobe_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
      if coalesce(NEW.SNP_DATA_BY_PROBE_ID::text, '') = '' then
         select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_DATA_BY_PROBE_ID ;
      end if;
RETURN NEW;
end;
$$;


ALTER FUNCTION deapp.tf_trg_snp_data_by_pprobe_id() OWNER TO deapp;

--
-- TOC entry 641 (class 1255 OID 24163)
-- Name: tf_trg_snp_subject_sorted_def_id(); Type: FUNCTION; Schema: deapp; Owner: deapp
--

CREATE FUNCTION tf_trg_snp_subject_sorted_def_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
if coalesce(NEW.SNP_SUBJECT_SORTED_DEF_ID::text, '') = '' then
select nextval('deapp.SEQ_DATA_ID') into NEW.SNP_SUBJECT_SORTED_DEF_ID ;
end if;
RETURN NEW;
end;
$$;


ALTER FUNCTION deapp.tf_trg_snp_subject_sorted_def_id() OWNER TO deapp;

SET default_tablespace = deapp;

SET default_with_oids = false;

--
-- TOC entry 294 (class 1259 OID 24763)
-- Name: de_chromosomal_region; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_chromosomal_region (
    region_id bigint NOT NULL,
    gpl_id character varying(50),
    chromosome character varying(2),
    start_bp bigint,
    end_bp bigint,
    num_probes integer,
    region_name character varying(100),
    gene_symbol character varying(100),
    gene_id bigint,
    organism character varying(200)
);


ALTER TABLE deapp.de_chromosomal_region OWNER TO deapp;

--
-- TOC entry 295 (class 1259 OID 24766)
-- Name: de_chromosomal_region_region_id_seq; Type: SEQUENCE; Schema: deapp; Owner: deapp
--

CREATE SEQUENCE de_chromosomal_region_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deapp.de_chromosomal_region_region_id_seq OWNER TO deapp;

--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 295
-- Name: de_chromosomal_region_region_id_seq; Type: SEQUENCE OWNED BY; Schema: deapp; Owner: deapp
--

ALTER SEQUENCE de_chromosomal_region_region_id_seq OWNED BY de_chromosomal_region.region_id;


--
-- TOC entry 296 (class 1259 OID 24768)
-- Name: de_gpl_info; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_gpl_info (
    platform character varying(50) NOT NULL,
    title character varying(500),
    organism character varying(100),
    annotation_date timestamp without time zone,
    marker_type character varying(100),
    genome_build character varying(20),
    release_nbr numeric
);


ALTER TABLE deapp.de_gpl_info OWNER TO deapp;

--
-- TOC entry 297 (class 1259 OID 24774)
-- Name: de_mrna_annotation; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_mrna_annotation (
    gpl_id character varying(100),
    probe_id character varying(100),
    gene_symbol character varying(100),
    probeset_id bigint,
    gene_id bigint,
    organism character varying(200)
);


ALTER TABLE deapp.de_mrna_annotation OWNER TO deapp;

--
-- TOC entry 298 (class 1259 OID 24780)
-- Name: de_parent_cd_seq; Type: SEQUENCE; Schema: deapp; Owner: deapp
--

CREATE SEQUENCE de_parent_cd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE deapp.de_parent_cd_seq OWNER TO deapp;

--
-- TOC entry 299 (class 1259 OID 24782)
-- Name: de_pathway; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_pathway (
    name character varying(300),
    description character varying(510),
    id bigint NOT NULL,
    type character varying(100),
    source character varying(100),
    externalid character varying(100),
    pathway_uid character varying(200),
    user_id bigint
);


ALTER TABLE deapp.de_pathway OWNER TO deapp;

--
-- TOC entry 300 (class 1259 OID 24788)
-- Name: de_pathway_gene; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_pathway_gene (
    id bigint NOT NULL,
    pathway_id bigint,
    gene_symbol character varying(200),
    gene_id character varying(200)
);


ALTER TABLE deapp.de_pathway_gene OWNER TO deapp;

--
-- TOC entry 301 (class 1259 OID 24791)
-- Name: de_saved_comparison; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_saved_comparison (
    comparison_id bigint NOT NULL,
    query_id1 bigint,
    query_id2 bigint
);


ALTER TABLE deapp.de_saved_comparison OWNER TO deapp;

--
-- TOC entry 302 (class 1259 OID 24794)
-- Name: de_snp_calls_by_gsm; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_calls_by_gsm (
    gsm_num character varying(10),
    patient_num bigint,
    snp_name character varying(100),
    snp_calls character varying(4)
);


ALTER TABLE deapp.de_snp_calls_by_gsm OWNER TO deapp;

--
-- TOC entry 303 (class 1259 OID 24797)
-- Name: de_snp_copy_number; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_copy_number (
    patient_num bigint,
    snp_name character varying(50),
    chrom character varying(2),
    chrom_pos bigint,
    copy_number smallint
);


ALTER TABLE deapp.de_snp_copy_number OWNER TO deapp;

--
-- TOC entry 304 (class 1259 OID 24800)
-- Name: de_snp_data_by_patient; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_data_by_patient (
    snp_data_by_patient_id bigint NOT NULL,
    snp_dataset_id bigint,
    trial_name character varying(255),
    patient_num bigint,
    chrom character varying(16),
    data_by_patient_chr text,
    ped_by_patient_chr text
);


ALTER TABLE deapp.de_snp_data_by_patient OWNER TO deapp;

--
-- TOC entry 305 (class 1259 OID 24806)
-- Name: de_snp_data_by_probe; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_data_by_probe (
    snp_data_by_probe_id bigint NOT NULL,
    probe_id bigint,
    probe_name character varying(255),
    snp_id bigint,
    snp_name character varying(255),
    trial_name character varying(255),
    data_by_probe text
);


ALTER TABLE deapp.de_snp_data_by_probe OWNER TO deapp;

--
-- TOC entry 306 (class 1259 OID 24812)
-- Name: de_snp_data_dataset_loc; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_data_dataset_loc (
    snp_data_dataset_loc_id bigint,
    trial_name character varying(255),
    snp_dataset_id bigint,
    location bigint
);


ALTER TABLE deapp.de_snp_data_dataset_loc OWNER TO deapp;

--
-- TOC entry 307 (class 1259 OID 24815)
-- Name: de_snp_gene_map; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_gene_map (
    snp_id bigint,
    snp_name character varying(255),
    entrez_gene_id bigint
);


ALTER TABLE deapp.de_snp_gene_map OWNER TO deapp;

--
-- TOC entry 308 (class 1259 OID 24818)
-- Name: de_snp_info; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_info (
    snp_info_id bigint NOT NULL,
    name character varying(255),
    chrom character varying(16),
    chrom_pos bigint
);


ALTER TABLE deapp.de_snp_info OWNER TO deapp;

--
-- TOC entry 309 (class 1259 OID 24821)
-- Name: de_snp_probe; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_probe (
    snp_probe_id bigint NOT NULL,
    probe_name character varying(255),
    snp_id bigint,
    snp_name character varying(255),
    vendor_name character varying(255)
);


ALTER TABLE deapp.de_snp_probe OWNER TO deapp;

--
-- TOC entry 310 (class 1259 OID 24827)
-- Name: de_snp_probe_sorted_def; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_probe_sorted_def (
    snp_probe_sorted_def_id bigint NOT NULL,
    platform_name character varying(255),
    num_probe bigint,
    chrom character varying(16),
    probe_def text,
    snp_id_def text
);


ALTER TABLE deapp.de_snp_probe_sorted_def OWNER TO deapp;

--
-- TOC entry 311 (class 1259 OID 24833)
-- Name: de_snp_subject_sorted_def; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_snp_subject_sorted_def (
    snp_subject_sorted_def_id bigint NOT NULL,
    trial_name character varying(255),
    patient_position integer,
    patient_num bigint,
    subject_id character varying(255)
);


ALTER TABLE deapp.de_snp_subject_sorted_def OWNER TO deapp;

--
-- TOC entry 312 (class 1259 OID 24839)
-- Name: de_subject_acgh_data; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_subject_acgh_data (
    trial_name character varying(50),
    region_id bigint NOT NULL,
    assay_id bigint NOT NULL,
    patient_id bigint,
    chip double precision,
    segmented double precision,
    flag smallint,
    probloss double precision,
    probnorm double precision,
    probgain double precision,
    probamp double precision
);


ALTER TABLE deapp.de_subject_acgh_data OWNER TO deapp;

--
-- TOC entry 3931 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN de_subject_acgh_data.chip; Type: COMMENT; Schema: deapp; Owner: deapp
--

COMMENT ON COLUMN de_subject_acgh_data.chip IS 'log2ratio';


--
-- TOC entry 3932 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN de_subject_acgh_data.segmented; Type: COMMENT; Schema: deapp; Owner: deapp
--

COMMENT ON COLUMN de_subject_acgh_data.segmented IS 'segmented log2ratio';


--
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN de_subject_acgh_data.flag; Type: COMMENT; Schema: deapp; Owner: deapp
--

COMMENT ON COLUMN de_subject_acgh_data.flag IS 'call  -1:loss, 0:normal, 1:gain, 2:amplification';


--
-- TOC entry 313 (class 1259 OID 24842)
-- Name: de_subject_microarray_data; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_subject_microarray_data (
    trial_name character varying(50),
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

--
-- TOC entry 314 (class 1259 OID 24845)
-- Name: de_subject_microarray_logs; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_subject_microarray_logs (
    probeset character varying(50),
    raw_intensity bigint,
    pvalue double precision,
    refseq character varying(50),
    gene_symbol character varying(50),
    assay_id bigint,
    patient_id bigint,
    subject_id character varying(20),
    trial_name character varying(15),
    timepoint character varying(30),
    log_intensity bigint
);


ALTER TABLE deapp.de_subject_microarray_logs OWNER TO deapp;

--
-- TOC entry 315 (class 1259 OID 24848)
-- Name: de_subject_microarray_med; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_subject_microarray_med (
    probeset character varying(50),
    raw_intensity bigint,
    log_intensity bigint,
    gene_symbol character varying(50),
    assay_id bigint,
    patient_id bigint,
    subject_id character varying(20),
    trial_name character varying(15),
    timepoint character varying(30),
    pvalue double precision,
    refseq character varying(50),
    mean_intensity bigint,
    stddev_intensity bigint,
    median_intensity bigint,
    zscore bigint
);


ALTER TABLE deapp.de_subject_microarray_med OWNER TO deapp;

--
-- TOC entry 316 (class 1259 OID 24851)
-- Name: de_subject_protein_data; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_subject_protein_data (
    trial_name character varying(15),
    component character varying(15),
    intensity bigint,
    patient_id bigint,
    subject_id character varying(10),
    gene_symbol character varying(100),
    gene_id integer,
    assay_id bigint,
    timepoint character varying(20),
    n_value bigint,
    mean_intensity bigint,
    stddev_intensity bigint,
    median_intensity bigint,
    zscore bigint
);


ALTER TABLE deapp.de_subject_protein_data OWNER TO deapp;

--
-- TOC entry 317 (class 1259 OID 24854)
-- Name: de_subject_rbm_data; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_subject_rbm_data (
    trial_name character varying(15),
    antigen_name character varying(100),
    n_value bigint,
    patient_id bigint,
    gene_symbol character varying(100),
    gene_id integer,
    assay_id bigint,
    normalized_value double precision,
    concept_cd character varying(100),
    timepoint character varying(100),
    data_uid character varying(100),
    value bigint,
    log_intensity bigint,
    mean_intensity bigint,
    stddev_intensity bigint,
    median_intensity bigint,
    zscore bigint,
    rbm_panel character varying(50)
);


ALTER TABLE deapp.de_subject_rbm_data OWNER TO deapp;

--
-- TOC entry 318 (class 1259 OID 24860)
-- Name: de_subject_sample_mapping; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_subject_sample_mapping (
    patient_id bigint,
    site_id character varying(100),
    subject_id character varying(100),
    subject_type character varying(100),
    concept_code character varying(1000),
    assay_id bigint NOT NULL,
    patient_uid character varying(50),
    sample_type character varying(100),
    assay_uid character varying(100),
    trial_name character varying(30),
    timepoint character varying(100),
    timepoint_cd character varying(50),
    sample_type_cd character varying(50),
    tissue_type_cd character varying(50),
    platform character varying(50),
    platform_cd character varying(50),
    tissue_type character varying(100),
    data_uid character varying(100),
    gpl_id character varying(20),
    rbm_panel character varying(50),
    sample_id bigint,
    sample_cd character varying(200),
    category_cd character varying(1000),
    source_cd character varying(50),
    omic_source_study character varying(200),
    omic_patient_id bigint,
    partition_id numeric
);


ALTER TABLE deapp.de_subject_sample_mapping OWNER TO deapp;

--
-- TOC entry 319 (class 1259 OID 24866)
-- Name: de_subject_snp_dataset; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_subject_snp_dataset (
    subject_snp_dataset_id bigint NOT NULL,
    dataset_name character varying(255),
    concept_cd character varying(255),
    platform_name character varying(255),
    trial_name character varying(255),
    patient_num bigint,
    timepoint character varying(255),
    subject_id character varying(255),
    sample_type character varying(255),
    paired_dataset_id bigint,
    patient_gender character varying(1)
);


ALTER TABLE deapp.de_subject_snp_dataset OWNER TO deapp;

--
-- TOC entry 320 (class 1259 OID 24872)
-- Name: de_xtrial_child_map; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_xtrial_child_map (
    concept_cd character varying(50) NOT NULL,
    parent_cd bigint NOT NULL,
    manually_mapped bigint,
    study_id character varying(50)
);


ALTER TABLE deapp.de_xtrial_child_map OWNER TO deapp;

--
-- TOC entry 321 (class 1259 OID 24875)
-- Name: de_xtrial_parent_names; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE de_xtrial_parent_names (
    parent_cd bigint NOT NULL,
    across_path character varying(500),
    manually_created bigint
);


ALTER TABLE deapp.de_xtrial_parent_names OWNER TO deapp;

--
-- TOC entry 322 (class 1259 OID 24881)
-- Name: deapp_annotation; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE deapp_annotation (
    annotation_type character varying(50),
    annotation_value character varying(100),
    gene_id bigint,
    gene_symbol character varying(200)
);


ALTER TABLE deapp.deapp_annotation OWNER TO deapp;

--
-- TOC entry 323 (class 1259 OID 24884)
-- Name: haploview_data; Type: TABLE; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE TABLE haploview_data (
    i2b2_id bigint,
    jnj_id character varying(30),
    father_id integer,
    mother_id integer,
    sex smallint,
    affection_status smallint,
    chromosome character varying(10),
    gene character varying(50),
    release smallint,
    release_date timestamp without time zone,
    trial_name character varying(50),
    snp_data text
);


ALTER TABLE deapp.haploview_data OWNER TO deapp;

--
-- TOC entry 324 (class 1259 OID 24890)
-- Name: seq_assay_id; Type: SEQUENCE; Schema: deapp; Owner: deapp
--

CREATE SEQUENCE seq_assay_id
    START WITH 41
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE deapp.seq_assay_id OWNER TO deapp;

--
-- TOC entry 325 (class 1259 OID 24892)
-- Name: seq_data_id; Type: SEQUENCE; Schema: deapp; Owner: deapp
--

CREATE SEQUENCE seq_data_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE deapp.seq_data_id OWNER TO deapp;

CREATE SEQUENCE deapp.seq_mrna_partition_id
	START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;
ALTER TABLE deapp.seq_mrna_partition_id OWNER TO deapp;
--
-- TOC entry 3841 (class 2604 OID 25734)
-- Name: region_id; Type: DEFAULT; Schema: deapp; Owner: deapp
--

ALTER TABLE ONLY de_chromosomal_region ALTER COLUMN region_id SET DEFAULT nextval('de_chromosomal_region_region_id_seq'::regclass);


SET default_tablespace = '';

--
-- TOC entry 3843 (class 2606 OID 25853)
-- Name: de_chromosomal_region_pkey; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: 
--

ALTER TABLE ONLY de_chromosomal_region
    ADD CONSTRAINT de_chromosomal_region_pkey PRIMARY KEY (region_id);


--
-- TOC entry 3845 (class 2606 OID 25855)
-- Name: de_gpl_info_pkey; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: 
--

ALTER TABLE ONLY de_gpl_info
    ADD CONSTRAINT de_gpl_info_pkey PRIMARY KEY (platform);


--
-- TOC entry 3868 (class 2606 OID 25857)
-- Name: de_subject_acgh_data_pkey; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: 
--

ALTER TABLE ONLY de_subject_acgh_data
    ADD CONSTRAINT de_subject_acgh_data_pkey PRIMARY KEY (assay_id, region_id);


SET default_tablespace = deapp;

--
-- TOC entry 3882 (class 2606 OID 25859)
-- Name: dextpn_parent_node_u; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_xtrial_parent_names
    ADD CONSTRAINT dextpn_parent_node_u UNIQUE (across_path);


--
-- TOC entry 3863 (class 2606 OID 25861)
-- Name: sys_c0020600; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_snp_probe_sorted_def
    ADD CONSTRAINT sys_c0020600 PRIMARY KEY (snp_probe_sorted_def_id);


--
-- TOC entry 3853 (class 2606 OID 25863)
-- Name: sys_c0020601; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_snp_data_by_probe
    ADD CONSTRAINT sys_c0020601 PRIMARY KEY (snp_data_by_probe_id);


--
-- TOC entry 3851 (class 2606 OID 25865)
-- Name: sys_c0020602; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_snp_data_by_patient
    ADD CONSTRAINT sys_c0020602 PRIMARY KEY (snp_data_by_patient_id);


--
-- TOC entry 3884 (class 2606 OID 25867)
-- Name: sys_c0020604; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_xtrial_parent_names
    ADD CONSTRAINT sys_c0020604 PRIMARY KEY (parent_cd);


--
-- TOC entry 3880 (class 2606 OID 25869)
-- Name: sys_c0020605; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_xtrial_child_map
    ADD CONSTRAINT sys_c0020605 PRIMARY KEY (concept_cd);


--
-- TOC entry 3878 (class 2606 OID 25871)
-- Name: sys_c0020606; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_subject_snp_dataset
    ADD CONSTRAINT sys_c0020606 PRIMARY KEY (subject_snp_dataset_id);


--
-- TOC entry 3865 (class 2606 OID 25873)
-- Name: sys_c0020607; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_snp_subject_sorted_def
    ADD CONSTRAINT sys_c0020607 PRIMARY KEY (snp_subject_sorted_def_id);


SET default_tablespace = transmart;

--
-- TOC entry 3859 (class 2606 OID 25875)
-- Name: sys_c0020609; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: transmart
--

ALTER TABLE ONLY de_snp_probe
    ADD CONSTRAINT sys_c0020609 PRIMARY KEY (snp_probe_id);


SET default_tablespace = deapp;

--
-- TOC entry 3855 (class 2606 OID 25877)
-- Name: sys_c0020611; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_snp_info
    ADD CONSTRAINT sys_c0020611 PRIMARY KEY (snp_info_id);


--
-- TOC entry 3857 (class 2606 OID 25879)
-- Name: u_snp_info_name; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: deapp
--

ALTER TABLE ONLY de_snp_info
    ADD CONSTRAINT u_snp_info_name UNIQUE (name);


SET default_tablespace = indx;

--
-- TOC entry 3861 (class 2606 OID 25881)
-- Name: u_snp_probe_name; Type: CONSTRAINT; Schema: deapp; Owner: deapp; Tablespace: indx
--

ALTER TABLE ONLY de_snp_probe
    ADD CONSTRAINT u_snp_probe_name UNIQUE (probe_name);


SET default_tablespace = deapp;

--
-- TOC entry 3870 (class 1259 OID 26105)
-- Name: de_microarray_data_idx1; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE INDEX de_microarray_data_idx1 ON de_subject_microarray_data USING btree (trial_name, assay_id, probeset_id);


--
-- TOC entry 3871 (class 1259 OID 26106)
-- Name: de_microarray_data_idx2; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE INDEX de_microarray_data_idx2 ON de_subject_microarray_data USING btree (assay_id, probeset_id);


--
-- TOC entry 3872 (class 1259 OID 26107)
-- Name: de_microarray_data_idx4; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE INDEX de_microarray_data_idx4 ON de_subject_microarray_data USING btree (trial_name);


--
-- TOC entry 3873 (class 1259 OID 26117)
-- Name: de_microarray_data_idx5; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: deapp
--

CREATE INDEX de_microarray_data_idx5 ON de_subject_microarray_data USING btree (assay_id, patient_id, probeset_id);


SET default_tablespace = '';

--
-- TOC entry 3846 (class 1259 OID 26118)
-- Name: de_mrna_annotation_index1; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: 
--

CREATE INDEX de_mrna_annotation_index1 ON de_mrna_annotation USING btree (probeset_id);


--
-- TOC entry 3847 (class 1259 OID 26119)
-- Name: de_pathway_gene_idx4; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: 
--

CREATE INDEX de_pathway_gene_idx4 ON de_pathway_gene USING btree (gene_symbol);


--
-- TOC entry 3848 (class 1259 OID 26120)
-- Name: de_pathway_gene_index1; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: 
--

CREATE INDEX de_pathway_gene_index1 ON de_pathway_gene USING btree (pathway_id, gene_symbol);


--
-- TOC entry 3866 (class 1259 OID 26121)
-- Name: de_subject_acgh_data_patient; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: 
--

CREATE INDEX de_subject_acgh_data_patient ON de_subject_acgh_data USING btree (patient_id);


--
-- TOC entry 3869 (class 1259 OID 26122)
-- Name: de_subject_acgh_data_region; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: 
--

CREATE INDEX de_subject_acgh_data_region ON de_subject_acgh_data USING btree (region_id);


--
-- TOC entry 3876 (class 1259 OID 26123)
-- Name: de_subject_smpl_mpng_idx2; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: 
--

CREATE INDEX de_subject_smpl_mpng_idx2 ON de_subject_sample_mapping USING btree (patient_id, timepoint_cd, platform_cd, assay_id, trial_name);


--
-- TOC entry 3874 (class 1259 OID 26124)
-- Name: idx_de_microarray_data_1; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: 
--

CREATE INDEX idx_de_microarray_data_1 ON de_subject_microarray_data USING btree (trial_name, assay_id, probeset_id);


--
-- TOC entry 3875 (class 1259 OID 26125)
-- Name: idx_de_microarray_data_2; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: 
--

CREATE INDEX idx_de_microarray_data_2 ON de_subject_microarray_data USING btree (assay_id, probeset_id);


--
-- TOC entry 3849 (class 1259 OID 26126)
-- Name: idx_pathway_gene_pathway; Type: INDEX; Schema: deapp; Owner: deapp; Tablespace: 
--

CREATE INDEX idx_pathway_gene_pathway ON de_pathway_gene USING btree (pathway_id);


--
-- TOC entry 3898 (class 2620 OID 26213)
-- Name: de_parent_cd_trg; Type: TRIGGER; Schema: deapp; Owner: deapp
--

CREATE TRIGGER de_parent_cd_trg BEFORE INSERT ON de_xtrial_parent_names FOR EACH ROW WHEN ((COALESCE((new.parent_cd)::text, ''::text) = ''::text)) EXECUTE PROCEDURE tf_de_parent_cd_trg();


--
-- TOC entry 3892 (class 2620 OID 26214)
-- Name: trg_de_snp_info_id; Type: TRIGGER; Schema: deapp; Owner: deapp
--

CREATE TRIGGER trg_de_snp_info_id BEFORE INSERT ON de_snp_info FOR EACH ROW EXECUTE PROCEDURE tf_trg_de_snp_info_id();


--
-- TOC entry 3893 (class 2620 OID 26215)
-- Name: trg_de_snp_probe_id; Type: TRIGGER; Schema: deapp; Owner: deapp
--

CREATE TRIGGER trg_de_snp_probe_id BEFORE INSERT ON de_snp_probe FOR EACH ROW EXECUTE PROCEDURE tf_trg_de_snp_probe_id();


--
-- TOC entry 3894 (class 2620 OID 26216)
-- Name: trg_de_snp_probe_sorted_def_id; Type: TRIGGER; Schema: deapp; Owner: deapp
--

CREATE TRIGGER trg_de_snp_probe_sorted_def_id BEFORE INSERT ON de_snp_probe_sorted_def FOR EACH ROW EXECUTE PROCEDURE tf_trg_de_snp_probe_sorted_def_id();


--
-- TOC entry 3897 (class 2620 OID 26217)
-- Name: trg_de_subject_snp_dataset_id; Type: TRIGGER; Schema: deapp; Owner: deapp
--

CREATE TRIGGER trg_de_subject_snp_dataset_id BEFORE INSERT ON de_subject_snp_dataset FOR EACH ROW EXECUTE PROCEDURE tf_trg_de_subject_snp_dataset_id();


--
-- TOC entry 3895 (class 2620 OID 26218)
-- Name: trg_de_subject_sorted_def_id; Type: TRIGGER; Schema: deapp; Owner: deapp
--

CREATE TRIGGER trg_de_subject_sorted_def_id BEFORE INSERT ON de_snp_subject_sorted_def FOR EACH ROW EXECUTE PROCEDURE tf_trg_de_subject_sorted_def_id();


--
-- TOC entry 3890 (class 2620 OID 26219)
-- Name: trg_snp_data_by_patient_id; Type: TRIGGER; Schema: deapp; Owner: deapp
--

CREATE TRIGGER trg_snp_data_by_patient_id BEFORE INSERT ON de_snp_data_by_patient FOR EACH ROW EXECUTE PROCEDURE tf_trg_snp_data_by_patient_id();


--
-- TOC entry 3891 (class 2620 OID 26220)
-- Name: trg_snp_data_by_pprobe_id; Type: TRIGGER; Schema: deapp; Owner: deapp
--

CREATE TRIGGER trg_snp_data_by_pprobe_id BEFORE INSERT ON de_snp_data_by_probe FOR EACH ROW EXECUTE PROCEDURE tf_trg_snp_data_by_pprobe_id();


--
-- TOC entry 3896 (class 2620 OID 26221)
-- Name: trg_snp_subject_sorted_def_id; Type: TRIGGER; Schema: deapp; Owner: deapp
--

CREATE TRIGGER trg_snp_subject_sorted_def_id BEFORE INSERT ON de_snp_subject_sorted_def FOR EACH ROW EXECUTE PROCEDURE tf_trg_snp_subject_sorted_def_id();


--
-- TOC entry 3885 (class 2606 OID 26497)
-- Name: de_chromosomal_region_gpl_id_fkey; Type: FK CONSTRAINT; Schema: deapp; Owner: deapp
--

ALTER TABLE ONLY de_chromosomal_region
    ADD CONSTRAINT de_chromosomal_region_gpl_id_fkey FOREIGN KEY (gpl_id) REFERENCES de_gpl_info(platform);


--
-- TOC entry 3889 (class 2606 OID 26502)
-- Name: de_subject_acgh_data_region_id_fkey; Type: FK CONSTRAINT; Schema: deapp; Owner: deapp
--

ALTER TABLE ONLY de_subject_acgh_data
    ADD CONSTRAINT de_subject_acgh_data_region_id_fkey FOREIGN KEY (region_id) REFERENCES de_chromosomal_region(region_id);


--
-- TOC entry 3887 (class 2606 OID 26507)
-- Name: fk_snp_gene_map_snp_id; Type: FK CONSTRAINT; Schema: deapp; Owner: deapp
--

ALTER TABLE ONLY de_snp_gene_map
    ADD CONSTRAINT fk_snp_gene_map_snp_id FOREIGN KEY (snp_id) REFERENCES de_snp_info(snp_info_id);


--
-- TOC entry 3886 (class 2606 OID 26512)
-- Name: fk_snp_loc_dataset_id; Type: FK CONSTRAINT; Schema: deapp; Owner: deapp
--

ALTER TABLE ONLY de_snp_data_dataset_loc
    ADD CONSTRAINT fk_snp_loc_dataset_id FOREIGN KEY (snp_dataset_id) REFERENCES de_subject_snp_dataset(subject_snp_dataset_id);


--
-- TOC entry 3888 (class 2606 OID 26517)
-- Name: fk_snp_probe_snp_id; Type: FK CONSTRAINT; Schema: deapp; Owner: deapp
--

ALTER TABLE ONLY de_snp_probe
    ADD CONSTRAINT fk_snp_probe_snp_id FOREIGN KEY (snp_id) REFERENCES de_snp_info(snp_info_id);



-- Completed on 2013-07-24 09:36:34 BST

--
-- PostgreSQL database dump complete
--

