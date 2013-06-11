-- to kill all sessions connectioned to the database
-- select pg_terminate_backend(pid) from pg_stat_activity where datname='transmart';

-- DROP DATABASE transmart;

CREATE DATABASE transmart
  WITH OWNER = postgres
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;
