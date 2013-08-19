

--\connect postgres

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Tablespaces
--

CREATE TABLESPACE biomart OWNER biomart_user LOCATION '__TABLESPACES_DIR__/biomart';
CREATE TABLESPACE deapp OWNER biomart_user LOCATION '__TABLESPACES_DIR__/deapp';
CREATE TABLESPACE indx OWNER biomart_user LOCATION '__TABLESPACES_DIR__/indx';
CREATE TABLESPACE search_app OWNER biomart_user LOCATION '__TABLESPACES_DIR__/search_app';
CREATE TABLESPACE transmart OWNER biomart_user LOCATION '__TABLESPACES_DIR__/transmart';



