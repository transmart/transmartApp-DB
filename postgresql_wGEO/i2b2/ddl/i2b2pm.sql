--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-24 09:50:34 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 14 (class 2615 OID 24070)
-- Name: i2b2pm; Type: SCHEMA; Schema: -; Owner: i2b2pm
--

CREATE SCHEMA i2b2pm;


ALTER SCHEMA i2b2pm OWNER TO i2b2pm;

SET search_path = i2b2pm, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 393 (class 1259 OID 25212)
-- Name: pm_cell_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_cell_data (
    cell_id character varying(50) NOT NULL,
    project_path character varying(255) NOT NULL,
    name character varying(255),
    method_cd character varying(255),
    url character varying(255),
    can_override numeric(1,0),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_cell_data OWNER TO i2b2pm;

--
-- TOC entry 394 (class 1259 OID 25218)
-- Name: pm_params; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE pm_params
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_params OWNER TO i2b2pm;

--
-- TOC entry 395 (class 1259 OID 25220)
-- Name: pm_cell_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_cell_params (
    id numeric DEFAULT nextval('pm_params'::regclass) NOT NULL,
    datatype_cd character varying(50),
    cell_id character varying(50) NOT NULL,
    project_path character varying(255) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value character varying(255),
    can_override numeric(1,0),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_cell_params OWNER TO i2b2pm;

--
-- TOC entry 396 (class 1259 OID 25227)
-- Name: pm_global_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_global_params (
    id numeric DEFAULT nextval('pm_params'::regclass) NOT NULL,
    datatype_cd character varying(50),
    param_name_cd character varying(50) NOT NULL,
    project_path character varying(255) NOT NULL,
    value character varying(255),
    can_override numeric(1,0),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_global_params OWNER TO i2b2pm;

--
-- TOC entry 397 (class 1259 OID 25234)
-- Name: pm_hive_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_hive_data (
    domain_id character varying(50) NOT NULL,
    helpurl character varying(255),
    domain_name character varying(255),
    environment_cd character varying(255),
    active numeric(1,0),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_hive_data OWNER TO i2b2pm;

--
-- TOC entry 398 (class 1259 OID 25240)
-- Name: pm_hive_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_hive_params (
    id numeric DEFAULT nextval('pm_params'::regclass) NOT NULL,
    datatype_cd character varying(50),
    domain_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value character varying(255),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_hive_params OWNER TO i2b2pm;

--
-- TOC entry 399 (class 1259 OID 25247)
-- Name: pm_project_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_project_data (
    project_id character varying(50) NOT NULL,
    project_name character varying(255),
    project_wiki character varying(255),
    project_key character varying(255),
    project_path character varying(255),
    project_description character varying(2000),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_data OWNER TO i2b2pm;

--
-- TOC entry 400 (class 1259 OID 25253)
-- Name: pm_project_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_project_params (
    id numeric DEFAULT nextval('pm_params'::regclass) NOT NULL,
    datatype_cd character varying(50),
    project_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value character varying(255),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_params OWNER TO i2b2pm;

--
-- TOC entry 401 (class 1259 OID 25260)
-- Name: pm_project_user_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_project_user_params (
    id numeric DEFAULT nextval('pm_params'::regclass) NOT NULL,
    datatype_cd character varying(50),
    project_id character varying(50) NOT NULL,
    user_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value character varying(255),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_user_params OWNER TO i2b2pm;

--
-- TOC entry 402 (class 1259 OID 25267)
-- Name: pm_project_user_roles; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_project_user_roles (
    project_id character varying(50) NOT NULL,
    user_id character varying(50) NOT NULL,
    user_role_cd character varying(255) NOT NULL,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_user_roles OWNER TO i2b2pm;

--
-- TOC entry 403 (class 1259 OID 25270)
-- Name: pm_role_requirement; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_role_requirement (
    table_cd character varying(50) NOT NULL,
    column_cd character varying(50) NOT NULL,
    read_hivemgmt_cd character varying(50) NOT NULL,
    write_hivemgmt_cd character varying(50) NOT NULL,
    name_char character varying(2000),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_role_requirement OWNER TO i2b2pm;

--
-- TOC entry 404 (class 1259 OID 25276)
-- Name: pm_user_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_user_data (
    user_id character varying(50) NOT NULL,
    full_name character varying(255),
    password character varying(255),
    email character varying(255),
    project_path character varying(255),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_data OWNER TO i2b2pm;

--
-- TOC entry 405 (class 1259 OID 25282)
-- Name: pm_user_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_user_params (
    id numeric DEFAULT nextval('pm_params'::regclass) NOT NULL,
    datatype_cd character varying(50),
    user_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value character varying(255),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_params OWNER TO i2b2pm;

--
-- TOC entry 406 (class 1259 OID 25289)
-- Name: pm_user_session; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

CREATE TABLE pm_user_session (
    user_id character varying(50) NOT NULL,
    session_id character varying(50) NOT NULL,
    expired_date timestamp without time zone,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_session OWNER TO i2b2pm;

--
-- TOC entry 3833 (class 2606 OID 25959)
-- Name: pm_cell_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_cell_data
    ADD CONSTRAINT pm_cell_data_pkey PRIMARY KEY (cell_id, project_path);


--
-- TOC entry 3835 (class 2606 OID 25961)
-- Name: pm_cell_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_cell_params
    ADD CONSTRAINT pm_cell_params_pkey PRIMARY KEY (id);


--
-- TOC entry 3837 (class 2606 OID 25963)
-- Name: pm_global_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_global_params
    ADD CONSTRAINT pm_global_params_pkey PRIMARY KEY (id);


--
-- TOC entry 3839 (class 2606 OID 25965)
-- Name: pm_hive_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_hive_data
    ADD CONSTRAINT pm_hive_data_pkey PRIMARY KEY (domain_id);


--
-- TOC entry 3841 (class 2606 OID 25967)
-- Name: pm_hive_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_hive_params
    ADD CONSTRAINT pm_hive_params_pkey PRIMARY KEY (id);


--
-- TOC entry 3843 (class 2606 OID 25969)
-- Name: pm_project_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_project_data
    ADD CONSTRAINT pm_project_data_pkey PRIMARY KEY (project_id);


--
-- TOC entry 3845 (class 2606 OID 25971)
-- Name: pm_project_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_project_params
    ADD CONSTRAINT pm_project_params_pkey PRIMARY KEY (id);


--
-- TOC entry 3847 (class 2606 OID 25973)
-- Name: pm_project_user_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_project_user_params
    ADD CONSTRAINT pm_project_user_params_pkey PRIMARY KEY (id);


--
-- TOC entry 3849 (class 2606 OID 25975)
-- Name: pm_project_user_roles_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_project_user_roles
    ADD CONSTRAINT pm_project_user_roles_pkey PRIMARY KEY (project_id, user_id, user_role_cd);


--
-- TOC entry 3851 (class 2606 OID 25977)
-- Name: pm_role_requirement_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_role_requirement
    ADD CONSTRAINT pm_role_requirement_pkey PRIMARY KEY (table_cd, column_cd, read_hivemgmt_cd, write_hivemgmt_cd);


--
-- TOC entry 3853 (class 2606 OID 25979)
-- Name: pm_user_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_user_data
    ADD CONSTRAINT pm_user_data_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3855 (class 2606 OID 25981)
-- Name: pm_user_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_user_params
    ADD CONSTRAINT pm_user_params_pkey PRIMARY KEY (id);


--
-- TOC entry 3857 (class 2606 OID 25983)
-- Name: pm_user_session_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm; Tablespace: 
--

ALTER TABLE ONLY pm_user_session
    ADD CONSTRAINT pm_user_session_pkey PRIMARY KEY (session_id, user_id);




-- Completed on 2013-07-24 09:50:34 BST

--
-- PostgreSQL database dump complete
--

