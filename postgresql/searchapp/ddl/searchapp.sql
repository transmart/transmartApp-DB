

-- TABLES
CREATE TABLE searchapp.search_auth_sec_object_access (
	auth_sec_obj_access_id bigint NOT NULL,
	auth_principal_id bigint,
	secure_object_id bigint,
	secure_access_level_id bigint
);
ALTER TABLE searchapp.search_auth_sec_object_access OWNER TO searchapp;
ALTER TABLE searchapp.search_auth_sec_object_access ADD CONSTRAINT sch_sec_a_a_s_a_pk PRIMARY KEY (auth_sec_obj_access_id);
CREATE TABLE searchapp.search_keyword (
	keyword varchar(200),
	bio_data_id bigint,
	unique_id varchar(500) NOT NULL,
	search_keyword_id bigint NOT NULL,
	data_category varchar(200) NOT NULL,
	source_code varchar(100),
	display_data_category varchar(200),
	owner_auth_user_id bigint
);
ALTER TABLE searchapp.search_keyword OWNER TO searchapp;
ALTER TABLE searchapp.search_keyword ADD CONSTRAINT search_keyword_uk UNIQUE (unique_id,data_category);
ALTER TABLE searchapp.search_keyword ADD CONSTRAINT search_kw_pk PRIMARY KEY (search_keyword_id);
CREATE INDEX search_keyword_index1 ON searchapp.search_keyword (keyword);
CREATE INDEX search_keyword_index2 ON searchapp.search_keyword (bio_data_id);
CREATE INDEX search_keyword_index3 ON searchapp.search_keyword (owner_auth_user_id);
CREATE TABLE searchapp.search_gene_sig_file_schema (
	search_gene_sig_file_schema_id bigint NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(255),
	number_columns bigint DEFAULT 2,
	supported boolean DEFAULT false
);
ALTER TABLE searchapp.search_gene_sig_file_schema OWNER TO searchapp;
ALTER TABLE searchapp.search_gene_sig_file_schema ADD CONSTRAINT search_gene_sig_file_sche_pk PRIMARY KEY (search_gene_sig_file_schema_id);
CREATE TABLE searchapp.search_auth_principal (
	id bigint NOT NULL,
	principal_type varchar(255),
	date_created timestamp NOT NULL,
	description varchar(255),
	last_updated timestamp NOT NULL,
	name varchar(255),
	unique_id varchar(255),
	enabled boolean
);
ALTER TABLE searchapp.search_auth_principal OWNER TO searchapp;
ALTER TABLE searchapp.search_auth_principal ADD CONSTRAINT pk_search_principal PRIMARY KEY (id);
CREATE TABLE searchapp.search_app_access_log (
	id bigint,
	access_time timestamp,
	event varchar(255),
	request_url varchar(255),
	user_name varchar(255),
	event_message text
);
ALTER TABLE searchapp.search_app_access_log OWNER TO searchapp;
CREATE TABLE searchapp.search_gene_signature_item (
	search_gene_signature_id bigint NOT NULL,
	bio_marker_id bigint,
	fold_chg_metric bigint,
	bio_data_unique_id varchar(200),
	id bigint NOT NULL,
	bio_assay_feature_group_id bigint
);
ALTER TABLE searchapp.search_gene_signature_item OWNER TO searchapp;
ALTER TABLE searchapp.search_gene_signature_item ADD CONSTRAINT search_gene_signature_ite_pk PRIMARY KEY (id);
CREATE TABLE searchapp.search_custom_filter_item (
	search_custom_filter_item_id bigint NOT NULL,
	search_custom_filter_id bigint NOT NULL,
	unique_id varchar(200) NOT NULL,
	bio_data_type varchar(100) NOT NULL
);
ALTER TABLE searchapp.search_custom_filter_item OWNER TO searchapp;
ALTER TABLE searchapp.search_custom_filter_item ADD CONSTRAINT search_cust_fil_item_pk PRIMARY KEY (search_custom_filter_item_id);
CREATE TABLE searchapp.search_keyword_term (
	keyword_term varchar(200),
	search_keyword_id bigint,
	rank bigint,
	search_keyword_term_id bigint NOT NULL,
	term_length bigint,
	owner_auth_user_id bigint
);
ALTER TABLE searchapp.search_keyword_term OWNER TO searchapp;
ALTER TABLE searchapp.search_keyword_term ADD CONSTRAINT search_kw_term_pk PRIMARY KEY (search_keyword_term_id);
CREATE INDEX search_kw_term_skid_idx ON searchapp.search_keyword_term (search_keyword_id);
CREATE TABLE searchapp.search_role_auth_user (
	people_id bigint,
	authorities_id bigint
);
ALTER TABLE searchapp.search_role_auth_user OWNER TO searchapp;
CREATE TABLE searchapp.search_custom_filter (
	search_custom_filter_id bigint NOT NULL,
	search_user_id bigint NOT NULL,
	name varchar(200) NOT NULL,
	description varchar(2000),
	private char(1) DEFAULT 'N'
);
ALTER TABLE searchapp.search_custom_filter OWNER TO searchapp;
ALTER TABLE searchapp.search_custom_filter ADD CONSTRAINT search_custom_filter_pk PRIMARY KEY (search_custom_filter_id);
CREATE TABLE searchapp.search_auth_user (
	id bigint NOT NULL,
	email varchar(255),
	email_show boolean,
	passwd varchar(255),
	user_real_name varchar(255),
	username varchar(255)
);
ALTER TABLE searchapp.search_auth_user OWNER TO searchapp;
ALTER TABLE searchapp.search_auth_user ADD CONSTRAINT sys_c0011119 PRIMARY KEY (id);
CREATE TABLE searchapp.search_secure_object (
	search_secure_object_id bigint NOT NULL,
	bio_data_id bigint,
	display_name varchar(100),
	data_type varchar(200),
	bio_data_unique_id varchar(200)
);
ALTER TABLE searchapp.search_secure_object OWNER TO searchapp;
ALTER TABLE searchapp.search_secure_object ADD CONSTRAINT search_sec_obj_pk PRIMARY KEY (search_secure_object_id);
CREATE TABLE searchapp.plugin (
	plugin_seq bigint NOT NULL,
	name varchar(200) NOT NULL,
	plugin_name varchar(90) NOT NULL,
	has_modules char(1) DEFAULT 'N',
	has_form char(1) DEFAULT 'N',
	default_link varchar(70) NOT NULL,
	form_link varchar(70),
	form_page varchar(100),
	active char(1)
);
ALTER TABLE searchapp.plugin OWNER TO searchapp;
ALTER TABLE searchapp.plugin ADD CONSTRAINT plugin_pk PRIMARY KEY (plugin_seq);
CREATE TABLE searchapp.search_sec_access_level (
	search_sec_access_level_id bigint NOT NULL,
	access_level_name varchar(200),
	access_level_value bigint
);
ALTER TABLE searchapp.search_sec_access_level OWNER TO searchapp;
ALTER TABLE searchapp.search_sec_access_level ADD CONSTRAINT search_sec_ac_level_pk PRIMARY KEY (search_sec_access_level_id);
CREATE TABLE searchapp.search_auth_group_member (
	auth_user_id bigint,
	auth_group_id bigint
);
ALTER TABLE searchapp.search_auth_group_member OWNER TO searchapp;
CREATE TABLE searchapp.search_secure_object_path (
	search_secure_object_id bigint,
	i2b2_concept_path varchar(2000),
	search_secure_obj_path_id bigint NOT NULL
);
ALTER TABLE searchapp.search_secure_object_path OWNER TO searchapp;
ALTER TABLE searchapp.search_secure_object_path ADD CONSTRAINT search_sec_obj__path_pk PRIMARY KEY (search_secure_obj_path_id);
CREATE TABLE searchapp.plugin_module (
	module_seq bigint NOT NULL,
	plugin_seq bigint NOT NULL,
	name varchar(70) NOT NULL,
	params text,
	version varchar(10) DEFAULT 0.1,
	active char(1) DEFAULT 'Y',
	has_form char(1) DEFAULT 'N',
	form_link varchar(90),
	form_page varchar(90),
	module_name varchar(50) NOT NULL,
	category varchar(50)
);
ALTER TABLE searchapp.plugin_module OWNER TO searchapp;
ALTER TABLE searchapp.plugin_module ADD CONSTRAINT plugin_module_pk PRIMARY KEY (module_seq);
CREATE TABLE searchapp.search_role (
	id bigint NOT NULL,
	version bigint,
	authority varchar(255),
	description varchar(255)
);
ALTER TABLE searchapp.search_role OWNER TO searchapp;
ALTER TABLE searchapp.search_role ADD CONSTRAINT sys_c0011120 PRIMARY KEY (id);
CREATE TABLE searchapp.search_auth_group (
	id bigint NOT NULL,
	group_category varchar(255)
);
ALTER TABLE searchapp.search_auth_group OWNER TO searchapp;
ALTER TABLE searchapp.search_auth_group ADD CONSTRAINT pk_auth_usr_group PRIMARY KEY (id);
CREATE TABLE searchapp.search_request_map (
	id bigint,
	version bigint,
	config_attribute varchar(255),
	url varchar(255)
);
ALTER TABLE searchapp.search_request_map OWNER TO searchapp;
CREATE TABLE searchapp.search_gene_signature (
	search_gene_signature_id bigint NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(1000),
	unique_id varchar(50),
	create_date timestamp NOT NULL,
	created_by_auth_user_id bigint NOT NULL,
	last_modified_date timestamp,
	modified_by_auth_user_id bigint,
	version_number varchar(50),
	public_flag boolean DEFAULT false,
	deleted_flag boolean DEFAULT false,
	parent_gene_signature_id bigint,
	source_concept_id bigint,
	source_other varchar(255),
	owner_concept_id bigint,
	stimulus_description varchar(1000),
	stimulus_dosing varchar(255),
	treatment_description varchar(1000),
	treatment_dosing varchar(255),
	treatment_bio_compound_id bigint,
	treatment_protocol_number varchar(50),
	pmid_list varchar(255),
	species_concept_id bigint NOT NULL,
	species_mouse_src_concept_id bigint,
	species_mouse_detail varchar(255),
	tissue_type_concept_id bigint,
	experiment_type_concept_id bigint,
	experiment_type_in_vivo_descr varchar(255),
	experiment_type_atcc_ref varchar(255),
	analytic_cat_concept_id bigint,
	analytic_cat_other varchar(255),
	bio_assay_platform_id bigint NOT NULL,
	analyst_name varchar(100),
	norm_method_concept_id bigint,
	norm_method_other varchar(255),
	analysis_method_concept_id bigint,
	analysis_method_other varchar(255),
	multiple_testing_correction boolean,
	p_value_cutoff_concept_id bigint NOT NULL,
	upload_file varchar(255) NOT NULL,
	search_gene_sig_file_schema_id bigint DEFAULT 1,
	fold_chg_metric_concept_id bigint DEFAULT NULL,
	experiment_type_cell_line_id bigint
);
ALTER TABLE searchapp.search_gene_signature OWNER TO searchapp;
ALTER TABLE searchapp.search_gene_signature ADD CONSTRAINT search_gene_sig_descr_pk PRIMARY KEY (search_gene_signature_id);
CREATE TABLE searchapp.search_auth_user_sec_access (
	search_auth_user_sec_access_id bigint NOT NULL,
	search_auth_user_id bigint,
	search_secure_object_id bigint,
	search_sec_access_level_id bigint
);
ALTER TABLE searchapp.search_auth_user_sec_access OWNER TO searchapp;
ALTER TABLE searchapp.search_auth_user_sec_access ADD CONSTRAINT search_sec_a_u_s_a_pk PRIMARY KEY (search_auth_user_sec_access_id);
ALTER TABLE searchapp.search_auth_sec_object_access ADD CONSTRAINT sch_sec_a_u_fk FOREIGN KEY (auth_principal_id) REFERENCES searchapp.search_auth_principal (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE searchapp.search_auth_sec_object_access ADD CONSTRAINT sch_sec_s_o_fk FOREIGN KEY (secure_object_id) REFERENCES searchapp.search_secure_object (search_secure_object_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE searchapp.search_auth_sec_object_access ADD CONSTRAINT sch_sec_s_a_l_fk FOREIGN KEY (secure_access_level_id) REFERENCES searchapp.search_sec_access_level (search_sec_access_level_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE searchapp.search_keyword_term ADD CONSTRAINT search_kw_fk FOREIGN KEY (search_keyword_id) REFERENCES searchapp.search_keyword (search_keyword_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE searchapp.search_role_auth_user ADD CONSTRAINT fkfb14ef79287e0cac FOREIGN KEY (authorities_id) REFERENCES searchapp.search_auth_user (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE searchapp.search_role_auth_user ADD CONSTRAINT fkfb14ef798f01f561 FOREIGN KEY (people_id) REFERENCES searchapp.search_role (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE searchapp.search_auth_user ADD CONSTRAINT sh_auth_user_id_fk FOREIGN KEY (id) REFERENCES searchapp.search_auth_principal (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE searchapp.search_auth_group_member ADD CONSTRAINT sch_user_gp_m_grp_fk FOREIGN KEY (auth_group_id) REFERENCES searchapp.search_auth_group (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE searchapp.search_auth_group_member ADD CONSTRAINT sch_user_gp_m_usr_fk FOREIGN KEY (auth_user_id) REFERENCES searchapp.search_auth_principal (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE searchapp.plugin_module ADD CONSTRAINT plugin_module_plugin_fk1 FOREIGN KEY (plugin_seq) REFERENCES searchapp.plugin (plugin_seq) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE searchapp.search_auth_group ADD CONSTRAINT sh_auth_gp_id_fk FOREIGN KEY (id) REFERENCES searchapp.search_auth_principal (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE searchapp.search_gene_signature ADD CONSTRAINT gene_sig_file_schema_fk1 FOREIGN KEY (search_gene_sig_file_schema_id) REFERENCES searchapp.search_gene_sig_file_schema (search_gene_sig_file_schema_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE searchapp.search_gene_signature ADD CONSTRAINT gene_sig_create_auth_user_fk1 FOREIGN KEY (created_by_auth_user_id) REFERENCES searchapp.search_auth_user (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE searchapp.search_gene_signature ADD CONSTRAINT gene_sig_parent_fk1 FOREIGN KEY (parent_gene_signature_id) REFERENCES searchapp.search_gene_signature (search_gene_signature_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE searchapp.search_gene_signature ADD CONSTRAINT gene_sig_mod_auth_user_fk1 FOREIGN KEY (modified_by_auth_user_id) REFERENCES searchapp.search_auth_user (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE searchapp.search_auth_user_sec_access ADD CONSTRAINT search_sec_s_o_fk FOREIGN KEY (search_secure_object_id) REFERENCES searchapp.search_secure_object (search_secure_object_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE searchapp.search_auth_user_sec_access ADD CONSTRAINT search_sec_s_a_l_fk FOREIGN KEY (search_sec_access_level_id) REFERENCES searchapp.search_sec_access_level (search_sec_access_level_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE searchapp.search_auth_user_sec_access ADD CONSTRAINT search_sec_a_u_fk FOREIGN KEY (search_auth_user_id) REFERENCES searchapp.search_auth_user (id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- VIEWS
CREATE OR REPLACE VIEW searchapp.search_auth_user_sec_access_v (search_auth_user_sec_access_id, search_auth_user_id, search_secure_object_id, search_sec_access_level_id) AS SELECT  
 sasoa.AUTH_SEC_OBJ_ACCESS_ID AS SEARCH_AUTH_USER_SEC_ACCESS_ID,
 sasoa.AUTH_PRINCIPAL_ID AS SEARCH_AUTH_USER_ID,
 sasoa.SECURE_OBJECT_ID AS SEARCH_SECURE_OBJECT_ID,
 sasoa.SECURE_ACCESS_LEVEL_ID AS SEARCH_SEC_ACCESS_LEVEL_ID
 FROM searchapp.SEARCH_AUTH_USER sau, 
searchapp.SEARCH_AUTH_SEC_OBJECT_ACCESS sasoa
WHERE 
sau.ID = sasoa.AUTH_PRINCIPAL_ID
UNION
 SELECT 
 sasoa.AUTH_SEC_OBJ_ACCESS_ID AS SEARCH_AUTH_USER_SEC_ACCESS_ID,
 sagm.AUTH_USER_ID AS SEARCH_AUTH_USER_ID,
 sasoa.SECURE_OBJECT_ID AS SEARCH_SECURE_OBJECT_ID,
 sasoa.SECURE_ACCESS_LEVEL_ID AS SEARCH_SEC_ACCESS_LEVEL_ID
FROM searchapp.SEARCH_AUTH_GROUP sag, 
searchapp.SEARCH_AUTH_GROUP_MEMBER sagm,
searchapp.SEARCH_AUTH_SEC_OBJECT_ACCESS sasoa
WHERE 
sag.ID = sagm.AUTH_GROUP_ID
AND
sag.ID = sasoa.AUTH_PRINCIPAL_ID
UNION
SELECT 
 sasoa.AUTH_SEC_OBJ_ACCESS_ID AS SEARCH_AUTH_USER_SEC_ACCESS_ID,
 NULL AS SEARCH_AUTH_USER_ID,
 sasoa.SECURE_OBJECT_ID AS SEARCH_SECURE_OBJECT_ID,
 sasoa.SECURE_ACCESS_LEVEL_ID AS SEARCH_SEC_ACCESS_LEVEL_ID
FROM searchapp.SEARCH_AUTH_GROUP sag, 
searchapp.SEARCH_AUTH_SEC_OBJECT_ACCESS sasoa
WHERE 
sag.group_category = 'EVERYONE_GROUP'
AND
sag.ID = sasoa.AUTH_PRINCIPAL_ID
 ;

-- SEQUENCES
CREATE SEQUENCE searchapp.hibernate_sequence INCREMENT 1 MINVALUE 1 NO MAXVALUE START 100041 CACHE 20;
ALTER SEQUENCE searchapp.hibernate_sequence OWNER TO searchapp;
CREATE SEQUENCE searchapp.plugin_module_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE searchapp.plugin_module_seq OWNER TO searchapp;
CREATE SEQUENCE searchapp.plugin_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE searchapp.plugin_seq OWNER TO searchapp;
CREATE SEQUENCE searchapp.seq_search_data_id INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1789472 CACHE 20;
ALTER SEQUENCE searchapp.seq_search_data_id OWNER TO searchapp;


-- TRIGGERS
DROP TRIGGER IF EXISTS trgi_search_au_obj_access_id ON searchapp.search_auth_sec_object_access CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_au_obj_access_id () RETURNS trigger AS $BODY$
begin     if coalesce(NEW.AUTH_SEC_OBJ_ACCESS_ID::text, '') = '' then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.AUTH_SEC_OBJ_ACCESS_ID ;       end if;    RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_au_obj_access_id
	BEFORE INSERT ON searchapp.search_auth_sec_object_access FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_au_obj_access_id();

DROP TRIGGER IF EXISTS trgi_search_au_prcpl_id ON searchapp.search_auth_principal CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_au_prcpl_id () RETURNS trigger AS $BODY$
begin     
 if(coalesce(NEW.ID::text, '') = '' or NEW.ID = -2000) then       
 select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.ID ;      
 end if;     RETURN NEW;
end;
$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_au_prcpl_id
	BEFORE INSERT ON searchapp.search_auth_principal FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_au_prcpl_id();

DROP TRIGGER IF EXISTS trgi_search_a_u_sec_access_id ON searchapp.search_auth_user_sec_access CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_a_u_sec_access_id () RETURNS trigger AS $BODY$
begin     if NEW.SEARCH_AUTH_USER_SEC_ACCESS_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_AUTH_USER_SEC_ACCESS_ID ;       end if;    RETURN NEW; end;



$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_a_u_sec_access_id
	BEFORE INSERT ON searchapp.search_auth_user_sec_access FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_a_u_sec_access_id();

DROP TRIGGER IF EXISTS trgi_search_custom_filter_id ON searchapp.search_custom_filter CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_custom_filter_id () RETURNS trigger AS $BODY$
begin 
    if NEW.SEARCH_CUSTOM_FILTER_ID is null then select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_CUSTOM_FILTER_ID ; end if; RETURN NEW;
end;



$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_custom_filter_id
	BEFORE INSERT ON searchapp.search_custom_filter FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_custom_filter_id();

DROP TRIGGER IF EXISTS trgi_search_cust_fil_item_id ON searchapp.search_custom_filter_item CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_cust_fil_item_id () RETURNS trigger AS $BODY$
begin 
    if NEW.SEARCH_CUSTOM_FILTER_ITEM_ID is null then select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_CUSTOM_FILTER_ITEM_ID ; end if; RETURN NEW;
end;



$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_cust_fil_item_id
	BEFORE INSERT ON searchapp.search_custom_filter_item FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_cust_fil_item_id();

DROP TRIGGER IF EXISTS trgi_search_keyword_id ON searchapp.search_keyword CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_keyword_id () RETURNS trigger AS $BODY$
begin     if NEW.SEARCH_KEYWORD_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_KEYWORD_ID ;       end if;   RETURN NEW; end;




$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_keyword_id
	BEFORE INSERT ON searchapp.search_keyword FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_keyword_id();

DROP TRIGGER IF EXISTS trgi_search_keyword_term_id ON searchapp.search_keyword_term CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_keyword_term_id () RETURNS trigger AS $BODY$
begin     if NEW.SEARCH_KEYWORD_TERM_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_KEYWORD_TERM_ID ;       end if;    RETURN NEW;
end;

$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_keyword_term_id
	BEFORE INSERT ON searchapp.search_keyword_term FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_keyword_term_id();

DROP TRIGGER IF EXISTS trgi_search_sec_acc_level_id ON searchapp.search_sec_access_level CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_sec_acc_level_id () RETURNS trigger AS $BODY$
begin     if NEW.SEARCH_SEC_ACCESS_LEVEL_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_SEC_ACCESS_LEVEL_ID ;       end if;   RETURN NEW; end;



$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_sec_acc_level_id
	BEFORE INSERT ON searchapp.search_sec_access_level FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_sec_acc_level_id();

DROP TRIGGER IF EXISTS trgi_search_sec_obj_id ON searchapp.search_secure_object CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_sec_obj_id () RETURNS trigger AS $BODY$
begin     if NEW.SEARCH_SECURE_OBJECT_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_SECURE_OBJECT_ID ;       end if;  RETURN NEW;  end;



$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_sec_obj_id
	BEFORE INSERT ON searchapp.search_secure_object FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_sec_obj_id();

DROP TRIGGER IF EXISTS trgi_search_sec_obj_path_id ON searchapp.search_secure_object_path CASCADE;
CREATE OR REPLACE FUNCTION searchapp.tf_trgi_search_sec_obj_path_id () RETURNS trigger AS $BODY$
begin     if NEW.SEARCH_SECURE_OBJ_PATH_ID is null then          select nextval('searchapp.SEQ_SEARCH_DATA_ID') into NEW.SEARCH_SECURE_OBJ_PATH_ID ;       end if;  RETURN NEW;  end;



$BODY$
 LANGUAGE 'plpgsql';

CREATE TRIGGER trgi_search_sec_obj_path_id
	BEFORE INSERT ON searchapp.search_secure_object_path FOR EACH ROW
	EXECUTE PROCEDURE searchapp.tf_trgi_search_sec_obj_path_id();


-- FUNCTIONS
CREATE OR REPLACE FUNCTION searchapp.BIO_CLINICAL_TRIAL_UID (
  TRIAL_NUMBER text,
  TITLE text,
  CONDITION text
)  RETURNS varchar AS $body$
BEGIN
  RETURN coalesce(TRIAL_NUMBER || '|', '') || coalesce(TITLE || '|', '') || coalesce(CONDITION, '');
END;
 
 
 
$body$
LANGUAGE PLPGSQL;



CREATE OR REPLACE FUNCTION searchapp.BIO_COMPOUND_UID ( CAS_REGISTRY IN text,
  JNJ_NUMBER IN text,
  CNTO_NUMBER IN text
)  RETURNS varchar AS $body$
BEGIN
  RETURN coalesce(CAS_REGISTRY || '|', '') || coalesce(JNJ_NUMBER || '|', '') || coalesce(CNTO_NUMBER, '');
END;
 
 
 
 
 
$body$
LANGUAGE PLPGSQL;

-- SET TABLESPACES
ALTER INDEX searchapp.SYS_C0011119 SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_KW_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_KEYWORD_UK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_KEYWORD_INDEX1 SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_KEYWORD_INDEX2 SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_KEYWORD_INDEX3 SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_SEC_OBJ__PATH_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_SEC_AC_LEVEL_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_SEC_OBJ_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_SEC_A_U_S_A_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_CUSTOM_FILTER_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SYS_C0011120 SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_CUST_FIL_ITEM_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_KW_TERM_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_KW_TERM_SKID_IDX SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_GENE_SIG_FILE_SCHE_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SCH_SEC_A_A_S_A_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_GENE_SIG_DESCR_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.SEARCH_GENE_SIGNATURE_ITE_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.PK_SEARCH_PRINCIPAL SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.PK_AUTH_USR_GROUP SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.PLUGIN_PK SET TABLESPACE SEARCH_APP;
ALTER INDEX searchapp.PLUGIN_MODULE_PK SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_AUTH_USER SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_REQUEST_MAP SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_ROLE SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_ROLE_AUTH_USER SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_KEYWORD SET TABLESPACE SEARCH_APP;

ALTER TABLE searchapp.SEARCH_SECURE_OBJECT_PATH SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_SEC_ACCESS_LEVEL SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_SECURE_OBJECT SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_AUTH_USER_SEC_ACCESS SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_CUSTOM_FILTER SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_CUSTOM_FILTER_ITEM SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_KEYWORD_TERM SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_GENE_SIG_FILE_SCHEMA SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_AUTH_PRINCIPAL SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_AUTH_GROUP SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_AUTH_GROUP_MEMBER SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_AUTH_SEC_OBJECT_ACCESS SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_APP_ACCESS_LOG SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_GENE_SIGNATURE SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_GENE_SIGNATURE_ITEM SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.PLUGIN SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.PLUGIN_MODULE SET TABLESPACE SEARCH_APP;



-- MATERIALIZED VIWS
CREATE TABLE searchapp.SEARCH_BIO_MKR_CORREL_FAST_MV
(
	domain_object_id bigint,
	asso_bio_marker_id bigint,
	correl_type varchar(19),
	value_metric bigint,
	mv_id bigint
);

ALTER TABLE searchapp.SEARCH_BIO_MKR_CORREL_FAST_MV SET TABLESPACE SEARCH_APP;
ALTER TABLE searchapp.SEARCH_BIO_MKR_CORREL_FAST_MV OWNER TO searchapp;


-- need to populate the table based on the this view at some regular interval
CREATE OR REPLACE VIEW searchapp.search_bio_mkr_correl_fast_view
  AS SELECT   i.SEARCH_GENE_SIGNATURE_ID AS domain_object_id,
         i.BIO_MARKER_ID AS asso_bio_marker_id,
         'GENE_SIGNATURE_ITEM' AS correl_type,
         CASE
            WHEN i.FOLD_CHG_METRIC IS NULL THEN 1
            ELSE i.FOLD_CHG_METRIC
         END
            AS value_metric,
         3 AS mv_id
  FROM   searchapp.SEARCH_GENE_SIGNATURE_ITEM i, searchapp.SEARCH_GENE_SIGNATURE gs
 WHERE   i.SEARCH_GENE_SIGNATURE_ID = gs.SEARCH_GENE_SIGNATURE_ID
         AND gs.DELETED_FLAG = false;


ALTER FUNCTION searchapp.bio_clinical_trial_uid(text, text, text)
  OWNER TO searchapp; 
ALTER FUNCTION searchapp.bio_compound_uid(text, text, text)
  OWNER TO searchapp;

ALTER FUNCTION searchapp.tf_trgi_search_a_u_sec_access_id()
  OWNER TO searchapp;
ALTER FUNCTION searchapp.tf_trgi_search_au_obj_access_id()
  OWNER TO searchapp;
ALTER FUNCTION searchapp.tf_trgi_search_au_prcpl_id()
  OWNER TO searchapp;
ALTER FUNCTION searchapp.tf_trgi_search_cust_fil_item_id()
  OWNER TO searchapp;
ALTER FUNCTION searchapp.tf_trgi_search_custom_filter_id()
  OWNER TO searchapp;
ALTER FUNCTION searchapp.tf_trgi_search_keyword_id()
  OWNER TO searchapp;
ALTER FUNCTION searchapp.tf_trgi_search_keyword_term_id()
  OWNER TO searchapp;
ALTER FUNCTION searchapp.tf_trgi_search_sec_acc_level_id()
  OWNER TO searchapp;
ALTER FUNCTION searchapp.tf_trgi_search_sec_obj_id()
  OWNER TO searchapp;
ALTER FUNCTION searchapp.tf_trgi_search_sec_obj_path_id()
  OWNER TO searchapp;
  
ALTER TABLE searchapp.search_auth_user_sec_access_v
  OWNER TO searchapp;
ALTER TABLE searchapp.search_bio_mkr_correl_fast_view
  OWNER TO searchapp;
  


-- POSTGRES specific code to refresh mat views  
CREATE OR REPLACE FUNCTION searchapp.refresh_search_bio_mkr_correl_fast_mv()
  RETURNS character varying AS
$BODY$
BEGIN

  -- populate the fake "materialized view" (i.e. actually a table) by deleting everything from it and then re-populating
  -- eventually we need a smarter algorithm for doing this

    delete from searchapp.search_bio_mkr_correl_fast_mv;

    insert into searchapp.search_bio_mkr_correl_fast_mv
    (domain_object_id, asso_bio_marker_id, correl_type, value_metric,  mv_id)    
    select domain_object_id, asso_bio_marker_id, correl_type, value_metric,  mv_id
       from searchapp.search_bio_mkr_correl_fast_view;  

    return true;
END;
 
 
 
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION searchapp.refresh_search_bio_mkr_correl_fast_mv()
  OWNER TO searchapp;
