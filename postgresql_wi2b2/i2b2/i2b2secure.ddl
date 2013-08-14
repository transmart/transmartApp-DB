--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = i2b2metadata, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
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
-- Name: i2b2_secure; Type: ACL; Schema: i2b2metadata; Owner: i2b2metadata
--

REVOKE ALL ON TABLE i2b2_secure FROM PUBLIC;
REVOKE ALL ON TABLE i2b2_secure FROM i2b2metadata;
GRANT ALL ON TABLE i2b2_secure TO i2b2metadata;
GRANT ALL ON TABLE i2b2_secure TO tm_cz;
GRANT ALL ON TABLE i2b2_secure TO biomart_user;


--
-- PostgreSQL database dump complete
--

