--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-24 09:49:31 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 13 (class 2615 OID 24069)
-- Name: i2b2metadata; Type: SCHEMA; Schema: -; Owner: i2b2metadata
--

CREATE SCHEMA i2b2metadata;


ALTER SCHEMA i2b2metadata OWNER TO i2b2metadata;

SET search_path = i2b2metadata, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 384 (class 1259 OID 25164)
-- Name: birn; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE birn (
    c_hlevel numeric(22,0) NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum numeric(22,0),
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50)
);


ALTER TABLE i2b2metadata.birn OWNER TO i2b2metadata;

--
-- TOC entry 385 (class 1259 OID 25170)
-- Name: custom_meta; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE custom_meta (
    c_hlevel numeric(22,0) NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum numeric(22,0),
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50)
);


ALTER TABLE i2b2metadata.custom_meta OWNER TO i2b2metadata;

--
-- TOC entry 386 (class 1259 OID 25176)
-- Name: i2b2; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE i2b2 (
    c_hlevel numeric(22,0) NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum numeric(22,0),
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(150) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50)
);


ALTER TABLE i2b2metadata.i2b2 OWNER TO i2b2metadata;

--
-- TOC entry 387 (class 1259 OID 25182)
-- Name: i2b2_secure; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE i2b2_secure (
    c_hlevel numeric(22,0),
    c_fullname character varying(700),
    c_name character varying(2000),
    c_synonym_cd character(1),
    c_visualattributes character(3),
    c_totalnum numeric(22,0),
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50),
    c_tablename character varying(150),
    c_columnname character varying(50),
    c_columndatatype character varying(50),
    c_operator character varying(10),
    c_dimcode character varying(700),
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700),
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50),
    i2b2_id numeric(18,0),
    secure_obj_token character varying(50)
);


ALTER TABLE i2b2metadata.i2b2_secure OWNER TO i2b2metadata;

--
-- TOC entry 388 (class 1259 OID 25188)
-- Name: i2b2_tags; Type: TABLE; Schema: i2b2metadata; Owner: gustavo; Tablespace: 
--

CREATE TABLE i2b2_tags (
    tag_id integer NOT NULL,
    path character varying(400),
    tag character varying(400),
    tag_type character varying(400),
    tags_idx integer NOT NULL
);


ALTER TABLE i2b2metadata.i2b2_tags OWNER TO i2b2metadata;

--
-- TOC entry 389 (class 1259 OID 25194)
-- Name: ont_sq_ps_prid; Type: SEQUENCE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE SEQUENCE ont_sq_ps_prid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2metadata.ont_sq_ps_prid OWNER TO i2b2metadata;

--
-- TOC entry 390 (class 1259 OID 25196)
-- Name: ont_process_status; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE ont_process_status (
    process_id numeric(5,0) DEFAULT nextval('ont_sq_ps_prid'::regclass) NOT NULL,
    process_type_cd character varying(50),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    process_step_cd character varying(50),
    process_status_cd character varying(50),
    crc_upload_id numeric(38,0),
    status_cd character varying(50),
    message character varying(2000),
    entry_date timestamp without time zone,
    change_date timestamp without time zone,
    changedby_char character(50)
);


ALTER TABLE i2b2metadata.ont_process_status OWNER TO i2b2metadata;

--
-- TOC entry 391 (class 1259 OID 25203)
-- Name: schemes; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE schemes (
    c_key character varying(50) NOT NULL,
    c_name character varying(50) NOT NULL,
    c_description character varying(100)
);


ALTER TABLE i2b2metadata.schemes OWNER TO i2b2metadata;

--
-- TOC entry 392 (class 1259 OID 25206)
-- Name: table_access; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

CREATE TABLE table_access (
    c_table_cd character varying(50) NOT NULL,
    c_table_name character varying(50) NOT NULL,
    c_protected_access character(1),
    c_hlevel numeric(22,0) NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum numeric(22,0),
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_dimtablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1),
    valuetype_cd character varying(50)
);


ALTER TABLE i2b2metadata.table_access OWNER TO i2b2metadata;

--
-- TOC entry 3823 (class 2606 OID 25953)
-- Name: ont_process_status_pkey; Type: CONSTRAINT; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

ALTER TABLE ONLY ont_process_status
    ADD CONSTRAINT ont_process_status_pkey PRIMARY KEY (process_id);


--
-- TOC entry 3825 (class 2606 OID 25955)
-- Name: schemes_pk; Type: CONSTRAINT; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

ALTER TABLE ONLY schemes
    ADD CONSTRAINT schemes_pk PRIMARY KEY (c_key);


--
-- TOC entry 3827 (class 2606 OID 25957)
-- Name: table_access_pk; Type: CONSTRAINT; Schema: i2b2metadata; Owner: i2b2metadata; Tablespace: 
--

ALTER TABLE ONLY table_access
    ADD CONSTRAINT table_access_pk PRIMARY KEY (c_table_cd);




-- Completed on 2013-07-24 09:49:31 BST

--
-- PostgreSQL database dump complete
--

-- Added for ETL compatibility

CREATE SEQUENCE i2b2metadata.seq_i2b2_tags_tag_id
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 20;

ALTER TABLE i2b2metadata.seq_i2b2_tags_tag_id OWNER TO i2b2metadata;

CREATE FUNCTION i2b2metadata.tf_trg_i2b2_tags_tag_id() 
    RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin      
    if NEW.TAG_ID is null 
    then          
        select nextval('i2b2metadata.seq_i2b2_tags_tag_id') into NEW.TAG_ID ;       
    end if; 
    RETURN NEW;  
end;
$$;

ALTER FUNCTION i2b2metadata.tf_trg_i2b2_tags_tag_id() OWNER TO i2b2metadata;

CREATE TRIGGER trg_i2b2_tags_tag_id 
BEFORE INSERT ON i2b2metadata.i2b2_tags FOR EACH ROW EXECUTE PROCEDURE i2b2metadata.tf_trg_i2b2_tags_tag_id();
