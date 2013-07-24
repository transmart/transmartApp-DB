REVOKE ALL ON SCHEMA deapp FROM PUBLIC;
GRANT ALL ON SCHEMA deapp TO biomart_user;
grant ALL on all tables in schema deapp to biomart_user;
grant ALL on all functions in schema deapp to biomart_user;
grant ALL on all sequences in schema deapp to biomart_user;

