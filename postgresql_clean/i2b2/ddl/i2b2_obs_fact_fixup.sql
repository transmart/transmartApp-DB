-- see https://github.com/transmart/transmartApp-DB/commit/aa5a8ad6a9dacb26b00f5d19c06dc700dc0719be#commitcomment-3038058
alter table i2b2demodata.observation_fact drop constraint observation_fact_pk;
alter table i2b2demodata.observation_fact alter column encounter_num drop not null;
alter table i2b2demodata.observation_fact alter column start_date drop not null;
alter table i2b2demodata.observation_fact alter column instance_num drop not null;
drop index if exists i2b2demodata.fact_cnpt_pat_enct_idx;
drop index if exists i2b2demodata.fact_nolob;
drop index if exists i2b2demodata.fact_patcon_date_prvd_idx;
--queries for clinical data always restrict to a value of modifier_cd and join using patient_num
create index fact_modifier_patient on i2b2demodata.observation_fact(modifier_cd, patient_num);

update i2b2metadata.table_access set c_hlevel=(select c_hlevel from i2b2metadata.i2b2  where c_fullname='\Public Studies\') where c_fullname='\Public Studies\';
update i2b2metadata.i2b2 set c_columndatatype='T';