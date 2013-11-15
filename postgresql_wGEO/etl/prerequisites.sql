\set ON_ERROR_STOP ON 


create schema tm_cz AUTHORIZATION tm_cz;
create schema tm_lz AUTHORIZATION tm_lz;
create schema tm_wz AUTHORIZATION tm_wz;

alter schema tm_cz owner to tm_cz;
alter schema tm_lz owner to tm_lz;
alter schema tm_wz owner to tm_wz;

-- create extension if not exists dblink with schema public;


