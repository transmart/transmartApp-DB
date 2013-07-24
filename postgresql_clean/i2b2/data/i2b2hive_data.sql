--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-24 14:51:38 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = i2b2hive, pg_catalog;

--
-- TOC entry 3849 (class 0 OID 32959)
-- Dependencies: 373
-- Data for Name: crc_analysis_job; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY crc_analysis_job (job_id, queue_name, status_type_id, domain_id, project_id, user_id, request_xml, create_date, update_date) FROM stdin;
\.


--
-- TOC entry 3850 (class 0 OID 32965)
-- Dependencies: 374
-- Data for Name: crc_db_lookup; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY crc_db_lookup (c_domain_id, c_project_path, c_owner_id, c_db_fullschema, c_db_datasource, c_db_servertype, c_db_nicename, c_db_tooltip, c_comment, c_entry_date, c_change_date, c_status_cd) FROM stdin;
i2b2demo	/Demo/	@	 	java:QueryToolDemoDS	POSTGRES	Demo	\N	\N	\N	\N	\N
i2b2demo	/Demo2/	@	 	java:QueryToolDemo2DS	POSTGRES	Demo2	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3851 (class 0 OID 32971)
-- Dependencies: 375
-- Data for Name: hilosequences; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY hilosequences (sequencename, highvalues) FROM stdin;
general	0
\.


--
-- TOC entry 3852 (class 0 OID 32974)
-- Dependencies: 376
-- Data for Name: jms_messages; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY jms_messages (messageid, destination, txid, txop, messageblob) FROM stdin;
\.


--
-- TOC entry 3853 (class 0 OID 32980)
-- Dependencies: 377
-- Data for Name: jms_roles; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY jms_roles (roleid, userid) FROM stdin;
noacc	nobody
durpublisher	dynsub
durpublisher	john
publisher	dynsub
publisher	john
subscriber	john
john	guest
j2ee	guest
guest	guest
\.


--
-- TOC entry 3854 (class 0 OID 32983)
-- Dependencies: 378
-- Data for Name: jms_subscriptions; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY jms_subscriptions (clientid, subname, topic, selector) FROM stdin;
\.


--
-- TOC entry 3855 (class 0 OID 32989)
-- Dependencies: 379
-- Data for Name: jms_transactions; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY jms_transactions (txid) FROM stdin;
\.


--
-- TOC entry 3856 (class 0 OID 32992)
-- Dependencies: 380
-- Data for Name: jms_users; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY jms_users (userid, passwd, clientid) FROM stdin;
dynsub	dynsub	\N
nobody	nobody	\N
john	needle	DurableSubscriberExample
j2ee	j2ee	\N
guest	guest	\N
\.


--
-- TOC entry 3857 (class 0 OID 32995)
-- Dependencies: 381
-- Data for Name: ont_db_lookup; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY ont_db_lookup (c_domain_id, c_project_path, c_owner_id, c_db_fullschema, c_db_datasource, c_db_servertype, c_db_nicename, c_db_tooltip, c_comment, c_entry_date, c_change_date, c_status_cd) FROM stdin;
i2b2demo	Demo/	@	i2b2metadata	java:OntologyDemoDS	POSTGRES	Metadata	\N	\N	\N	\N	\N
i2b2demo	Demo2/	@	i2b2metadata2	java:OntologyDemo2DS	POSTGRES	Metadata2	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3858 (class 0 OID 33001)
-- Dependencies: 382
-- Data for Name: timers; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY timers (timerid, targetid, initialdate, timerinterval, instancepk, info) FROM stdin;
1366195322592	[target=jboss.j2ee:service=EJB3,ear=QP1.ear,jar=QP-An-EJB.jar,name=CronEjb]	2013-04-17 11:43:09.933+01	60000	\N	\\xaced00057400036d636a
1366195322593	[target=jboss.j2ee:service=EJB3,ear=QP1.ear,jar=QP-An-EJB.jar,name=LargeCronEjb]	2013-04-17 11:43:09.954+01	60000	\N	\\xaced00057400036c636a
\.


--
-- TOC entry 3859 (class 0 OID 33007)
-- Dependencies: 383
-- Data for Name: work_db_lookup; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY work_db_lookup (c_domain_id, c_project_path, c_owner_id, c_db_fullschema, c_db_datasource, c_db_servertype, c_db_nicename, c_db_tooltip, c_comment, c_entry_date, c_change_date, c_status_cd) FROM stdin;
i2b2demo	Demo/	@	i2b2workdata	java:WorkplaceDemoDS	POSTGRES	Workplace	\N	\N	\N	\N	\N
i2b2demo	Demo2/	@	i2b2workdata2	java:WorkplaceDemo2DS	POSTGRES	Workplace2	\N	\N	\N	\N	\N
\.


-- Completed on 2013-07-24 14:51:39 BST

--
-- PostgreSQL database dump complete
--

