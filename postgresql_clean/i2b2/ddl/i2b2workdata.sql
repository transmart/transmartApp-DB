--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-24 10:06:23 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 15 (class 2615 OID 24071)
-- Name: i2b2workdata; Type: SCHEMA; Schema: -; Owner: i2b2workdata
--

CREATE SCHEMA i2b2workdata;


ALTER SCHEMA i2b2workdata OWNER TO i2b2workdata;

SET search_path = i2b2workdata, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 407 (class 1259 OID 25292)
-- Name: workplace; Type: TABLE; Schema: i2b2workdata; Owner: i2b2workdata; Tablespace: 
--

CREATE TABLE workplace (
    c_name character varying(255) NOT NULL,
    c_user_id character varying(255) NOT NULL,
    c_group_id character varying(255) NOT NULL,
    c_share_id character varying(255),
    c_index character varying(255) NOT NULL,
    c_parent_index character varying(255),
    c_visualattributes character(3) NOT NULL,
    c_protected_access character(1),
    c_tooltip character varying(255),
    c_work_xml text,
    c_work_xml_schema text,
    c_work_xml_i2b2_type character varying(255),
    c_entry_date date,
    c_change_date date,
    c_status_cd character(1)
);


ALTER TABLE i2b2workdata.workplace OWNER TO i2b2workdata;

--
-- TOC entry 408 (class 1259 OID 25298)
-- Name: workplace_access; Type: TABLE; Schema: i2b2workdata; Owner: i2b2workdata; Tablespace: 
--

CREATE TABLE workplace_access (
    c_table_cd character varying(255) NOT NULL,
    c_table_name character varying(255) NOT NULL,
    c_protected_access character(1),
    c_hlevel integer NOT NULL,
    c_name character varying(255) NOT NULL,
    c_user_id character varying(255) NOT NULL,
    c_group_id character varying(255) NOT NULL,
    c_share_id character varying(255),
    c_index character varying(255) NOT NULL,
    c_parent_index character varying(255),
    c_visualattributes character(3) NOT NULL,
    c_tooltip character varying(255),
    c_entry_date date,
    c_change_date date,
    c_status_cd character(1)
);


ALTER TABLE i2b2workdata.workplace_access OWNER TO i2b2workdata;

--
-- TOC entry 3818 (class 2606 OID 25985)
-- Name: workplace_access_pk; Type: CONSTRAINT; Schema: i2b2workdata; Owner: i2b2workdata; Tablespace: 
--

ALTER TABLE ONLY workplace_access
    ADD CONSTRAINT workplace_access_pk PRIMARY KEY (c_index);


--
-- TOC entry 3816 (class 2606 OID 25987)
-- Name: workplace_pk; Type: CONSTRAINT; Schema: i2b2workdata; Owner: i2b2workdata; Tablespace: 
--

ALTER TABLE ONLY workplace
    ADD CONSTRAINT workplace_pk PRIMARY KEY (c_index);




-- Completed on 2013-07-24 10:06:23 BST

--
-- PostgreSQL database dump complete
--

