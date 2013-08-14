--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-24 10:10:18 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 17 (class 2615 OID 24072)
-- Name: searchapp; Type: SCHEMA; Schema: -; Owner: searchapp
--

CREATE SCHEMA searchapp;


ALTER SCHEMA searchapp OWNER TO searchapp;

SET search_path = searchapp, pg_catalog;

--
-- TOC entry 732 (class 1255 OID 24193)
-- Name: bio_clinical_trial_uid(text, text, text); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION bio_clinical_trial_uid(trial_number text, title text, condition text) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN coalesce(TRIAL_NUMBER || '|', '') || coalesce(TITLE || '|', '') || coalesce(CONDITION, '');
END;
 
 
 
$$;


ALTER FUNCTION searchapp.bio_clinical_trial_uid(trial_number text, title text, condition text) OWNER TO searchapp;

--
-- TOC entry 733 (class 1255 OID 24194)
-- Name: bio_compound_uid(text, text, text); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION bio_compound_uid(cas_registry text, jnj_number text, cnto_number text) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN coalesce(CAS_REGISTRY || '|', '') || coalesce(JNJ_NUMBER || '|', '') || coalesce(CNTO_NUMBER, '');
END;
 
 
 
 
 
$$;


ALTER FUNCTION searchapp.bio_compound_uid(cas_registry text, jnj_number text, cnto_number text) OWNER TO searchapp;

--
-- TOC entry 734 (class 1255 OID 24195)
-- Name: refresh_search_bio_mkr_correl_fast_mv(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION refresh_search_bio_mkr_correl_fast_mv() RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN

  -- populate the fake "materialized view" (i.e. actually a table) by deleting everything from it and then re-populating
  -- eventually we need a smarter algorithm for doing this

    delete from searchapp.search_bio_mkr_correl_fast_mv;

    insert into searchapp.search_bio_mkr_correl_fast_mv
    (domain_object_id, asso_bio_marker_id, correl_type, value_metric,  mv_id)    
    select domain_object_id, asso_bio_marker_id, correl_type, value_metric,  mv_id
       from searchapp.search_bio_mkr_correl_fast_view;  

    return true;
END;
 
 
 
$$;


ALTER FUNCTION searchapp.refresh_search_bio_mkr_correl_fast_mv() OWNER TO searchapp;

--
-- TOC entry 735 (class 1255 OID 24196)
-- Name: tf_trgi_search_a_u_sec_access_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_a_u_sec_access_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.SEARCH_AUTH_USER_SEC_ACCESS_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_AUTH_USER_SEC_ACCESS_ID ;       end if;    RETURN NEW; end;



$$;


ALTER FUNCTION searchapp.tf_trgi_search_a_u_sec_access_id() OWNER TO searchapp;

--
-- TOC entry 736 (class 1255 OID 24197)
-- Name: tf_trgi_search_au_obj_access_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_au_obj_access_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if coalesce(NEW.AUTH_SEC_OBJ_ACCESS_ID::text, '') = '' then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.AUTH_SEC_OBJ_ACCESS_ID ;       end if;    RETURN NEW;
end;
$$;


ALTER FUNCTION searchapp.tf_trgi_search_au_obj_access_id() OWNER TO searchapp;

--
-- TOC entry 729 (class 1255 OID 24198)
-- Name: tf_trgi_search_au_prcpl_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_au_prcpl_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     
 if(coalesce(NEW.ID::text, '') = '' or NEW.ID = -2000) then       
 select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.ID ;      
 end if;     RETURN NEW;
end;
$$;


ALTER FUNCTION searchapp.tf_trgi_search_au_prcpl_id() OWNER TO searchapp;

--
-- TOC entry 737 (class 1255 OID 24199)
-- Name: tf_trgi_search_cust_fil_item_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_cust_fil_item_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin 
    if NEW.SEARCH_CUSTOM_FILTER_ITEM_ID is null then select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_CUSTOM_FILTER_ITEM_ID ; end if; RETURN NEW;
end;



$$;


ALTER FUNCTION searchapp.tf_trgi_search_cust_fil_item_id() OWNER TO searchapp;

--
-- TOC entry 738 (class 1255 OID 24200)
-- Name: tf_trgi_search_custom_filter_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_custom_filter_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin 
    if NEW.SEARCH_CUSTOM_FILTER_ID is null then select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_CUSTOM_FILTER_ID ; end if; RETURN NEW;
end;



$$;


ALTER FUNCTION searchapp.tf_trgi_search_custom_filter_id() OWNER TO searchapp;

--
-- TOC entry 739 (class 1255 OID 24201)
-- Name: tf_trgi_search_keyword_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_keyword_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.SEARCH_KEYWORD_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_KEYWORD_ID ;       end if;   RETURN NEW; end;




$$;


ALTER FUNCTION searchapp.tf_trgi_search_keyword_id() OWNER TO searchapp;

--
-- TOC entry 740 (class 1255 OID 24202)
-- Name: tf_trgi_search_keyword_term_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_keyword_term_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.SEARCH_KEYWORD_TERM_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_KEYWORD_TERM_ID ;       end if;    RETURN NEW;
end;

$$;


ALTER FUNCTION searchapp.tf_trgi_search_keyword_term_id() OWNER TO searchapp;

--
-- TOC entry 741 (class 1255 OID 24203)
-- Name: tf_trgi_search_sec_acc_level_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_sec_acc_level_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.SEARCH_SEC_ACCESS_LEVEL_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_SEC_ACCESS_LEVEL_ID ;       end if;   RETURN NEW; end;



$$;


ALTER FUNCTION searchapp.tf_trgi_search_sec_acc_level_id() OWNER TO searchapp;

--
-- TOC entry 742 (class 1255 OID 24204)
-- Name: tf_trgi_search_sec_obj_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_sec_obj_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.SEARCH_SECURE_OBJECT_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_SECURE_OBJECT_ID ;       end if;  RETURN NEW;  end;



$$;


ALTER FUNCTION searchapp.tf_trgi_search_sec_obj_id() OWNER TO searchapp;

--
-- TOC entry 743 (class 1255 OID 24205)
-- Name: tf_trgi_search_sec_obj_path_id(); Type: FUNCTION; Schema: searchapp; Owner: searchapp
--

CREATE FUNCTION tf_trgi_search_sec_obj_path_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin     if NEW.SEARCH_SECURE_OBJ_PATH_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_SECURE_OBJ_PATH_ID ;       end if;  RETURN NEW;  end;



$$;


ALTER FUNCTION searchapp.tf_trgi_search_sec_obj_path_id() OWNER TO searchapp;

--
-- TOC entry 2866 (class 2617 OID 24206)
-- Name: =; Type: OPERATOR; Schema: searchapp; Owner: gustavo
--

--CREATE OPERATOR = (
--    PROCEDURE = public.equal_numeric_integer,
--    LEFTARG = numeric,
--    RIGHTARG = character varying
--);
--
--
--ALTER OPERATOR searchapp.= (numeric, character varying) OWNER TO gustavo;

--
-- TOC entry 491 (class 1259 OID 25594)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: searchapp; Owner: searchapp
--

CREATE SEQUENCE hibernate_sequence
    START WITH 100041
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE searchapp.hibernate_sequence OWNER TO searchapp;

SET default_tablespace = search_app;

SET default_with_oids = false;

--
-- TOC entry 492 (class 1259 OID 25596)
-- Name: plugin; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE plugin (
    plugin_seq bigint NOT NULL,
    name character varying(200) NOT NULL,
    plugin_name character varying(90) NOT NULL,
    has_modules character(1) DEFAULT 'N'::bpchar,
    has_form character(1) DEFAULT 'N'::bpchar,
    default_link character varying(70) NOT NULL,
    form_link character varying(70),
    form_page character varying(100),
    active character(1)
);


ALTER TABLE searchapp.plugin OWNER TO searchapp;

--
-- TOC entry 493 (class 1259 OID 25604)
-- Name: plugin_module; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE plugin_module (
    module_seq bigint NOT NULL,
    plugin_seq bigint NOT NULL,
    name character varying(70) NOT NULL,
    params text,
    version character varying(10) DEFAULT 0.1,
    active character(1) DEFAULT 'Y'::bpchar,
    has_form character(1) DEFAULT 'N'::bpchar,
    form_link character varying(90),
    form_page character varying(90),
    module_name character varying(50) NOT NULL,
    category character varying(50)
);


ALTER TABLE searchapp.plugin_module OWNER TO searchapp;

--
-- TOC entry 494 (class 1259 OID 25613)
-- Name: plugin_module_seq; Type: SEQUENCE; Schema: searchapp; Owner: searchapp
--

CREATE SEQUENCE plugin_module_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE searchapp.plugin_module_seq OWNER TO searchapp;

--
-- TOC entry 495 (class 1259 OID 25615)
-- Name: plugin_seq; Type: SEQUENCE; Schema: searchapp; Owner: searchapp
--

CREATE SEQUENCE plugin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE searchapp.plugin_seq OWNER TO searchapp;

--
-- TOC entry 496 (class 1259 OID 25617)
-- Name: search_app_access_log; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_app_access_log (
    id bigint,
    access_time timestamp without time zone,
    event character varying(255),
    request_url character varying(255),
    user_name character varying(255),
    event_message text
);


ALTER TABLE searchapp.search_app_access_log OWNER TO searchapp;

--
-- TOC entry 497 (class 1259 OID 25623)
-- Name: search_auth_group; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_auth_group (
    id bigint NOT NULL,
    group_category character varying(255)
);


ALTER TABLE searchapp.search_auth_group OWNER TO searchapp;

--
-- TOC entry 498 (class 1259 OID 25626)
-- Name: search_auth_group_member; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_auth_group_member (
    auth_user_id bigint,
    auth_group_id bigint
);


ALTER TABLE searchapp.search_auth_group_member OWNER TO searchapp;

--
-- TOC entry 499 (class 1259 OID 25629)
-- Name: search_auth_principal; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_auth_principal (
    id bigint NOT NULL,
    principal_type character varying(255),
    date_created timestamp without time zone NOT NULL,
    description character varying(255),
    last_updated timestamp without time zone NOT NULL,
    name character varying(255),
    unique_id character varying(255),
    enabled boolean
);


ALTER TABLE searchapp.search_auth_principal OWNER TO searchapp;

--
-- TOC entry 500 (class 1259 OID 25635)
-- Name: search_auth_sec_object_access; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_auth_sec_object_access (
    auth_sec_obj_access_id bigint NOT NULL,
    auth_principal_id bigint,
    secure_object_id bigint,
    secure_access_level_id bigint
);


ALTER TABLE searchapp.search_auth_sec_object_access OWNER TO searchapp;

--
-- TOC entry 501 (class 1259 OID 25638)
-- Name: search_auth_user; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_auth_user (
    id bigint NOT NULL,
    email character varying(255),
    email_show boolean,
    passwd character varying(255),
    user_real_name character varying(255),
    username character varying(255)
);


ALTER TABLE searchapp.search_auth_user OWNER TO searchapp;

--
-- TOC entry 502 (class 1259 OID 25644)
-- Name: search_auth_user_sec_access; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_auth_user_sec_access (
    search_auth_user_sec_access_id bigint NOT NULL,
    search_auth_user_id bigint,
    search_secure_object_id bigint,
    search_sec_access_level_id bigint
);


ALTER TABLE searchapp.search_auth_user_sec_access OWNER TO searchapp;

--
-- TOC entry 503 (class 1259 OID 25647)
-- Name: search_auth_user_sec_access_v; Type: VIEW; Schema: searchapp; Owner: searchapp
--

CREATE VIEW search_auth_user_sec_access_v AS
    (SELECT sasoa.auth_sec_obj_access_id AS search_auth_user_sec_access_id, sasoa.auth_principal_id AS search_auth_user_id, sasoa.secure_object_id AS search_secure_object_id, sasoa.secure_access_level_id AS search_sec_access_level_id FROM search_auth_user sau, search_auth_sec_object_access sasoa WHERE (sau.id = sasoa.auth_principal_id) UNION SELECT sasoa.auth_sec_obj_access_id AS search_auth_user_sec_access_id, sagm.auth_user_id AS search_auth_user_id, sasoa.secure_object_id AS search_secure_object_id, sasoa.secure_access_level_id AS search_sec_access_level_id FROM search_auth_group sag, search_auth_group_member sagm, search_auth_sec_object_access sasoa WHERE ((sag.id = sagm.auth_group_id) AND (sag.id = sasoa.auth_principal_id))) UNION SELECT sasoa.auth_sec_obj_access_id AS search_auth_user_sec_access_id, NULL::bigint AS search_auth_user_id, sasoa.secure_object_id AS search_secure_object_id, sasoa.secure_access_level_id AS search_sec_access_level_id FROM search_auth_group sag, search_auth_sec_object_access sasoa WHERE (((sag.group_category)::text = 'EVERYONE_GROUP'::text) AND (sag.id = sasoa.auth_principal_id));


ALTER TABLE searchapp.search_auth_user_sec_access_v OWNER TO searchapp;

--
-- TOC entry 504 (class 1259 OID 25652)
-- Name: search_bio_mkr_correl_fast_mv; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_bio_mkr_correl_fast_mv (
    domain_object_id bigint,
    asso_bio_marker_id bigint,
    correl_type character varying(19),
    value_metric bigint,
    mv_id bigint
);


ALTER TABLE searchapp.search_bio_mkr_correl_fast_mv OWNER TO searchapp;

--
-- TOC entry 505 (class 1259 OID 25655)
-- Name: search_gene_signature; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_gene_signature (
    search_gene_signature_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(1000),
    unique_id character varying(50),
    create_date timestamp without time zone NOT NULL,
    created_by_auth_user_id bigint NOT NULL,
    last_modified_date timestamp without time zone,
    modified_by_auth_user_id bigint,
    version_number character varying(50),
    public_flag boolean DEFAULT false,
    deleted_flag boolean DEFAULT false,
    parent_gene_signature_id bigint,
    source_concept_id bigint,
    source_other character varying(255),
    owner_concept_id bigint,
    stimulus_description character varying(1000),
    stimulus_dosing character varying(255),
    treatment_description character varying(1000),
    treatment_dosing character varying(255),
    treatment_bio_compound_id bigint,
    treatment_protocol_number character varying(50),
    pmid_list character varying(255),
    species_concept_id bigint NOT NULL,
    species_mouse_src_concept_id bigint,
    species_mouse_detail character varying(255),
    tissue_type_concept_id bigint,
    experiment_type_concept_id bigint,
    experiment_type_in_vivo_descr character varying(255),
    experiment_type_atcc_ref character varying(255),
    analytic_cat_concept_id bigint,
    analytic_cat_other character varying(255),
    bio_assay_platform_id bigint NOT NULL,
    analyst_name character varying(100),
    norm_method_concept_id bigint,
    norm_method_other character varying(255),
    analysis_method_concept_id bigint,
    analysis_method_other character varying(255),
    multiple_testing_correction boolean,
    p_value_cutoff_concept_id bigint NOT NULL,
    upload_file character varying(255) NOT NULL,
    search_gene_sig_file_schema_id bigint DEFAULT 1,
    fold_chg_metric_concept_id bigint,
    experiment_type_cell_line_id bigint
);


ALTER TABLE searchapp.search_gene_signature OWNER TO searchapp;

--
-- TOC entry 506 (class 1259 OID 25664)
-- Name: search_gene_signature_item; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_gene_signature_item (
    search_gene_signature_id bigint NOT NULL,
    bio_marker_id bigint,
    fold_chg_metric bigint,
    bio_data_unique_id character varying(200),
    id bigint NOT NULL,
    bio_assay_feature_group_id bigint
);


ALTER TABLE searchapp.search_gene_signature_item OWNER TO searchapp;

--
-- TOC entry 507 (class 1259 OID 25667)
-- Name: search_bio_mkr_correl_fast_view; Type: VIEW; Schema: searchapp; Owner: searchapp
--

CREATE VIEW search_bio_mkr_correl_fast_view AS
    SELECT i.search_gene_signature_id AS domain_object_id, i.bio_marker_id AS asso_bio_marker_id, 'GENE_SIGNATURE_ITEM' AS correl_type, CASE WHEN (i.fold_chg_metric IS NULL) THEN (1)::bigint ELSE i.fold_chg_metric END AS value_metric, 3 AS mv_id FROM search_gene_signature_item i, search_gene_signature gs WHERE ((i.search_gene_signature_id = gs.search_gene_signature_id) AND (gs.deleted_flag = false));


ALTER TABLE searchapp.search_bio_mkr_correl_fast_view OWNER TO searchapp;

--
-- TOC entry 508 (class 1259 OID 25672)
-- Name: search_custom_filter; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_custom_filter (
    search_custom_filter_id bigint NOT NULL,
    search_user_id bigint NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(2000),
    private character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE searchapp.search_custom_filter OWNER TO searchapp;

--
-- TOC entry 509 (class 1259 OID 25679)
-- Name: search_custom_filter_item; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_custom_filter_item (
    search_custom_filter_item_id bigint NOT NULL,
    search_custom_filter_id bigint NOT NULL,
    unique_id character varying(200) NOT NULL,
    bio_data_type character varying(100) NOT NULL
);


ALTER TABLE searchapp.search_custom_filter_item OWNER TO searchapp;

--
-- TOC entry 510 (class 1259 OID 25682)
-- Name: search_gene_sig_file_schema; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_gene_sig_file_schema (
    search_gene_sig_file_schema_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    number_columns bigint DEFAULT 2,
    supported boolean DEFAULT false
);


ALTER TABLE searchapp.search_gene_sig_file_schema OWNER TO searchapp;

--
-- TOC entry 511 (class 1259 OID 25687)
-- Name: search_keyword; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_keyword (
    keyword character varying(200),
    bio_data_id bigint,
    unique_id character varying(500) NOT NULL,
    search_keyword_id bigint NOT NULL,
    data_category character varying(200) NOT NULL,
    source_code character varying(100),
    display_data_category character varying(200),
    owner_auth_user_id bigint
);


ALTER TABLE searchapp.search_keyword OWNER TO searchapp;

--
-- TOC entry 512 (class 1259 OID 25693)
-- Name: search_keyword_term; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_keyword_term (
    keyword_term character varying(200),
    search_keyword_id bigint,
    rank bigint,
    search_keyword_term_id bigint NOT NULL,
    term_length bigint,
    owner_auth_user_id bigint
);


ALTER TABLE searchapp.search_keyword_term OWNER TO searchapp;

--
-- TOC entry 513 (class 1259 OID 25696)
-- Name: search_request_map; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_request_map (
    id bigint,
    version bigint,
    config_attribute character varying(255),
    url character varying(255)
);


ALTER TABLE searchapp.search_request_map OWNER TO searchapp;

--
-- TOC entry 514 (class 1259 OID 25702)
-- Name: search_role; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_role (
    id bigint NOT NULL,
    version bigint,
    authority character varying(255),
    description character varying(255)
);


ALTER TABLE searchapp.search_role OWNER TO searchapp;

--
-- TOC entry 515 (class 1259 OID 25708)
-- Name: search_role_auth_user; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_role_auth_user (
    people_id bigint,
    authorities_id bigint
);


ALTER TABLE searchapp.search_role_auth_user OWNER TO searchapp;

--
-- TOC entry 516 (class 1259 OID 25711)
-- Name: search_sec_access_level; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_sec_access_level (
    search_sec_access_level_id bigint NOT NULL,
    access_level_name character varying(200),
    access_level_value bigint
);


ALTER TABLE searchapp.search_sec_access_level OWNER TO searchapp;

--
-- TOC entry 517 (class 1259 OID 25714)
-- Name: search_secure_object; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_secure_object (
    search_secure_object_id bigint NOT NULL,
    bio_data_id bigint,
    display_name character varying(100),
    data_type character varying(200),
    bio_data_unique_id character varying(200)
);


ALTER TABLE searchapp.search_secure_object OWNER TO searchapp;

--
-- TOC entry 518 (class 1259 OID 25720)
-- Name: search_secure_object_path; Type: TABLE; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE TABLE search_secure_object_path (
    search_secure_object_id bigint,
    i2b2_concept_path character varying(2000),
    search_secure_obj_path_id bigint NOT NULL
);


ALTER TABLE searchapp.search_secure_object_path OWNER TO searchapp;

SET default_tablespace = '';

--
-- TOC entry 519 (class 1259 OID 25726)
-- Name: search_user_settings; Type: TABLE; Schema: searchapp; Owner: biomart_user; Tablespace: 
--

CREATE TABLE search_user_settings (
    id bigint NOT NULL,
    setting_name character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    setting_value character varying(255) NOT NULL
);


ALTER TABLE searchapp.search_user_settings OWNER TO biomart_user;

--
-- TOC entry 520 (class 1259 OID 25732)
-- Name: seq_search_data_id; Type: SEQUENCE; Schema: searchapp; Owner: searchapp
--

CREATE SEQUENCE seq_search_data_id
    START WITH 1789472
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;


ALTER TABLE searchapp.seq_search_data_id OWNER TO searchapp;

SET default_tablespace = search_app;

--
-- TOC entry 3855 (class 2606 OID 25989)
-- Name: pk_auth_usr_group; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_auth_group
    ADD CONSTRAINT pk_auth_usr_group PRIMARY KEY (id);


--
-- TOC entry 3857 (class 2606 OID 25991)
-- Name: pk_search_principal; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_auth_principal
    ADD CONSTRAINT pk_search_principal PRIMARY KEY (id);


--
-- TOC entry 3853 (class 2606 OID 25993)
-- Name: plugin_module_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY plugin_module
    ADD CONSTRAINT plugin_module_pk PRIMARY KEY (module_seq);


--
-- TOC entry 3851 (class 2606 OID 25995)
-- Name: plugin_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY plugin
    ADD CONSTRAINT plugin_pk PRIMARY KEY (plugin_seq);


--
-- TOC entry 3859 (class 2606 OID 25997)
-- Name: sch_sec_a_a_s_a_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_auth_sec_object_access
    ADD CONSTRAINT sch_sec_a_a_s_a_pk PRIMARY KEY (auth_sec_obj_access_id);


--
-- TOC entry 3871 (class 2606 OID 25999)
-- Name: search_cust_fil_item_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_custom_filter_item
    ADD CONSTRAINT search_cust_fil_item_pk PRIMARY KEY (search_custom_filter_item_id);


--
-- TOC entry 3869 (class 2606 OID 26001)
-- Name: search_custom_filter_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_custom_filter
    ADD CONSTRAINT search_custom_filter_pk PRIMARY KEY (search_custom_filter_id);


--
-- TOC entry 3865 (class 2606 OID 26003)
-- Name: search_gene_sig_descr_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_gene_signature
    ADD CONSTRAINT search_gene_sig_descr_pk PRIMARY KEY (search_gene_signature_id);


--
-- TOC entry 3873 (class 2606 OID 26005)
-- Name: search_gene_sig_file_sche_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_gene_sig_file_schema
    ADD CONSTRAINT search_gene_sig_file_sche_pk PRIMARY KEY (search_gene_sig_file_schema_id);


--
-- TOC entry 3867 (class 2606 OID 26007)
-- Name: search_gene_signature_ite_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_gene_signature_item
    ADD CONSTRAINT search_gene_signature_ite_pk PRIMARY KEY (id);


--
-- TOC entry 3878 (class 2606 OID 26009)
-- Name: search_keyword_uk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_keyword
    ADD CONSTRAINT search_keyword_uk UNIQUE (unique_id, data_category);


--
-- TOC entry 3880 (class 2606 OID 26011)
-- Name: search_kw_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_keyword
    ADD CONSTRAINT search_kw_pk PRIMARY KEY (search_keyword_id);


--
-- TOC entry 3882 (class 2606 OID 26013)
-- Name: search_kw_term_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_keyword_term
    ADD CONSTRAINT search_kw_term_pk PRIMARY KEY (search_keyword_term_id);


--
-- TOC entry 3863 (class 2606 OID 26015)
-- Name: search_sec_a_u_s_a_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_auth_user_sec_access
    ADD CONSTRAINT search_sec_a_u_s_a_pk PRIMARY KEY (search_auth_user_sec_access_id);


--
-- TOC entry 3887 (class 2606 OID 26017)
-- Name: search_sec_ac_level_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_sec_access_level
    ADD CONSTRAINT search_sec_ac_level_pk PRIMARY KEY (search_sec_access_level_id);


--
-- TOC entry 3891 (class 2606 OID 26019)
-- Name: search_sec_obj__path_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_secure_object_path
    ADD CONSTRAINT search_sec_obj__path_pk PRIMARY KEY (search_secure_obj_path_id);


--
-- TOC entry 3889 (class 2606 OID 26021)
-- Name: search_sec_obj_pk; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_secure_object
    ADD CONSTRAINT search_sec_obj_pk PRIMARY KEY (search_secure_object_id);


SET default_tablespace = '';

--
-- TOC entry 3893 (class 2606 OID 26023)
-- Name: search_user_settings_pkey; Type: CONSTRAINT; Schema: searchapp; Owner: biomart_user; Tablespace: 
--

ALTER TABLE ONLY search_user_settings
    ADD CONSTRAINT search_user_settings_pkey PRIMARY KEY (id);


SET default_tablespace = search_app;

--
-- TOC entry 3861 (class 2606 OID 26025)
-- Name: sys_c0011119; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_auth_user
    ADD CONSTRAINT sys_c0011119 PRIMARY KEY (id);


--
-- TOC entry 3885 (class 2606 OID 26027)
-- Name: sys_c0011120; Type: CONSTRAINT; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

ALTER TABLE ONLY search_role
    ADD CONSTRAINT sys_c0011120 PRIMARY KEY (id);


--
-- TOC entry 3874 (class 1259 OID 26164)
-- Name: search_keyword_index1; Type: INDEX; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE INDEX search_keyword_index1 ON search_keyword USING btree (keyword);


--
-- TOC entry 3875 (class 1259 OID 26165)
-- Name: search_keyword_index2; Type: INDEX; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE INDEX search_keyword_index2 ON search_keyword USING btree (bio_data_id);


--
-- TOC entry 3876 (class 1259 OID 26166)
-- Name: search_keyword_index3; Type: INDEX; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE INDEX search_keyword_index3 ON search_keyword USING btree (owner_auth_user_id);


--
-- TOC entry 3883 (class 1259 OID 26167)
-- Name: search_kw_term_skid_idx; Type: INDEX; Schema: searchapp; Owner: searchapp; Tablespace: search_app
--

CREATE INDEX search_kw_term_skid_idx ON search_keyword_term USING btree (search_keyword_id);


--
-- TOC entry 3914 (class 2620 OID 26222)
-- Name: trgi_search_a_u_sec_access_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_a_u_sec_access_id BEFORE INSERT ON search_auth_user_sec_access FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_a_u_sec_access_id();


--
-- TOC entry 3913 (class 2620 OID 26223)
-- Name: trgi_search_au_obj_access_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_au_obj_access_id BEFORE INSERT ON search_auth_sec_object_access FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_au_obj_access_id();


--
-- TOC entry 3912 (class 2620 OID 26224)
-- Name: trgi_search_au_prcpl_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_au_prcpl_id BEFORE INSERT ON search_auth_principal FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_au_prcpl_id();


--
-- TOC entry 3916 (class 2620 OID 26225)
-- Name: trgi_search_cust_fil_item_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_cust_fil_item_id BEFORE INSERT ON search_custom_filter_item FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_cust_fil_item_id();


--
-- TOC entry 3915 (class 2620 OID 26226)
-- Name: trgi_search_custom_filter_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_custom_filter_id BEFORE INSERT ON search_custom_filter FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_custom_filter_id();


--
-- TOC entry 3917 (class 2620 OID 26227)
-- Name: trgi_search_keyword_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_keyword_id BEFORE INSERT ON search_keyword FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_keyword_id();


--
-- TOC entry 3918 (class 2620 OID 26228)
-- Name: trgi_search_keyword_term_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_keyword_term_id BEFORE INSERT ON search_keyword_term FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_keyword_term_id();


--
-- TOC entry 3919 (class 2620 OID 26229)
-- Name: trgi_search_sec_acc_level_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_sec_acc_level_id BEFORE INSERT ON search_sec_access_level FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_sec_acc_level_id();


--
-- TOC entry 3920 (class 2620 OID 26230)
-- Name: trgi_search_sec_obj_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_sec_obj_id BEFORE INSERT ON search_secure_object FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_sec_obj_id();


--
-- TOC entry 3921 (class 2620 OID 26231)
-- Name: trgi_search_sec_obj_path_id; Type: TRIGGER; Schema: searchapp; Owner: searchapp
--

CREATE TRIGGER trgi_search_sec_obj_path_id BEFORE INSERT ON search_secure_object_path FOR EACH ROW EXECUTE PROCEDURE tf_trgi_search_sec_obj_path_id();


--
-- TOC entry 3910 (class 2606 OID 26567)
-- Name: fkfb14ef79287e0cac; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_role_auth_user
    ADD CONSTRAINT fkfb14ef79287e0cac FOREIGN KEY (authorities_id) REFERENCES search_auth_user(id);


--
-- TOC entry 3911 (class 2606 OID 26572)
-- Name: fkfb14ef798f01f561; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_role_auth_user
    ADD CONSTRAINT fkfb14ef798f01f561 FOREIGN KEY (people_id) REFERENCES search_role(id);


--
-- TOC entry 3905 (class 2606 OID 26577)
-- Name: gene_sig_create_auth_user_fk1; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_gene_signature
    ADD CONSTRAINT gene_sig_create_auth_user_fk1 FOREIGN KEY (created_by_auth_user_id) REFERENCES search_auth_user(id);


--
-- TOC entry 3906 (class 2606 OID 26582)
-- Name: gene_sig_file_schema_fk1; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_gene_signature
    ADD CONSTRAINT gene_sig_file_schema_fk1 FOREIGN KEY (search_gene_sig_file_schema_id) REFERENCES search_gene_sig_file_schema(search_gene_sig_file_schema_id);


--
-- TOC entry 3907 (class 2606 OID 26587)
-- Name: gene_sig_mod_auth_user_fk1; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_gene_signature
    ADD CONSTRAINT gene_sig_mod_auth_user_fk1 FOREIGN KEY (modified_by_auth_user_id) REFERENCES search_auth_user(id);


--
-- TOC entry 3908 (class 2606 OID 26592)
-- Name: gene_sig_parent_fk1; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_gene_signature
    ADD CONSTRAINT gene_sig_parent_fk1 FOREIGN KEY (parent_gene_signature_id) REFERENCES search_gene_signature(search_gene_signature_id);


--
-- TOC entry 3894 (class 2606 OID 26597)
-- Name: plugin_module_plugin_fk1; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY plugin_module
    ADD CONSTRAINT plugin_module_plugin_fk1 FOREIGN KEY (plugin_seq) REFERENCES plugin(plugin_seq);


--
-- TOC entry 3898 (class 2606 OID 26602)
-- Name: sch_sec_a_u_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_sec_object_access
    ADD CONSTRAINT sch_sec_a_u_fk FOREIGN KEY (auth_principal_id) REFERENCES search_auth_principal(id);


--
-- TOC entry 3899 (class 2606 OID 26607)
-- Name: sch_sec_s_a_l_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_sec_object_access
    ADD CONSTRAINT sch_sec_s_a_l_fk FOREIGN KEY (secure_access_level_id) REFERENCES search_sec_access_level(search_sec_access_level_id);


--
-- TOC entry 3900 (class 2606 OID 26612)
-- Name: sch_sec_s_o_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_sec_object_access
    ADD CONSTRAINT sch_sec_s_o_fk FOREIGN KEY (secure_object_id) REFERENCES search_secure_object(search_secure_object_id);


--
-- TOC entry 3896 (class 2606 OID 26617)
-- Name: sch_user_gp_m_grp_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_group_member
    ADD CONSTRAINT sch_user_gp_m_grp_fk FOREIGN KEY (auth_group_id) REFERENCES search_auth_group(id);


--
-- TOC entry 3897 (class 2606 OID 26622)
-- Name: sch_user_gp_m_usr_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_group_member
    ADD CONSTRAINT sch_user_gp_m_usr_fk FOREIGN KEY (auth_user_id) REFERENCES search_auth_principal(id);


--
-- TOC entry 3909 (class 2606 OID 26627)
-- Name: search_kw_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_keyword_term
    ADD CONSTRAINT search_kw_fk FOREIGN KEY (search_keyword_id) REFERENCES search_keyword(search_keyword_id);


--
-- TOC entry 3902 (class 2606 OID 26632)
-- Name: search_sec_a_u_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_user_sec_access
    ADD CONSTRAINT search_sec_a_u_fk FOREIGN KEY (search_auth_user_id) REFERENCES search_auth_user(id);


--
-- TOC entry 3903 (class 2606 OID 26637)
-- Name: search_sec_s_a_l_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_user_sec_access
    ADD CONSTRAINT search_sec_s_a_l_fk FOREIGN KEY (search_sec_access_level_id) REFERENCES search_sec_access_level(search_sec_access_level_id);


--
-- TOC entry 3904 (class 2606 OID 26642)
-- Name: search_sec_s_o_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_user_sec_access
    ADD CONSTRAINT search_sec_s_o_fk FOREIGN KEY (search_secure_object_id) REFERENCES search_secure_object(search_secure_object_id);


--
-- TOC entry 3895 (class 2606 OID 26647)
-- Name: sh_auth_gp_id_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_group
    ADD CONSTRAINT sh_auth_gp_id_fk FOREIGN KEY (id) REFERENCES search_auth_principal(id);


--
-- TOC entry 3901 (class 2606 OID 26652)
-- Name: sh_auth_user_id_fk; Type: FK CONSTRAINT; Schema: searchapp; Owner: searchapp
--

ALTER TABLE ONLY search_auth_user
    ADD CONSTRAINT sh_auth_user_id_fk FOREIGN KEY (id) REFERENCES search_auth_principal(id);



-- Completed on 2013-07-24 10:10:18 BST

--
-- PostgreSQL database dump complete
--

