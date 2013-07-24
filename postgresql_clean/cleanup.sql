drop schema if exists biomart cascade;
drop schema if exists deapp cascade;
drop schema if exists searchapp cascade;
drop schema if exists tm_cz cascade;
drop schema if exists tm_lz cascade;
drop schema if exists tm_wz cascade;
drop schema if exists i2b2demodata cascade;
drop schema if exists i2b2metadata cascade;
drop schema if exists i2b2hive cascade;
drop schema if exists i2b2pm cascade;
drop schema if exists i2b2workdata cascade;

drop role if exists biomart_user;
drop role if exists biomart;
drop role if exists deapp;
drop role if exists searchapp;
drop role if exists tm_cz;
drop role if exists tm_lz;
drop role if exists tm_wz;
drop role if exists i2b2demodata;
drop role if exists i2b2metadata;
drop role if exists i2b2hive;
drop role if exists i2b2pm;
drop role if exists i2b2workdata;

drop tablespace if exists search_app;
drop tablespace if exists indx;
drop tablespace if exists transmart;
drop tablespace if exists biomart;
drop tablespace if exists deapp;

