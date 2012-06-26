select * from (
select 'DEAPP_ANNOTATION', count(*) from deapp.DEAPP_ANNOTATION UNION 
select 'DE_GPL_INFO', count(*) from deapp.DE_GPL_INFO UNION 
select 'DE_MRNA_ANNOTATION', count(*) from deapp.DE_MRNA_ANNOTATION UNION 
select 'DE_PATHWAY', count(*) from deapp.DE_PATHWAY UNION 
select 'DE_PATHWAY_GENE', count(*) from deapp.DE_PATHWAY_GENE UNION 
select 'DE_SAVED_COMPARISON', count(*) from deapp.DE_SAVED_COMPARISON UNION 
select 'DE_SNP_DATA_DATASET_LOC', count(*) from deapp.DE_SNP_DATA_DATASET_LOC UNION 
select 'DE_SNP_GENE_MAP', count(*) from deapp.DE_SNP_GENE_MAP UNION 
select 'DE_SNP_INFO', count(*) from deapp.DE_SNP_INFO UNION 
select 'DE_SNP_PROBE', count(*) from deapp.DE_SNP_PROBE UNION 
select 'DE_SNP_SUBJECT_SORTED_DEF', count(*) from deapp.DE_SNP_SUBJECT_SORTED_DEF UNION 
select 'DE_SUBJECT_MICROARRAY_LOGS', count(*) from deapp.DE_SUBJECT_MICROARRAY_LOGS UNION 
select 'DE_SUBJECT_MICROARRAY_MED', count(*) from deapp.DE_SUBJECT_MICROARRAY_MED UNION 
select 'DE_SUBJECT_PROTEIN_DATA', count(*) from deapp.DE_SUBJECT_PROTEIN_DATA UNION 
select 'DE_SUBJECT_RBM_DATA', count(*) from deapp.DE_SUBJECT_RBM_DATA UNION 
select 'DE_SUBJECT_SAMPLE_MAPPING', count(*) from deapp.DE_SUBJECT_SAMPLE_MAPPING UNION 
select 'DE_SUBJECT_SNP_DATASET', count(*) from deapp.DE_SUBJECT_SNP_DATASET UNION 
select 'DE_XTRIAL_CHILD_MAP', count(*) from deapp.DE_XTRIAL_CHILD_MAP UNION 
select 'DE_XTRIAL_PARENT_NAMES', count(*) from deapp.DE_XTRIAL_PARENT_NAMES UNION 
select 'DE_SUBJECT_MICROARRAY_DATA', count(*) from deapp.DE_SUBJECT_MICROARRAY_DATA UNION 
select 'DE_SNP_COPY_NUMBER', count(*) from deapp.DE_SNP_COPY_NUMBER UNION 
select 'DE_SNP_CALLS_BY_GSM', count(*) from deapp.DE_SNP_CALLS_BY_GSM UNION 
select 'DE_SNP_DATA_BY_PATIENT', count(*) from deapp.DE_SNP_DATA_BY_PATIENT UNION 
select 'DE_SNP_DATA_BY_PROBE', count(*) from deapp.DE_SNP_DATA_BY_PROBE UNION 
select 'DE_SNP_PROBE_SORTED_DEF', count(*) from deapp.DE_SNP_PROBE_SORTED_DEF UNION 
select 'HAPLOVIEW_DATA', count(*) from deapp.HAPLOVIEW_DATA
) a
order by 2 desc