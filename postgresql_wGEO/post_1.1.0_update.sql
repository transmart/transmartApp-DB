-- Run this script only if you have stock 1.1.0 version installed already and don't want to reinstall the database from scratch

\i ddl-updates/post_1.1.0/i2b2metadata.sql
\i ddl-updates/post_1.1.0/tm_lz_fix.sql
\i ddl-updates/post_1.1.0/tm_wz_fix.sql
\i etl/create-functions.sql