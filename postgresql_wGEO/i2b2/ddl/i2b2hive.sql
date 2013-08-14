--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-24 09:48:52 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 12 (class 2615 OID 24068)
-- Name: i2b2hive; Type: SCHEMA; Schema: -; Owner: i2b2hive
--

CREATE SCHEMA i2b2hive;


ALTER SCHEMA i2b2hive OWNER TO i2b2hive;

SET search_path = i2b2hive, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 373 (class 1259 OID 25110)
-- Name: crc_analysis_job; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE crc_analysis_job (
    job_id character varying(10) NOT NULL,
    queue_name character varying(50),
    status_type_id integer,
    domain_id character varying(255),
    project_id character varying(500),
    user_id character varying(255),
    request_xml text,
    create_date timestamp without time zone,
    update_date timestamp without time zone
);


ALTER TABLE i2b2hive.crc_analysis_job OWNER TO i2b2hive;

--
-- TOC entry 374 (class 1259 OID 25116)
-- Name: crc_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE crc_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.crc_db_lookup OWNER TO i2b2hive;

--
-- TOC entry 375 (class 1259 OID 25122)
-- Name: hilosequences; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE hilosequences (
    sequencename character varying(50) NOT NULL,
    highvalues integer NOT NULL
);


ALTER TABLE i2b2hive.hilosequences OWNER TO i2b2hive;

--
-- TOC entry 376 (class 1259 OID 25125)
-- Name: jms_messages; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE jms_messages (
    messageid integer NOT NULL,
    destination character varying(150) NOT NULL,
    txid integer,
    txop character(1),
    messageblob bytea
);


ALTER TABLE i2b2hive.jms_messages OWNER TO i2b2hive;

--
-- TOC entry 377 (class 1259 OID 25131)
-- Name: jms_roles; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE jms_roles (
    roleid character varying(32) NOT NULL,
    userid character varying(32) NOT NULL
);


ALTER TABLE i2b2hive.jms_roles OWNER TO i2b2hive;

--
-- TOC entry 378 (class 1259 OID 25134)
-- Name: jms_subscriptions; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE jms_subscriptions (
    clientid character varying(128) NOT NULL,
    subname character varying(128) NOT NULL,
    topic character varying(255) NOT NULL,
    selector character varying(255)
);


ALTER TABLE i2b2hive.jms_subscriptions OWNER TO i2b2hive;

--
-- TOC entry 379 (class 1259 OID 25140)
-- Name: jms_transactions; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE jms_transactions (
    txid integer NOT NULL
);


ALTER TABLE i2b2hive.jms_transactions OWNER TO i2b2hive;

--
-- TOC entry 380 (class 1259 OID 25143)
-- Name: jms_users; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE jms_users (
    userid character varying(32) NOT NULL,
    passwd character varying(32) NOT NULL,
    clientid character varying(128)
);


ALTER TABLE i2b2hive.jms_users OWNER TO i2b2hive;

--
-- TOC entry 381 (class 1259 OID 25146)
-- Name: ont_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE ont_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.ont_db_lookup OWNER TO i2b2hive;

--
-- TOC entry 382 (class 1259 OID 25152)
-- Name: timers; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE timers (
    timerid character varying(80) NOT NULL,
    targetid character varying(250) NOT NULL,
    initialdate timestamp with time zone NOT NULL,
    timerinterval bigint,
    instancepk bytea,
    info bytea
);


ALTER TABLE i2b2hive.timers OWNER TO i2b2hive;

--
-- TOC entry 383 (class 1259 OID 25158)
-- Name: work_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE TABLE work_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment character varying(4000),
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.work_db_lookup OWNER TO i2b2hive;

--
-- TOC entry 3825 (class 2606 OID 25931)
-- Name: analsis_job_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY crc_analysis_job
    ADD CONSTRAINT analsis_job_pk PRIMARY KEY (job_id);


--
-- TOC entry 3828 (class 2606 OID 25933)
-- Name: crc_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY crc_db_lookup
    ADD CONSTRAINT crc_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- TOC entry 3830 (class 2606 OID 25935)
-- Name: hilo_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY hilosequences
    ADD CONSTRAINT hilo_pk PRIMARY KEY (sequencename);


--
-- TOC entry 3833 (class 2606 OID 25937)
-- Name: jms_messages_pkey; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY jms_messages
    ADD CONSTRAINT jms_messages_pkey PRIMARY KEY (messageid, destination);


--
-- TOC entry 3836 (class 2606 OID 25939)
-- Name: jms_roles_pkey; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY jms_roles
    ADD CONSTRAINT jms_roles_pkey PRIMARY KEY (userid, roleid);


--
-- TOC entry 3838 (class 2606 OID 25941)
-- Name: jms_subscriptions_pkey; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY jms_subscriptions
    ADD CONSTRAINT jms_subscriptions_pkey PRIMARY KEY (clientid, subname);


--
-- TOC entry 3840 (class 2606 OID 25943)
-- Name: jms_transactions_pkey; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY jms_transactions
    ADD CONSTRAINT jms_transactions_pkey PRIMARY KEY (txid);


--
-- TOC entry 3842 (class 2606 OID 25945)
-- Name: jms_users_pkey; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY jms_users
    ADD CONSTRAINT jms_users_pkey PRIMARY KEY (userid);


--
-- TOC entry 3844 (class 2606 OID 25947)
-- Name: ont_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY ont_db_lookup
    ADD CONSTRAINT ont_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- TOC entry 3846 (class 2606 OID 25949)
-- Name: timers_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY timers
    ADD CONSTRAINT timers_pk PRIMARY KEY (timerid, targetid);


--
-- TOC entry 3848 (class 2606 OID 25951)
-- Name: work_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

ALTER TABLE ONLY work_db_lookup
    ADD CONSTRAINT work_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- TOC entry 3826 (class 1259 OID 26161)
-- Name: crc_idx_aj_qnstid; Type: INDEX; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE INDEX crc_idx_aj_qnstid ON crc_analysis_job USING btree (queue_name, status_type_id);


--
-- TOC entry 3831 (class 1259 OID 26162)
-- Name: jms_messages_destination; Type: INDEX; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE INDEX jms_messages_destination ON jms_messages USING btree (destination);


--
-- TOC entry 3834 (class 1259 OID 26163)
-- Name: jms_messages_txop_txid; Type: INDEX; Schema: i2b2hive; Owner: i2b2hive; Tablespace: 
--

CREATE INDEX jms_messages_txop_txid ON jms_messages USING btree (txop, txid);


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 12
-- Name: i2b2hive; Type: ACL; Schema: -; Owner: i2b2hive
--

REVOKE ALL ON SCHEMA i2b2hive FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2hive FROM i2b2hive;
GRANT ALL ON SCHEMA i2b2hive TO i2b2hive;
GRANT ALL ON SCHEMA i2b2hive TO biomart_user;


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 373
-- Name: crc_analysis_job; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE crc_analysis_job FROM PUBLIC;
REVOKE ALL ON TABLE crc_analysis_job FROM i2b2hive;
GRANT ALL ON TABLE crc_analysis_job TO i2b2hive;
GRANT ALL ON TABLE crc_analysis_job TO biomart_user;


--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 374
-- Name: crc_db_lookup; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE crc_db_lookup FROM PUBLIC;
REVOKE ALL ON TABLE crc_db_lookup FROM i2b2hive;
GRANT ALL ON TABLE crc_db_lookup TO i2b2hive;
GRANT ALL ON TABLE crc_db_lookup TO biomart_user;


--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 375
-- Name: hilosequences; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE hilosequences FROM PUBLIC;
REVOKE ALL ON TABLE hilosequences FROM i2b2hive;
GRANT ALL ON TABLE hilosequences TO i2b2hive;
GRANT ALL ON TABLE hilosequences TO biomart_user;


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 376
-- Name: jms_messages; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE jms_messages FROM PUBLIC;
REVOKE ALL ON TABLE jms_messages FROM i2b2hive;
GRANT ALL ON TABLE jms_messages TO i2b2hive;
GRANT ALL ON TABLE jms_messages TO biomart_user;


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 377
-- Name: jms_roles; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE jms_roles FROM PUBLIC;
REVOKE ALL ON TABLE jms_roles FROM i2b2hive;
GRANT ALL ON TABLE jms_roles TO i2b2hive;
GRANT ALL ON TABLE jms_roles TO biomart_user;


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 378
-- Name: jms_subscriptions; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE jms_subscriptions FROM PUBLIC;
REVOKE ALL ON TABLE jms_subscriptions FROM i2b2hive;
GRANT ALL ON TABLE jms_subscriptions TO i2b2hive;
GRANT ALL ON TABLE jms_subscriptions TO biomart_user;


--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 379
-- Name: jms_transactions; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE jms_transactions FROM PUBLIC;
REVOKE ALL ON TABLE jms_transactions FROM i2b2hive;
GRANT ALL ON TABLE jms_transactions TO i2b2hive;
GRANT ALL ON TABLE jms_transactions TO biomart_user;


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 380
-- Name: jms_users; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE jms_users FROM PUBLIC;
REVOKE ALL ON TABLE jms_users FROM i2b2hive;
GRANT ALL ON TABLE jms_users TO i2b2hive;
GRANT ALL ON TABLE jms_users TO biomart_user;


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 381
-- Name: ont_db_lookup; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE ont_db_lookup FROM PUBLIC;
REVOKE ALL ON TABLE ont_db_lookup FROM i2b2hive;
GRANT ALL ON TABLE ont_db_lookup TO i2b2hive;
GRANT ALL ON TABLE ont_db_lookup TO biomart_user;


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 382
-- Name: timers; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE timers FROM PUBLIC;
REVOKE ALL ON TABLE timers FROM i2b2hive;
GRANT ALL ON TABLE timers TO i2b2hive;
GRANT ALL ON TABLE timers TO biomart_user;


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 383
-- Name: work_db_lookup; Type: ACL; Schema: i2b2hive; Owner: i2b2hive
--

REVOKE ALL ON TABLE work_db_lookup FROM PUBLIC;
REVOKE ALL ON TABLE work_db_lookup FROM i2b2hive;
GRANT ALL ON TABLE work_db_lookup TO i2b2hive;
GRANT ALL ON TABLE work_db_lookup TO biomart_user;


-- Completed on 2013-07-24 09:48:52 BST

--
-- PostgreSQL database dump complete
--

