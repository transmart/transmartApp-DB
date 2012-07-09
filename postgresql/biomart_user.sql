CREATE ROLE biomart_user LOGIN
  PASSWORD 'biomart_user'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
  
ALTER ROLE biomart_user IN DATABASE transmart SET search_path=searchapp,biomart,deapp,public;