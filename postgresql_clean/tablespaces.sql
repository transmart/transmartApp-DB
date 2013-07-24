

\connect postgres

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Tablespaces
--

CREATE TABLESPACE biomart OWNER biomart_user LOCATION '$POSTGRES_HOME/data/tablespaces/biomart';
CREATE TABLESPACE deapp OWNER biomart_user LOCATION '$POSTGRES_HOME/data/tablespaces/deapp';
CREATE TABLESPACE indx OWNER biomart_user LOCATION '$POSTGRES_HOME/data/tablespaces/indx';
CREATE TABLESPACE search_app OWNER biomart_user LOCATION '$POSTGRES_HOME/data/tablespaces/search_app';
CREATE TABLESPACE transmart OWNER biomart_user LOCATION '$POSTGRES_HOME/data/tablespaces/transmart';



