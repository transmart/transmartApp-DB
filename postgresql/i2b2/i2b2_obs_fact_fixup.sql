-- see https://github.com/transmart/transmartApp-DB/commit/aa5a8ad6a9dacb26b00f5d19c06dc700dc0719be#commitcomment-3038058
alter table i2b2demodata.observation_fact drop constraint observation_fact_pk;
alter table i2b2demodata.observation_fact alter column encounter_num drop not null;
alter table i2b2demodata.observation_fact alter column start_date drop not null;
alter table i2b2demodata.observation_fact add primary key (PATIENT_NUM, CONCEPT_CD, PROVIDER_ID, MODIFIER_CD);
