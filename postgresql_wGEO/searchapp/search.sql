
delete from searchapp.search_gene_sig_file_schema;

insert into searchapp.search_gene_sig_file_schema 
(SEARCH_GENE_SIG_FILE_SCHEMA_ID, NAME, DESCRIPTION, NUMBER_COLUMNS, SUPPORTED)
values (1, 'Gene Symbol <tab> Metric Indicator', 'two column upload file schema containing: gene id <tab> value type indicator', 2, true);

insert into searchapp.search_gene_sig_file_schema 
(SEARCH_GENE_SIG_FILE_SCHEMA_ID, NAME, DESCRIPTION, NUMBER_COLUMNS, SUPPORTED)
values (2, 'Gene Symbol <tab> Probeset Symbol <tab> Metric Indicator', 'three column upload file schema containing: gene id <tab> probeset <tab> value type indicator', 3, false);

insert into searchapp.search_gene_sig_file_schema 
(SEARCH_GENE_SIG_FILE_SCHEMA_ID, NAME, DESCRIPTION, NUMBER_COLUMNS, SUPPORTED)
values (3, 'ProbeSet Symbol <tab> Metric Indicator', 'two column upload file schema containing: probeset id <tab> value type indicator', 2, true);

