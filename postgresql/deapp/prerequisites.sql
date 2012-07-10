\set ON_ERROR_STOP ON 

CREATE ROLE deapp LOGIN
  PASSWORD 'deapp'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

create schema deapp AUTHORIZATION deapp;

alter schema deapp owner to deapp;


