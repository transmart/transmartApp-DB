--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-24 14:56:16 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = i2b2workdata, pg_catalog;

--
-- TOC entry 3819 (class 0 OID 33141)
-- Dependencies: 407
-- Data for Name: workplace; Type: TABLE DATA; Schema: i2b2workdata; Owner: i2b2workdata
--

COPY workplace (c_name, c_user_id, c_group_id, c_share_id, c_index, c_parent_index, c_visualattributes, c_protected_access, c_tooltip, c_work_xml, c_work_xml_schema, c_work_xml_i2b2_type, c_entry_date, c_change_date, c_status_cd) FROM stdin;
\.


--
-- TOC entry 3820 (class 0 OID 33147)
-- Dependencies: 408
-- Data for Name: workplace_access; Type: TABLE DATA; Schema: i2b2workdata; Owner: i2b2workdata
--

COPY workplace_access (c_table_cd, c_table_name, c_protected_access, c_hlevel, c_name, c_user_id, c_group_id, c_share_id, c_index, c_parent_index, c_visualattributes, c_tooltip, c_entry_date, c_change_date, c_status_cd) FROM stdin;
demo	WORKPLACE	N	0	SHARED	shared	demo	Y	100	\N	CA 	SHARED	\N	\N	\N
demo	WORKPLACE	N	0	@	@	@	N	0	\N	CA 	@	\N	\N	\N
\.


-- Completed on 2013-07-24 14:56:16 BST

--
-- PostgreSQL database dump complete
--

