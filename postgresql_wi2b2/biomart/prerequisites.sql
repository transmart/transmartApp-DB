\set ON_ERROR_STOP ON
CREATE ROLE biomart LOGIN
  PASSWORD 'biomart'    
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

create schema biomart AUTHORIZATION biomart;

alter schema biomart owner to biomart;



