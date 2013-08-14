\set ON_ERROR_STOP ON 

CREATE ROLE tm_cz LOGIN
   PASSWORD 'tm_cz'   -- tm_cz
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
  
CREATE ROLE tm_lz LOGIN
   PASSWORD 'tm_lz'  -- tm_lz
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

CREATE ROLE tm_wz LOGIN
   PASSWORD 'tm_wz'  -- tm_wz
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

create schema tm_cz AUTHORIZATION tm_cz;
create schema tm_lz AUTHORIZATION tm_lz;
create schema tm_wz AUTHORIZATION tm_wz;

alter schema tm_cz owner to tm_cz;
alter schema tm_lz owner to tm_lz;
alter schema tm_wz owner to tm_wz;


