-- to dump schema to tar file
-- ~/bin/pg_dump -Ft postgres  --schema=searchapp > searchapp.pgdump.tar

-- to restore from tar file
-- 1. Create a new db called transmart
-- 2. Create login role searchapp
CREATE ROLE searchapp LOGIN
  ENCRYPTED PASSWORD 'md544dcc093141b5e1cfcdc6232c560da01'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
-- 3. Create tablespace search_app
CREATE TABLESPACE SEARCH_APP LOCATION '/opt/PostgreSQL/9.1/data/tablespaces/search_app';

-- execute pg_restore command from command line
-- !/bin/pg_restore -d transmart searchapp.pgdump.tar




