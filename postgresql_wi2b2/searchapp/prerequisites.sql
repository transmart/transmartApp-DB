\set ON_ERROR_STOP ON

CREATE ROLE searchapp LOGIN
  PASSWORD 'searchapp'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

create schema searchapp AUTHORIZATION searchapp;

alter schema searchapp owner to searchapp;
