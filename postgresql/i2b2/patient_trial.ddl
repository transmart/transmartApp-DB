
CREATE TABLE i2b2demodata.patient_trial (
    patient_num numeric,
    trial character varying(30),
    secure_obj_token character varying(50)
);


ALTER TABLE i2b2demodata.patient_trial OWNER TO i2b2demodata;

--
-- Name: patient_trial; Type: ACL; Schema: i2b2demodata; Owner: i2b2demodata
--

REVOKE ALL ON TABLE i2b2demodata.patient_trial FROM PUBLIC;
REVOKE ALL ON TABLE i2b2demodata.patient_trial FROM i2b2demodata;
GRANT ALL ON TABLE i2b2demodata.patient_trial TO i2b2demodata;
GRANT ALL ON TABLE i2b2demodata.patient_trial TO tm_cz;
GRANT ALL ON TABLE i2b2demodata.patient_trial TO biomart_user;



