Prior to executing the scripts:
a. Create transmart database if does not exist 
b. Create user biomart_user if does not exist:

CREATE ROLE biomart_user LOGIN
  PASSWORD 'biomart_user'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

c. In deapp/prerequisites.sql, update the locations of the tablespaces to be created (DEAPP, BIOMART, TRANSMART).  Verify that these directories exist with proper permissions.  
If the tablespace(s) already exist, these lines can be removed or commented out.

The deapp schema can be created thru the SQL scripts. 

Using scripts:
a.  In deapp/start.sh, update the "pgbin" variable to the path where the psql executable file is on the server being run on
b.  From deapp folder, execute the start.sh script
     sh ./start.sh

Verification - After completing above, verify the counts of the tables by running the SQL in deapp/data/check_counts.sql.  Following are the expected row counts for each table:

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