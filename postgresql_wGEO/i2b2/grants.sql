REVOKE ALL ON SCHEMA i2b2demodata FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2demodata FROM i2b2demodata;
GRANT ALL ON SCHEMA i2b2demodata TO i2b2demodata;
GRANT ALL ON SCHEMA i2b2demodata TO biomart_user;
grant ALL on all TABLES in schema i2b2demodata to biomart_user;
grant ALL on all FUNCTIONS in schema i2b2demodata to biomart_user;
grant ALL on all SEQUENCES in schema i2b2demodata to biomart_user;

REVOKE ALL ON SCHEMA i2b2hive FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2hive FROM i2b2hive;
GRANT ALL ON SCHEMA i2b2hive TO i2b2hive;
GRANT ALL ON SCHEMA i2b2hive TO biomart_user;
grant ALL on all TABLES in schema i2b2hive to biomart_user;
grant ALL on all FUNCTIONS in schema i2b2hive to biomart_user;
grant ALL on all SEQUENCES in schema i2b2hive to biomart_user;

REVOKE ALL ON SCHEMA i2b2metadata FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2metadata FROM i2b2metadata;
GRANT ALL ON SCHEMA i2b2metadata TO i2b2metadata;
GRANT ALL ON SCHEMA i2b2metadata TO biomart_user;
grant ALL on all TABLES in schema i2b2metadata to biomart_user;
grant ALL on all FUNCTIONS in schema i2b2metadata to biomart_user;
grant ALL on all SEQUENCES in schema i2b2metadata to biomart_user;

REVOKE ALL ON SCHEMA i2b2pm FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2pm FROM i2b2pm;
GRANT ALL ON SCHEMA i2b2pm TO i2b2pm;
GRANT ALL ON SCHEMA i2b2pm TO biomart_user;
grant ALL on all TABLES in schema i2b2pm to biomart_user;
grant ALL on all FUNCTIONS in schema i2b2pm to biomart_user;
grant ALL on all SEQUENCES in schema i2b2pm to biomart_user;

REVOKE ALL ON SCHEMA i2b2workdata FROM PUBLIC;
REVOKE ALL ON SCHEMA i2b2workdata FROM i2b2workdata;
GRANT ALL ON SCHEMA i2b2workdata TO i2b2workdata;
GRANT ALL ON SCHEMA i2b2workdata TO biomart_user;
grant ALL on all TABLES in schema i2b2workdata to biomart_user;
grant ALL on all FUNCTIONS in schema i2b2workdata to biomart_user;
grant ALL on all SEQUENCES in schema i2b2workdata to biomart_user;