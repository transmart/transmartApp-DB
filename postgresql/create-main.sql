\i ./cleanup.sql
\i ./tablespaces.sql
\i ./biomart_user.sql
\i searchapp/start.sql
\i biomart/start.sql
\i deapp/start.sql
\i ./i2b2_prerequisites.sql

ALTER ROLE biomart_user IN DATABASE transmart SET search_path=searchapp,biomart,deapp,i2b2demodata,
	i2b2metadata, i2b2hive, i2b2pm, i2b2workdata, public;
