CREATE ROLE tm_cz LOGIN
  ENCRYPTED PASSWORD 'md5b1cbce950ddc93c5ccec424c0c19a29d'   -- tm_cz
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
  
CREATE ROLE tm_lz LOGIN
  ENCRYPTED PASSWORD 'md5f5fb4487b17dbf2f090d87b91670f53f'  -- tm_lz
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

CREATE ROLE tm_wz LOGIN
  ENCRYPTED PASSWORD 'md5ecb88cc49310482090fe9243436fc73b'  -- tm_wz
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

drop schema tm_cz cascade;
drop schema tm_lz cascade;
drop schema tm_wz cascade;

create schema tm_cz AUTHORIZATION tm_cz;
create schema tm_lz AUTHORIZATION tm_lz;
create schema tm_wz AUTHORIZATION tm_wz;

alter schema tm_cz owner to tm_cz;
alter schema tm_lz owner to tm_lz;
alter schema tm_wz owner to tm_wz;

CREATE TABLESPACE TRANSMART LOCATION '/opt/PostgreSQL/9.1/data/tablespaces/transmart';

CREATE TABLESPACE INDX LOCATION '/opt/PostgreSQL/9.1/data/tablespaces/indx';

