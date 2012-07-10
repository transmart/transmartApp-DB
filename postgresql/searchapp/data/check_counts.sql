select * from (
select 'PLUGIN', count(*) from searchapp.PLUGIN UNION 
select 'PLUGIN_MODULE', count(*) from searchapp.PLUGIN_MODULE UNION 
select 'SEARCH_APP_ACCESS_LOG', count(*) from searchapp.SEARCH_APP_ACCESS_LOG UNION 
select 'SEARCH_AUTH_GROUP', count(*) from searchapp.SEARCH_AUTH_GROUP UNION 
select 'SEARCH_AUTH_GROUP_MEMBER', count(*) from searchapp.SEARCH_AUTH_GROUP_MEMBER UNION 
select 'SEARCH_AUTH_PRINCIPAL', count(*) from searchapp.SEARCH_AUTH_PRINCIPAL UNION 
select 'SEARCH_AUTH_SEC_OBJECT_ACCESS', count(*) from searchapp.SEARCH_AUTH_SEC_OBJECT_ACCESS UNION 
select 'SEARCH_AUTH_USER', count(*) from searchapp.SEARCH_AUTH_USER UNION 
select 'SEARCH_AUTH_USER_SEC_ACCESS', count(*) from searchapp.SEARCH_AUTH_USER_SEC_ACCESS UNION 
select 'SEARCH_BIO_MKR_CORREL_FAST_MV', count(*) from searchapp.SEARCH_BIO_MKR_CORREL_FAST_MV UNION 
select 'SEARCH_CUSTOM_FILTER', count(*) from searchapp.SEARCH_CUSTOM_FILTER UNION 
select 'SEARCH_CUSTOM_FILTER_ITEM', count(*) from searchapp.SEARCH_CUSTOM_FILTER_ITEM UNION 
select 'SEARCH_GENE_SIGNATURE', count(*) from searchapp.SEARCH_GENE_SIGNATURE UNION 
select 'SEARCH_GENE_SIGNATURE_ITEM', count(*) from searchapp.SEARCH_GENE_SIGNATURE_ITEM UNION 
select 'SEARCH_GENE_SIG_FILE_SCHEMA', count(*) from searchapp.SEARCH_GENE_SIG_FILE_SCHEMA UNION 
select 'SEARCH_KEYWORD', count(*) from searchapp.SEARCH_KEYWORD UNION 
select 'SEARCH_KEYWORD_TERM', count(*) from searchapp.SEARCH_KEYWORD_TERM UNION 
select 'SEARCH_REQUEST_MAP', count(*) from searchapp.SEARCH_REQUEST_MAP UNION 
select 'SEARCH_ROLE', count(*) from searchapp.SEARCH_ROLE UNION 
select 'SEARCH_ROLE_AUTH_USER', count(*) from searchapp.SEARCH_ROLE_AUTH_USER UNION 
select 'SEARCH_SECURE_OBJECT', count(*) from searchapp.SEARCH_SECURE_OBJECT UNION 
select 'SEARCH_SECURE_OBJECT_PATH', count(*) from searchapp.SEARCH_SECURE_OBJECT_PATH UNION 
select 'SEARCH_SEC_ACCESS_LEVEL', count(*) from searchapp.SEARCH_SEC_ACCESS_LEVEL 
) a
order by 2 desc