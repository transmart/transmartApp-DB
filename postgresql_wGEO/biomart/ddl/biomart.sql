--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-24 09:35:24 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 24065)
-- Name: biomart; Type: SCHEMA; Schema: -; Owner: biomart
--

CREATE SCHEMA biomart;


ALTER SCHEMA biomart OWNER TO biomart;

SET search_path = biomart, pg_catalog;

--
-- TOC entry 642 (class 1255 OID 24094)
-- Name: bio_assay_analysis_uid(text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION bio_assay_analysis_uid(analysis_name text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BAA:' || coalesce(ANALYSIS_NAME, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.bio_assay_analysis_uid(analysis_name text) OWNER TO biomart;

--
-- TOC entry 643 (class 1255 OID 24095)
-- Name: bio_assay_platform_uid(text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION bio_assay_platform_uid(platform_name text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BAP:' || coalesce(PLATFORM_NAME, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.bio_assay_platform_uid(platform_name text) OWNER TO biomart;

--
-- TOC entry 644 (class 1255 OID 24096)
-- Name: bio_asy_analysis_pltfm_uid(text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION bio_asy_analysis_pltfm_uid(platform_name text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BAAP:' || coalesce(PLATFORM_NAME, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.bio_asy_analysis_pltfm_uid(platform_name text) OWNER TO biomart;

--
-- TOC entry 646 (class 1255 OID 24097)
-- Name: bio_compound_uid(text, text, text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION bio_compound_uid(cas_registry text, jnj_number text, cnto_number text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Function to create compound_uid.

  RETURN 'COM:' || coalesce(CAS_REGISTRY, coalesce(JNJ_NUMBER, coalesce(CNTO_NUMBER, 'ERROR')));
END;
$_$;


ALTER FUNCTION biomart.bio_compound_uid(cas_registry text, jnj_number text, cnto_number text) OWNER TO biomart;

--
-- TOC entry 647 (class 1255 OID 24098)
-- Name: bio_curation_dataset_uid(text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION bio_curation_dataset_uid(bio_curation_type text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BCD:' || coalesce(BIO_CURATION_TYPE, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.bio_curation_dataset_uid(bio_curation_type text) OWNER TO biomart;

--
-- TOC entry 645 (class 1255 OID 24099)
-- Name: bio_disease_uid(text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION bio_disease_uid(mesh_code text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates bio_disease_uid.

  RETURN 'DIS:' || coalesce(MESH_CODE, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.bio_disease_uid(mesh_code text) OWNER TO biomart;

--
-- TOC entry 651 (class 1255 OID 24100)
-- Name: bio_experiment_uid(text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION bio_experiment_uid(primary_id text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'EXP:' || coalesce(PRIMARY_ID, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.bio_experiment_uid(primary_id text) OWNER TO biomart;

--
-- TOC entry 652 (class 1255 OID 24101)
-- Name: bio_jub_oncol_data_uid(bigint, text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION bio_jub_oncol_data_uid(record_id bigint, bio_curation_name text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BJOD:' || coalesce(trim(TO_CHAR(RECORD_ID, '9999999999999999999')), 'ERROR') || ':' || coalesce(BIO_CURATION_NAME, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.bio_jub_oncol_data_uid(record_id bigint, bio_curation_name text) OWNER TO biomart;

--
-- TOC entry 653 (class 1255 OID 24102)
-- Name: bio_jub_oncol_sum_data_uid(bigint, text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION bio_jub_oncol_sum_data_uid(record_id bigint, bio_curation_name text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'BJOS:' || coalesce(trim(TO_CHAR(RECORD_ID, '9999999999999999999')), 'ERROR') || ':' || coalesce(BIO_CURATION_NAME, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.bio_jub_oncol_sum_data_uid(record_id bigint, bio_curation_name text) OWNER TO biomart;

--
-- TOC entry 654 (class 1255 OID 24103)
-- Name: biomarker_gene_uid(text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION biomarker_gene_uid(gene_id text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'GENE:' || coalesce(GENE_ID, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.biomarker_gene_uid(gene_id text) OWNER TO biomart;

--
-- TOC entry 655 (class 1255 OID 24104)
-- Name: biomarker_pathway_uid(text, text); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION biomarker_pathway_uid(p_source text, pathway_id text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
  -- $Id$
  -- Creates uid for bio_experiment.

  RETURN 'PATHWAY:'|| P_SOURCE || ':' || coalesce(PATHWAY_ID, 'ERROR');
END;
$_$;


ALTER FUNCTION biomart.biomarker_pathway_uid(p_source text, pathway_id text) OWNER TO biomart;

--
-- TOC entry 656 (class 1255 OID 24105)
-- Name: cum_normal_dist(numeric, numeric, numeric); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION cum_normal_dist(foldchg numeric, mu numeric, sigma numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION biomart.cum_normal_dist(foldchg numeric, mu numeric, sigma numeric) OWNER TO biomart;

--
-- TOC entry 658 (class 1255 OID 24106)
-- Name: fract_error_dist(numeric); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION fract_error_dist(norminput numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION biomart.fract_error_dist(norminput numeric) OWNER TO biomart;

--
-- TOC entry 657 (class 1255 OID 24107)
-- Name: refresh_bio_lit_int_model_mv(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION refresh_bio_lit_int_model_mv() RETURNS character varying
    LANGUAGE plpgsql
    AS $$
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
 
 
 
$$;


ALTER FUNCTION biomart.refresh_bio_lit_int_model_mv() OWNER TO biomart;

--
-- TOC entry 659 (class 1255 OID 24108)
-- Name: refresh_bio_marker_correl_mv(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION refresh_bio_marker_correl_mv() RETURNS character varying
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION biomart.refresh_bio_marker_correl_mv() OWNER TO biomart;

--
-- TOC entry 660 (class 1255 OID 24109)
-- Name: tea_npv_precompute(numeric, numeric, numeric); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tea_npv_precompute(foldchg numeric, mu numeric, sigma numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION biomart.tea_npv_precompute(foldchg numeric, mu numeric, sigma numeric) OWNER TO biomart;

--
-- TOC entry 661 (class 1255 OID 24110)
-- Name: tf_trg_bio_assay_analysis_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_assay_analysis_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.BIO_ASSAY_ANALYSIS_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_ANALYSIS_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_assay_analysis_id() OWNER TO biomart;

--
-- TOC entry 662 (class 1255 OID 24111)
-- Name: tf_trg_bio_assay_data_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_assay_data_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin    if NEW.BIO_ASSAY_DATA_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_DATA_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_assay_data_id() OWNER TO biomart;

--
-- TOC entry 663 (class 1255 OID 24112)
-- Name: tf_trg_bio_assay_dataset_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_assay_dataset_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.BIO_ASSAY_DATASET_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_DATASET_ID ;       end if; RETURN NEW;  end;

$$;


ALTER FUNCTION biomart.tf_trg_bio_assay_dataset_id() OWNER TO biomart;

--
-- TOC entry 664 (class 1255 OID 24113)
-- Name: tf_trg_bio_assay_f_g_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_assay_f_g_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.BIO_ASSAY_FEATURE_GROUP_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_FEATURE_GROUP_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_assay_f_g_id() OWNER TO biomart;

--
-- TOC entry 665 (class 1255 OID 24114)
-- Name: tf_trg_bio_assay_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_assay_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin   if NEW.BIO_ASSAY_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_assay_id() OWNER TO biomart;

--
-- TOC entry 666 (class 1255 OID 24115)
-- Name: tf_trg_bio_assay_platform_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_assay_platform_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.BIO_ASSAY_PLATFORM_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASSAY_PLATFORM_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_assay_platform_id() OWNER TO biomart;

--
-- TOC entry 667 (class 1255 OID 24116)
-- Name: tf_trg_bio_asy_analysis_pltfm_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_asy_analysis_pltfm_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin  if NEW.BIO_ASY_ANALYSIS_PLTFM_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_ASY_ANALYSIS_PLTFM_ID ;       end if; RETURN NEW;   end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_asy_analysis_pltfm_id() OWNER TO biomart;

--
-- TOC entry 668 (class 1255 OID 24117)
-- Name: tf_trg_bio_asy_dt_stats_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_asy_dt_stats_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin    if NEW.BIO_ASSAY_DATA_STATS_ID is null then          select nextval('biomart.SEQ_BIO_DATA_FACT_ID') into NEW.BIO_ASSAY_DATA_STATS_ID ;       end if;  RETURN NEW; end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_asy_dt_stats_id() OWNER TO biomart;

--
-- TOC entry 669 (class 1255 OID 24118)
-- Name: tf_trg_bio_cell_line_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_cell_line_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin   if NEW.BIO_CELL_LINE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CELL_LINE_ID ;       end if; RETURN NEW;   end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_cell_line_id() OWNER TO biomart;

--
-- TOC entry 670 (class 1255 OID 24119)
-- Name: tf_trg_bio_cl_trl_time_pt_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_cl_trl_time_pt_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin  if NEW.BIO_CLINC_TRIAL_TM_PT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CLINC_TRIAL_TM_PT_ID ;       end if; RETURN NEW;   end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_cl_trl_time_pt_id() OWNER TO biomart;

--
-- TOC entry 671 (class 1255 OID 24120)
-- Name: tf_trg_bio_clin_trl_pt_grp_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_clin_trl_pt_grp_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin   if NEW.BIO_CLINICAL_TRIAL_P_GROUP_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CLINICAL_TRIAL_P_GROUP_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_clin_trl_pt_grp_id() OWNER TO biomart;

--
-- TOC entry 672 (class 1255 OID 24121)
-- Name: tf_trg_bio_cln_trl_attr_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_cln_trl_attr_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin   if NEW.BIO_CLINC_TRIAL_ATTR_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CLINC_TRIAL_ATTR_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_cln_trl_attr_id() OWNER TO biomart;

--
-- TOC entry 673 (class 1255 OID 24122)
-- Name: tf_trg_bio_compound_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_compound_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin if NEW.BIO_COMPOUND_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_COMPOUND_ID ;       end if; RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_compound_id() OWNER TO biomart;

--
-- TOC entry 674 (class 1255 OID 24123)
-- Name: tf_trg_bio_concept_code_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_concept_code_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.BIO_CONCEPT_CODE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CONCEPT_CODE_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_concept_code_id() OWNER TO biomart;

--
-- TOC entry 675 (class 1255 OID 24124)
-- Name: tf_trg_bio_content_ref_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_content_ref_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin      if NEW.BIO_CONTENT_REFERENCE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CONTENT_REFERENCE_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_content_ref_id() OWNER TO biomart;

--
-- TOC entry 676 (class 1255 OID 24125)
-- Name: tf_trg_bio_content_repo_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_content_repo_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin if NEW.BIO_CONTENT_REPO_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CONTENT_REPO_ID ;       end if; RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_content_repo_id() OWNER TO biomart;

--
-- TOC entry 677 (class 1255 OID 24126)
-- Name: tf_trg_bio_curation_dataset_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_curation_dataset_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin      if NEW.BIO_CURATION_DATASET_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CURATION_DATASET_ID ;       end if; RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_curation_dataset_id() OWNER TO biomart;

--
-- TOC entry 678 (class 1255 OID 24127)
-- Name: tf_trg_bio_data_attr_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_data_attr_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin if NEW.BIO_DATA_ATTRIBUTE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DATA_ATTRIBUTE_ID ;       end if; RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_data_attr_id() OWNER TO biomart;

--
-- TOC entry 679 (class 1255 OID 24128)
-- Name: tf_trg_bio_data_correl_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_data_correl_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin       if NEW.BIO_DATA_CORREL_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DATA_CORREL_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_data_correl_id() OWNER TO biomart;

--
-- TOC entry 680 (class 1255 OID 24129)
-- Name: tf_trg_bio_data_ext_code_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_data_ext_code_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin    if NEW.BIO_DATA_EXT_CODE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DATA_EXT_CODE_ID ;       end if;   RETURN NEW;
end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_data_ext_code_id() OWNER TO biomart;

--
-- TOC entry 681 (class 1255 OID 24130)
-- Name: tf_trg_bio_disease_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_disease_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.BIO_DISEASE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DISEASE_ID ;       end if;   RETURN NEW; end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_disease_id() OWNER TO biomart;

--
-- TOC entry 682 (class 1255 OID 24131)
-- Name: tf_trg_bio_experiment_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_experiment_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin         if NEW.BIO_EXPERIMENT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_EXPERIMENT_ID ;       end if; RETURN NEW;   end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_experiment_id() OWNER TO biomart;

--
-- TOC entry 683 (class 1255 OID 24132)
-- Name: tf_trg_bio_file_content_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_file_content_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin       if NEW.BIO_FILE_CONTENT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_FILE_CONTENT_ID ;       end if;   RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_file_content_id() OWNER TO biomart;

--
-- TOC entry 684 (class 1255 OID 24133)
-- Name: tf_trg_bio_lit_alt_data_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_lit_alt_data_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
       if NEW.BIO_LIT_ALT_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_ALT_DATA_ID ;
       end if;
       RETURN NEW;
end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_lit_alt_data_id() OWNER TO biomart;

--
-- TOC entry 685 (class 1255 OID 24134)
-- Name: tf_trg_bio_lit_amd_data_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_lit_amd_data_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
       if NEW.BIO_LIT_AMD_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_AMD_DATA_ID ;
       end if;
       RETURN NEW;
    end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_lit_amd_data_id() OWNER TO biomart;

--
-- TOC entry 686 (class 1255 OID 24135)
-- Name: tf_trg_bio_lit_inh_data_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_lit_inh_data_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
       if NEW.BIO_LIT_INH_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_INH_DATA_ID ;
       end if; 
       RETURN NEW;
end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_lit_inh_data_id() OWNER TO biomart;

--
-- TOC entry 687 (class 1255 OID 24136)
-- Name: tf_trg_bio_lit_int_data_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_lit_int_data_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
       if NEW.BIO_LIT_INT_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_INT_DATA_ID ;
       end if; 
       RETURN NEW;
end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_lit_int_data_id() OWNER TO biomart;

--
-- TOC entry 688 (class 1255 OID 24137)
-- Name: tf_trg_bio_lit_model_data_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_lit_model_data_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
       if NEW.BIO_LIT_MODEL_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_MODEL_DATA_ID ;
       end if;
       RETURN NEW;
end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_lit_model_data_id() OWNER TO biomart;

--
-- TOC entry 689 (class 1255 OID 24138)
-- Name: tf_trg_bio_lit_pe_data_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_lit_pe_data_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
       if NEW.BIO_LIT_PE_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_PE_DATA_ID ;
       end if;
       RETURN NEW;
end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_lit_pe_data_id() OWNER TO biomart;

--
-- TOC entry 690 (class 1255 OID 24139)
-- Name: tf_trg_bio_lit_ref_data_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_lit_ref_data_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
       if NEW.BIO_LIT_REF_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_REF_DATA_ID ;
       end if;
       RETURN NEW;
end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_lit_ref_data_id() OWNER TO biomart;

--
-- TOC entry 691 (class 1255 OID 24140)
-- Name: tf_trg_bio_lit_sum_data_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_lit_sum_data_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
       if NEW.BIO_LIT_SUM_DATA_ID is null then
          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_LIT_SUM_DATA_ID ;
       end if;
       RETURN NEW;
end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_lit_sum_data_id() OWNER TO biomart;

--
-- TOC entry 692 (class 1255 OID 24141)
-- Name: tf_trg_bio_marker_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_marker_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin  if NEW.BIO_MARKER_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_MARKER_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_marker_id() OWNER TO biomart;

--
-- TOC entry 693 (class 1255 OID 24142)
-- Name: tf_trg_bio_mkr_correl_descr_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_mkr_correl_descr_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin   if NEW.BIO_DATA_CORREL_DESCR_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_DATA_CORREL_DESCR_ID ;       end if;  RETURN NEW;  end;

$$;


ALTER FUNCTION biomart.tf_trg_bio_mkr_correl_descr_id() OWNER TO biomart;

--
-- TOC entry 694 (class 1255 OID 24143)
-- Name: tf_trg_bio_patient_event_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_patient_event_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin  if NEW.BIO_PATIENT_EVENT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_PATIENT_EVENT_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_patient_event_id() OWNER TO biomart;

--
-- TOC entry 695 (class 1255 OID 24144)
-- Name: tf_trg_bio_patient_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_patient_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin  if NEW.BIO_PATIENT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_PATIENT_ID ;       end if; RETURN NEW;   end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_patient_id() OWNER TO biomart;

--
-- TOC entry 696 (class 1255 OID 24145)
-- Name: tf_trg_bio_pt_evt_attr_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_pt_evt_attr_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin if NEW.BIO_CLINIC_TRIAL_ATTRIBUTE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_CLINIC_TRIAL_ATTRIBUTE_ID ;       end if; RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_pt_evt_attr_id() OWNER TO biomart;

--
-- TOC entry 697 (class 1255 OID 24146)
-- Name: tf_trg_bio_sample_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_sample_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin   if NEW.BIO_SAMPLE_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_SAMPLE_ID ;       end if; RETURN NEW;   end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_sample_id() OWNER TO biomart;

--
-- TOC entry 698 (class 1255 OID 24147)
-- Name: tf_trg_bio_subject_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_subject_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin if NEW.BIO_SUBJECT_ID is null then          select nextval('biomart.SEQ_BIO_DATA_ID') into NEW.BIO_SUBJECT_ID ;       end if;  RETURN NEW;  end;
$$;


ALTER FUNCTION biomart.tf_trg_bio_subject_id() OWNER TO biomart;

--
-- TOC entry 699 (class 1255 OID 24148)
-- Name: tf_trg_bio_taxon_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_bio_taxon_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN IF NEW.BIO_TAXONOMY_ID IS NULL THEN
  select nextval('biomart.SEQ_BIO_DATA_ID') INTO NEW.BIO_TAXONOMY_ID ;
END IF;
RETURN NEW;
END;
$$;


ALTER FUNCTION biomart.tf_trg_bio_taxon_id() OWNER TO biomart;

--
-- TOC entry 700 (class 1255 OID 24149)
-- Name: tf_trg_ctd2_clin_inhib_effect(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_ctd2_clin_inhib_effect() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN     
 	IF NEW.CTD_CIE_SEQ IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_CIE_SEQ ;  
	END IF;  
	RETURN NEW;  
END;
$$;


ALTER FUNCTION biomart.tf_trg_ctd2_clin_inhib_effect() OWNER TO biomart;

--
-- TOC entry 701 (class 1255 OID 24150)
-- Name: tf_trg_ctd2_disease(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_ctd2_disease() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN     
	IF NEW.CTD_DISEASE_SEQ IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_DISEASE_SEQ ;  
	END IF;    
	RETURN NEW;
END;
$$;


ALTER FUNCTION biomart.tf_trg_ctd2_disease() OWNER TO biomart;

--
-- TOC entry 702 (class 1255 OID 24151)
-- Name: tf_trg_ctd2_inhib_details(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_ctd2_inhib_details() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN     
	IF NEW.CTD_INHIB_SEQ IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_INHIB_SEQ ;  
	END IF;    
	RETURN NEW;
END;
$$;


ALTER FUNCTION biomart.tf_trg_ctd2_inhib_details() OWNER TO biomart;

--
-- TOC entry 703 (class 1255 OID 24152)
-- Name: tf_trg_ctd2_study_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_ctd2_study_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN     
	IF NEW.CTD_STUDY_ID IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_STUDY_ID ;  
	END IF;    
	RETURN NEW;
END;
$$;


ALTER FUNCTION biomart.tf_trg_ctd2_study_id() OWNER TO biomart;

--
-- TOC entry 704 (class 1255 OID 24153)
-- Name: tf_trg_ctd2_trial_details(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trg_ctd2_trial_details() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN     
	IF NEW.CTD_TD_SEQ IS NULL THEN 
		select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') INTO NEW.CTD_TD_SEQ ;  
	END IF;   
	RETURN NEW; 
END;
$$;


ALTER FUNCTION biomart.tf_trg_ctd2_trial_details() OWNER TO biomart;

--
-- TOC entry 705 (class 1255 OID 24154)
-- Name: tf_trig_clinical_trial_design_id(); Type: FUNCTION; Schema: biomart; Owner: biomart
--

CREATE FUNCTION tf_trig_clinical_trial_design_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     
    if NEW.CLINICAL_TRIAL_DESIGN_ID is null then          
      select nextval('biomart.SEQ_CLINICAL_TRIAL_DESIGN_ID') into NEW.CLINICAL_TRIAL_DESIGN_ID ;  
    end if; 
    RETURN NEW;
end;
$$;


ALTER FUNCTION biomart.tf_trig_clinical_trial_design_id() OWNER TO biomart;

SET default_tablespace = biomart;

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 24207)
-- Name: bio_assay; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay (
    bio_assay_id bigint NOT NULL,
    etl_id character varying(100) NOT NULL,
    study character varying(200),
    protocol character varying(200),
    description text,
    sample_type character varying(200),
    experiment_id bigint NOT NULL,
    test_date timestamp without time zone,
    sample_receive_date timestamp without time zone,
    requestor character varying(200),
    bio_assay_type character varying(200) NOT NULL,
    bio_assay_platform_id bigint
);


ALTER TABLE biomart.bio_assay OWNER TO biomart;

--
-- TOC entry 183 (class 1259 OID 24213)
-- Name: bio_assay_analysis; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_analysis (
    analysis_name character varying(500),
    short_description character varying(510),
    analysis_create_date timestamp without time zone,
    analyst_id character varying(510),
    bio_assay_analysis_id bigint NOT NULL,
    analysis_version character varying(200),
    fold_change_cutoff double precision,
    pvalue_cutoff double precision,
    rvalue_cutoff double precision,
    bio_asy_analysis_pltfm_id bigint,
    bio_source_import_id bigint,
    analysis_type character varying(200),
    analyst_name character varying(250),
    analysis_method_cd character varying(50),
    bio_assay_data_type character varying(50),
    etl_id character varying(100),
    long_description character varying(4000),
    qa_criteria character varying(4000),
    data_count bigint,
    tea_data_count bigint
);


ALTER TABLE biomart.bio_assay_analysis OWNER TO biomart;

--
-- TOC entry 184 (class 1259 OID 24219)
-- Name: bio_assay_analysis_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_analysis_data (
    bio_asy_analysis_data_id bigint NOT NULL,
    fold_change_ratio bigint,
    raw_pvalue double precision,
    adjusted_pvalue double precision,
    r_value double precision,
    rho_value double precision,
    bio_assay_analysis_id bigint NOT NULL,
    adjusted_p_value_code character varying(100),
    feature_group_name character varying(100) NOT NULL,
    bio_experiment_id bigint,
    bio_assay_platform_id bigint,
    etl_id character varying(100),
    preferred_pvalue double precision,
    cut_value double precision,
    results_value character varying(100),
    numeric_value double precision,
    numeric_value_code character varying(50),
    tea_normalized_pvalue double precision,
    bio_assay_feature_group_id bigint
);


ALTER TABLE biomart.bio_assay_analysis_data OWNER TO biomart;

--
-- TOC entry 185 (class 1259 OID 24222)
-- Name: bio_assay_analysis_data_tea; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_analysis_data_tea (
    bio_asy_analysis_data_id bigint NOT NULL,
    fold_change_ratio bigint,
    raw_pvalue double precision,
    adjusted_pvalue double precision,
    r_value double precision,
    rho_value double precision,
    bio_assay_analysis_id bigint NOT NULL,
    adjusted_p_value_code character varying(100),
    feature_group_name character varying(100) NOT NULL,
    bio_experiment_id bigint,
    bio_assay_platform_id bigint,
    etl_id character varying(100),
    preferred_pvalue double precision,
    cut_value double precision,
    results_value character varying(100),
    numeric_value double precision,
    numeric_value_code character varying(50),
    tea_normalized_pvalue double precision,
    bio_experiment_type character varying(50),
    bio_assay_feature_group_id bigint,
    tea_rank bigint
);


ALTER TABLE biomart.bio_assay_analysis_data_tea OWNER TO biomart;

--
-- TOC entry 186 (class 1259 OID 24228)
-- Name: bio_assay_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_data (
    bio_sample_id bigint,
    bio_assay_data_id bigint NOT NULL,
    log2_value double precision,
    log10_value double precision,
    numeric_value bigint,
    text_value character varying(200),
    float_value double precision,
    feature_group_name character varying(100) NOT NULL,
    bio_experiment_id bigint,
    bio_assay_dataset_id bigint,
    bio_assay_id bigint,
    etl_id bigint
);


ALTER TABLE biomart.bio_assay_data OWNER TO biomart;

--
-- TOC entry 187 (class 1259 OID 24231)
-- Name: bio_assay_data_annotation; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_data_annotation (
    bio_assay_feature_group_id bigint,
    bio_marker_id bigint NOT NULL,
    data_table character(5)
);


ALTER TABLE biomart.bio_assay_data_annotation OWNER TO biomart;

--
-- TOC entry 188 (class 1259 OID 24234)
-- Name: bio_assay_data_stats; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_data_stats (
    bio_assay_data_stats_id bigint NOT NULL,
    bio_sample_count bigint,
    quartile_1 double precision,
    quartile_2 double precision,
    quartile_3 double precision,
    max_value double precision,
    min_value double precision,
    bio_sample_id bigint,
    feature_group_name character varying(120),
    value_normalize_method character varying(50),
    bio_experiment_id bigint,
    mean_value double precision,
    std_dev_value double precision,
    bio_assay_dataset_id bigint,
    bio_assay_feature_group_id bigint NOT NULL
);


ALTER TABLE biomart.bio_assay_data_stats OWNER TO biomart;

--
-- TOC entry 189 (class 1259 OID 24237)
-- Name: bio_assay_data_stats_seq; Type: SEQUENCE; Schema: biomart; Owner: biomart
--

CREATE SEQUENCE bio_assay_data_stats_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE biomart.bio_assay_data_stats_seq OWNER TO biomart;

--
-- TOC entry 190 (class 1259 OID 24239)
-- Name: bio_assay_dataset; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_dataset (
    bio_assay_dataset_id bigint NOT NULL,
    dataset_name character varying(400),
    dataset_description character varying(1000),
    dataset_criteria character varying(1000),
    create_date timestamp without time zone,
    bio_experiment_id bigint NOT NULL,
    bio_assay_id bigint,
    etl_id character varying(100),
    accession character varying(50)
);


ALTER TABLE biomart.bio_assay_dataset OWNER TO biomart;

--
-- TOC entry 191 (class 1259 OID 24245)
-- Name: bio_assay_feature_group; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_feature_group (
    bio_assay_feature_group_id bigint NOT NULL,
    feature_group_name character varying(100) NOT NULL,
    feature_group_type character varying(50) NOT NULL
);


ALTER TABLE biomart.bio_assay_feature_group OWNER TO biomart;

--
-- TOC entry 192 (class 1259 OID 24248)
-- Name: bio_assay_platform; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_platform (
    bio_assay_platform_id bigint NOT NULL,
    platform_name character varying(200),
    platform_version character varying(200),
    platform_description character varying(2000),
    platform_array character varying(50),
    platform_accession character varying(20),
    platform_organism character varying(200),
    platform_vendor character varying(200)
);


ALTER TABLE biomart.bio_assay_platform OWNER TO biomart;

--
-- TOC entry 193 (class 1259 OID 24254)
-- Name: bio_assay_sample; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_assay_sample (
    bio_assay_id bigint NOT NULL,
    bio_sample_id bigint NOT NULL,
    bio_clinic_trial_timepoint_id bigint NOT NULL
);


ALTER TABLE biomart.bio_assay_sample OWNER TO biomart;

--
-- TOC entry 194 (class 1259 OID 24257)
-- Name: bio_asy_analysis_dataset; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_asy_analysis_dataset (
    bio_assay_dataset_id bigint NOT NULL,
    bio_assay_analysis_id bigint NOT NULL
);


ALTER TABLE biomart.bio_asy_analysis_dataset OWNER TO biomart;

--
-- TOC entry 195 (class 1259 OID 24260)
-- Name: bio_asy_analysis_pltfm; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_asy_analysis_pltfm (
    bio_asy_analysis_pltfm_id bigint NOT NULL,
    platform_name character varying(200),
    platform_version character varying(200),
    platform_description character varying(1000)
);


ALTER TABLE biomart.bio_asy_analysis_pltfm OWNER TO biomart;

--
-- TOC entry 196 (class 1259 OID 24266)
-- Name: bio_asy_data_stats_all; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_asy_data_stats_all (
    bio_assay_data_stats_id bigint NOT NULL,
    bio_sample_count bigint,
    quartile_1 double precision,
    quartile_2 double precision,
    quartile_3 double precision,
    max_value double precision,
    min_value double precision,
    bio_sample_id bigint,
    feature_group_name character varying(120),
    value_normalize_method character varying(50),
    bio_experiment_id bigint,
    mean_value double precision,
    std_dev_value double precision,
    bio_assay_dataset_id bigint
);


ALTER TABLE biomart.bio_asy_data_stats_all OWNER TO biomart;

--
-- TOC entry 197 (class 1259 OID 24269)
-- Name: bio_cell_line; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_cell_line (
    disease character varying(510),
    primary_site character varying(510),
    metastatic_site character varying(510),
    species character varying(510),
    attc_number character varying(510),
    cell_line_name character varying(510),
    bio_cell_line_id bigint NOT NULL,
    bio_disease_id bigint,
    origin character varying(200),
    description character varying(500),
    disease_stage character varying(100),
    disease_subtype character varying(200),
    etl_reference_link character varying(300)
);


ALTER TABLE biomart.bio_cell_line OWNER TO biomart;

--
-- TOC entry 198 (class 1259 OID 24275)
-- Name: bio_cgdcp_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_cgdcp_data (
    evidence_code character varying(200),
    negation_indicator character(1),
    cell_line_id bigint,
    nci_disease_concept_code character varying(200),
    nci_role_code character varying(200),
    nci_drug_concept_code character varying(200),
    bio_data_id bigint NOT NULL
);


ALTER TABLE biomart.bio_cgdcp_data OWNER TO biomart;

--
-- TOC entry 199 (class 1259 OID 24281)
-- Name: bio_clinc_trial_attr; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_clinc_trial_attr (
    bio_clinc_trial_attr_id bigint NOT NULL,
    property_code character varying(200) NOT NULL,
    property_value character varying(200),
    bio_experiment_id bigint NOT NULL
);


ALTER TABLE biomart.bio_clinc_trial_attr OWNER TO biomart;

--
-- TOC entry 200 (class 1259 OID 24284)
-- Name: bio_clinc_trial_pt_group; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_clinc_trial_pt_group (
    bio_experiment_id bigint NOT NULL,
    bio_clinical_trial_p_group_id bigint NOT NULL,
    name character varying(510),
    description character varying(1000),
    number_of_patients integer,
    patient_group_type_code character varying(200)
);


ALTER TABLE biomart.bio_clinc_trial_pt_group OWNER TO biomart;

--
-- TOC entry 201 (class 1259 OID 24290)
-- Name: bio_clinc_trial_time_pt; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_clinc_trial_time_pt (
    bio_clinc_trial_tm_pt_id bigint NOT NULL,
    time_point character varying(200),
    time_point_code character varying(200),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    bio_experiment_id bigint NOT NULL
);


ALTER TABLE biomart.bio_clinc_trial_time_pt OWNER TO biomart;

--
-- TOC entry 202 (class 1259 OID 24293)
-- Name: bio_clinical_trial; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_clinical_trial (
    trial_number character varying(510),
    study_owner character varying(510),
    study_phase character varying(100),
    blinding_procedure character varying(1000),
    studytype character varying(510),
    duration_of_study_weeks integer,
    number_of_patients integer,
    number_of_sites integer,
    route_of_administration character varying(510),
    dosing_regimen character varying(3500),
    group_assignment character varying(510),
    type_of_control character varying(510),
    completion_date timestamp without time zone,
    primary_end_points character varying(2000),
    secondary_end_points character varying(3500),
    inclusion_criteria text,
    exclusion_criteria text,
    subjects character varying(2000),
    gender_restriction_mfb character varying(510),
    min_age integer,
    max_age integer,
    secondary_ids character varying(510),
    bio_experiment_id bigint NOT NULL,
    development_partner character varying(100),
    geo_platform character varying(30),
    main_findings character varying(2000),
    platform_name character varying(200),
    search_area character varying(100)
);


ALTER TABLE biomart.bio_clinical_trial OWNER TO biomart;

--
-- TOC entry 203 (class 1259 OID 24299)
-- Name: bio_clinical_trial_design; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_clinical_trial_design (
    ref_id character varying(4000),
    ref_record_id character varying(4000),
    ref_back_reference character varying(4000),
    ref_article_pmid character varying(4000),
    ref_protocol_id character varying(4000),
    ref_title character varying(4000),
    study_type character varying(4000),
    common_name character varying(4000),
    icd10 character varying(4000),
    mesh character varying(4000),
    disease_type character varying(4000),
    physiology_name character varying(4000),
    trial_status character varying(4000),
    trial_phase character varying(4000),
    nature_of_trial character varying(4000),
    randomization character varying(4000),
    blinded_trial character varying(4000),
    trial_type character varying(4000),
    run_n_period character varying(4000),
    treatment_period character varying(4000),
    washout_period character varying(4000),
    open_label_extension character varying(4000),
    sponsor character varying(4000),
    trial_nbr_of_patients_studied character varying(4000),
    source_type character varying(4000),
    trial_age character varying(4000),
    disease_severity character varying(4000),
    difficult_to_treat character varying(4000),
    asthma_diagnosis character varying(4000),
    inhaled_steroid_dose character varying(4000),
    laba character varying(4000),
    ocs character varying(4000),
    xolair character varying(4000),
    ltra_inhibitors character varying(4000),
    asthma_phenotype character varying(4000),
    fev1 character varying(4000),
    fev1_reversibility character varying(4000),
    tlc character varying(4000),
    fev1_fvc character varying(4000),
    fvc character varying(4000),
    dlco character varying(4000),
    sgrq character varying(4000),
    hrct character varying(4000),
    biopsy character varying(4000),
    dyspnea_on_exertion character varying(4000),
    concomitant_med character varying(4000),
    trial_smokers_pct character varying(4000),
    trial_former_smokers_pct character varying(4000),
    trial_never_smokers_pct character varying(4000),
    trial_pack_years character varying(4000),
    exclusion_criteria character varying(4000),
    minimal_symptoms character varying(4000),
    rescue_medication_use character varying(4000),
    control_details character varying(4000),
    blinding_procedure character varying(4000),
    number_of_arms character varying(4000),
    description character varying(4000),
    arm character varying(4000),
    arm_nbr_of_patients_studied character varying(4000),
    arm_classification_type character varying(4000),
    arm_classification_value character varying(4000),
    arm_asthma_duration character varying(4000),
    arm_geographic_region character varying(4000),
    arm_age character varying(4000),
    arm_gender character varying(4000),
    arm_smokers_pct character varying(4000),
    arm_former_smokers_pct character varying(4000),
    arm_never_smokers_pct character varying(4000),
    arm_pack_years character varying(4000),
    minority_participation character varying(4000),
    baseline_symptom_score character varying(4000),
    baseline_rescue_medication_use character varying(4000),
    clinical_variable character varying(4000),
    clinical_variable_pct character varying(4000),
    clinical_variable_value character varying(4000),
    prior_med_drug_name character varying(4000),
    prior_med_pct character varying(4000),
    prior_med_value character varying(4000),
    biomarker_name character varying(4000),
    biomarker_pct character varying(4000),
    biomarkervalue character varying(4000),
    cellinfo_type character varying(4000),
    cellinfo_count character varying(4000),
    cellinfo_source character varying(4000),
    pulmonary_pathology_name character varying(4000),
    pulmpath_patient_pct character varying(4000),
    pulmpath_value_unit character varying(4000),
    pulmpath_method character varying(4000),
    runin_ocs character varying(4000),
    runin_ics character varying(4000),
    runin_laba character varying(4000),
    runin_ltra character varying(4000),
    runin_corticosteroids character varying(4000),
    runin_anti_fibrotics character varying(4000),
    runin_immunosuppressive character varying(4000),
    runin_cytotoxic character varying(4000),
    runin_description character varying(4000),
    trtmt_ocs character varying(4000),
    trtmt_ics character varying(4000),
    trtmt_laba character varying(4000),
    trtmt_ltra character varying(4000),
    trtmt_corticosteroids character varying(4000),
    trtmt_anti_fibrotics character varying(4000),
    trtmt_immunosuppressive character varying(4000),
    trtmt_cytotoxic character varying(4000),
    trtmt_description character varying(4000),
    drug_inhibitor_common_name character varying(4000),
    drug_inhibitor_standard_name character varying(4000),
    drug_inhibitor_cas_id character varying(4000),
    drug_inhibitor_dose character varying(4000),
    drug_inhibitor_route_of_admin character varying(4000),
    drug_inhibitor_trtmt_regime character varying(4000),
    comparator_name character varying(4000),
    comparator_dose character varying(4000),
    comparator_time_period character varying(4000),
    comparator_route_of_admin character varying(4000),
    treatment_regime character varying(4000),
    placebo character varying(4000),
    experiment_description character varying(4000),
    primary_endpoint_type character varying(4000),
    primary_endpoint_definition character varying(4000),
    primary_endpoint_time_period character varying(4000),
    primary_endpoint_change character varying(4000),
    primary_endpoint_p_value character varying(4000),
    primary_endpoint_stat_test character varying(4000),
    secondary_type character varying(4000),
    secondary_type_definition character varying(4000),
    secondary_type_time_period character varying(4000),
    secondary_type_change character varying(4000),
    secondary_type_p_value character varying(4000),
    secondary_type_stat_test character varying(4000),
    clinical_variable_name character varying(4000),
    pct_change_from_baseline character varying(4000),
    abs_change_from_baseline character varying(4000),
    rate_of_change_from_baseline character varying(4000),
    average_over_treatment_period character varying(4000),
    within_group_changes character varying(4000),
    stat_measure_p_value character varying(4000),
    definition_of_the_event character varying(4000),
    number_of_events character varying(4000),
    event_rate character varying(4000),
    time_to_event character varying(4000),
    event_pct_reduction character varying(4000),
    event_p_value character varying(4000),
    event_description character varying(4000),
    discontinuation_rate character varying(4000),
    response_rate character varying(4000),
    downstream_signaling_effects character varying(4000),
    beneficial_effects character varying(4000),
    adverse_effects character varying(4000),
    pk_pd_parameter character varying(4000),
    pk_pd_value character varying(4000),
    effect_description character varying(4000),
    biomolecule_name character varying(4000),
    biomolecule_id character varying(4000),
    biomolecule_type character varying(4000),
    biomarker character varying(4000),
    biomarker_type character varying(4000),
    baseline_expr_pct character varying(4000),
    baseline_expr_number character varying(4000),
    baseline_expr_value_fold_mean character varying(4000),
    baseline_expr_sd character varying(4000),
    baseline_expr_sem character varying(4000),
    baseline_expr_unit character varying(4000),
    expr_after_trtmt_pct character varying(4000),
    expr_after_trtmt_number character varying(4000),
    expr_aftertrtmt_valuefold_mean character varying(4000),
    expr_after_trtmt_sd character varying(4000),
    expr_after_trtmt_sem character varying(4000),
    expr_after_trtmt_unit character varying(4000),
    expr_chg_source_type character varying(4000),
    expr_chg_technique character varying(4000),
    expr_chg_description character varying(4000),
    clinical_correlation character varying(4000),
    statistical_test character varying(4000),
    statistical_coefficient_value character varying(4000),
    statistical_test_p_value character varying(4000),
    statistical_test_description character varying(4000)
);


ALTER TABLE biomart.bio_clinical_trial_design OWNER TO biomart;

--
-- TOC entry 204 (class 1259 OID 24305)
-- Name: bio_compound; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_compound (
    bio_compound_id bigint NOT NULL,
    cnto_number character varying(200),
    jnj_number character varying(200),
    cas_registry character varying(400),
    code_name character varying(300),
    generic_name character varying(200),
    brand_name character varying(200),
    chemical_name character varying(1000),
    mechanism character varying(400),
    product_category character varying(200),
    description character varying(1000),
    etl_id_retired bigint,
    etl_id character varying(50),
    source_cd character varying(100)
);


ALTER TABLE biomart.bio_compound OWNER TO biomart;

--
-- TOC entry 205 (class 1259 OID 24311)
-- Name: bio_concept_code; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_concept_code (
    bio_concept_code character varying(200),
    code_name character varying(200),
    code_description character varying(1000),
    code_type_name character varying(200),
    bio_concept_code_id bigint NOT NULL
);


ALTER TABLE biomart.bio_concept_code OWNER TO biomart;

--
-- TOC entry 206 (class 1259 OID 24317)
-- Name: bio_content; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_content (
    bio_file_content_id bigint NOT NULL,
    file_name character varying(1000),
    repository_id bigint,
    location character varying(400),
    title character varying(1000),
    abstract character varying(2000),
    file_type character varying(200) NOT NULL,
    etl_id bigint,
    etl_id_c character varying(30),
    study_name character varying(30),
    cel_location character varying(300),
    cel_file_suffix character varying(30)
);


ALTER TABLE biomart.bio_content OWNER TO biomart;

--
-- TOC entry 207 (class 1259 OID 24323)
-- Name: bio_content_reference; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_content_reference (
    bio_content_reference_id bigint NOT NULL,
    bio_content_id bigint NOT NULL,
    bio_data_id bigint NOT NULL,
    content_reference_type character varying(200) NOT NULL,
    etl_id bigint,
    etl_id_c character varying(30)
);


ALTER TABLE biomart.bio_content_reference OWNER TO biomart;

--
-- TOC entry 208 (class 1259 OID 24326)
-- Name: bio_content_repository; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_content_repository (
    bio_content_repo_id bigint NOT NULL,
    location character varying(510),
    active_y_n character(1),
    repository_type character varying(200) NOT NULL,
    location_type character varying(200)
);


ALTER TABLE biomart.bio_content_repository OWNER TO biomart;

--
-- TOC entry 209 (class 1259 OID 24332)
-- Name: bio_curated_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_curated_data (
    statement text,
    statement_status character varying(200),
    bio_data_id bigint NOT NULL,
    bio_curation_dataset_id bigint NOT NULL,
    reference_id bigint,
    data_type character varying(200)
);


ALTER TABLE biomart.bio_curated_data OWNER TO biomart;

--
-- TOC entry 210 (class 1259 OID 24338)
-- Name: bio_curation_dataset; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_curation_dataset (
    bio_curation_dataset_id bigint NOT NULL,
    bio_asy_analysis_pltfm_id bigint,
    bio_source_import_id bigint,
    bio_curation_type character varying(200) NOT NULL,
    create_date timestamp without time zone,
    creator bigint,
    bio_curation_name character varying(500),
    data_type character varying(100)
);


ALTER TABLE biomart.bio_curation_dataset OWNER TO biomart;

--
-- TOC entry 211 (class 1259 OID 24344)
-- Name: bio_data_attribute; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_attribute (
    bio_data_attribute_id bigint NOT NULL,
    property_code character varying(200) NOT NULL,
    property_value character varying(200),
    bio_data_id bigint NOT NULL,
    property_unit character varying(100)
);


ALTER TABLE biomart.bio_data_attribute OWNER TO biomart;

--
-- TOC entry 212 (class 1259 OID 24350)
-- Name: bio_data_compound; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_compound (
    bio_data_id bigint NOT NULL,
    bio_compound_id bigint NOT NULL,
    etl_source character varying(100)
);


ALTER TABLE biomart.bio_data_compound OWNER TO biomart;

--
-- TOC entry 213 (class 1259 OID 24353)
-- Name: bio_data_correl_descr; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_correl_descr (
    bio_data_correl_descr_id bigint NOT NULL,
    correlation character varying(510),
    description character varying(1000),
    type_name character varying(200),
    status character varying(200),
    source character varying(100),
    source_code character varying(200)
);


ALTER TABLE biomart.bio_data_correl_descr OWNER TO biomart;

--
-- TOC entry 214 (class 1259 OID 24359)
-- Name: bio_data_correlation; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_correlation (
    bio_data_id bigint NOT NULL,
    asso_bio_data_id bigint NOT NULL,
    bio_data_correl_descr_id bigint NOT NULL,
    bio_data_correl_id bigint NOT NULL
);


ALTER TABLE biomart.bio_data_correlation OWNER TO biomart;

--
-- TOC entry 215 (class 1259 OID 24362)
-- Name: bio_data_disease; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_disease (
    bio_data_id bigint NOT NULL,
    bio_disease_id bigint NOT NULL,
    etl_source character varying(100)
);


ALTER TABLE biomart.bio_data_disease OWNER TO biomart;

--
-- TOC entry 216 (class 1259 OID 24365)
-- Name: bio_data_ext_code; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_ext_code (
    bio_data_id bigint NOT NULL,
    code character varying(500) NOT NULL,
    code_source character varying(200),
    code_type character varying(200),
    bio_data_type character varying(100),
    bio_data_ext_code_id bigint NOT NULL,
    etl_id character varying(50)
);


ALTER TABLE biomart.bio_data_ext_code OWNER TO biomart;

--
-- TOC entry 217 (class 1259 OID 24371)
-- Name: bio_data_literature; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_literature (
    bio_data_id bigint NOT NULL,
    bio_lit_ref_data_id bigint,
    bio_curation_dataset_id bigint NOT NULL,
    statement text,
    statement_status character varying(200),
    data_type character varying(200)
);


ALTER TABLE biomart.bio_data_literature OWNER TO biomart;

--
-- TOC entry 218 (class 1259 OID 24377)
-- Name: bio_data_omic_marker; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_omic_marker (
    bio_data_id bigint,
    bio_marker_id bigint NOT NULL,
    data_table character varying(5)
);


ALTER TABLE biomart.bio_data_omic_marker OWNER TO biomart;

--
-- TOC entry 219 (class 1259 OID 24380)
-- Name: bio_data_taxonomy; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_taxonomy (
    bio_taxonomy_id bigint NOT NULL,
    bio_data_id bigint NOT NULL,
    etl_source character varying(100)
);


ALTER TABLE biomart.bio_data_taxonomy OWNER TO biomart;

--
-- TOC entry 220 (class 1259 OID 24383)
-- Name: bio_data_uid; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_data_uid (
    bio_data_id bigint NOT NULL,
    unique_id character varying(300) NOT NULL,
    bio_data_type character varying(100) NOT NULL
);


ALTER TABLE biomart.bio_data_uid OWNER TO biomart;

--
-- TOC entry 221 (class 1259 OID 24386)
-- Name: bio_disease; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_disease (
    bio_disease_id bigint NOT NULL,
    disease character varying(510) NOT NULL,
    ccs_category character varying(510),
    icd10_code character varying(510),
    mesh_code character varying(510),
    icd9_code character varying(510),
    prefered_name character varying(510),
    etl_id_retired bigint,
    primary_source_cd character varying(30),
    etl_id character varying(50)
);


ALTER TABLE biomart.bio_disease OWNER TO biomart;

--
-- TOC entry 222 (class 1259 OID 24392)
-- Name: bio_experiment; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_experiment (
    bio_experiment_id bigint NOT NULL,
    bio_experiment_type character varying(200),
    title character varying(1000),
    description character varying(2000),
    design character varying(2000),
    start_date timestamp without time zone,
    completion_date timestamp without time zone,
    primary_investigator character varying(400),
    contact_field character varying(400),
    etl_id character varying(100),
    status character varying(100),
    overall_design character varying(2000),
    accession character varying(100),
    entrydt timestamp without time zone,
    updated timestamp without time zone,
    institution character varying(100),
    country character varying(50),
    biomarker_type character varying(255),
    target character varying(255),
    access_type character varying(100)
);


ALTER TABLE biomart.bio_experiment OWNER TO biomart;

--
-- TOC entry 223 (class 1259 OID 24398)
-- Name: bio_lit_alt_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_lit_alt_data (
    bio_lit_alt_data_id bigint NOT NULL,
    bio_lit_ref_data_id bigint NOT NULL,
    in_vivo_model_id bigint,
    in_vitro_model_id bigint,
    etl_id character varying(50),
    alteration_type character varying(50),
    control character varying(1000),
    effect character varying(500),
    description character varying(1000),
    techniques character varying(1000),
    patients_percent character varying(500),
    patients_number character varying(500),
    pop_number character varying(250),
    pop_inclusion_criteria character varying(1000),
    pop_exclusion_criteria character varying(1000),
    pop_description character varying(1000),
    pop_type character varying(250),
    pop_value character varying(250),
    pop_phase character varying(250),
    pop_status character varying(250),
    pop_experimental_model character varying(250),
    pop_tissue character varying(250),
    pop_body_substance character varying(250),
    pop_localization character varying(1000),
    pop_cell_type character varying(250),
    clin_submucosa_marker_type character varying(250),
    clin_submucosa_unit character varying(250),
    clin_submucosa_value character varying(250),
    clin_asm_marker_type character varying(250),
    clin_asm_unit character varying(250),
    clin_asm_value character varying(250),
    clin_cellular_source character varying(250),
    clin_cellular_type character varying(250),
    clin_cellular_count character varying(250),
    clin_prior_med_percent character varying(250),
    clin_prior_med_dose character varying(250),
    clin_prior_med_name character varying(250),
    clin_baseline_variable character varying(250),
    clin_baseline_percent character varying(250),
    clin_baseline_value character varying(250),
    clin_smoker character varying(250),
    clin_atopy character varying(250),
    control_exp_percent character varying(50),
    control_exp_number character varying(50),
    control_exp_value character varying(50),
    control_exp_sd character varying(50),
    control_exp_unit character varying(100),
    over_exp_percent character varying(50),
    over_exp_number character varying(50),
    over_exp_value character varying(50),
    over_exp_sd character varying(50),
    over_exp_unit character varying(100),
    loss_exp_percent character varying(50),
    loss_exp_number character varying(50),
    loss_exp_value character varying(50),
    loss_exp_sd character varying(50),
    loss_exp_unit character varying(100),
    total_exp_percent character varying(50),
    total_exp_number character varying(50),
    total_exp_value character varying(50),
    total_exp_sd character varying(50),
    total_exp_unit character varying(100),
    glc_control_percent character varying(250),
    glc_molecular_change character varying(250),
    glc_type character varying(50),
    glc_percent character varying(100),
    glc_number character varying(100),
    ptm_region character varying(250),
    ptm_type character varying(250),
    ptm_change character varying(250),
    loh_loci character varying(250),
    mutation_type character varying(250),
    mutation_change character varying(250),
    mutation_sites character varying(250),
    epigenetic_region character varying(250),
    epigenetic_type character varying(250)
);


ALTER TABLE biomart.bio_lit_alt_data OWNER TO biomart;

--
-- TOC entry 224 (class 1259 OID 24404)
-- Name: bio_lit_amd_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_lit_amd_data (
    bio_lit_amd_data_id bigint NOT NULL,
    bio_lit_alt_data_id bigint NOT NULL,
    etl_id character varying(50),
    molecule character varying(50),
    molecule_type character varying(50),
    total_exp_percent character varying(50),
    total_exp_number character varying(100),
    total_exp_value character varying(100),
    total_exp_sd character varying(50),
    total_exp_unit character varying(50),
    over_exp_percent character varying(50),
    over_exp_number character varying(100),
    over_exp_value character varying(100),
    over_exp_sd character varying(50),
    over_exp_unit character varying(50),
    co_exp_percent character varying(50),
    co_exp_number character varying(100),
    co_exp_value character varying(100),
    co_exp_sd character varying(50),
    co_exp_unit character varying(50),
    mutation_type character varying(50),
    mutation_sites character varying(50),
    mutation_change character varying(50),
    mutation_percent character varying(50),
    mutation_number character varying(100),
    target_exp_percent character varying(50),
    target_exp_number character varying(100),
    target_exp_value character varying(100),
    target_exp_sd character varying(50),
    target_exp_unit character varying(50),
    target_over_exp_percent character varying(50),
    target_over_exp_number character varying(100),
    target_over_exp_value character varying(100),
    target_over_exp_sd character varying(50),
    target_over_exp_unit character varying(50),
    techniques character varying(250),
    description character varying(1000)
);


ALTER TABLE biomart.bio_lit_amd_data OWNER TO biomart;

--
-- TOC entry 225 (class 1259 OID 24410)
-- Name: bio_lit_inh_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_lit_inh_data (
    bio_lit_inh_data_id bigint NOT NULL,
    bio_lit_ref_data_id bigint,
    etl_id character varying(50),
    trial_type character varying(250),
    trial_phase character varying(250),
    trial_status character varying(250),
    trial_experimental_model character varying(250),
    trial_tissue character varying(250),
    trial_body_substance character varying(250),
    trial_description character varying(1000),
    trial_designs character varying(250),
    trial_cell_line character varying(250),
    trial_cell_type character varying(250),
    trial_patients_number character varying(100),
    trial_inclusion_criteria character varying(2000),
    inhibitor character varying(250),
    inhibitor_standard_name character varying(250),
    casid character varying(250),
    description character varying(1000),
    concentration character varying(250),
    time_exposure character varying(500),
    administration character varying(250),
    treatment character varying(2000),
    techniques character varying(1000),
    effect_molecular character varying(250),
    effect_percent character varying(250),
    effect_number character varying(50),
    effect_value character varying(250),
    effect_sd character varying(250),
    effect_unit character varying(250),
    effect_response_rate character varying(250),
    effect_downstream character varying(2000),
    effect_beneficial character varying(2000),
    effect_adverse character varying(2000),
    effect_description character varying(2000),
    effect_pharmacos character varying(2000),
    effect_potentials character varying(2000)
);


ALTER TABLE biomart.bio_lit_inh_data OWNER TO biomart;

--
-- TOC entry 226 (class 1259 OID 24416)
-- Name: bio_lit_int_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_lit_int_data (
    bio_lit_int_data_id bigint NOT NULL,
    bio_lit_ref_data_id bigint NOT NULL,
    in_vivo_model_id bigint,
    in_vitro_model_id bigint,
    etl_id character varying(50),
    source_component character varying(100),
    source_gene_id character varying(50),
    target_component character varying(100),
    target_gene_id character varying(50),
    interaction_mode character varying(250),
    regulation character varying(1000),
    mechanism character varying(250),
    effect character varying(500),
    localization character varying(500),
    region character varying(250),
    techniques character varying(1000)
);


ALTER TABLE biomart.bio_lit_int_data OWNER TO biomart;

--
-- TOC entry 227 (class 1259 OID 24422)
-- Name: bio_lit_int_model_mv; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_lit_int_model_mv (
    bio_lit_int_data_id bigint,
    experimental_model character varying(250)
);


ALTER TABLE biomart.bio_lit_int_model_mv OWNER TO biomart;

--
-- TOC entry 228 (class 1259 OID 24425)
-- Name: bio_lit_model_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_lit_model_data (
    bio_lit_model_data_id bigint NOT NULL,
    etl_id character varying(50),
    model_type character varying(50),
    description character varying(1000),
    stimulation character varying(1000),
    control_challenge character varying(500),
    challenge character varying(1000),
    sentization character varying(1000),
    zygosity character varying(250),
    experimental_model character varying(250),
    animal_wild_type character varying(250),
    tissue character varying(250),
    cell_type character varying(250),
    cell_line character varying(250),
    body_substance character varying(250),
    component character varying(250),
    gene_id character varying(250)
);


ALTER TABLE biomart.bio_lit_model_data OWNER TO biomart;

--
-- TOC entry 229 (class 1259 OID 24431)
-- Name: bio_lit_int_model_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW bio_lit_int_model_view AS
    SELECT DISTINCT s.bio_lit_int_data_id, s.experimental_model FROM (SELECT a.bio_lit_int_data_id, b.experimental_model FROM (bio_lit_int_data a JOIN bio_lit_model_data b ON ((a.in_vivo_model_id = b.bio_lit_model_data_id))) WHERE (b.experimental_model IS NOT NULL) UNION SELECT a.bio_lit_int_data_id, b.experimental_model FROM (bio_lit_int_data a JOIN bio_lit_model_data b ON ((a.in_vitro_model_id = b.bio_lit_model_data_id))) WHERE (b.experimental_model IS NOT NULL)) s;


ALTER TABLE biomart.bio_lit_int_model_view OWNER TO biomart;

--
-- TOC entry 230 (class 1259 OID 24436)
-- Name: bio_lit_pe_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_lit_pe_data (
    bio_lit_pe_data_id bigint NOT NULL,
    bio_lit_ref_data_id bigint NOT NULL,
    in_vivo_model_id bigint,
    in_vitro_model_id bigint,
    etl_id character varying(50),
    description character varying(2000)
);


ALTER TABLE biomart.bio_lit_pe_data OWNER TO biomart;

--
-- TOC entry 231 (class 1259 OID 24442)
-- Name: bio_lit_ref_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_lit_ref_data (
    bio_lit_ref_data_id bigint NOT NULL,
    etl_id character varying(50),
    component character varying(100),
    component_class character varying(250),
    gene_id character varying(50),
    molecule_type character varying(50),
    variant character varying(250),
    reference_type character varying(50),
    reference_id character varying(250),
    reference_title character varying(2000),
    back_references character varying(1000),
    study_type character varying(250),
    disease character varying(250),
    disease_icd10 character varying(250),
    disease_mesh character varying(250),
    disease_site character varying(250),
    disease_stage character varying(250),
    disease_grade character varying(250),
    disease_types character varying(250),
    disease_description character varying(1000),
    physiology character varying(250),
    stat_clinical character varying(500),
    stat_clinical_correlation character varying(250),
    stat_tests character varying(500),
    stat_coefficient character varying(500),
    stat_p_value character varying(100),
    stat_description character varying(1000)
);


ALTER TABLE biomart.bio_lit_ref_data OWNER TO biomart;

--
-- TOC entry 232 (class 1259 OID 24448)
-- Name: bio_lit_sum_data; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_lit_sum_data (
    bio_lit_sum_data_id bigint NOT NULL,
    etl_id character varying(50),
    disease_site character varying(250),
    target character varying(50),
    variant character varying(50),
    data_type character varying(50),
    alteration_type character varying(100),
    total_frequency character varying(50),
    total_affected_cases character varying(50),
    summary character varying(1000)
);


ALTER TABLE biomart.bio_lit_sum_data OWNER TO biomart;

--
-- TOC entry 233 (class 1259 OID 24454)
-- Name: bio_marker; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_marker (
    bio_marker_id bigint NOT NULL,
    bio_marker_name character varying(200),
    bio_marker_description character varying(1000),
    organism character varying(200),
    primary_source_code character varying(200),
    primary_external_id character varying(200),
    bio_marker_type character varying(200) NOT NULL
);


ALTER TABLE biomart.bio_marker OWNER TO biomart;

--
-- TOC entry 234 (class 1259 OID 24460)
-- Name: bio_marker_correl_mv; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_marker_correl_mv (
    bio_marker_id bigint,
    asso_bio_marker_id bigint,
    correl_type character varying(15),
    mv_id bigint
);


ALTER TABLE biomart.bio_marker_correl_mv OWNER TO biomart;

--
-- TOC entry 235 (class 1259 OID 24463)
-- Name: bio_marker_correl_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW bio_marker_correl_view AS
    (SELECT DISTINCT b.bio_marker_id, b.bio_marker_id AS asso_bio_marker_id, 'GENE'::text AS correl_type, 1 AS mv_id FROM bio_marker b WHERE ((b.bio_marker_type)::text = 'GENE'::text) UNION SELECT DISTINCT c.bio_data_id AS bio_marker_id, c.asso_bio_data_id AS asso_bio_marker_id, 'PATHWAY_GENE'::text AS correl_type, 2 AS mv_id FROM bio_marker b, bio_data_correlation c, bio_data_correl_descr d WHERE ((((b.bio_marker_id = c.bio_data_id) AND (c.bio_data_correl_descr_id = d.bio_data_correl_descr_id)) AND ((b.primary_source_code)::text <> 'ARIADNE'::text)) AND ((d.correlation)::text = 'PATHWAY GENE'::text))) UNION SELECT DISTINCT c.bio_data_id AS bio_marker_id, c.asso_bio_data_id AS asso_bio_marker_id, 'HOMOLOGENE_GENE'::text AS correl_type, 3 AS mv_id FROM bio_marker b, bio_data_correlation c, bio_data_correl_descr d WHERE (((b.bio_marker_id = c.bio_data_id) AND (c.bio_data_correl_descr_id = d.bio_data_correl_descr_id)) AND ((d.correlation)::text = 'HOMOLOGENE GENE'::text));


ALTER TABLE biomart.bio_marker_correl_view OWNER TO biomart;

--
-- TOC entry 236 (class 1259 OID 24468)
-- Name: bio_marker_exp_analysis_mv; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW bio_marker_exp_analysis_mv AS
    SELECT DISTINCT t3.bio_marker_id, t1.bio_experiment_id, t1.bio_assay_analysis_id, ((t1.bio_assay_analysis_id * 100) + t3.bio_marker_id) AS mv_id FROM bio_assay_analysis_data t1, bio_experiment t2, bio_marker t3, bio_assay_data_annotation t4 WHERE ((((t1.bio_experiment_id = t2.bio_experiment_id) AND ((t2.bio_experiment_type)::text = 'Experiment'::text)) AND (t3.bio_marker_id = t4.bio_marker_id)) AND (t1.bio_assay_feature_group_id = t4.bio_assay_feature_group_id));


ALTER TABLE biomart.bio_marker_exp_analysis_mv OWNER TO biomart;

--
-- TOC entry 237 (class 1259 OID 24473)
-- Name: bio_patient; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_patient (
    bio_patient_id bigint NOT NULL,
    first_name character varying(200),
    last_name character varying(200),
    middle_name character varying(200),
    birth_date timestamp without time zone,
    birth_date_orig character varying(200),
    gender_code character varying(200),
    race_code character varying(200),
    ethnic_group_code character varying(200),
    address_zip_code character varying(200),
    country_code character varying(200),
    informed_consent_code character varying(200),
    bio_experiment_id bigint,
    bio_clinical_trial_p_group_id bigint
);


ALTER TABLE biomart.bio_patient OWNER TO biomart;

--
-- TOC entry 238 (class 1259 OID 24479)
-- Name: bio_patient_event; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_patient_event (
    bio_patient_event_id bigint NOT NULL,
    bio_patient_id bigint NOT NULL,
    event_code character varying(200),
    event_type_code character varying(200),
    event_date timestamp without time zone,
    site character varying(400),
    bio_clinic_trial_timepoint_id bigint NOT NULL
);


ALTER TABLE biomart.bio_patient_event OWNER TO biomart;

--
-- TOC entry 239 (class 1259 OID 24485)
-- Name: bio_patient_event_attr; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_patient_event_attr (
    bio_patient_attr_code character varying(200) NOT NULL,
    attribute_text_value character varying(200),
    attribute_numeric_value character varying(200),
    bio_clinic_trial_attr_id bigint NOT NULL,
    bio_patient_attribute_id bigint NOT NULL,
    bio_patient_event_id bigint NOT NULL
);


ALTER TABLE biomart.bio_patient_event_attr OWNER TO biomart;

--
-- TOC entry 240 (class 1259 OID 24491)
-- Name: bio_sample; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_sample (
    bio_sample_id bigint NOT NULL,
    bio_sample_type character varying(200) NOT NULL,
    characteristics character varying(1000),
    source_code character varying(200),
    experiment_id bigint,
    bio_subject_id bigint,
    source character varying(200),
    bio_bank_id bigint,
    bio_patient_event_id bigint,
    bio_cell_line_id bigint,
    bio_sample_name character varying(100)
);


ALTER TABLE biomart.bio_sample OWNER TO biomart;

--
-- TOC entry 241 (class 1259 OID 24497)
-- Name: bio_stats_exp_marker; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_stats_exp_marker (
    bio_marker_id bigint NOT NULL,
    bio_experiment_id bigint NOT NULL,
    bio_stats_exp_marker_id bigint
);


ALTER TABLE biomart.bio_stats_exp_marker OWNER TO biomart;

--
-- TOC entry 242 (class 1259 OID 24500)
-- Name: bio_subject; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_subject (
    bio_subject_id bigint NOT NULL,
    site_subject_id bigint,
    source character varying(200),
    source_code character varying(200),
    status character varying(200),
    organism character varying(200),
    bio_subject_type character varying(200) NOT NULL
);


ALTER TABLE biomart.bio_subject OWNER TO biomart;

--
-- TOC entry 243 (class 1259 OID 24506)
-- Name: bio_taxonomy; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE bio_taxonomy (
    bio_taxonomy_id bigint NOT NULL,
    taxon_name character varying(200) NOT NULL,
    taxon_label character varying(200) NOT NULL,
    ncbi_tax_id character varying(200)
);


ALTER TABLE biomart.bio_taxonomy OWNER TO biomart;

SET default_tablespace = '';

--
-- TOC entry 244 (class 1259 OID 24512)
-- Name: biobank_sample; Type: TABLE; Schema: biomart; Owner: biomart_user; Tablespace: 
--

CREATE TABLE biobank_sample (
    sample_tube_id character varying(255) NOT NULL,
    accession_number character varying(255) NOT NULL,
    client_sample_tube_id character varying(255) NOT NULL,
    container_id character varying(255) NOT NULL,
    import_date timestamp without time zone NOT NULL,
    source_type character varying(255) NOT NULL
);


ALTER TABLE biomart.biobank_sample OWNER TO biomart_user;

SET default_tablespace = biomart;

--
-- TOC entry 245 (class 1259 OID 24518)
-- Name: ctd2_clin_inhib_effect; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd2_clin_inhib_effect (
    ctd_cie_seq bigint,
    ctd_study_id bigint,
    event_description_name character varying(4000),
    event_definition_name character varying(4000),
    adverse_effect_name character varying(4000),
    signal_effect_name character varying(4000),
    pharmaco_parameter_name character varying(500),
    discontinuation_rate_value character varying(250),
    beneficial_effect_name character varying(4000),
    drug_effect character varying(4000),
    clinical_variable_name character varying(250),
    qp_sm_percentage_change character varying(250),
    qp_sm_absolute_change character varying(250),
    qp_sm_rate_of_change character varying(250),
    qp_sm_treatment_period character varying(250),
    qp_sm_group_change character varying(250),
    qp_sm_p_value character varying(250),
    ce_sm_no character varying(250),
    ce_sm_event_rate character varying(250),
    ce_time_to_event character varying(250),
    ce_reduction character varying(250),
    ce_p_value character varying(250),
    clinical_correlation character varying(2000),
    coefficient_value character varying(250),
    statistics_p_value character varying(250),
    statistics_description character varying(4000),
    primary_endpoint_type character varying(250),
    primary_endpoint_definition character varying(4000),
    primary_endpoint_test_name character varying(2000),
    primary_endpoint_time_period character varying(2000),
    primary_endpoint_change character varying(2000),
    primary_endpoint_p_value character varying(2000),
    secondary_endpoint_type character varying(2000),
    secondary_endpoint_definition character varying(4000),
    secondary_endpoint_test_name character varying(2000),
    secondary_endpoint_time_period character varying(4000),
    secondary_endpoint_change character varying(4000),
    secondary_endpoint_p_value character varying(4000)
);


ALTER TABLE biomart.ctd2_clin_inhib_effect OWNER TO biomart;

--
-- TOC entry 246 (class 1259 OID 24524)
-- Name: ctd2_disease; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd2_disease (
    ctd_disease_seq bigint,
    ctd_study_id bigint,
    disease_type_name character varying(500),
    disease_common_name character varying(500),
    icd10_name character varying(250),
    mesh_name character varying(250),
    study_type_name character varying(2000),
    physiology_name character varying(500)
);


ALTER TABLE biomart.ctd2_disease OWNER TO biomart;

--
-- TOC entry 247 (class 1259 OID 24530)
-- Name: ctd2_inhib_details; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd2_inhib_details (
    ctd_inhib_seq bigint,
    ctd_study_id bigint,
    common_name_name character varying(500),
    standard_name_name character varying(500),
    experimental_detail_dose character varying(4000),
    exp_detail_exposure_period character varying(4000),
    exp_detail_treatment_name character varying(4000),
    exp_detail_admin_route character varying(4000),
    exp_detail_description character varying(4000),
    exp_detail_placebo character varying(250),
    comparator_name_name character varying(250),
    comp_treatment_name character varying(4000),
    comp_admin_route character varying(4000),
    comp_dose character varying(2000),
    comp_exposure_period character varying(2000)
);


ALTER TABLE biomart.ctd2_inhib_details OWNER TO biomart;

--
-- TOC entry 248 (class 1259 OID 24536)
-- Name: ctd2_study; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd2_study (
    ctd_study_id bigint,
    ref_article_protocol_id character varying(1000),
    reference_id integer NOT NULL,
    pubmed_id character varying(250),
    pubmed_title character varying(2000),
    protocol_id character varying(1000),
    protocol_title character varying(2000)
);


ALTER TABLE biomart.ctd2_study OWNER TO biomart;

--
-- TOC entry 249 (class 1259 OID 24542)
-- Name: ctd2_trial_details; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd2_trial_details (
    ctd_td_seq bigint,
    ctd_study_id bigint,
    control character varying(2000),
    blinding_procedure character varying(2000),
    no_of_arms character varying(2000),
    sponsor character varying(2000),
    patient_studied character varying(2000),
    source_type character varying(2000),
    trial_description character varying(4000),
    arm_name character varying(250),
    patient_study character varying(250),
    class_type character varying(250),
    class_value character varying(250),
    asthma_duration character varying(250),
    region character varying(250),
    age character varying(100),
    gender character varying(100),
    minor_participation character varying(100),
    symptom_score character varying(100),
    rescue_medication character varying(2000),
    therapeutic_intervention character varying(255),
    smokers character varying(255),
    former_smokers character varying(255),
    never_smokers character varying(255),
    smoking_pack_years character varying(255),
    pulm_path_name character varying(255),
    pulm_path_pct character varying(50),
    pulm_path_value character varying(50),
    pulm_path_method character varying(255),
    allow_med_therapy_ocs character varying(1000),
    allow_med_therapy_ics character varying(1000),
    allow_med_therapy_laba character varying(1000),
    allow_med_therapy_ltra character varying(1000),
    allow_med_therapy_desc character varying(4000),
    allow_med_therapy_cortster character varying(1000),
    allow_med_therapy_immuno character varying(1000),
    allow_med_therapy_cyto character varying(1000),
    allow_med_treat_ocs character varying(1000),
    allow_med_treat_ics character varying(1000),
    allow_med_treat_laba character varying(1000),
    allow_med_treat_ltra character varying(1000),
    allow_med_treat_desc character varying(4000),
    allow_med_treat_cortster character varying(1000),
    allow_med_treat_immuno character varying(1000),
    allow_med_treat_cyto character varying(1000),
    pat_char_base_clin_var character varying(500),
    pat_char_base_clin_var_pct character varying(250),
    pat_char_base_clin_var_value character varying(250),
    biomarker_name_name character varying(250),
    pat_char_biomarker_pct character varying(250),
    pat_char_biomarker_value character varying(250),
    pat_char_cellinfo_name character varying(250),
    pat_char_cellinfo_type character varying(250),
    pat_char_cellinfo_count character varying(250),
    pat_char_priormed_name character varying(250),
    pat_char_priormed_pct character varying(500),
    pat_char_priormed_dose character varying(250),
    disease_phenotype_name character varying(1000),
    disease_severity_name character varying(500),
    incl_age character varying(2000),
    incl_difficult_to_treat character varying(2000),
    incl_disease_diagnosis character varying(2000),
    incl_steroid_dose character varying(2000),
    incl_laba character varying(2000),
    incl_ocs character varying(2000),
    incl_xolair character varying(2000),
    incl_ltra_inhibitor character varying(2000),
    incl_fev1 character varying(2000),
    incl_fev1_reversibility character varying(2000),
    incl_smoking character varying(2000),
    incl_tlc character varying(2000),
    incl_fvc character varying(2000),
    incl_dlco character varying(2000),
    incl_sgrq character varying(2000),
    incl_hrct character varying(2000),
    incl_biopsy character varying(2000),
    incl_dypsnea_on_exertion character varying(2000),
    incl_concomitant_med character varying(2000),
    incl_former_smokers character varying(2000),
    incl_never_smokers character varying(2000),
    incl_smoking_pack_years character varying(2000),
    incl_fev_fvc character varying(2000),
    trial_des_minimal_symptom character varying(2000),
    trial_des_rescue_med character varying(4000),
    trial_des_exclusion_criteria character varying(4000),
    trial_des_open_label_status character varying(250),
    trial_des_random_status character varying(250),
    trial_des_nature_of_trial character varying(250),
    trial_des_blinded_status character varying(250),
    trial_des_run_in_period character varying(2000),
    trial_des_treatment character varying(2000),
    trial_des_washout_period character varying(2000),
    trial_status_name character varying(2000),
    trial_phase_name character varying(2000)
);


ALTER TABLE biomart.ctd2_trial_details OWNER TO biomart;

--
-- TOC entry 250 (class 1259 OID 24548)
-- Name: ctd_allowed_meds_treatment; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd_allowed_meds_treatment (
    ctd_study_id bigint,
    trtmt_ocs character varying(4000),
    trtmt_ics character varying(4000),
    trtmt_laba character varying(4000),
    trtmt_ltra character varying(4000),
    trtmt_corticosteroids character varying(4000),
    trtmt_anti_fibrotics character varying(4000),
    trtmt_immunosuppressive character varying(4000),
    trtmt_cytotoxic character varying(4000)
);


ALTER TABLE biomart.ctd_allowed_meds_treatment OWNER TO biomart;

--
-- TOC entry 251 (class 1259 OID 24554)
-- Name: ctd_full; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd_full (
    clinical_trial_design_id bigint,
    ref_article_protocol_id character varying(4000),
    ref_record_id character varying(4000),
    ref_back_reference character varying(4000),
    ref_article_pmid character varying(4000),
    ref_protocol_id character varying(4000),
    ref_title character varying(4000),
    study_type character varying(4000),
    common_name character varying(4000),
    icd10 character varying(4000),
    mesh character varying(4000),
    disease_type character varying(4000),
    physiology_name character varying(4000),
    trial_status character varying(4000),
    trial_phase character varying(4000),
    nature_of_trial character varying(4000),
    randomization character varying(4000),
    blinded_trial character varying(4000),
    trial_type character varying(4000),
    run_in_period character varying(4000),
    treatment_period character varying(4000),
    washout_period character varying(4000),
    open_label_extension character varying(4000),
    sponsor character varying(4000),
    trial_nbr_of_patients_studied character varying(4000),
    source_type character varying(4000),
    trial_age character varying(4000),
    disease_severity character varying(4000),
    difficult_to_treat character varying(4000),
    asthma_diagnosis character varying(4000),
    inhaled_steroid_dose character varying(4000),
    laba character varying(4000),
    ocs character varying(4000),
    xolair character varying(4000),
    ltra_inhibitors character varying(4000),
    asthma_phenotype character varying(4000),
    fev1 character varying(4000),
    fev1_reversibility character varying(4000),
    tlc character varying(4000),
    fev1_fvc character varying(4000),
    fvc character varying(4000),
    dlco character varying(4000),
    sgrq character varying(4000),
    hrct character varying(4000),
    biopsy character varying(4000),
    dyspnea_on_exertion character varying(4000),
    concomitant_med character varying(4000),
    trial_smokers_pct character varying(4000),
    trial_former_smokers_pct character varying(4000),
    trial_never_smokers_pct character varying(4000),
    trial_pack_years character varying(4000),
    exclusion_criteria text,
    minimal_symptoms character varying(4000),
    rescue_medication_use character varying(4000),
    control_details character varying(4000),
    blinding_procedure character varying(4000),
    number_of_arms character varying(4000),
    description text,
    arm character varying(4000),
    arm_nbr_of_patients_studied character varying(4000),
    arm_classification_type character varying(4000),
    arm_classification_value character varying(4000),
    arm_asthma_duration character varying(4000),
    arm_geographic_region character varying(4000),
    arm_age character varying(4000),
    arm_gender character varying(4000),
    arm_smokers_pct character varying(4000),
    arm_former_smokers_pct character varying(4000),
    arm_never_smokers_pct character varying(4000),
    arm_pack_years character varying(4000),
    minority_participation character varying(4000),
    baseline_symptom_score character varying(4000),
    baseline_rescue_medication_use character varying(4000),
    clinical_variable character varying(4000),
    clinical_variable_pct character varying(4000),
    clinical_variable_value character varying(4000),
    prior_med_drug_name character varying(4000),
    prior_med_pct character varying(4000),
    prior_med_value character varying(4000),
    biomarker_name character varying(4000),
    biomarker_pct character varying(4000),
    biomarker_value character varying(4000),
    cellinfo_type character varying(4000),
    cellinfo_count character varying(4000),
    cellinfo_source character varying(4000),
    pulmonary_pathology_name character varying(4000),
    pulmpath_patient_pct character varying(4000),
    pulmpath_value_unit character varying(4000),
    pulmpath_method character varying(4000),
    runin_ocs character varying(4000),
    runin_ics character varying(4000),
    runin_laba character varying(4000),
    runin_ltra character varying(4000),
    runin_corticosteroids character varying(4000),
    runin_anti_fibrotics character varying(4000),
    runin_immunosuppressive character varying(4000),
    runin_cytotoxic character varying(4000),
    runin_description character varying(4000),
    trtmt_ocs character varying(4000),
    trtmt_ics character varying(4000),
    trtmt_laba character varying(4000),
    trtmt_ltra character varying(4000),
    trtmt_corticosteroids character varying(4000),
    trtmt_anti_fibrotics character varying(4000),
    trtmt_immunosuppressive character varying(4000),
    trtmt_cytotoxic character varying(4000),
    trtmt_description character varying(4000),
    drug_inhibitor_common_name character varying(4000),
    drug_inhibitor_standard_name character varying(4000),
    drug_inhibitor_cas_id character varying(4000),
    drug_inhibitor_dose character varying(4000),
    drug_inhibitor_route_of_admin character varying(4000),
    drug_inhibitor_trtmt_regime character varying(4000),
    comparator_name character varying(4000),
    comparator_dose character varying(4000),
    comparator_time_period character varying(4000),
    comparator_route_of_admin character varying(4000),
    treatment_regime character varying(4000),
    placebo character varying(4000),
    experiment_description character varying(4000),
    primary_endpoint_type character varying(4000),
    primary_endpoint_definition character varying(4000),
    primary_endpoint_change character varying(4000),
    primary_endpoint_time_period character varying(4000),
    primary_endpoint_stat_test character varying(4000),
    primary_endpoint_p_value character varying(4000),
    secondary_type character varying(4000),
    secondary_type_definition character varying(4000),
    secondary_type_change character varying(4000),
    secondary_type_time_period character varying(4000),
    secondary_type_p_value character varying(4000),
    secondary_type_stat_test character varying(4000),
    clinical_variable_name character varying(4000),
    pct_change_from_baseline character varying(4000),
    abs_change_from_baseline character varying(4000),
    rate_of_change_from_baseline character varying(4000),
    average_over_treatment_period character varying(4000),
    within_group_changes character varying(4000),
    stat_measure_p_value character varying(4000),
    definition_of_the_event character varying(4000),
    number_of_events character varying(4000),
    event_rate character varying(4000),
    time_to_event character varying(4000),
    event_pct_reduction character varying(4000),
    event_p_value character varying(4000),
    event_description character varying(4000),
    discontinuation_rate character varying(4000),
    response_rate character varying(4000),
    downstream_signaling_effects character varying(4000),
    beneficial_effects character varying(4000),
    adverse_effects character varying(4000),
    pk_pd_parameter character varying(4000),
    pk_pd_value character varying(4000),
    effect_description character varying(4000),
    biomolecule_name character varying(4000),
    biomolecule_id character varying(4000),
    biomolecule_type character varying(4000),
    biomarker character varying(4000),
    biomarker_type character varying(4000),
    baseline_expr_pct character varying(4000),
    baseline_expr_number character varying(4000),
    baseline_expr_value_fold_mean character varying(4000),
    baseline_expr_sd character varying(4000),
    baseline_expr_sem character varying(4000),
    baseline_expr_unit character varying(4000),
    expr_after_trtmt_pct character varying(4000),
    expr_after_trtmt_number character varying(4000),
    expr_aftertrtmt_valuefold_mean character varying(4000),
    expr_after_trtmt_sd character varying(4000),
    expr_after_trtmt_sem character varying(4000),
    expr_after_trtmt_unit character varying(4000),
    expr_chg_source_type character varying(4000),
    expr_chg_technique character varying(4000),
    expr_chg_description character varying(4000),
    clinical_correlation character varying(4000),
    statistical_test character varying(4000),
    statistical_coefficient_value character varying(4000),
    statistical_test_p_value character varying(4000),
    statistical_test_description character varying(4000),
    drug_inhibitor_time_period character varying(4000)
);


ALTER TABLE biomart.ctd_full OWNER TO biomart;

--
-- TOC entry 252 (class 1259 OID 24560)
-- Name: ctd_arm_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_arm_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.arm, v.arm_nbr_of_patients_studied) AS id, v.ref_article_protocol_id, v.arm, v.arm_nbr_of_patients_studied, v.arm_classification_type, v.arm_classification_value, v.arm_asthma_duration, v.arm_geographic_region, v.arm_age, v.arm_gender, v.arm_smokers_pct, v.arm_former_smokers_pct, v.arm_never_smokers_pct, v.arm_pack_years, v.minority_participation, v.baseline_symptom_score, v.baseline_rescue_medication_use FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.arm, to_number((ctd_full.arm_nbr_of_patients_studied)::text, '999999999999999'::text) AS arm_nbr_of_patients_studied, ctd_full.arm_classification_type, ctd_full.arm_classification_value, ctd_full.arm_asthma_duration, ctd_full.arm_geographic_region, ctd_full.arm_age, ctd_full.arm_gender, ctd_full.arm_smokers_pct, ctd_full.arm_former_smokers_pct, ctd_full.arm_never_smokers_pct, ctd_full.arm_pack_years, ctd_full.minority_participation, ctd_full.baseline_symptom_score, ctd_full.baseline_rescue_medication_use FROM ctd_full WHERE ((ctd_full.arm IS NOT NULL) AND ((ctd_full.arm)::text <> ''::text)) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.arm, to_number((ctd_full.arm_nbr_of_patients_studied)::text, '999999999999999'::text)) v;


ALTER TABLE biomart.ctd_arm_view OWNER TO biomart;

--
-- TOC entry 253 (class 1259 OID 24565)
-- Name: ctd_biomarker; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd_biomarker (
    ctd_study_id bigint,
    biomarker_name character varying(4000),
    biomarker_pct character varying(4000),
    biomarker_value character varying(4000)
);


ALTER TABLE biomart.ctd_biomarker OWNER TO biomart;

--
-- TOC entry 254 (class 1259 OID 24571)
-- Name: ctd_biomarker_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_biomarker_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.biomarker_name) AS id, v.ref_article_protocol_id, v.biomarker_name, v.biomarker_pct, v.biomarker_value FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.biomarker_name, ctd_full.biomarker_pct, ctd_full.biomarker_value FROM ctd_full WHERE ((ctd_full.biomarker_name IS NOT NULL) AND ((ctd_full.biomarker_name)::text <> ''::text)) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.biomarker_name) v;


ALTER TABLE biomart.ctd_biomarker_view OWNER TO biomart;

--
-- TOC entry 255 (class 1259 OID 24576)
-- Name: ctd_cell_info_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_cell_info_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.cellinfo_type) AS id, v.ref_article_protocol_id, v.cellinfo_type, v.cellinfo_count, v.cellinfo_source FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.cellinfo_type, ctd_full.cellinfo_count, ctd_full.cellinfo_source FROM ctd_full WHERE ((ctd_full.cellinfo_type IS NOT NULL) AND ((ctd_full.cellinfo_type)::text <> ''::text)) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.cellinfo_type) v;


ALTER TABLE biomart.ctd_cell_info_view OWNER TO biomart;

--
-- TOC entry 256 (class 1259 OID 24581)
-- Name: ctd_clinical_chars_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_clinical_chars_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.clinical_variable) AS id, v.ref_article_protocol_id, v.clinical_variable, v.clinical_variable_pct, v.clinical_variable_value FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.clinical_variable, ctd_full.clinical_variable_pct, ctd_full.clinical_variable_value FROM ctd_full WHERE ((ctd_full.clinical_variable IS NOT NULL) AND ((ctd_full.clinical_variable)::text <> ''::text)) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.clinical_variable) v;


ALTER TABLE biomart.ctd_clinical_chars_view OWNER TO biomart;

--
-- TOC entry 257 (class 1259 OID 24586)
-- Name: ctd_disease; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd_disease (
    ctd_study_id bigint,
    common_name character varying(4000),
    icd10 character varying(4000),
    mesh character varying(4000),
    disease_severity character varying(4000)
);


ALTER TABLE biomart.ctd_disease OWNER TO biomart;

--
-- TOC entry 258 (class 1259 OID 24592)
-- Name: ctd_drug_effects_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_drug_effects_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.beneficial_effects, v.adverse_effects) AS id, v.ref_article_protocol_id, v.discontinuation_rate, v.response_rate, v.downstream_signaling_effects, v.beneficial_effects, v.adverse_effects, v.pk_pd_parameter, v.pk_pd_value, v.effect_description FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.discontinuation_rate, ctd_full.response_rate, ctd_full.downstream_signaling_effects, ctd_full.beneficial_effects, ctd_full.adverse_effects, ctd_full.pk_pd_parameter, ctd_full.pk_pd_value, ctd_full.effect_description FROM ctd_full ORDER BY ctd_full.ref_article_protocol_id, ctd_full.beneficial_effects, ctd_full.adverse_effects) v;


ALTER TABLE biomart.ctd_drug_effects_view OWNER TO biomart;

--
-- TOC entry 259 (class 1259 OID 24597)
-- Name: ctd_drug_inhib; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd_drug_inhib (
    ctd_study_id bigint,
    drug_inhibitor_common_name character varying(4000),
    drug_inhibitor_standard_name character varying(4000),
    drug_inhibitor_cas_id character varying(4000)
);


ALTER TABLE biomart.ctd_drug_inhib OWNER TO biomart;

--
-- TOC entry 260 (class 1259 OID 24603)
-- Name: ctd_drug_inhibitor_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_drug_inhibitor_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.drug_inhibitor_common_name) AS id, v.ref_article_protocol_id, v.drug_inhibitor_common_name, v.drug_inhibitor_standard_name, v.drug_inhibitor_cas_id FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.drug_inhibitor_common_name, ctd_full.drug_inhibitor_standard_name, ctd_full.drug_inhibitor_cas_id FROM ctd_full ORDER BY ctd_full.ref_article_protocol_id, ctd_full.drug_inhibitor_common_name) v;


ALTER TABLE biomart.ctd_drug_inhibitor_view OWNER TO biomart;

--
-- TOC entry 261 (class 1259 OID 24608)
-- Name: ctd_events_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_events_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.definition_of_the_event) AS id, v.ref_article_protocol_id, v.definition_of_the_event, v.number_of_events, v.event_rate, v.time_to_event, v.event_pct_reduction, v.event_p_value, v.event_description FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.definition_of_the_event, ctd_full.number_of_events, ctd_full.event_rate, ctd_full.time_to_event, ctd_full.event_pct_reduction, ctd_full.event_p_value, ctd_full.event_description FROM ctd_full WHERE (((ctd_full.definition_of_the_event IS NOT NULL) AND ((ctd_full.definition_of_the_event)::text <> ''::text)) OR ((ctd_full.event_description IS NOT NULL) AND ((ctd_full.event_description)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.definition_of_the_event) v;


ALTER TABLE biomart.ctd_events_view OWNER TO biomart;

--
-- TOC entry 262 (class 1259 OID 24613)
-- Name: ctd_experiments_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_experiments_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.drug_inhibitor_common_name, v.drug_inhibitor_trtmt_regime) AS id, v.ref_article_protocol_id, v.drug_inhibitor_common_name, v.drug_inhibitor_dose, v.drug_inhibitor_time_period, v.drug_inhibitor_route_of_admin, v.drug_inhibitor_trtmt_regime, v.comparator_name, v.comparator_dose, v.comparator_time_period, v.comparator_route_of_admin, v.treatment_regime, v.placebo, v.experiment_description FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.drug_inhibitor_common_name, ctd_full.drug_inhibitor_time_period, ctd_full.drug_inhibitor_dose, ctd_full.drug_inhibitor_route_of_admin, ctd_full.drug_inhibitor_trtmt_regime, ctd_full.comparator_name, ctd_full.comparator_dose, ctd_full.comparator_time_period, ctd_full.comparator_route_of_admin, ctd_full.treatment_regime, ctd_full.placebo, ctd_full.experiment_description FROM ctd_full ORDER BY ctd_full.ref_article_protocol_id, ctd_full.drug_inhibitor_common_name, ctd_full.drug_inhibitor_trtmt_regime) v;


ALTER TABLE biomart.ctd_experiments_view OWNER TO biomart;

--
-- TOC entry 263 (class 1259 OID 24618)
-- Name: ctd_expr_after_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_expr_after_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.biomolecule_name) AS id, v.ref_article_protocol_id, v.biomolecule_name, v.expr_after_trtmt_pct, v.expr_after_trtmt_number, v.expr_aftertrtmt_valuefold_mean, v.expr_after_trtmt_sd, v.expr_after_trtmt_sem, v.expr_after_trtmt_unit FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.biomolecule_name, ctd_full.expr_after_trtmt_pct, ctd_full.expr_after_trtmt_number, ctd_full.expr_aftertrtmt_valuefold_mean, ctd_full.expr_after_trtmt_sd, ctd_full.expr_after_trtmt_sem, ctd_full.expr_after_trtmt_unit FROM ctd_full WHERE (((ctd_full.biomolecule_name IS NOT NULL) AND ((ctd_full.biomolecule_name)::text <> ''::text)) OR ((ctd_full.expr_aftertrtmt_valuefold_mean IS NOT NULL) AND ((ctd_full.expr_aftertrtmt_valuefold_mean)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.biomolecule_name) v;


ALTER TABLE biomart.ctd_expr_after_view OWNER TO biomart;

--
-- TOC entry 264 (class 1259 OID 24623)
-- Name: ctd_expr_baseline_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_expr_baseline_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.biomolecule_name) AS id, v.ref_article_protocol_id, v.biomolecule_name, v.baseline_expr_pct, v.baseline_expr_number, v.baseline_expr_value_fold_mean, v.baseline_expr_sd, v.baseline_expr_sem, v.baseline_expr_unit FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.biomolecule_name, ctd_full.baseline_expr_pct, ctd_full.baseline_expr_number, ctd_full.baseline_expr_value_fold_mean, ctd_full.baseline_expr_sd, ctd_full.baseline_expr_sem, ctd_full.baseline_expr_unit FROM ctd_full WHERE (((ctd_full.biomolecule_name IS NOT NULL) AND ((ctd_full.biomolecule_name)::text <> ''::text)) OR ((ctd_full.baseline_expr_value_fold_mean IS NOT NULL) AND ((ctd_full.baseline_expr_value_fold_mean)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.biomolecule_name) v;


ALTER TABLE biomart.ctd_expr_baseline_view OWNER TO biomart;

--
-- TOC entry 265 (class 1259 OID 24628)
-- Name: ctd_expr_bio_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_expr_bio_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.biomolecule_name) AS id, v.ref_article_protocol_id, v.biomolecule_name, v.biomolecule_id, v.biomolecule_type, v.biomarker, v.biomarker_type FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.biomolecule_name, ctd_full.biomolecule_id, ctd_full.biomolecule_type, ctd_full.biomarker, ctd_full.biomarker_type FROM ctd_full WHERE (((ctd_full.biomolecule_name IS NOT NULL) AND ((ctd_full.biomolecule_name)::text <> ''::text)) OR ((ctd_full.biomolecule_id IS NOT NULL) AND ((ctd_full.biomolecule_id)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.biomolecule_name) v;


ALTER TABLE biomart.ctd_expr_bio_view OWNER TO biomart;

--
-- TOC entry 266 (class 1259 OID 24633)
-- Name: ctd_expr_source_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_expr_source_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.expr_chg_source_type) AS id, v.ref_article_protocol_id, v.expr_chg_source_type, v.expr_chg_technique, v.expr_chg_description FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.expr_chg_source_type, ctd_full.expr_chg_technique, ctd_full.expr_chg_description FROM ctd_full WHERE (((ctd_full.expr_chg_source_type IS NOT NULL) AND ((ctd_full.expr_chg_source_type)::text <> ''::text)) OR ((ctd_full.expr_chg_description IS NOT NULL) AND ((ctd_full.expr_chg_description)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.expr_chg_source_type) v;


ALTER TABLE biomart.ctd_expr_source_view OWNER TO biomart;

--
-- TOC entry 267 (class 1259 OID 24638)
-- Name: ctd_full_clinical_endpts_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_full_clinical_endpts_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id) AS id, v.ref_article_protocol_id, v.primary_endpoint_type, v.primary_endpoint_definition, v.primary_endpoint_change, v.primary_endpoint_time_period, v.primary_endpoint_p_value, v.primary_endpoint_stat_test, v.secondary_type, v.secondary_type_definition, v.secondary_type_change, v.secondary_type_time_period, v.secondary_type_p_value, v.secondary_type_stat_test FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.primary_endpoint_type, ctd_full.primary_endpoint_definition, ctd_full.primary_endpoint_change, ctd_full.primary_endpoint_time_period, ctd_full.primary_endpoint_p_value, ctd_full.primary_endpoint_stat_test, ctd_full.secondary_type, ctd_full.secondary_type_definition, ctd_full.secondary_type_change, ctd_full.secondary_type_time_period, ctd_full.secondary_type_p_value, ctd_full.secondary_type_stat_test FROM ctd_full ORDER BY ctd_full.ref_article_protocol_id) v;


ALTER TABLE biomart.ctd_full_clinical_endpts_view OWNER TO biomart;

--
-- TOC entry 268 (class 1259 OID 24643)
-- Name: ctd_full_search_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_full_search_view AS
    SELECT row_number() OVER (ORDER BY t.ref_article_protocol_id) AS fact_id, t.ref_article_protocol_id, t.mesh, t.common_name, t.drug_inhibitor_standard_name, t.primary_endpoint_type, t.secondary_type, t.biomarker_name, t.disease_severity, t.inhaled_steroid_dose, t.fev1, t.primary_endpoint_time_period, t.primary_endpoint_change, t.primary_endpoint_p_value FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.mesh, ctd_full.common_name, ctd_full.drug_inhibitor_standard_name, ctd_full.primary_endpoint_type, ctd_full.secondary_type, ctd_full.biomarker_name, ctd_full.disease_severity, ctd_full.inhaled_steroid_dose, ctd_full.fev1, ctd_full.primary_endpoint_time_period, ctd_full.primary_endpoint_change, ctd_full.primary_endpoint_p_value FROM ctd_full) t;


ALTER TABLE biomart.ctd_full_search_view OWNER TO biomart;

--
-- TOC entry 269 (class 1259 OID 24648)
-- Name: ctd_inclusion_criteria; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd_inclusion_criteria (
    ctd_study_id bigint,
    inhaled_steroid_dose character varying(4000),
    laba character varying(4000),
    ocs character varying(4000),
    xolair character varying(4000),
    ltra_inhibitors character varying(4000),
    asthma_phenotype character varying(4000),
    fev1 character varying(4000)
);


ALTER TABLE biomart.ctd_inclusion_criteria OWNER TO biomart;

--
-- TOC entry 270 (class 1259 OID 24654)
-- Name: ctd_primary_endpts; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd_primary_endpts (
    ctd_study_id bigint,
    primary_type character varying(4000),
    primary_type_definition character varying(4000),
    primary_type_time_period character varying(4000),
    primary_type_change character varying(4000),
    primary_type_p_value character varying(4000),
    id bigint
);


ALTER TABLE biomart.ctd_primary_endpts OWNER TO biomart;

--
-- TOC entry 271 (class 1259 OID 24660)
-- Name: ctd_primary_endpts_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_primary_endpts_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.primary_endpoint_type) AS id, v.ref_article_protocol_id, v.primary_endpoint_type, v.primary_endpoint_definition, v.primary_endpoint_change, v.primary_endpoint_time_period, v.primary_endpoint_p_value, v.primary_endpoint_stat_test FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.primary_endpoint_type, ctd_full.primary_endpoint_definition, ctd_full.primary_endpoint_change, ctd_full.primary_endpoint_time_period, ctd_full.primary_endpoint_p_value, ctd_full.primary_endpoint_stat_test FROM ctd_full WHERE (((ctd_full.primary_endpoint_type IS NOT NULL) AND ((ctd_full.primary_endpoint_type)::text <> ''::text)) OR ((ctd_full.primary_endpoint_definition IS NOT NULL) AND ((ctd_full.primary_endpoint_definition)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.primary_endpoint_type) v;


ALTER TABLE biomart.ctd_primary_endpts_view OWNER TO biomart;

--
-- TOC entry 272 (class 1259 OID 24665)
-- Name: ctd_prior_med_use_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_prior_med_use_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.prior_med_drug_name) AS id, v.ref_article_protocol_id, v.prior_med_drug_name, v.prior_med_pct, v.prior_med_value FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.prior_med_drug_name, ctd_full.prior_med_pct, ctd_full.prior_med_value FROM ctd_full WHERE ((ctd_full.prior_med_drug_name IS NOT NULL) AND ((ctd_full.prior_med_drug_name)::text <> ''::text)) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.prior_med_drug_name) v;


ALTER TABLE biomart.ctd_prior_med_use_view OWNER TO biomart;

--
-- TOC entry 273 (class 1259 OID 24670)
-- Name: ctd_pulmonary_path_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_pulmonary_path_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.pulmonary_pathology_name) AS id, v.ref_article_protocol_id, v.pulmonary_pathology_name, v.pulmpath_patient_pct, v.pulmpath_value_unit, v.pulmpath_method FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.pulmonary_pathology_name, ctd_full.pulmpath_patient_pct, ctd_full.pulmpath_value_unit, ctd_full.pulmpath_method FROM ctd_full WHERE ((ctd_full.pulmonary_pathology_name IS NOT NULL) AND ((ctd_full.pulmonary_pathology_name)::text <> ''::text)) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.pulmonary_pathology_name) v;


ALTER TABLE biomart.ctd_pulmonary_path_view OWNER TO biomart;

--
-- TOC entry 274 (class 1259 OID 24675)
-- Name: ctd_quant_params_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_quant_params_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id) AS id, v.ref_article_protocol_id, v.clinical_variable_name, v.pct_change_from_baseline, v.abs_change_from_baseline, v.rate_of_change_from_baseline, v.average_over_treatment_period, v.within_group_changes, v.stat_measure_p_value FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.clinical_variable_name, ctd_full.pct_change_from_baseline, ctd_full.abs_change_from_baseline, ctd_full.rate_of_change_from_baseline, ctd_full.average_over_treatment_period, ctd_full.within_group_changes, ctd_full.stat_measure_p_value FROM ctd_full WHERE ((ctd_full.clinical_variable_name IS NOT NULL) AND ((ctd_full.clinical_variable_name)::text <> ''::text)) ORDER BY ctd_full.ref_article_protocol_id) v;


ALTER TABLE biomart.ctd_quant_params_view OWNER TO biomart;

--
-- TOC entry 275 (class 1259 OID 24680)
-- Name: ctd_reference_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_reference_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.ref_record_id) AS id, v.ref_article_protocol_id, v.ref_article_pmid, v.ref_protocol_id, v.ref_title, v.ref_record_id, v.ref_back_reference FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.ref_article_pmid, ctd_full.ref_protocol_id, ctd_full.ref_title, ctd_full.ref_record_id, ctd_full.ref_back_reference FROM ctd_full ORDER BY ctd_full.ref_article_protocol_id, ctd_full.ref_record_id) v;


ALTER TABLE biomart.ctd_reference_view OWNER TO biomart;

--
-- TOC entry 276 (class 1259 OID 24685)
-- Name: ctd_runin_therapies_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_runin_therapies_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.runin_description) AS id, v.ref_article_protocol_id, v.runin_ocs, v.runin_ics, v.runin_laba, v.runin_ltra, v.runin_corticosteroids, v.runin_anti_fibrotics, v.runin_immunosuppressive, v.runin_cytotoxic, v.runin_description FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.runin_ocs, ctd_full.runin_ics, ctd_full.runin_laba, ctd_full.runin_ltra, ctd_full.runin_corticosteroids, ctd_full.runin_anti_fibrotics, ctd_full.runin_immunosuppressive, ctd_full.runin_cytotoxic, ctd_full.runin_description FROM ctd_full WHERE ((((ctd_full.runin_ocs IS NOT NULL) AND ((ctd_full.runin_ocs)::text <> ''::text)) OR ((ctd_full.runin_description IS NOT NULL) AND ((ctd_full.runin_description)::text <> ''::text))) OR ((ctd_full.runin_immunosuppressive IS NOT NULL) AND ((ctd_full.runin_immunosuppressive)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.runin_description) v;


ALTER TABLE biomart.ctd_runin_therapies_view OWNER TO biomart;

--
-- TOC entry 277 (class 1259 OID 24690)
-- Name: ctd_sec_endpts; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd_sec_endpts (
    ctd_study_id bigint,
    secondary_type character varying(4000),
    secondary_type_definition character varying(4000),
    secondary_type_time_period character varying(4000),
    secondary_type_change character varying(4000),
    secondary_type_p_value character varying(4000),
    id bigint
);


ALTER TABLE biomart.ctd_sec_endpts OWNER TO biomart;

--
-- TOC entry 278 (class 1259 OID 24696)
-- Name: ctd_secondary_endpts_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_secondary_endpts_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.secondary_type) AS id, v.ref_article_protocol_id, v.secondary_type, v.secondary_type_definition, v.secondary_type_change, v.secondary_type_time_period, v.secondary_type_p_value, v.secondary_type_stat_test FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.secondary_type, ctd_full.secondary_type_definition, ctd_full.secondary_type_change, ctd_full.secondary_type_time_period, ctd_full.secondary_type_p_value, ctd_full.secondary_type_stat_test FROM ctd_full WHERE (((ctd_full.secondary_type IS NOT NULL) AND ((ctd_full.secondary_type)::text <> ''::text)) OR ((ctd_full.secondary_type_definition IS NOT NULL) AND ((ctd_full.secondary_type_definition)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.secondary_type) v;


ALTER TABLE biomart.ctd_secondary_endpts_view OWNER TO biomart;

--
-- TOC entry 279 (class 1259 OID 24701)
-- Name: ctd_stats_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_stats_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.statistical_test) AS id, v.ref_article_protocol_id, v.clinical_correlation, v.statistical_test, v.statistical_coefficient_value, v.statistical_test_p_value, v.statistical_test_description FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.clinical_correlation, ctd_full.statistical_test, ctd_full.statistical_coefficient_value, ctd_full.statistical_test_p_value, ctd_full.statistical_test_description FROM ctd_full WHERE (((ctd_full.statistical_test_description IS NOT NULL) AND ((ctd_full.statistical_test_description)::text <> ''::text)) OR ((ctd_full.statistical_test IS NOT NULL) AND ((ctd_full.statistical_test)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.statistical_test) v;


ALTER TABLE biomart.ctd_stats_view OWNER TO biomart;

--
-- TOC entry 280 (class 1259 OID 24706)
-- Name: ctd_study; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE ctd_study (
    ctd_study_id bigint,
    ref_article_protocol_id character varying(4000),
    ref_article_pmid character varying(4000),
    ref_protocol_id character varying(4000)
);


ALTER TABLE biomart.ctd_study OWNER TO biomart;

--
-- TOC entry 281 (class 1259 OID 24712)
-- Name: ctd_study_details_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_study_details_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.common_name) AS id, v.ref_article_protocol_id, v.study_type, v.common_name, v.icd10, v.mesh, v.disease_type, v.physiology_name FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.study_type, ctd_full.common_name, ctd_full.icd10, ctd_full.mesh, ctd_full.disease_type, ctd_full.physiology_name FROM ctd_full WHERE ((ctd_full.common_name IS NOT NULL) AND ((ctd_full.common_name)::text <> ''::text)) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.common_name) v;


ALTER TABLE biomart.ctd_study_details_view OWNER TO biomart;

--
-- TOC entry 282 (class 1259 OID 24717)
-- Name: ctd_td_design_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_td_design_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.nature_of_trial, v.trial_type) AS id, v.ref_article_protocol_id, v.nature_of_trial, v.randomization, v.blinded_trial, v.trial_type, v.run_in_period, v.treatment_period, v.washout_period, v.open_label_extension FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.nature_of_trial, ctd_full.randomization, ctd_full.blinded_trial, ctd_full.trial_type, ctd_full.run_in_period, ctd_full.treatment_period, ctd_full.washout_period, ctd_full.open_label_extension FROM ctd_full WHERE (((ctd_full.trial_type IS NOT NULL) AND ((ctd_full.trial_type)::text <> ''::text)) OR ((ctd_full.nature_of_trial IS NOT NULL) AND ((ctd_full.nature_of_trial)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.nature_of_trial, ctd_full.trial_type) v;


ALTER TABLE biomart.ctd_td_design_view OWNER TO biomart;

--
-- TOC entry 283 (class 1259 OID 24722)
-- Name: ctd_td_excl_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_td_excl_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id) AS id, v.ref_article_protocol_id, v.exclusion_criteria1, v.exclusion_criteria2, v.minimal_symptoms, v.rescue_medication_use, v.control_details, v.blinding_procedure, v.number_of_arms, v.description1, v.description2 FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, "substring"(ctd_full.exclusion_criteria, 1, 4000) AS exclusion_criteria1, "substring"(ctd_full.exclusion_criteria, 4001, 2000) AS exclusion_criteria2, ctd_full.minimal_symptoms, ctd_full.rescue_medication_use, ctd_full.control_details, ctd_full.blinding_procedure, ctd_full.number_of_arms, "substring"(ctd_full.description, 1, 4000) AS description1, "substring"(ctd_full.description, 4001, 2000) AS description2 FROM ctd_full WHERE (((ctd_full.blinding_procedure IS NOT NULL) AND ((ctd_full.blinding_procedure)::text <> ''::text)) OR ((ctd_full.number_of_arms IS NOT NULL) AND ((ctd_full.number_of_arms)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id) v;


ALTER TABLE biomart.ctd_td_excl_view OWNER TO biomart;

--
-- TOC entry 284 (class 1259 OID 24727)
-- Name: ctd_td_inclusion_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_td_inclusion_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.disease_severity, v.fev1) AS id, v.ref_article_protocol_id, v.trial_age, v.disease_severity, v.difficult_to_treat, v.asthma_diagnosis, v.inhaled_steroid_dose, v.laba, v.ocs, v.xolair, v.ltra_inhibitors, v.asthma_phenotype, v.fev1, v.fev1_reversibility, v.tlc, v.fev1_fvc, v.fvc, v.dlco, v.sgrq, v.hrct, v.biopsy, v.dyspnea_on_exertion, v.concomitant_med FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.trial_age, ctd_full.disease_severity, ctd_full.difficult_to_treat, ctd_full.asthma_diagnosis, ctd_full.inhaled_steroid_dose, ctd_full.laba, ctd_full.ocs, ctd_full.xolair, ctd_full.ltra_inhibitors, ctd_full.asthma_phenotype, ctd_full.fev1, ctd_full.fev1_reversibility, ctd_full.tlc, ctd_full.fev1_fvc, ctd_full.fvc, ctd_full.dlco, ctd_full.sgrq, ctd_full.hrct, ctd_full.biopsy, ctd_full.dyspnea_on_exertion, ctd_full.concomitant_med FROM ctd_full WHERE ((((ctd_full.fev1 IS NOT NULL) AND ((ctd_full.fev1)::text <> ''::text)) OR ((ctd_full.disease_severity IS NOT NULL) AND ((ctd_full.disease_severity)::text <> ''::text))) OR ((ctd_full.trial_age IS NOT NULL) AND ((ctd_full.trial_age)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.disease_severity, ctd_full.fev1) v;


ALTER TABLE biomart.ctd_td_inclusion_view OWNER TO biomart;

--
-- TOC entry 285 (class 1259 OID 24732)
-- Name: ctd_td_smoker_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_td_smoker_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.trial_smokers_pct) AS id, v.ref_article_protocol_id, v.trial_smokers_pct, v.trial_former_smokers_pct, v.trial_never_smokers_pct, v.trial_pack_years FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.trial_smokers_pct, ctd_full.trial_former_smokers_pct, ctd_full.trial_never_smokers_pct, ctd_full.trial_pack_years FROM ctd_full WHERE (((ctd_full.trial_smokers_pct IS NOT NULL) AND ((ctd_full.trial_smokers_pct)::text <> ''::text)) OR ((ctd_full.trial_never_smokers_pct IS NOT NULL) AND ((ctd_full.trial_never_smokers_pct)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.trial_smokers_pct) v;


ALTER TABLE biomart.ctd_td_smoker_view OWNER TO biomart;

--
-- TOC entry 286 (class 1259 OID 24737)
-- Name: ctd_td_sponsor_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_td_sponsor_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.sponsor, v.trial_nbr_of_patients_studied) AS id, v.ref_article_protocol_id, v.sponsor, v.trial_nbr_of_patients_studied, v.source_type FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.sponsor, ctd_full.trial_nbr_of_patients_studied, ctd_full.source_type FROM ctd_full WHERE (((ctd_full.sponsor IS NOT NULL) AND ((ctd_full.sponsor)::text <> ''::text)) OR ((ctd_full.trial_nbr_of_patients_studied IS NOT NULL) AND ((ctd_full.trial_nbr_of_patients_studied)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.sponsor, ctd_full.trial_nbr_of_patients_studied) v;


ALTER TABLE biomart.ctd_td_sponsor_view OWNER TO biomart;

--
-- TOC entry 287 (class 1259 OID 24742)
-- Name: ctd_td_status_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_td_status_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id) AS id, v.ref_article_protocol_id, v.trial_status, v.trial_phase FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.trial_status, ctd_full.trial_phase FROM ctd_full WHERE (((ctd_full.trial_status IS NOT NULL) AND ((ctd_full.trial_status)::text <> ''::text)) OR ((ctd_full.trial_phase IS NOT NULL) AND ((ctd_full.trial_phase)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id) v;


ALTER TABLE biomart.ctd_td_status_view OWNER TO biomart;

--
-- TOC entry 288 (class 1259 OID 24747)
-- Name: ctd_treatment_phases_view; Type: VIEW; Schema: biomart; Owner: biomart
--

CREATE VIEW ctd_treatment_phases_view AS
    SELECT row_number() OVER (ORDER BY v.ref_article_protocol_id, v.trtmt_description, v.trtmt_ocs) AS id, v.ref_article_protocol_id, v.trtmt_ocs, v.trtmt_ics, v.trtmt_laba, v.trtmt_ltra, v.trtmt_corticosteroids, v.trtmt_anti_fibrotics, v.trtmt_immunosuppressive, v.trtmt_cytotoxic, v.trtmt_description FROM (SELECT DISTINCT ctd_full.ref_article_protocol_id, ctd_full.trtmt_ocs, ctd_full.trtmt_ics, ctd_full.trtmt_laba, ctd_full.trtmt_ltra, ctd_full.trtmt_corticosteroids, ctd_full.trtmt_anti_fibrotics, ctd_full.trtmt_immunosuppressive, ctd_full.trtmt_cytotoxic, ctd_full.trtmt_description FROM ctd_full WHERE ((((ctd_full.trtmt_ocs IS NOT NULL) AND ((ctd_full.trtmt_ocs)::text <> ''::text)) OR ((ctd_full.trtmt_description IS NOT NULL) AND ((ctd_full.trtmt_description)::text <> ''::text))) OR ((ctd_full.trtmt_immunosuppressive IS NOT NULL) AND ((ctd_full.trtmt_immunosuppressive)::text <> ''::text))) ORDER BY ctd_full.ref_article_protocol_id, ctd_full.trtmt_description, ctd_full.trtmt_ocs) v;


ALTER TABLE biomart.ctd_treatment_phases_view OWNER TO biomart;

--
-- TOC entry 289 (class 1259 OID 24752)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: biomart; Owner: biomart
--

CREATE SEQUENCE hibernate_sequence
    START WITH 226
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE biomart.hibernate_sequence OWNER TO biomart;

--
-- TOC entry 290 (class 1259 OID 24754)
-- Name: seq_bio_data_fact_id; Type: SEQUENCE; Schema: biomart; Owner: biomart
--

CREATE SEQUENCE seq_bio_data_fact_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE biomart.seq_bio_data_fact_id OWNER TO biomart;

--
-- TOC entry 291 (class 1259 OID 24756)
-- Name: seq_bio_data_id; Type: SEQUENCE; Schema: biomart; Owner: biomart
--

CREATE SEQUENCE seq_bio_data_id
    START WITH 1082041
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE biomart.seq_bio_data_id OWNER TO biomart;

--
-- TOC entry 292 (class 1259 OID 24758)
-- Name: seq_clinical_trial_design_id; Type: SEQUENCE; Schema: biomart; Owner: biomart
--

CREATE SEQUENCE seq_clinical_trial_design_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE biomart.seq_clinical_trial_design_id OWNER TO biomart;

--
-- TOC entry 293 (class 1259 OID 24760)
-- Name: tmp_analysis_data_tea_rank; Type: TABLE; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE TABLE tmp_analysis_data_tea_rank (
    analysis_data_id bigint NOT NULL,
    analysis_id bigint NOT NULL,
    rank1 bigint
);


ALTER TABLE biomart.tmp_analysis_data_tea_rank OWNER TO biomart;

SET default_tablespace = indx;

--
-- TOC entry 3943 (class 2606 OID 25741)
-- Name: bio_aa_data_t_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_assay_analysis_data_tea
    ADD CONSTRAINT bio_aa_data_t_pk PRIMARY KEY (bio_asy_analysis_data_id);


SET default_tablespace = '';

--
-- TOC entry 3972 (class 2606 OID 25743)
-- Name: bio_assay_analysis_platform_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_asy_analysis_pltfm
    ADD CONSTRAINT bio_assay_analysis_platform_pk PRIMARY KEY (bio_asy_analysis_pltfm_id);


SET default_tablespace = indx;

--
-- TOC entry 3965 (class 2606 OID 25745)
-- Name: bio_assay_platform_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_assay_platform
    ADD CONSTRAINT bio_assay_platform_pk PRIMARY KEY (bio_assay_platform_id);


--
-- TOC entry 3967 (class 2606 OID 25747)
-- Name: bio_assay_sample_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_assay_sample
    ADD CONSTRAINT bio_assay_sample_pk PRIMARY KEY (bio_assay_id, bio_sample_id, bio_clinic_trial_timepoint_id);


--
-- TOC entry 3978 (class 2606 OID 25749)
-- Name: bio_asy_dt_stats_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_asy_data_stats_all
    ADD CONSTRAINT bio_asy_dt_stats_pk PRIMARY KEY (bio_assay_data_stats_id);


--
-- TOC entry 3957 (class 2606 OID 25751)
-- Name: bio_asy_dt_stats_s_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_assay_data_stats
    ADD CONSTRAINT bio_asy_dt_stats_s_pk PRIMARY KEY (bio_assay_data_stats_id);


--
-- TOC entry 3963 (class 2606 OID 25753)
-- Name: bio_asy_feature_grp_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_assay_feature_group
    ADD CONSTRAINT bio_asy_feature_grp_pk PRIMARY KEY (bio_assay_feature_group_id);


SET default_tablespace = '';

--
-- TOC entry 3984 (class 2606 OID 25755)
-- Name: bio_cancer_gene_curation_fact_; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_cgdcp_data
    ADD CONSTRAINT bio_cancer_gene_curation_fact_ PRIMARY KEY (bio_data_id);


--
-- TOC entry 3988 (class 2606 OID 25757)
-- Name: bio_clinical_trial_patient_grp; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_clinc_trial_attr
    ADD CONSTRAINT bio_clinical_trial_patient_grp PRIMARY KEY (bio_clinc_trial_attr_id);


--
-- TOC entry 3991 (class 2606 OID 25759)
-- Name: bio_clinical_trial_pt_group; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_clinc_trial_pt_group
    ADD CONSTRAINT bio_clinical_trial_pt_group PRIMARY KEY (bio_clinical_trial_p_group_id);


--
-- TOC entry 3994 (class 2606 OID 25761)
-- Name: bio_clinical_trial_time_point_; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_clinc_trial_time_pt
    ADD CONSTRAINT bio_clinical_trial_time_point_ PRIMARY KEY (bio_clinc_trial_tm_pt_id);


SET default_tablespace = indx;

--
-- TOC entry 4002 (class 2606 OID 25763)
-- Name: bio_concept_code_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_concept_code
    ADD CONSTRAINT bio_concept_code_pk PRIMARY KEY (bio_concept_code_id);


--
-- TOC entry 4005 (class 2606 OID 25765)
-- Name: bio_concept_code_uk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_concept_code
    ADD CONSTRAINT bio_concept_code_uk UNIQUE (bio_concept_code, code_type_name);


SET default_tablespace = '';

--
-- TOC entry 4010 (class 2606 OID 25767)
-- Name: bio_content_ref_n_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_content_reference
    ADD CONSTRAINT bio_content_ref_n_pk PRIMARY KEY (bio_content_reference_id);


--
-- TOC entry 3970 (class 2606 OID 25769)
-- Name: bio_data_analysis_dataset_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_asy_analysis_dataset
    ADD CONSTRAINT bio_data_analysis_dataset_pk PRIMARY KEY (bio_assay_dataset_id, bio_assay_analysis_id);


--
-- TOC entry 3925 (class 2606 OID 25771)
-- Name: bio_data_anl_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_assay_analysis
    ADD CONSTRAINT bio_data_anl_pk PRIMARY KEY (bio_assay_analysis_id);


--
-- TOC entry 4022 (class 2606 OID 25773)
-- Name: bio_data_attr_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_data_attribute
    ADD CONSTRAINT bio_data_attr_pk PRIMARY KEY (bio_data_attribute_id);


SET default_tablespace = indx;

--
-- TOC entry 4025 (class 2606 OID 25775)
-- Name: bio_data_compound_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_data_compound
    ADD CONSTRAINT bio_data_compound_pk PRIMARY KEY (bio_data_id, bio_compound_id);


--
-- TOC entry 4031 (class 2606 OID 25777)
-- Name: bio_data_correlation_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_data_correlation
    ADD CONSTRAINT bio_data_correlation_pk PRIMARY KEY (bio_data_correl_id);


--
-- TOC entry 4033 (class 2606 OID 25779)
-- Name: bio_data_disease_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_data_disease
    ADD CONSTRAINT bio_data_disease_pk PRIMARY KEY (bio_data_id, bio_disease_id);


--
-- TOC entry 4040 (class 2606 OID 25781)
-- Name: bio_data_ext_code_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_data_ext_code
    ADD CONSTRAINT bio_data_ext_code_pk PRIMARY KEY (bio_data_ext_code_id);


--
-- TOC entry 4042 (class 2606 OID 25783)
-- Name: bio_data_literature_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_data_literature
    ADD CONSTRAINT bio_data_literature_pk PRIMARY KEY (bio_data_id);


--
-- TOC entry 4046 (class 2606 OID 25785)
-- Name: bio_data_uid_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_data_uid
    ADD CONSTRAINT bio_data_uid_pk PRIMARY KEY (bio_data_id);


--
-- TOC entry 4048 (class 2606 OID 25787)
-- Name: bio_data_uid_uk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_data_uid
    ADD CONSTRAINT bio_data_uid_uk UNIQUE (unique_id);


SET default_tablespace = '';

--
-- TOC entry 3960 (class 2606 OID 25789)
-- Name: bio_dataset_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_assay_dataset
    ADD CONSTRAINT bio_dataset_pk PRIMARY KEY (bio_assay_dataset_id);


--
-- TOC entry 3948 (class 2606 OID 25791)
-- Name: bio_experiment_data_fact_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_assay_data
    ADD CONSTRAINT bio_experiment_data_fact_pk PRIMARY KEY (bio_assay_data_id);


--
-- TOC entry 4020 (class 2606 OID 25793)
-- Name: bio_external_analysis_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_curation_dataset
    ADD CONSTRAINT bio_external_analysis_pk PRIMARY KEY (bio_curation_dataset_id);


--
-- TOC entry 4017 (class 2606 OID 25795)
-- Name: bio_externalanalysis_fact_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_curated_data
    ADD CONSTRAINT bio_externalanalysis_fact_pk PRIMARY KEY (bio_data_id);


SET default_tablespace = indx;

--
-- TOC entry 4058 (class 2606 OID 25797)
-- Name: bio_lit_alt_data_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_lit_alt_data
    ADD CONSTRAINT bio_lit_alt_data_pk PRIMARY KEY (bio_lit_alt_data_id);


--
-- TOC entry 4060 (class 2606 OID 25800)
-- Name: bio_lit_amd_data_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_lit_amd_data
    ADD CONSTRAINT bio_lit_amd_data_pk PRIMARY KEY (bio_lit_amd_data_id);


--
-- TOC entry 4062 (class 2606 OID 25802)
-- Name: bio_lit_inh_data_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_lit_inh_data
    ADD CONSTRAINT bio_lit_inh_data_pk PRIMARY KEY (bio_lit_inh_data_id);


--
-- TOC entry 4064 (class 2606 OID 25804)
-- Name: bio_lit_int_data_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_lit_int_data
    ADD CONSTRAINT bio_lit_int_data_pk PRIMARY KEY (bio_lit_int_data_id);


--
-- TOC entry 4066 (class 2606 OID 25806)
-- Name: bio_lit_model_data_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_lit_model_data
    ADD CONSTRAINT bio_lit_model_data_pk PRIMARY KEY (bio_lit_model_data_id);


--
-- TOC entry 4068 (class 2606 OID 25808)
-- Name: bio_lit_pe_data_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_lit_pe_data
    ADD CONSTRAINT bio_lit_pe_data_pk PRIMARY KEY (bio_lit_pe_data_id);


--
-- TOC entry 4070 (class 2606 OID 25810)
-- Name: bio_lit_ref_data_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_lit_ref_data
    ADD CONSTRAINT bio_lit_ref_data_pk PRIMARY KEY (bio_lit_ref_data_id);


--
-- TOC entry 4072 (class 2606 OID 25812)
-- Name: bio_lit_sum_data_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_lit_sum_data
    ADD CONSTRAINT bio_lit_sum_data_pk PRIMARY KEY (bio_lit_sum_data_id);


SET default_tablespace = '';

--
-- TOC entry 4028 (class 2606 OID 25814)
-- Name: bio_marker_relationship_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_data_correl_descr
    ADD CONSTRAINT bio_marker_relationship_pk PRIMARY KEY (bio_data_correl_descr_id);


--
-- TOC entry 4087 (class 2606 OID 25816)
-- Name: bio_patient_attribute_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_patient_event_attr
    ADD CONSTRAINT bio_patient_attribute_pk PRIMARY KEY (bio_patient_attribute_id);


SET default_tablespace = indx;

--
-- TOC entry 4085 (class 2606 OID 25818)
-- Name: bio_patient_event_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_patient_event
    ADD CONSTRAINT bio_patient_event_pk PRIMARY KEY (bio_patient_event_id);


--
-- TOC entry 4083 (class 2606 OID 25820)
-- Name: bio_patient_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_patient
    ADD CONSTRAINT bio_patient_pk PRIMARY KEY (bio_patient_id);


--
-- TOC entry 4093 (class 2606 OID 25822)
-- Name: bio_s_e_m_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_stats_exp_marker
    ADD CONSTRAINT bio_s_e_m_pk PRIMARY KEY (bio_marker_id, bio_experiment_id);


--
-- TOC entry 4097 (class 2606 OID 25824)
-- Name: bio_subject_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: indx
--

ALTER TABLE ONLY bio_subject
    ADD CONSTRAINT bio_subject_pk PRIMARY KEY (bio_subject_id);


SET default_tablespace = biomart;

--
-- TOC entry 4099 (class 2606 OID 25826)
-- Name: bio_taxon_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: biomart
--

ALTER TABLE ONLY bio_taxonomy
    ADD CONSTRAINT bio_taxon_pk PRIMARY KEY (bio_taxonomy_id);


SET default_tablespace = '';

--
-- TOC entry 4101 (class 2606 OID 25828)
-- Name: biobank_sample_pkey; Type: CONSTRAINT; Schema: biomart; Owner: biomart_user; Tablespace: 
--

ALTER TABLE ONLY biobank_sample
    ADD CONSTRAINT biobank_sample_pkey PRIMARY KEY (sample_tube_id);


--
-- TOC entry 4077 (class 2606 OID 25830)
-- Name: biomarker_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_marker
    ADD CONSTRAINT biomarker_pk PRIMARY KEY (bio_marker_id);


--
-- TOC entry 4091 (class 2606 OID 25832)
-- Name: biosample_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_sample
    ADD CONSTRAINT biosample_pk PRIMARY KEY (bio_sample_id);


--
-- TOC entry 3982 (class 2606 OID 25834)
-- Name: celllinedictionary_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_cell_line
    ADD CONSTRAINT celllinedictionary_pk PRIMARY KEY (bio_cell_line_id);


--
-- TOC entry 3997 (class 2606 OID 25836)
-- Name: clinicaltrialdim_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_clinical_trial
    ADD CONSTRAINT clinicaltrialdim_pk PRIMARY KEY (bio_experiment_id);


--
-- TOC entry 4000 (class 2606 OID 25838)
-- Name: compounddim_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_compound
    ADD CONSTRAINT compounddim_pk PRIMARY KEY (bio_compound_id);


--
-- TOC entry 4051 (class 2606 OID 25840)
-- Name: diseasedim_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_disease
    ADD CONSTRAINT diseasedim_pk PRIMARY KEY (bio_disease_id);


--
-- TOC entry 4056 (class 2606 OID 25842)
-- Name: experimentdim_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_experiment
    ADD CONSTRAINT experimentdim_pk PRIMARY KEY (bio_experiment_id);


--
-- TOC entry 4008 (class 2606 OID 25844)
-- Name: external_file_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_content
    ADD CONSTRAINT external_file_pk PRIMARY KEY (bio_file_content_id);


--
-- TOC entry 4014 (class 2606 OID 25846)
-- Name: external_file_repository_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_content_repository
    ADD CONSTRAINT external_file_repository_pk PRIMARY KEY (bio_content_repo_id);


--
-- TOC entry 3922 (class 2606 OID 25848)
-- Name: rbmorderdim_pk; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: 
--

ALTER TABLE ONLY bio_assay
    ADD CONSTRAINT rbmorderdim_pk PRIMARY KEY (bio_assay_id);


SET default_tablespace = biomart;

--
-- TOC entry 4079 (class 2606 OID 25850)
-- Name: sys_c0020430; Type: CONSTRAINT; Schema: biomart; Owner: biomart; Tablespace: biomart
--

ALTER TABLE ONLY bio_marker
    ADD CONSTRAINT sys_c0020430 UNIQUE (organism, primary_external_id);


SET default_tablespace = indx;

--
-- TOC entry 3926 (class 1259 OID 26028)
-- Name: baad_fgn_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baad_fgn_idx ON bio_assay_analysis_data USING btree (feature_group_name);


--
-- TOC entry 3927 (class 1259 OID 26029)
-- Name: baad_idx11; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baad_idx11 ON bio_assay_analysis_data USING btree (bio_experiment_id, bio_assay_analysis_id, bio_asy_analysis_data_id);


--
-- TOC entry 3928 (class 1259 OID 26030)
-- Name: baad_idx12; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baad_idx12 ON bio_assay_analysis_data USING btree (bio_experiment_id, bio_assay_analysis_id, bio_assay_feature_group_id);


--
-- TOC entry 3929 (class 1259 OID 26031)
-- Name: baad_idx14; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baad_idx14 ON bio_assay_analysis_data USING btree (bio_assay_feature_group_id, bio_asy_analysis_data_id);


--
-- TOC entry 3930 (class 1259 OID 26034)
-- Name: baad_idx4; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baad_idx4 ON bio_assay_analysis_data USING btree (bio_assay_platform_id);


--
-- TOC entry 3931 (class 1259 OID 26035)
-- Name: baad_idx6; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baad_idx6 ON bio_assay_analysis_data USING btree (bio_experiment_id, bio_assay_analysis_id);


--
-- TOC entry 3932 (class 1259 OID 26036)
-- Name: baad_idx7; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baad_idx7 ON bio_assay_analysis_data USING btree (bio_assay_analysis_id, bio_asy_analysis_data_id);


--
-- TOC entry 3935 (class 1259 OID 26037)
-- Name: baadt_f_idx13; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baadt_f_idx13 ON bio_assay_analysis_data_tea USING btree (bio_assay_feature_group_id, bio_asy_analysis_data_id);


--
-- TOC entry 3936 (class 1259 OID 26038)
-- Name: baadt_idex12; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baadt_idex12 ON bio_assay_analysis_data_tea USING btree (feature_group_name, bio_asy_analysis_data_id);


--
-- TOC entry 3937 (class 1259 OID 26039)
-- Name: baadt_idx10; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baadt_idx10 ON bio_assay_analysis_data_tea USING btree (bio_assay_feature_group_id, bio_experiment_id);


--
-- TOC entry 3938 (class 1259 OID 26040)
-- Name: baadt_idx11; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baadt_idx11 ON bio_assay_analysis_data_tea USING btree (bio_experiment_id, bio_assay_analysis_id, bio_asy_analysis_data_id);


--
-- TOC entry 3939 (class 1259 OID 26041)
-- Name: baadt_idx17; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baadt_idx17 ON bio_assay_analysis_data_tea USING btree (bio_assay_analysis_id, tea_rank);


--
-- TOC entry 3940 (class 1259 OID 26042)
-- Name: baadt_idx6; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baadt_idx6 ON bio_assay_analysis_data_tea USING btree (bio_experiment_id, bio_assay_analysis_id);


--
-- TOC entry 3941 (class 1259 OID 26043)
-- Name: baadt_idx7; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX baadt_idx7 ON bio_assay_analysis_data_tea USING btree (bio_assay_analysis_id, bio_asy_analysis_data_id);


--
-- TOC entry 3933 (class 1259 OID 26044)
-- Name: bad_idx13; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bad_idx13 ON bio_assay_analysis_data USING btree (bio_assay_analysis_id, bio_assay_feature_group_id);


--
-- TOC entry 4029 (class 1259 OID 26045)
-- Name: bdc_index1; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bdc_index1 ON bio_data_correlation USING btree (asso_bio_data_id);


--
-- TOC entry 3974 (class 1259 OID 26046)
-- Name: bio_a__d_s_ds_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_a__d_s_ds_idx ON bio_asy_data_stats_all USING btree (bio_assay_dataset_id);


--
-- TOC entry 3975 (class 1259 OID 26047)
-- Name: bio_a__d_s_exp_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_a__d_s_exp_idx ON bio_asy_data_stats_all USING btree (bio_experiment_id);


--
-- TOC entry 3976 (class 1259 OID 26048)
-- Name: bio_a__d_s_f_g_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_a__d_s_f_g_idx ON bio_asy_data_stats_all USING btree (feature_group_name);


--
-- TOC entry 3952 (class 1259 OID 26049)
-- Name: bio_a_d_s_ds__s_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_a_d_s_ds__s_idx ON bio_assay_data_stats USING btree (bio_assay_dataset_id);


--
-- TOC entry 3953 (class 1259 OID 26050)
-- Name: bio_a_d_s_exp__s_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_a_d_s_exp__s_idx ON bio_assay_data_stats USING btree (bio_experiment_id);


--
-- TOC entry 3954 (class 1259 OID 26051)
-- Name: bio_a_d_s_f_g_s_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_a_d_s_f_g_s_idx ON bio_assay_data_stats USING btree (feature_group_name, bio_assay_data_stats_id);


--
-- TOC entry 3955 (class 1259 OID 26052)
-- Name: bio_a_d_s_fgi_s_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_a_d_s_fgi_s_idx ON bio_assay_data_stats USING btree (bio_assay_feature_group_id, bio_assay_data_stats_id);


--
-- TOC entry 3949 (class 1259 OID 26053)
-- Name: bio_a_o_an_idx2; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_a_o_an_idx2 ON bio_assay_data_annotation USING btree (bio_assay_feature_group_id, bio_marker_id);


--
-- TOC entry 3950 (class 1259 OID 26054)
-- Name: bio_a_o_fg_id_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_a_o_fg_id_idx ON bio_assay_data_annotation USING btree (bio_assay_feature_group_id);


--
-- TOC entry 3923 (class 1259 OID 26055)
-- Name: bio_assay_analysis_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_assay_analysis_pk ON bio_assay_analysis USING btree (bio_assay_analysis_id);


--
-- TOC entry 3946 (class 1259 OID 26056)
-- Name: bio_assay_data_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_assay_data_pk ON bio_assay_data USING btree (bio_assay_data_id);


--
-- TOC entry 3958 (class 1259 OID 26057)
-- Name: bio_assay_dataset_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_assay_dataset_pk ON bio_assay_dataset USING btree (bio_assay_dataset_id);


--
-- TOC entry 3920 (class 1259 OID 26058)
-- Name: bio_assay_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_assay_pk ON bio_assay USING btree (bio_assay_id);


--
-- TOC entry 3968 (class 1259 OID 26059)
-- Name: bio_asy_analysis_dataset_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_asy_analysis_dataset_pk ON bio_asy_analysis_dataset USING btree (bio_assay_dataset_id, bio_assay_analysis_id);


--
-- TOC entry 3973 (class 1259 OID 26060)
-- Name: bio_asy_analysis_pltfm_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_asy_analysis_pltfm_pk ON bio_asy_analysis_pltfm USING btree (bio_asy_analysis_pltfm_id);


--
-- TOC entry 3961 (class 1259 OID 26061)
-- Name: bio_asy_feature_grp_name_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_asy_feature_grp_name_idx ON bio_assay_feature_group USING btree (feature_group_name, bio_assay_feature_group_id);


--
-- TOC entry 3979 (class 1259 OID 26064)
-- Name: bio_cell_line_dict_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_cell_line_dict_pk ON bio_cell_line USING btree (bio_cell_line_id);


--
-- TOC entry 3980 (class 1259 OID 26065)
-- Name: bio_cell_line_name_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_cell_line_name_idx ON bio_cell_line USING btree (cell_line_name, bio_cell_line_id);


--
-- TOC entry 3985 (class 1259 OID 26066)
-- Name: bio_cgdcp_data_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_cgdcp_data_pk ON bio_cgdcp_data USING btree (bio_data_id);


--
-- TOC entry 3986 (class 1259 OID 26067)
-- Name: bio_clinc_trial_attr_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_clinc_trial_attr_pk ON bio_clinc_trial_attr USING btree (bio_clinc_trial_attr_id);


--
-- TOC entry 3989 (class 1259 OID 26068)
-- Name: bio_clinc_trial_pt_group_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_clinc_trial_pt_group_pk ON bio_clinc_trial_pt_group USING btree (bio_clinical_trial_p_group_id);


--
-- TOC entry 3992 (class 1259 OID 26069)
-- Name: bio_clinc_trial_time_pt_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_clinc_trial_time_pt_pk ON bio_clinc_trial_time_pt USING btree (bio_clinc_trial_tm_pt_id);


--
-- TOC entry 3995 (class 1259 OID 26070)
-- Name: bio_clinical_trial_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_clinical_trial_pk ON bio_clinical_trial USING btree (bio_experiment_id);


--
-- TOC entry 3998 (class 1259 OID 26071)
-- Name: bio_compound_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_compound_pk ON bio_compound USING btree (bio_compound_id);


--
-- TOC entry 4003 (class 1259 OID 26072)
-- Name: bio_concept_code_type_index; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_concept_code_type_index ON bio_concept_code USING btree (code_type_name);


--
-- TOC entry 4006 (class 1259 OID 26073)
-- Name: bio_content_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_content_pk ON bio_content USING btree (bio_file_content_id);


--
-- TOC entry 4011 (class 1259 OID 26074)
-- Name: bio_content_reference_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_content_reference_pk ON bio_content_reference USING btree (bio_content_reference_id);


--
-- TOC entry 4012 (class 1259 OID 26075)
-- Name: bio_content_repository_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_content_repository_pk ON bio_content_repository USING btree (bio_content_repo_id);


--
-- TOC entry 4015 (class 1259 OID 26076)
-- Name: bio_curated_data_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_curated_data_pk ON bio_curated_data USING btree (bio_data_id);


--
-- TOC entry 4018 (class 1259 OID 26077)
-- Name: bio_curation_dataset_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_curation_dataset_pk ON bio_curation_dataset USING btree (bio_curation_dataset_id);


--
-- TOC entry 4036 (class 1259 OID 26078)
-- Name: bio_d_e_c_did_ct_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_d_e_c_did_ct_idx ON bio_data_ext_code USING btree (bio_data_id, code_type);


--
-- TOC entry 3951 (class 1259 OID 26079)
-- Name: bio_d_fg_m_marker2_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_d_fg_m_marker2_pk ON bio_assay_data_annotation USING btree (bio_marker_id, bio_assay_feature_group_id);


--
-- TOC entry 4043 (class 1259 OID 26080)
-- Name: bio_d_o_m_marker2_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_d_o_m_marker2_pk ON bio_data_omic_marker USING btree (bio_marker_id, bio_data_id);


--
-- TOC entry 4023 (class 1259 OID 26081)
-- Name: bio_data_attribute_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_data_attribute_pk ON bio_data_attribute USING btree (bio_data_attribute_id);


--
-- TOC entry 4026 (class 1259 OID 26082)
-- Name: bio_data_correl_descr_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_data_correl_descr_pk ON bio_data_correl_descr USING btree (bio_data_correl_descr_id);


--
-- TOC entry 4037 (class 1259 OID 26083)
-- Name: bio_data_e_c_c_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_data_e_c_c_idx ON bio_data_ext_code USING btree (code);


--
-- TOC entry 4038 (class 1259 OID 26084)
-- Name: bio_data_e_c_t_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_data_e_c_t_idx ON bio_data_ext_code USING btree (code_type);


--
-- TOC entry 4044 (class 1259 OID 26085)
-- Name: bio_data_o_m_did_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_data_o_m_did_idx ON bio_data_omic_marker USING btree (bio_data_id);


--
-- TOC entry 4034 (class 1259 OID 26086)
-- Name: bio_dd_idx2; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_dd_idx2 ON bio_data_disease USING btree (bio_disease_id);


--
-- TOC entry 4049 (class 1259 OID 26087)
-- Name: bio_disease_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_disease_pk ON bio_disease USING btree (bio_disease_id);


--
-- TOC entry 4035 (class 1259 OID 26088)
-- Name: bio_dt_dis_did_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_dt_dis_did_idx ON bio_data_disease USING btree (bio_data_id);


--
-- TOC entry 4052 (class 1259 OID 26089)
-- Name: bio_exp_acen_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_exp_acen_idx ON bio_experiment USING btree (accession);


--
-- TOC entry 4053 (class 1259 OID 26090)
-- Name: bio_exp_type_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_exp_type_idx ON bio_experiment USING btree (bio_experiment_type);


--
-- TOC entry 4054 (class 1259 OID 26091)
-- Name: bio_experiment_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_experiment_pk ON bio_experiment USING btree (bio_experiment_id);


SET default_tablespace = biomart;

--
-- TOC entry 4080 (class 1259 OID 26092)
-- Name: bio_marker_c_mv_idx1; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE INDEX bio_marker_c_mv_idx1 ON bio_marker_correl_mv USING btree (bio_marker_id, asso_bio_marker_id);


--
-- TOC entry 4081 (class 1259 OID 26093)
-- Name: bio_marker_c_mv_idx2; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE INDEX bio_marker_c_mv_idx2 ON bio_marker_correl_mv USING btree (asso_bio_marker_id, bio_marker_id);


SET default_tablespace = indx;

--
-- TOC entry 4073 (class 1259 OID 26094)
-- Name: bio_marker_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_marker_pk ON bio_marker USING btree (bio_marker_id);


--
-- TOC entry 4074 (class 1259 OID 26095)
-- Name: bio_mkr_ext_id; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_mkr_ext_id ON bio_marker USING btree (primary_external_id);


--
-- TOC entry 4075 (class 1259 OID 26096)
-- Name: bio_mkr_type_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_mkr_type_idx ON bio_marker USING btree (bio_marker_type);


--
-- TOC entry 4088 (class 1259 OID 26097)
-- Name: bio_patient_event_attr_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_patient_event_attr_pk ON bio_patient_event_attr USING btree (bio_patient_attribute_id);


--
-- TOC entry 4089 (class 1259 OID 26098)
-- Name: bio_sample_pk; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX bio_sample_pk ON bio_sample USING btree (bio_sample_id);


--
-- TOC entry 4094 (class 1259 OID 26099)
-- Name: bio_stats_exp_mk_exp_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_stats_exp_mk_exp_idx ON bio_stats_exp_marker USING btree (bio_experiment_id);


--
-- TOC entry 4095 (class 1259 OID 26100)
-- Name: bio_stats_exp_mk_mk_idx; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX bio_stats_exp_mk_mk_idx ON bio_stats_exp_marker USING btree (bio_marker_id);


--
-- TOC entry 3944 (class 1259 OID 26101)
-- Name: idx_baadt_fg_ad; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX idx_baadt_fg_ad ON bio_assay_analysis_data_tea USING btree (bio_assay_feature_group_id, bio_assay_analysis_id);


--
-- TOC entry 3945 (class 1259 OID 26102)
-- Name: idx_baadt_idx10; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE INDEX idx_baadt_idx10 ON bio_assay_analysis_data_tea USING btree (bio_experiment_type, bio_asy_analysis_data_id);


--
-- TOC entry 3934 (class 1259 OID 26103)
-- Name: pk_baad; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: indx
--

CREATE UNIQUE INDEX pk_baad ON bio_assay_analysis_data USING btree (bio_asy_analysis_data_id);


SET default_tablespace = biomart;

--
-- TOC entry 4102 (class 1259 OID 26104)
-- Name: tmp_a_d_tea_r_index1; Type: INDEX; Schema: biomart; Owner: biomart; Tablespace: biomart
--

CREATE INDEX tmp_a_d_tea_r_index1 ON tmp_analysis_data_tea_rank USING btree (analysis_data_id);


--
-- TOC entry 4157 (class 2620 OID 26168)
-- Name: trg_bio_assay_analysis_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_assay_analysis_id BEFORE INSERT ON bio_assay_analysis FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_assay_analysis_id();


--
-- TOC entry 4158 (class 2620 OID 26169)
-- Name: trg_bio_assay_data_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_assay_data_id BEFORE INSERT ON bio_assay_data FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_assay_data_id();


--
-- TOC entry 4159 (class 2620 OID 26170)
-- Name: trg_bio_assay_dataset_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_assay_dataset_id BEFORE INSERT ON bio_assay_dataset FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_assay_dataset_id();


--
-- TOC entry 4160 (class 2620 OID 26171)
-- Name: trg_bio_assay_f_g_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_assay_f_g_id BEFORE INSERT ON bio_assay_feature_group FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_assay_f_g_id();


--
-- TOC entry 4156 (class 2620 OID 26172)
-- Name: trg_bio_assay_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_assay_id BEFORE INSERT ON bio_assay FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_assay_id();


--
-- TOC entry 4161 (class 2620 OID 26173)
-- Name: trg_bio_assay_platform_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_assay_platform_id BEFORE INSERT ON bio_assay_platform FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_assay_platform_id();


--
-- TOC entry 4162 (class 2620 OID 26174)
-- Name: trg_bio_asy_analysis_pltfm_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_asy_analysis_pltfm_id BEFORE INSERT ON bio_asy_analysis_pltfm FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_asy_analysis_pltfm_id();


--
-- TOC entry 4163 (class 2620 OID 26175)
-- Name: trg_bio_asy_dt_stats_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_asy_dt_stats_id BEFORE INSERT ON bio_asy_data_stats_all FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_asy_dt_stats_id();


--
-- TOC entry 4164 (class 2620 OID 26176)
-- Name: trg_bio_cell_line_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_cell_line_id BEFORE INSERT ON bio_cell_line FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_cell_line_id();


--
-- TOC entry 4167 (class 2620 OID 26177)
-- Name: trg_bio_cl_trl_time_pt_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_cl_trl_time_pt_id BEFORE INSERT ON bio_clinc_trial_time_pt FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_cl_trl_time_pt_id();


--
-- TOC entry 4166 (class 2620 OID 26178)
-- Name: trg_bio_clin_trl_pt_grp_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_clin_trl_pt_grp_id BEFORE INSERT ON bio_clinc_trial_pt_group FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_clin_trl_pt_grp_id();


--
-- TOC entry 4165 (class 2620 OID 26179)
-- Name: trg_bio_cln_trl_attr_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_cln_trl_attr_id BEFORE INSERT ON bio_clinc_trial_attr FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_cln_trl_attr_id();


--
-- TOC entry 4168 (class 2620 OID 26180)
-- Name: trg_bio_compound_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_compound_id BEFORE INSERT ON bio_compound FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_compound_id();


--
-- TOC entry 4169 (class 2620 OID 26181)
-- Name: trg_bio_concept_code_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_concept_code_id BEFORE INSERT ON bio_concept_code FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_concept_code_id();


--
-- TOC entry 4171 (class 2620 OID 26182)
-- Name: trg_bio_content_ref_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_content_ref_id BEFORE INSERT ON bio_content_reference FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_content_ref_id();


--
-- TOC entry 4172 (class 2620 OID 26183)
-- Name: trg_bio_content_repo_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_content_repo_id BEFORE INSERT ON bio_content_repository FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_content_repo_id();


--
-- TOC entry 4173 (class 2620 OID 26184)
-- Name: trg_bio_curation_dataset_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_curation_dataset_id BEFORE INSERT ON bio_curation_dataset FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_curation_dataset_id();


--
-- TOC entry 4174 (class 2620 OID 26185)
-- Name: trg_bio_data_attr_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_data_attr_id BEFORE INSERT ON bio_data_attribute FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_data_attr_id();


--
-- TOC entry 4176 (class 2620 OID 26186)
-- Name: trg_bio_data_correl_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_data_correl_id BEFORE INSERT ON bio_data_correlation FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_data_correl_id();


--
-- TOC entry 4177 (class 2620 OID 26187)
-- Name: trg_bio_data_ext_code_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_data_ext_code_id BEFORE INSERT ON bio_data_ext_code FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_data_ext_code_id();


--
-- TOC entry 4178 (class 2620 OID 26188)
-- Name: trg_bio_disease_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_disease_id BEFORE INSERT ON bio_disease FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_disease_id();


--
-- TOC entry 4179 (class 2620 OID 26189)
-- Name: trg_bio_experiment_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_experiment_id BEFORE INSERT ON bio_experiment FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_experiment_id();


--
-- TOC entry 4170 (class 2620 OID 26190)
-- Name: trg_bio_file_content_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_file_content_id BEFORE INSERT ON bio_content FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_file_content_id();


--
-- TOC entry 4180 (class 2620 OID 26191)
-- Name: trg_bio_lit_alt_data_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_lit_alt_data_id BEFORE INSERT ON bio_lit_alt_data FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_lit_alt_data_id();


--
-- TOC entry 4181 (class 2620 OID 26192)
-- Name: trg_bio_lit_amd_data_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_lit_amd_data_id BEFORE INSERT ON bio_lit_amd_data FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_lit_amd_data_id();


--
-- TOC entry 4182 (class 2620 OID 26193)
-- Name: trg_bio_lit_inh_data_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_lit_inh_data_id BEFORE INSERT ON bio_lit_inh_data FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_lit_inh_data_id();


--
-- TOC entry 4183 (class 2620 OID 26194)
-- Name: trg_bio_lit_int_data_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_lit_int_data_id BEFORE INSERT ON bio_lit_int_data FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_lit_int_data_id();


--
-- TOC entry 4184 (class 2620 OID 26195)
-- Name: trg_bio_lit_model_data_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_lit_model_data_id BEFORE INSERT ON bio_lit_model_data FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_lit_model_data_id();


--
-- TOC entry 4185 (class 2620 OID 26196)
-- Name: trg_bio_lit_pe_data_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_lit_pe_data_id BEFORE INSERT ON bio_lit_pe_data FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_lit_pe_data_id();


--
-- TOC entry 4186 (class 2620 OID 26197)
-- Name: trg_bio_lit_ref_data_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_lit_ref_data_id BEFORE INSERT ON bio_lit_ref_data FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_lit_ref_data_id();


--
-- TOC entry 4187 (class 2620 OID 26198)
-- Name: trg_bio_lit_sum_data_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_lit_sum_data_id BEFORE INSERT ON bio_lit_sum_data FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_lit_sum_data_id();


--
-- TOC entry 4188 (class 2620 OID 26199)
-- Name: trg_bio_marker_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_marker_id BEFORE INSERT ON bio_marker FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_marker_id();


--
-- TOC entry 4175 (class 2620 OID 26200)
-- Name: trg_bio_mkr_correl_descr_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_mkr_correl_descr_id BEFORE INSERT ON bio_data_correl_descr FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_mkr_correl_descr_id();


--
-- TOC entry 4190 (class 2620 OID 26201)
-- Name: trg_bio_patient_event_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_patient_event_id BEFORE INSERT ON bio_patient_event FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_patient_event_id();


--
-- TOC entry 4189 (class 2620 OID 26202)
-- Name: trg_bio_patient_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_patient_id BEFORE INSERT ON bio_patient FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_patient_id();


--
-- TOC entry 4191 (class 2620 OID 26203)
-- Name: trg_bio_pt_evt_attr_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_pt_evt_attr_id BEFORE INSERT ON bio_patient_event_attr FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_pt_evt_attr_id();


--
-- TOC entry 4192 (class 2620 OID 26204)
-- Name: trg_bio_sample_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_sample_id BEFORE INSERT ON bio_sample FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_sample_id();


--
-- TOC entry 4193 (class 2620 OID 26205)
-- Name: trg_bio_subject_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_subject_id BEFORE INSERT ON bio_subject FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_subject_id();


--
-- TOC entry 4194 (class 2620 OID 26206)
-- Name: trg_bio_taxon_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_bio_taxon_id BEFORE INSERT ON bio_taxonomy FOR EACH ROW EXECUTE PROCEDURE tf_trg_bio_taxon_id();


--
-- TOC entry 4195 (class 2620 OID 26207)
-- Name: trg_ctd2_clin_inhib_effect; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_ctd2_clin_inhib_effect BEFORE INSERT ON ctd2_clin_inhib_effect FOR EACH ROW EXECUTE PROCEDURE tf_trg_ctd2_clin_inhib_effect();


--
-- TOC entry 4196 (class 2620 OID 26208)
-- Name: trg_ctd2_disease; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_ctd2_disease BEFORE INSERT ON ctd2_disease FOR EACH ROW EXECUTE PROCEDURE tf_trg_ctd2_disease();


--
-- TOC entry 4197 (class 2620 OID 26209)
-- Name: trg_ctd2_inhib_details; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_ctd2_inhib_details BEFORE INSERT ON ctd2_inhib_details FOR EACH ROW EXECUTE PROCEDURE tf_trg_ctd2_inhib_details();


--
-- TOC entry 4198 (class 2620 OID 26210)
-- Name: trg_ctd2_study_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_ctd2_study_id BEFORE INSERT ON ctd2_study FOR EACH ROW EXECUTE PROCEDURE tf_trg_ctd2_study_id();


--
-- TOC entry 4199 (class 2620 OID 26211)
-- Name: trg_ctd2_trial_details; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trg_ctd2_trial_details BEFORE INSERT ON ctd2_trial_details FOR EACH ROW EXECUTE PROCEDURE tf_trg_ctd2_trial_details();


--
-- TOC entry 4200 (class 2620 OID 26212)
-- Name: trig_clinical_trial_design_id; Type: TRIGGER; Schema: biomart; Owner: biomart
--

CREATE TRIGGER trig_clinical_trial_design_id BEFORE INSERT ON ctd_full FOR EACH ROW EXECUTE PROCEDURE tf_trig_clinical_trial_design_id();


--
-- TOC entry 4106 (class 2606 OID 26232)
-- Name: bio_assay_analysis_data_n_fk1; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_analysis_data
    ADD CONSTRAINT bio_assay_analysis_data_n_fk1 FOREIGN KEY (bio_assay_analysis_id) REFERENCES bio_assay_analysis(bio_assay_analysis_id);


--
-- TOC entry 4107 (class 2606 OID 26237)
-- Name: bio_assay_analysis_data_n_fk2; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_analysis_data
    ADD CONSTRAINT bio_assay_analysis_data_n_fk2 FOREIGN KEY (bio_experiment_id) REFERENCES bio_experiment(bio_experiment_id);


--
-- TOC entry 4108 (class 2606 OID 26242)
-- Name: bio_assay_analysis_data_n_fk3; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_analysis_data
    ADD CONSTRAINT bio_assay_analysis_data_n_fk3 FOREIGN KEY (bio_assay_platform_id) REFERENCES bio_assay_platform(bio_assay_platform_id);


--
-- TOC entry 4110 (class 2606 OID 26247)
-- Name: bio_assay_analysis_data_t_fk1; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_analysis_data_tea
    ADD CONSTRAINT bio_assay_analysis_data_t_fk1 FOREIGN KEY (bio_assay_analysis_id) REFERENCES bio_assay_analysis(bio_assay_analysis_id);


--
-- TOC entry 4111 (class 2606 OID 26252)
-- Name: bio_assay_analysis_data_t_fk2; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_analysis_data_tea
    ADD CONSTRAINT bio_assay_analysis_data_t_fk2 FOREIGN KEY (bio_experiment_id) REFERENCES bio_experiment(bio_experiment_id);


--
-- TOC entry 4112 (class 2606 OID 26257)
-- Name: bio_assay_analysis_data_t_fk3; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_analysis_data_tea
    ADD CONSTRAINT bio_assay_analysis_data_t_fk3 FOREIGN KEY (bio_assay_platform_id) REFERENCES bio_assay_platform(bio_assay_platform_id);


--
-- TOC entry 4105 (class 2606 OID 26262)
-- Name: bio_assay_ans_pltfm_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_analysis
    ADD CONSTRAINT bio_assay_ans_pltfm_fk FOREIGN KEY (bio_asy_analysis_pltfm_id) REFERENCES bio_asy_analysis_pltfm(bio_asy_analysis_pltfm_id);


--
-- TOC entry 4122 (class 2606 OID 26267)
-- Name: bio_assay_sample_bio_assay_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_sample
    ADD CONSTRAINT bio_assay_sample_bio_assay_fk FOREIGN KEY (bio_assay_id) REFERENCES bio_assay(bio_assay_id);


--
-- TOC entry 4123 (class 2606 OID 26272)
-- Name: bio_assay_sample_bio_sample_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_sample
    ADD CONSTRAINT bio_assay_sample_bio_sample_fk FOREIGN KEY (bio_sample_id) REFERENCES bio_sample(bio_sample_id);


--
-- TOC entry 4109 (class 2606 OID 26277)
-- Name: bio_asy_ad_fg_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_analysis_data
    ADD CONSTRAINT bio_asy_ad_fg_fk FOREIGN KEY (bio_assay_feature_group_id) REFERENCES bio_assay_feature_group(bio_assay_feature_group_id);


--
-- TOC entry 4113 (class 2606 OID 26282)
-- Name: bio_asy_ad_tea_fg_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_analysis_data_tea
    ADD CONSTRAINT bio_asy_ad_tea_fg_fk FOREIGN KEY (bio_assay_feature_group_id) REFERENCES bio_assay_feature_group(bio_assay_feature_group_id);


--
-- TOC entry 4103 (class 2606 OID 26287)
-- Name: bio_asy_asy_pfm_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay
    ADD CONSTRAINT bio_asy_asy_pfm_fk FOREIGN KEY (bio_assay_platform_id) REFERENCES bio_assay_platform(bio_assay_platform_id);


--
-- TOC entry 4114 (class 2606 OID 26292)
-- Name: bio_asy_dt_ds_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_data
    ADD CONSTRAINT bio_asy_dt_ds_fk FOREIGN KEY (bio_assay_dataset_id) REFERENCES bio_assay_dataset(bio_assay_dataset_id);


--
-- TOC entry 4117 (class 2606 OID 26297)
-- Name: bio_asy_dt_fg_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_data_stats
    ADD CONSTRAINT bio_asy_dt_fg_fk FOREIGN KEY (bio_assay_feature_group_id) REFERENCES bio_assay_feature_group(bio_assay_feature_group_id);


--
-- TOC entry 4118 (class 2606 OID 26302)
-- Name: bio_asy_dt_stat_exp_s_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_data_stats
    ADD CONSTRAINT bio_asy_dt_stat_exp_s_fk FOREIGN KEY (bio_experiment_id) REFERENCES bio_experiment(bio_experiment_id);


--
-- TOC entry 4119 (class 2606 OID 26307)
-- Name: bio_asy_dt_stats_ds_s_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_data_stats
    ADD CONSTRAINT bio_asy_dt_stats_ds_s_fk FOREIGN KEY (bio_assay_dataset_id) REFERENCES bio_assay_dataset(bio_assay_dataset_id);


--
-- TOC entry 4126 (class 2606 OID 26312)
-- Name: bio_asy_dt_stats_smp_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_asy_data_stats_all
    ADD CONSTRAINT bio_asy_dt_stats_smp_fk FOREIGN KEY (bio_sample_id) REFERENCES bio_sample(bio_sample_id);


--
-- TOC entry 4120 (class 2606 OID 26317)
-- Name: bio_asy_dt_stats_smp_s_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_data_stats
    ADD CONSTRAINT bio_asy_dt_stats_smp_s_fk FOREIGN KEY (bio_sample_id) REFERENCES bio_sample(bio_sample_id);


--
-- TOC entry 4115 (class 2606 OID 26322)
-- Name: bio_asy_exp_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_data
    ADD CONSTRAINT bio_asy_exp_fk FOREIGN KEY (bio_experiment_id) REFERENCES bio_experiment(bio_experiment_id);


--
-- TOC entry 4130 (class 2606 OID 26327)
-- Name: bio_cli_trial_time_trl_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_clinc_trial_time_pt
    ADD CONSTRAINT bio_cli_trial_time_trl_fk FOREIGN KEY (bio_experiment_id) REFERENCES bio_clinical_trial(bio_experiment_id);


--
-- TOC entry 4129 (class 2606 OID 26332)
-- Name: bio_clinc_trl_pt_grp_exp_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_clinc_trial_pt_group
    ADD CONSTRAINT bio_clinc_trl_pt_grp_exp_fk FOREIGN KEY (bio_experiment_id) REFERENCES bio_clinical_trial(bio_experiment_id);


--
-- TOC entry 4131 (class 2606 OID 26337)
-- Name: bio_clinical_trial_bio_experim; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_clinical_trial
    ADD CONSTRAINT bio_clinical_trial_bio_experim FOREIGN KEY (bio_experiment_id) REFERENCES bio_experiment(bio_experiment_id);


--
-- TOC entry 4128 (class 2606 OID 26342)
-- Name: bio_clinical_trial_property_bi; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_clinc_trial_attr
    ADD CONSTRAINT bio_clinical_trial_property_bi FOREIGN KEY (bio_experiment_id) REFERENCES bio_clinical_trial(bio_experiment_id);


--
-- TOC entry 4133 (class 2606 OID 26347)
-- Name: bio_content_ref_cont_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_content_reference
    ADD CONSTRAINT bio_content_ref_cont_fk FOREIGN KEY (bio_content_id) REFERENCES bio_content(bio_file_content_id);


--
-- TOC entry 4124 (class 2606 OID 26352)
-- Name: bio_data_anl_ds_anl_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_asy_analysis_dataset
    ADD CONSTRAINT bio_data_anl_ds_anl_fk FOREIGN KEY (bio_assay_analysis_id) REFERENCES bio_assay_analysis(bio_assay_analysis_id);


--
-- TOC entry 4125 (class 2606 OID 26357)
-- Name: bio_data_anl_ds_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_asy_analysis_dataset
    ADD CONSTRAINT bio_data_anl_ds_fk FOREIGN KEY (bio_assay_dataset_id) REFERENCES bio_assay_dataset(bio_assay_dataset_id);


--
-- TOC entry 4121 (class 2606 OID 26362)
-- Name: bio_dataset_experiment_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_dataset
    ADD CONSTRAINT bio_dataset_experiment_fk FOREIGN KEY (bio_experiment_id) REFERENCES bio_experiment(bio_experiment_id);


--
-- TOC entry 4136 (class 2606 OID 26367)
-- Name: bio_df_cmp_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_data_compound
    ADD CONSTRAINT bio_df_cmp_fk FOREIGN KEY (bio_compound_id) REFERENCES bio_compound(bio_compound_id);


--
-- TOC entry 4138 (class 2606 OID 26372)
-- Name: bio_df_disease_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_data_disease
    ADD CONSTRAINT bio_df_disease_fk FOREIGN KEY (bio_disease_id) REFERENCES bio_disease(bio_disease_id);


--
-- TOC entry 4116 (class 2606 OID 26377)
-- Name: bio_exp_data_fact_samp_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay_data
    ADD CONSTRAINT bio_exp_data_fact_samp_fk FOREIGN KEY (bio_sample_id) REFERENCES bio_sample(bio_sample_id);


--
-- TOC entry 4134 (class 2606 OID 26382)
-- Name: bio_ext_analys_ext_anl_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_curated_data
    ADD CONSTRAINT bio_ext_analys_ext_anl_fk FOREIGN KEY (bio_curation_dataset_id) REFERENCES bio_curation_dataset(bio_curation_dataset_id);


--
-- TOC entry 4135 (class 2606 OID 26387)
-- Name: bio_ext_anl_pltfm_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_curation_dataset
    ADD CONSTRAINT bio_ext_anl_pltfm_fk FOREIGN KEY (bio_asy_analysis_pltfm_id) REFERENCES bio_asy_analysis_pltfm(bio_asy_analysis_pltfm_id);


--
-- TOC entry 4141 (class 2606 OID 26392)
-- Name: bio_lit_alt_ref_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_lit_alt_data
    ADD CONSTRAINT bio_lit_alt_ref_fk FOREIGN KEY (bio_lit_ref_data_id) REFERENCES bio_lit_ref_data(bio_lit_ref_data_id);


--
-- TOC entry 4142 (class 2606 OID 26397)
-- Name: bio_lit_amd_alt_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_lit_amd_data
    ADD CONSTRAINT bio_lit_amd_alt_fk FOREIGN KEY (bio_lit_alt_data_id) REFERENCES bio_lit_alt_data(bio_lit_alt_data_id);


--
-- TOC entry 4139 (class 2606 OID 26402)
-- Name: bio_lit_curation_dataset_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_data_literature
    ADD CONSTRAINT bio_lit_curation_dataset_fk FOREIGN KEY (bio_curation_dataset_id) REFERENCES bio_curation_dataset(bio_curation_dataset_id);


--
-- TOC entry 4143 (class 2606 OID 26407)
-- Name: bio_lit_inh_ref_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_lit_inh_data
    ADD CONSTRAINT bio_lit_inh_ref_fk FOREIGN KEY (bio_lit_ref_data_id) REFERENCES bio_lit_ref_data(bio_lit_ref_data_id);


--
-- TOC entry 4144 (class 2606 OID 26412)
-- Name: bio_lit_int_ref_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_lit_int_data
    ADD CONSTRAINT bio_lit_int_ref_fk FOREIGN KEY (bio_lit_ref_data_id) REFERENCES bio_lit_ref_data(bio_lit_ref_data_id);


--
-- TOC entry 4145 (class 2606 OID 26417)
-- Name: bio_lit_pe_ref_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_lit_pe_data
    ADD CONSTRAINT bio_lit_pe_ref_fk FOREIGN KEY (bio_lit_ref_data_id) REFERENCES bio_lit_ref_data(bio_lit_ref_data_id);


--
-- TOC entry 4137 (class 2606 OID 26422)
-- Name: bio_marker_link_bio_marker_rel; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_data_correlation
    ADD CONSTRAINT bio_marker_link_bio_marker_rel FOREIGN KEY (bio_data_correl_descr_id) REFERENCES bio_data_correl_descr(bio_data_correl_descr_id);


--
-- TOC entry 4146 (class 2606 OID 26427)
-- Name: bio_patient_bio_clinic_tri_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_patient
    ADD CONSTRAINT bio_patient_bio_clinic_tri_fk FOREIGN KEY (bio_clinical_trial_p_group_id) REFERENCES bio_clinc_trial_pt_group(bio_clinical_trial_p_group_id);


--
-- TOC entry 4147 (class 2606 OID 26432)
-- Name: bio_patient_bio_clinical_trial; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_patient
    ADD CONSTRAINT bio_patient_bio_clinical_trial FOREIGN KEY (bio_experiment_id) REFERENCES bio_clinical_trial(bio_experiment_id);


--
-- TOC entry 4148 (class 2606 OID 26437)
-- Name: bio_patient_bio_subject_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_patient
    ADD CONSTRAINT bio_patient_bio_subject_fk FOREIGN KEY (bio_patient_id) REFERENCES bio_subject(bio_subject_id);


--
-- TOC entry 4151 (class 2606 OID 26442)
-- Name: bio_pt_attr_trl_attr_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_patient_event_attr
    ADD CONSTRAINT bio_pt_attr_trl_attr_fk FOREIGN KEY (bio_clinic_trial_attr_id) REFERENCES bio_clinc_trial_attr(bio_clinc_trial_attr_id);


--
-- TOC entry 4152 (class 2606 OID 26447)
-- Name: bio_pt_event_attr_evt_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_patient_event_attr
    ADD CONSTRAINT bio_pt_event_attr_evt_fk FOREIGN KEY (bio_patient_event_id) REFERENCES bio_patient_event(bio_patient_event_id);


--
-- TOC entry 4149 (class 2606 OID 26452)
-- Name: bio_pt_event_bio_pt_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_patient_event
    ADD CONSTRAINT bio_pt_event_bio_pt_fk FOREIGN KEY (bio_patient_id) REFERENCES bio_patient(bio_patient_id);


--
-- TOC entry 4150 (class 2606 OID 26457)
-- Name: bio_pt_event_bio_trl_tp_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_patient_event
    ADD CONSTRAINT bio_pt_event_bio_trl_tp_fk FOREIGN KEY (bio_clinic_trial_timepoint_id) REFERENCES bio_clinc_trial_time_pt(bio_clinc_trial_tm_pt_id);


--
-- TOC entry 4153 (class 2606 OID 26462)
-- Name: bio_sample_bio_subject_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_sample
    ADD CONSTRAINT bio_sample_bio_subject_fk FOREIGN KEY (bio_subject_id) REFERENCES bio_subject(bio_subject_id);


--
-- TOC entry 4154 (class 2606 OID 26467)
-- Name: bio_sample_cl_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_sample
    ADD CONSTRAINT bio_sample_cl_fk FOREIGN KEY (bio_cell_line_id) REFERENCES bio_cell_line(bio_cell_line_id);


--
-- TOC entry 4155 (class 2606 OID 26472)
-- Name: bio_sample_pt_evt_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_sample
    ADD CONSTRAINT bio_sample_pt_evt_fk FOREIGN KEY (bio_patient_event_id) REFERENCES bio_patient_event(bio_patient_event_id);


--
-- TOC entry 4140 (class 2606 OID 26477)
-- Name: bio_taxon_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_data_taxonomy
    ADD CONSTRAINT bio_taxon_fk FOREIGN KEY (bio_taxonomy_id) REFERENCES bio_taxonomy(bio_taxonomy_id);


--
-- TOC entry 4127 (class 2606 OID 26482)
-- Name: cd_disease_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_cell_line
    ADD CONSTRAINT cd_disease_fk FOREIGN KEY (bio_disease_id) REFERENCES bio_disease(bio_disease_id);


--
-- TOC entry 4104 (class 2606 OID 26487)
-- Name: dataset_experiment_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_assay
    ADD CONSTRAINT dataset_experiment_fk FOREIGN KEY (experiment_id) REFERENCES bio_experiment(bio_experiment_id);


--
-- TOC entry 4132 (class 2606 OID 26492)
-- Name: ext_file_cnt_cnt_repo_fk; Type: FK CONSTRAINT; Schema: biomart; Owner: biomart
--

ALTER TABLE ONLY bio_content
    ADD CONSTRAINT ext_file_cnt_cnt_repo_fk FOREIGN KEY (repository_id) REFERENCES bio_content_repository(bio_content_repo_id);





-- Completed on 2013-07-24 09:35:24 BST

--
-- PostgreSQL database dump complete
--

