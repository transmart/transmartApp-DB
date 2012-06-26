CREATE ROLE deapp LOGIN
  PASSWORD 'deapp'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

drop schema deapp cascade;

create schema deapp AUTHORIZATION deapp;

alter schema deapp owner to deapp;

CREATE TABLESPACE DEAPP LOCATION '/opt/PostgreSQL/9.1/data/tablespaces/deapp';

CREATE TABLESPACE biomart LOCATION '/opt/PostgreSQL/9.1/data/tablespaces/biomart';

CREATE TABLESPACE transmart LOCATION '/opt/PostgreSQL/9.1/data/tablespaces/transmart';

