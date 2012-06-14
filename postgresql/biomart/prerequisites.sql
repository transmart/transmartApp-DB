
CREATE ROLE biomart LOGIN
  ENCRYPTED PASSWORD 'md50236af8d61d2adb5ab395322ff61ec59'    -- unencrypted=biomart
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

drop schema biomart cascade;

create schema biomart AUTHORIZATION biomart;

alter schema biomart owner to biomart;

CREATE TABLESPACE BIOMART LOCATION '/opt/PostgreSQL/9.1/data/tablespaces/biomart';

CREATE TABLESPACE INDX LOCATION '/opt/PostgreSQL/9.1/data/tablespaces/indx';

