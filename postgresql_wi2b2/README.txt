The following assumes that you have installed postgres using the standard install;
that the account 'postgres' exists on your postgreSQL database;
and that the command psql is on your path.

Furthermore, it is assumed that you have done the install of the 
PostgreSQL Version of I2B2. See the install notes on the transmartprogject.org wiki 
and the github project for installing postgres i2b2: 
https://github.com/transmart/i2b2_1.6_Postgres (master branch).

There are 3 main steps to creating the transmart database:
1.  Create the transmart schemas (and all objects not part of i2b2 or ETL)
2.  Execute the i2b2 postgresql database import scripts to 
create the transmart-specific i2b2 objects, linkages, and data
3.  Create the ETL schema objects

==================================================================
Step 1:
The create-main.sql script will drop and then create schemas, objects, 
and seed data in the transmart database.  

Prior to executing the script:
a. Create the transmart database (you can use the script transmart-db.sql as a guide) 
b. In tablespaces.sql, update the directory locations of the tablespaces to be created.  
Verify that these directories exist with proper permissions for a postgresql 
tablespace directory.

Execute the create-main script (substitute hostname if not 'localhost')
	psql -h localhost -U postgres -d transmart -f create-main.sql --quiet
	
Note: a number of warning will be printed which you can ignore, if the below
verifications are correct, this step worked! The warnings all come from statements
to "drop x if it exists". 

Verification:
1. Verify SEARCHAPP table row counts using searchapp/data/check_counts.sql.
  Login as biomart_user/biomart_user...
  psql -h localhost -U biomart_user -W -d transmart -f searchapp/data/check_counts.sql
Following are the expected row counts for each table:
SEARCH_KEYWORD_TERM	105844
SEARCH_KEYWORD	42114
SEARCH_REQUEST_MAP	17
PLUGIN_MODULE	11
SEARCH_ROLE_AUTH_USER	11
SEARCH_AUTH_PRINCIPAL	6
SEARCH_AUTH_USER	5
SEARCH_ROLE	5
SEARCH_GENE_SIG_FILE_SCHEMA	3
SEARCH_SEC_ACCESS_LEVEL	3
SEARCH_AUTH_GROUP	1
PLUGIN	1
SEARCH_AUTH_GROUP_MEMBER	0
SEARCH_SECURE_OBJECT_PATH	0
SEARCH_AUTH_USER_SEC_ACCESS	0
SEARCH_BIO_MKR_CORREL_FAST_MV	0
SEARCH_CUSTOM_FILTER_ITEM	0
SEARCH_GENE_SIGNATURE_ITEM	0
SEARCH_APP_ACCESS_LOG	0
SEARCH_SECURE_OBJECT	0
SEARCH_AUTH_SEC_OBJECT_ACCESS	0
SEARCH_CUSTOM_FILTER	0
SEARCH_GENE_SIGNATURE	0

2. Verify DEAPP table row counts using deapp/data/check_counts.sql.  
  Login as biomart_user/biomart_user...
  psql -h localhost -U biomart_user -W -d transmart -f deapp/data/check_counts.sql
Following are the expected row counts for each table:
DE_SUBJECT_MICROARRAY_DATA	54400
DE_MRNA_ANNOTATION	5440
DE_SUBJECT_SAMPLE_MAPPING	10
DE_SAVED_COMPARISON	5
DE_GPL_INFO	1
DE_SNP_DATA_BY_PATIENT	0
DE_SNP_DATA_BY_PROBE	0
DE_SNP_DATA_DATASET_LOC	0
DE_SNP_GENE_MAP	0
HAPLOVIEW_DATA	0
DE_SNP_PROBE	0
DE_SNP_PROBE_SORTED_DEF	0
DE_SNP_SUBJECT_SORTED_DEF	0
DE_SUBJECT_MICROARRAY_LOGS	0
DE_SUBJECT_MICROARRAY_MED	0
DE_SUBJECT_PROTEIN_DATA	0
DE_SUBJECT_RBM_DATA	0
DE_SUBJECT_SNP_DATASET	0
DE_XTRIAL_CHILD_MAP	0
DE_XTRIAL_PARENT_NAMES	0
DE_SNP_COPY_NUMBER	0
DE_SNP_CALLS_BY_GSM	0
DE_PATHWAY_GENE	0
DE_PATHWAY	0
DEAPP_ANNOTATION	0
DE_SNP_INFO	0

3. Verify BIOMART table row counts using biomart/data/check_counts.sql.
  Login as biomart_user/biomart_user...
  psql -h localhost -U biomart_user -W -d transmart -f biomart/data/check_counts.sql  
Following are the expected row counts for each table:
BIO_ASSAY_FEATURE_GROUP	237002 
BIO_ASSAY_ANALYSIS_DATA	184538 
BIO_DATA_EXT_CODE	134965 
BIO_DATA_UID	126764 
BIO_ASSAY_DATA_ANNOTATION	104960 
BIO_MARKER	100171 
bio_marker_correl_mv        100171 
BIO_DATA_OMIC_MARKER	78821 
BIO_DISEASE	26581 
BIO_ASSAY_ANALYSIS_DATA_TEA	13140 
TMP_ANALYSIS_DATA_TEA_RANK	5605 
BIO_CONCEPT_CODE	50 
BIO_ASSAY_PLATFORM	34 
BIO_DATA_DISEASE	27 
BIO_ASSAY_DATASET	19 
BIO_ASSAY_ANALYSIS	12 
BIO_CONTENT	7 
BIO_EXPERIMENT	7 
BIO_CONTENT_REFERENCE	7 
BIO_TAXONOMY	1 
BIO_CONTENT_REPOSITORY	1 
BIO_ASY_ANALYSIS_PLTFM	1 
BIO_CLINICAL_TRIAL	0
BIO_CLINICAL_TRIAL_DESIGN	0
BIO_COMPOUND	0
BIO_CURATED_DATA	0
BIO_CURATION_DATASET	0
BIO_DATA_ATTRIBUTE	0
BIO_DATA_COMPOUND	0
BIO_DATA_CORRELATION	0
BIO_DATA_CORREL_DESCR	0
BIO_DATA_LITERATURE	0
CTD_STUDY	0
BIO_LIT_ALT_DATA	0
BIO_LIT_AMD_DATA	0
BIO_LIT_INH_DATA	0
BIO_LIT_INT_DATA	0
BIO_LIT_MODEL_DATA	0
BIO_LIT_PE_DATA	0
BIO_LIT_REF_DATA	0
BIO_LIT_SUM_DATA	0
BIO_PATIENT	0
BIO_PATIENT_EVENT	0
BIO_PATIENT_EVENT_ATTR	0
BIO_SAMPLE	0
BIO_STATS_EXP_MARKER	0
BIO_SUBJECT	0
CTD2_CLIN_INHIB_EFFECT	0
CTD2_DISEASE	0
CTD2_INHIB_DETAILS	0
CTD2_STUDY	0
CTD2_TRIAL_DETAILS	0
CTD_ALLOWED_MEDS_TREATMENT	0
CTD_BIOMARKER	0
CTD_DISEASE	0
CTD_DRUG_INHIB	0
CTD_FULL	0
CTD_INCLUSION_CRITERIA	0
CTD_PRIMARY_ENDPTS	0
CTD_SEC_ENDPTS	0
BIO_CLINC_TRIAL_TIME_PT	0
BIO_CLINC_TRIAL_PT_GROUP	0
BIO_CLINC_TRIAL_ATTR	0
BIO_CGDCP_DATA	0
BIO_CELL_LINE	0
BIO_ASY_DATA_STATS_ALL	0
BIO_ASY_ANALYSIS_DATASET	0
BIO_ASSAY_SAMPLE	0
BIO_ASSAY_DATA_STATS	0
BIO_ASSAY_DATA	0
BIO_ASSAY	0
BIO_DATA_TAXONOMY	0
bio_lit_int_model_mv        0

==================================================================
==================================================================

Step 2: Execute the i2b2 postgresql import scripts 
	These are in the master branch of git://github.com/transmart/i2b2_1.6_Postgres.git
	See the file 'Data load instructions.docx' in the NewInstall directory,
	i2b2_1.6_Postgres/demodata/src/src/edu.harvard.i2b2.data/Release_1-6/NewInstall
	
==================================================================
==================================================================

Step 3: Post-i2b2 scripts (substitute for localhost, if appropriate)
This includes the ETL schema objects (first, because of dependencies)

a. psql -h localhost -U postgres -d transmart -f i2b2-grants.sql --quiet
b  psql -h localhost -U postgres -d transmart -f etl/start.sql --quiet
c. psql -h localhost -U postgres -d transmart -f post-i2b2.sql --quiet
     
