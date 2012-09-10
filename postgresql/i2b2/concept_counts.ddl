--
-- Name: concept_counts; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE i2b2demodata.concept_counts (
    concept_path character varying(500),
    parent_concept_path character varying(500),
    patient_count numeric(18,0)
);


ALTER TABLE i2b2demodata.concept_counts OWNER TO i2b2demodata;

--
-- Name: concept_counts; Type: ACL; Schema: i2b2demodata; Owner: i2b2demodata
--

REVOKE ALL ON TABLE i2b2demodata.concept_counts FROM PUBLIC;
REVOKE ALL ON TABLE i2b2demodata.concept_counts FROM i2b2demodata;
GRANT ALL ON TABLE i2b2demodata.concept_counts TO i2b2demodata;
GRANT ALL ON TABLE i2b2demodata.concept_counts TO tm_cz;
GRANT ALL ON TABLE i2b2demodata.concept_counts TO biomart_user;


--
-- PostgreSQL database dump complete
--

