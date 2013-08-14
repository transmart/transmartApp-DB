--
-- PostgreSQL database cluster dump
--

\connect postgres

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Tablespaces
--

CREATE TABLESPACE biomart OWNER biomart_user LOCATION '/opt/transmart/db/biomart';
CREATE TABLESPACE deapp OWNER biomart_user LOCATION '/opt/transmart/db/deapp';
CREATE TABLESPACE indx OWNER biomart_user LOCATION '/opt/transmart/db/indx';
CREATE TABLESPACE search_app OWNER biomart_user LOCATION '/opt/transmart/db/search_app';
CREATE TABLESPACE transmart OWNER biomart_user LOCATION '/opt/transmart/db/transmart';


--
-- PostgreSQL database cluster dump complete
--

