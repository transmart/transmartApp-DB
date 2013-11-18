--------------------------------------------------------
--  File created - Wednesday-April-03-2013   
--------------------------------------------------------
---------------------------
--New TABLE
--BIO_ANALYSIS_COHORT_XREF
---------------------------
  CREATE TABLE "BIOMART"."BIO_ANALYSIS_COHORT_XREF" 
   (	"STUDY_ID" VARCHAR2(255),
	"COHORT_ID" VARCHAR2(255),
	"ANALYSIS_CD" VARCHAR2(255),
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0)
   );
---------------------------
--New TABLE
--BIO_ANALYSIS_ATTRIBUTE
---------------------------
  CREATE TABLE "BIOMART"."BIO_ANALYSIS_ATTRIBUTE" 
   (	"STUDY_ID" VARCHAR2(255),
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,
	"TERM_ID" NUMBER(22,0),
	"SOURCE_CD" VARCHAR2(255),
	"BIO_ANALYSIS_ATTRIBUTE_ID" NUMBER NOT NULL ENABLE,
	CONSTRAINT "PK_BAA_ID" PRIMARY KEY ("BIO_ANALYSIS_ATTRIBUTE_ID") ENABLE
   );
---------------------------
--New TABLE
--CTA_RESULTS
---------------------------
  CREATE TABLE "BIOMART"."CTA_RESULTS" 
   (	"BIO_ASSAY_ANALYSIS_ID" NUMBER(*,0),
	"SEARCH_KEYWORD_ID" NUMBER(*,0),
	"KEYWORD" VARCHAR2(400),
	"BIO_MARKER_ID" NUMBER(*,0),
	"BIO_MARKER_NAME" VARCHAR2(200),
	"GENE_ID" VARCHAR2(200),
	"PROBE_ID" VARCHAR2(100),
	"FOLD_CHANGE" NUMBER,
	"PREFERRED_PVALUE" NUMBER,
	"ORGANISM" VARCHAR2(100)
   );
---------------------------
--New TABLE
--BIO_ANALYSIS_ATTRIBUTE_LINEAGE
---------------------------
  CREATE TABLE "BIOMART"."BIO_ANALYSIS_ATTRIBUTE_LINEAGE" 
   (	"BIO_ANALYSIS_ATT_LINEAGE_ID" NUMBER NOT NULL ENABLE,
	"BIO_ANALYSIS_ATTRIBUTE_ID" NUMBER NOT NULL ENABLE,
	"ANCESTOR_TERM_ID" NUMBER NOT NULL ENABLE,
	"ANCESTOR_SEARCH_KEYWORD_ID" NUMBER NOT NULL ENABLE,
	CONSTRAINT "PK_BAAL_ID" PRIMARY KEY ("BIO_ANALYSIS_ATT_LINEAGE_ID") ENABLE
   );
---------------------------
--Changed TABLE
--BIO_ASSAY_ANALYSIS
---------------------------
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS" ADD ("ANALYSIS_UPDATE_DATE" DATE);
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS" ADD ("LSMEAN_CUTOFF" NUMBER(9,2));

---------------------------
--Changed TABLE
--BIO_ASSAY_ANALYSIS_DATA
---------------------------
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" ADD ("LSMEAN1" NUMBER(9,2));
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" ADD ("LSMEAN2" NUMBER(9,2));
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" MODIFY ("ADJUSTED_PVALUE" NUMBER(32,15));
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" MODIFY ("CUT_VALUE" NUMBER(32,15));
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" MODIFY ("NUMERIC_VALUE" NUMBER(32,15));
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" MODIFY ("PREFERRED_PVALUE" NUMBER(32,15));
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" MODIFY ("RAW_PVALUE" NUMBER(32,15));
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" MODIFY ("RHO_VALUE" NUMBER(32,15));
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" MODIFY ("R_VALUE" NUMBER(32,15));
ALTER TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" MODIFY ("TEA_NORMALIZED_PVALUE" NUMBER(32,15));

---------------------------
--New TABLE
--HEAT_MAP_RESULTS
---------------------------
  CREATE TABLE "BIOMART"."HEAT_MAP_RESULTS" 
   (	"SUBJECT_ID" VARCHAR2(50),
	"LOG_INTENSITY" NUMBER(18,4),
	"COHORT_ID" VARCHAR2(255),
	"PROBE_ID" VARCHAR2(100),
	"BIO_ASSAY_FEATURE_GROUP_ID" NUMBER(18,0),
	"FOLD_CHANGE_RATIO" NUMBER,
	"TEA_NORMALIZED_PVALUE" NUMBER,
	"BIO_MARKER_NAME" NVARCHAR2(400),
	"BIO_MARKER_ID" NUMBER(18,0),
	"SEARCH_KEYWORD_ID" NUMBER(18,0),
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0),
	"TRIAL_NAME" VARCHAR2(50),
	"SIGNIFICANT" NUMBER,
	"GENE_ID" VARCHAR2(200),
	"ASSAY_ID" NUMBER(18,0),
	"PREFERRED_PVALUE" NUMBER
   )
  PARTITION BY LIST ("TRIAL_NAME");
---------------------------
--New TABLE
--BIO_ASSAY_COHORT
---------------------------
  CREATE TABLE "BIOMART"."BIO_ASSAY_COHORT" 
   (	"STUDY_ID" VARCHAR2(500),
	"COHORT_ID" VARCHAR2(500),
	"DISEASE" VARCHAR2(500),
	"SAMPLE_TYPE" VARCHAR2(500),
	"TREATMENT" VARCHAR2(500),
	"ORGANISM" VARCHAR2(500),
	"PATHOLOGY" VARCHAR2(500),
	"COHORT_TITLE" VARCHAR2(500),
	"SHORT_DESC" VARCHAR2(500),
	"LONG_DESC" VARCHAR2(500),
	"IMPORT_DATE" TIMESTAMP(6) NOT NULL ENABLE,
	"BIO_ASSAY_COHORT_ID" NUMBER(38,0) NOT NULL ENABLE,
	CONSTRAINT "PK_BIO_ASSAY_COHORT" PRIMARY KEY ("BIO_ASSAY_COHORT_ID") ENABLE
   );
---------------------------
--New TABLE
--BIO_COHORT_EXP_XREF
---------------------------
  CREATE TABLE "BIOMART"."BIO_COHORT_EXP_XREF" 
   (	"STUDY_ID" VARCHAR2(255),
	"COHORT_ID" VARCHAR2(255),
	"EXP_ID" VARCHAR2(255)
   );
---------------------------
--New MATERIALIZED VIEW
--BIO_MARKER_EXP_ANALYSIS_MV
---------------------------
CREATE MATERIALIZED VIEW "BIOMART"."BIO_MARKER_EXP_ANALYSIS_MV" ("BIO_MARKER_ID","BIO_EXPERIMENT_ID","BIO_ASSAY_ANALYSIS_ID","MV_ID") 
  PARALLEL 4
  BUILD IMMEDIATE
  USING INDEX REFRESH COMPLETE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT  USING ENFORCED CONSTRAINTS
  ENABLE QUERY REWRITE AS 
  SELECT DISTINCT t3.bio_marker_id,
    t1.bio_experiment_id,
    t1.bio_assay_analysis_id,
    t1.bio_assay_analysis_id*100+t3.bio_marker_id
  FROM BIO_ASSAY_ANALYSIS_DATA t1,
    BIO_EXPERIMENT t2,
    BIO_MARKER t3,
    BIO_ASSAY_DATA_ANNOTATION t4
  WHERE t1.bio_experiment_id       = t2.bio_experiment_id
  AND t2.bio_experiment_type       ='Experiment'
  AND t3.bio_marker_id             =t4.bio_marker_id
  AND t1.bio_assay_feature_group_id=t4.bio_assay_feature_group_id
---------------------------
--Changed MATERIALIZED VIEW
--BIO_MARKER_CORREL_MV
---------------------------
DROP MATERIALIZED VIEW "BIOMART"."BIO_MARKER_CORREL_MV";
CREATE MATERIALIZED VIEW "BIOMART"."BIO_MARKER_CORREL_MV" ("BIO_MARKER_ID","ASSO_BIO_MARKER_ID","CORREL_TYPE","MV_ID")  CACHE
  PARALLEL 
  BUILD IMMEDIATE
  USING INDEX REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT  USING ENFORCED CONSTRAINTS
  DISABLE QUERY REWRITE AS 
  select distinct b.bio_marker_id as bio_marker_id, b.bio_marker_id as asso_bio_marker_id, 'GENE' as correl_type, 1 as mv_id
from biomart.bio_marker b
where b.bio_marker_type='GENE'
UNION 
select distinct b.bio_marker_id as bio_marker_id, b.bio_marker_id as asso_bio_marker_id, 'Protein' as correl_type, 4 as mv_id
from biomart.bio_marker b
where b.bio_marker_type='Protein'
UNION
select distinct c.bio_data_id as bio_marker_id, c.asso_bio_data_id as asso_bio_marker_id , 'PATHWAY_GENE' as correl_type, 2 as mv_id
from
biomart.bio_marker b,
biomart.bio_data_correlation c,
biomart.bio_data_correl_descr d
where 
b.bio_marker_id = c.bio_data_id
and c.bio_data_correl_descr_id = d.bio_data_correl_descr_id
and b.primary_source_code!='ARIADNE'
and d.correlation ='PATHWAY GENE'
UNION 
select distinct c.bio_data_id as bio_marker_id, c.asso_bio_data_id as asso_bio_marker_id , 'HOMOLOGENE_GENE' as correl_type, 3 as mv_id
from
biomart.bio_marker b,
biomart.bio_data_correlation c,
biomart.bio_data_correl_descr d
where 
b.bio_marker_id = c.bio_data_id
and c.bio_data_correl_descr_id = d.bio_data_correl_descr_id
and d.correlation ='HOMOLOGENE GENE'
UNION
select distinct c.bio_data_id as bio_marker_id, c.asso_bio_data_id as asso_bio_marker_id , 'PROTEIN TO GENE' as correl_type, 5 as mv_id
from
biomart.bio_marker b,
biomart.bio_data_correlation c,
biomart.bio_data_correl_descr d
where 
b.bio_marker_id = c.bio_data_id
and c.bio_data_correl_descr_id = d.bio_data_correl_descr_id
and d.correlation ='PROTEIN TO GENE'
UNION
select distinct c.bio_data_id as bio_marker_id, c.asso_bio_data_id as asso_bio_marker_id , 'GENE TO PROTEIN' as correl_type, 6 as mv_id
from
biomart.bio_marker b,
biomart.bio_data_correlation c,
biomart.bio_data_correl_descr d
where 
b.bio_marker_id = c.bio_data_id
and c.bio_data_correl_descr_id = d.bio_data_correl_descr_id
and d.correlation ='GENE TO PROTEIN'
---------------------------
--New INDEX
--BACX_IDX1
---------------------------
  CREATE INDEX "BIOMART"."BACX_IDX1" ON "BIOMART"."BIO_ANALYSIS_COHORT_XREF" ("BIO_ASSAY_ANALYSIS_ID");
---------------------------
--New INDEX
--PK_BIO_ASSAY_COHORT
---------------------------
  CREATE UNIQUE INDEX "BIOMART"."PK_BIO_ASSAY_COHORT" ON "BIOMART"."BIO_ASSAY_COHORT" ("BIO_ASSAY_COHORT_ID");
---------------------------
--New INDEX
--PK_BAAL_ID
---------------------------
  CREATE UNIQUE INDEX "BIOMART"."PK_BAAL_ID" ON "BIOMART"."BIO_ANALYSIS_ATTRIBUTE_LINEAGE" ("BIO_ANALYSIS_ATT_LINEAGE_ID");
---------------------------
--New INDEX
--PK_BAA_ID
---------------------------
  CREATE UNIQUE INDEX "BIOMART"."PK_BAA_ID" ON "BIOMART"."BIO_ANALYSIS_ATTRIBUTE" ("BIO_ANALYSIS_ATTRIBUTE_ID");
---------------------------
--New TRIGGER
--TRIG_BIO_ASY_ANALYSIS_DATA_ID
---------------------------
  CREATE OR REPLACE TRIGGER "BIOMART"."TRIG_BIO_ASY_ANALYSIS_DATA_ID"
  BEFORE INSERT ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA"
  REFERENCING FOR EACH ROW
  BEGIN
  if inserting then       
    if :NEW."BIO_ASY_ANALYSIS_DATA_ID" is null 
    then  select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_ASY_ANALYSIS_DATA_ID" from dual;       
    end if;    
    end if;
END;
/
---------------------------
--New TRIGGER
--TRG_BIO_ASSAY_COHORT_ID
---------------------------
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASSAY_COHORT_ID"
  BEFORE INSERT ON "BIOMART"."BIO_ASSAY_COHORT"
  REFERENCING FOR EACH ROW
  begin     
    if inserting then      
      if :NEW."BIO_ASSAY_COHORT_ID" is null 
      then  select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_ASSAY_COHORT_ID" from dual;       
      end if;   
      end if; 
      end;
/
---------------------------
--New TRIGGER
--TRG_BIO_ANLY_ATT_LINEAGE_ID
---------------------------
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ANLY_ATT_LINEAGE_ID"
  BEFORE INSERT ON "BIOMART"."BIO_ANALYSIS_ATTRIBUTE_LINEAGE"
  REFERENCING FOR EACH ROW
  begin     
	if inserting then       
		if :NEW."BIO_ANALYSIS_ATT_LINEAGE_ID" is null 
		then select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_ANALYSIS_ATT_LINEAGE_ID" from dual;       end if;    end if; end;
/
---------------------------
--New TRIGGER
--TRG_BIO_ANALYSIS_ATTRIBUTE_ID
---------------------------
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ANALYSIS_ATTRIBUTE_ID"
  BEFORE INSERT ON "BIOMART"."BIO_ANALYSIS_ATTRIBUTE"
  REFERENCING FOR EACH ROW
  begin     
	if inserting then       
		if :NEW."BIO_ANALYSIS_ATTRIBUTE_ID" is null 
		then select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_ANALYSIS_ATTRIBUTE_ID" from dual;       end if;    end if; end;
/
