-- to kill all sessions connectioned to the database

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'transmart';

DROP DATABASE transmart;

CREATE DATABASE transmart
  WITH OWNER = postgres TEMPLATE template0
       TABLESPACE = pg_default
       ENCODING='UTF-8' LC_COLLATE='en_US.UTF-8'
       CONNECTION LIMIT = -1;