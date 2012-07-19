CREATE ROLE biomart_user LOGIN
  PASSWORD 'biomart_user'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
  
ALTER ROLE biomart_user IN DATABASE transmart SET search_path=searchapp,biomart,deapp,i2b2demodata,
                   i2b2metadata, i2b2hive, i2b2pm, i2b2workdata, public;