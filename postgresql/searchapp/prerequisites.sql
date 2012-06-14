CREATE ROLE searchapp LOGIN
  ENCRYPTED PASSWORD 'md544dcc093141b5e1cfcdc6232c560da01'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

drop schema searchapp cascade;

create schema searchapp AUTHORIZATION searchapp;

alter schema searchapp owner to searchapp;

CREATE TABLESPACE SEARCH_APP LOCATION '/opt/PostgreSQL/9.1/data/tablespaces/search_app';

