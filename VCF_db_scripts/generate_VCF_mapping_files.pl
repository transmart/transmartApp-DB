#!/usr/bin/perl

## This script was developed specifically to load VCF data into tranSMART
## NGS data (VCF file) were loaded to VCF-specific tables under schema DEAPP already

## This script will generate all necessary files to be loaded into i2b2demodata and i2b2metadata tables, as well deapp table (de_subject_sample_mapping)
## IF you have already loaded the Clinical Data into tranSMART with other tools, you do not need to load i2b2demodata and i2b2metadata tables
##    Instead, you only need to load deapp.de_subject_sample_mapping table (to link the Clinical Data and VCF sample IDs)

##### Users should adjust the following few lines *************
our $source = '54GenomesChr17';
our $trial = '54Genomes';
our $subject_sample = $source."_subject_sample_mapping.txt";
our $fullpath = "Public_Studies+54Genomes+Biomarker_Data+Next_Generation_Sequencing+CGI_54_Genome_VCF";

##### Do NOT modify stuff after this line *******

use strict;

our ($subj_id, $sample_id, $hlevel, $path, $name, $path1, $attr, @fields,$top_node);

## Loop through the full path and add proper data to affected tables
open CD, "> load_concept_dimension.sql" or die "Cannot open file: $!";
open IB, "> load_i2b2.sql" or die "Cannot open file: $!";

@fields = split (/\+/, $fullpath);
$top_node =  $fields[0];
$top_node =~ s/_/ /g;

$path = "\\" . $top_node . "\\";
for ( $hlevel = 1; $hlevel <= $#fields; $hlevel++) {
	$name = $fields[$hlevel];
	$name =~ s/_/ /g;
	$path = $path . $name . "\\";

	if ($hlevel == 1) {
		$attr = "FA";
		$path1 = $path;
		print CD "insert into i2b2demodata.concept_dimension (concept_cd, concept_path, name_char, update_date, download_date, import_date, sourcesystem_cd, table_name)\n";
		print CD " values (concept_id.nextval,'$path','$name',sysdate,sysdate,sysdate,null,'CONCEPT_DIMENSION');\n";
		print IB "insert into i2b2metadata.i2b2 (c_hlevel,c_fullname,c_name,c_synonym_cd,C_VISUALATTRIBUTES,C_BASECODE,C_FACTTABLECOLUMN,C_TABLENAME,\n";
		print IB "C_COLUMNNAME,C_COLUMNDATATYPE,C_OPERATOR,C_DIMCODE,C_COMMENT,C_TOOLTIP,UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,SOURCESYSTEM_CD,I2B2_ID,M_APPLIED_PATH)\n";
		print IB " values ($hlevel,'$path','$name','N','$attr',select concept_cd from i2b2demodata.concept_dimension where CONCEPT_PATH = '$path',\n";
		print IB "'CONCEPT_CD','CONCEPT_DIMENSION','CONCEPT_PATH','T','LIKE','$path','SOURCE:$trial',\n";
		print IB "'$path',sysdate,sysdate,sysdate,null,I2B2_ID_SEQ.nextval,null);\n";
	} else {
		if ($hlevel == $#fields) {
			$attr = "LAH";
		} else {
			$attr = "FA";
		}
		print CD "insert into i2b2demodata.concept_dimension (concept_cd, concept_path, name_char, update_date, download_date, import_date, sourcesystem_cd, table_name)\n";
                print CD " values (concept_id.nextval,'$path','$name',sysdate,sysdate,sysdate,'$trial','CONCEPT_DIMENSION');\n";
                print IB "insert into i2b2metadata.i2b2 (c_hlevel,c_fullname,c_name,c_synonym_cd,C_VISUALATTRIBUTES,C_BASECODE,C_FACTTABLECOLUMN,C_TABLENAME,\n";
                print IB "C_COLUMNNAME,C_COLUMNDATATYPE,C_OPERATOR,C_DIMCODE,C_COMMENT,C_TOOLTIP,UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,SOURCESYSTEM_CD,I2B2_ID,M_APPLIED_PATH)\n";
                print IB " values ($hlevel,'$path','$name','N','$attr',select concept_cd from i2b2demodata.concept_dimension where CONCEPT_PATH = '$path',\n";
                print IB "'CONCEPT_CD','CONCEPT_DIMENSION','CONCEPT_PATH','T','LIKE','$path','SOURCE:$trial',\n";
                print IB "'$path',sysdate,sysdate,sysdate,'$trial',I2B2_ID_SEQ.nextval,'\@');\n";
	}

}
print CD "\ncommit;\n";
print IB "\ncommit;\n";
close CD;
close IB;

open MAPPING, "< $subject_sample" or die "Cannot open file: $!";
open DE, "> load_de_subject_sample_mapping.sql" or die "Cannot open file: $!";
open OF, "> load_observation_fact.sql" or die "Cannot open file: $!";
$subj_id = "";
$sample_id = "";

while (<MAPPING>) {
chomp;
        ($subj_id, $sample_id) = split (/\t/);
        if ($subj_id eq "" or $sample_id eq "") {
                die "The subject sample mapping file should be tab-delimited and have at least two columns.";
        }
        print DE "insert into deapp.de_subject_sample_mapping (patient_id, subject_id)\n";
        print DE " values ($subj_id, '$sample_id');\n";
	print OF "insert into i2b2demodata.observation_fact (patient_num, concept_cd, provider_id, modifier_cd, valtype_cd,tval_char,valueflag_cd,location_cd,import_date,sourcesystem_cd,instance_num)\n";
	print OF " values ($subj_id,select concept_cd from concept_dimension where CONCEPT_PATH = '$path','\@','$trial','T','$name','\@','\@',sysdate,'$trial:$sample_id',1);\n";

}
print DE "\ncommit;\n";
print OF "\ncommit;\n";
close MAPPING;
close DE;
close OF;

open SECURE, "> load_i2b2_secure.sql" or die "Cannot open file: $!";
print SECURE " insert into i2b2metadata.i2b2_secure 
	(c_hlevel,c_fullname,
	c_name,c_synonym_cd,
	C_VISUALATTRIBUTES,C_BASECODE,
	C_FACTTABLECOLUMN,C_TABLENAME,
	C_COLUMNNAME,C_COLUMNDATATYPE,
	C_OPERATOR,C_DIMCODE,
	C_COMMENT,C_TOOLTIP,
	UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,
	SOURCESYSTEM_CD,I2B2_ID,
	M_APPLIED_PATH,SECURE_OBJ_TOKEN)
 select 
	c_hlevel,c_fullname,
	c_name,c_synonym_cd,
	C_VISUALATTRIBUTES,C_BASECODE,
	C_FACTTABLECOLUMN,C_TABLENAME,
	C_COLUMNNAME,C_COLUMNDATATYPE,
	C_OPERATOR,C_DIMCODE,
	C_COMMENT,C_TOOLTIP,
	UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,
	SOURCESYSTEM_CD,I2B2_ID,
	M_APPLIED_PATH,'EXP:PUBLIC'
 from 
	i2b2metadata.i2b2 
 where 
	c_fullname like '$path1%';

 commit;
\n";
close SECURE;

open COUNT, "> load_concept_counts.sql"  or die "Cannot open file: $!";
print COUNT " insert into concept_counts
      (concept_path
       ,parent_concept_path
        ,patient_count
       )
select
        fa.c_fullname
        ,ltrim(SUBSTR(fa.c_fullname, 1,instr(fa.c_fullname, '\',-1,2)))
        ,count(distinct tpm.patient_num)
from
        i2b2metadata.i2b2 fa
        ,i2b2metadata.i2b2 la
        ,observation_fact tpm
        ,patient_dimension p
where
        fa.c_fullname like '$path1%'
        and substr(fa.c_visualattributes,2,1) != 'H'
        and la.c_fullname like fa.c_fullname || '%'
        and la.c_visualattributes like 'L%'
        and tpm.patient_num = p.patient_num
        and la.c_basecode = tpm.concept_cd
 group by
        fa.c_fullname
        ,ltrim(SUBSTR(fa.c_fullname, 1,instr(fa.c_fullname, '\',-1,2)));

 commit;
\n";
close COUNT;

## The following will generate a shell script
## If everything goes well, you only need to run this shell script
 
open RUN, "> load_mapping_tables.sh" or die "Cannot open file: $!";
print RUN "
 date
 sqlplus i2b2demodata/i2b2demodata \@load_concept_dimension.sql
 sqlplus i2b2demodata/i2b2demodata \@load_observation_fact.sql

 sqlplus i2b2metadata/i2b2metadata \@load_i2b2.sql
 sqlplus i2b2metadata/i2b2metadata \@load_i2b2_secure.sql

 sqlplus deapp/deapp \@load_de_subject_sample_mapping.sql

 sqlplus biomart_user/biomart_user \@load_concept_counts.sql
 date
\n";
close RUN;

system "chmod 755 load_mapping_tables.sh";


