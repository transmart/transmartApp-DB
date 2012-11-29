DROP DATABASE transmart;

CREATE DATABASE transmart
  WITH OWNER = postgres
       TABLESPACE = pg_default
       LC_COLLATE = 'C'
       LC_CTYPE = 'C'
       CONNECTION LIMIT = -1;
