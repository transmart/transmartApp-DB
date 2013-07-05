-- to see if there are sessions connected to the database
-- select procpid from pg_stat_activity where datname='transmart';
-- to kill all sessions connectioned to the database
-- select pg_terminate_backend(procpid) from pg_stat_activity where datname='transmart';

-- DROP DATABASE transmart;

CREATE DATABASE transmart
  WITH OWNER = postgres
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;
