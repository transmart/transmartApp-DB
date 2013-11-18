--------------------------------------------------------
--  File created - Wednesday-April-03-2013   
--------------------------------------------------------
---------------------------
--New SEQUENCE
--SEQ_SAVED_FACETED_SEARCH_ID
---------------------------
 CREATE SEQUENCE "SEARCHAPP"."SEQ_SAVED_FACETED_SEARCH_ID" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 278 CACHE 20 NOORDER NOCYCLE;
---------------------------
--New TABLE
--SAVED_FACETED_SEARCH
---------------------------
  CREATE TABLE "SEARCHAPP"."SAVED_FACETED_SEARCH" 
   (	"SAVED_FACETED_SEARCH_ID" NUMBER(*,0) NOT NULL ENABLE,
	"USER_ID" NUMBER(*,0) NOT NULL ENABLE,
	"NAME" VARCHAR2(100) NOT NULL ENABLE,
	"KEYWORDS" VARCHAR2(4000) NOT NULL ENABLE,
	"CREATE_DT" DATE DEFAULT sysdate,
	"MODIFIED_DT" DATE,
	"SEARCH_TYPE" VARCHAR2(50) DEFAULT ('FACETED_SEARCH') NOT NULL ENABLE,
	"ANALYSIS_IDS" VARCHAR2(4000),
	PRIMARY KEY ("SAVED_FACETED_SEARCH_ID") ENABLE,
	CONSTRAINT "U_SAVED_SEARCH__USER_ID_NAME" UNIQUE ("USER_ID","NAME") ENABLE,
	CONSTRAINT "SAVED_FACETED_SEARCH_USER_ID" FOREIGN KEY ("USER_ID")
	 REFERENCES "SEARCHAPP"."SEARCH_AUTH_USER" ("ID") ENABLE
   );
---------------------------
--New TABLE
--SEARCH_TAXONOMY_RELS
---------------------------
  CREATE TABLE "SEARCHAPP"."SEARCH_TAXONOMY_RELS" 
   (	"SEARCH_TAXONOMY_RELS_ID" NUMBER(22,0) NOT NULL ENABLE,
	"CHILD_ID" NUMBER(22,0) NOT NULL ENABLE,
	"PARENT_ID" NUMBER(22,0),
	PRIMARY KEY ("SEARCH_TAXONOMY_RELS_ID") ENABLE,
	CONSTRAINT "U_CHILD_ID_PARENT_ID" UNIQUE ("CHILD_ID","PARENT_ID") ENABLE,
	CONSTRAINT "FK_SEARCH_TAX_RELS_CHILD" FOREIGN KEY ("CHILD_ID")
	 REFERENCES "SEARCHAPP"."SEARCH_TAXONOMY" ("TERM_ID") ENABLE,
	CONSTRAINT "FK_SEARCH_TAX_RELS_PARENT" FOREIGN KEY ("PARENT_ID")
	 REFERENCES "SEARCHAPP"."SEARCH_TAXONOMY" ("TERM_ID") ENABLE
   );
---------------------------
--New TABLE
--SEARCH_TAXONOMY
---------------------------
  CREATE TABLE "SEARCHAPP"."SEARCH_TAXONOMY" 
   (	"TERM_ID" NUMBER(22,0) NOT NULL ENABLE,
	"TERM_NAME" VARCHAR2(900) NOT NULL ENABLE,
	"SOURCE_CD" VARCHAR2(900),
	"IMPORT_DATE" TIMESTAMP(1) DEFAULT Sysdate,
	"SEARCH_KEYWORD_ID" NUMBER(38,0),
	CONSTRAINT "SEARCH_TAXONOMY_PK" PRIMARY KEY ("TERM_ID") ENABLE,
	CONSTRAINT "FK_SEARCH_TAX_SEARCH_KEYWORD" FOREIGN KEY ("SEARCH_KEYWORD_ID")
	 REFERENCES "SEARCHAPP"."SEARCH_KEYWORD" ("SEARCH_KEYWORD_ID") ENABLE
   );
---------------------------
--Changed TABLE
--SEARCH_KEYWORD
---------------------------
ALTER TABLE "SEARCHAPP"."SEARCH_KEYWORD" MODIFY ("KEYWORD" NVARCHAR2(400));

---------------------------
--New VIEW
--SEARCH_TAXONOMY_LEVEL5
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_TAXONOMY_LEVEL5" 
 ( "TERM_ID", "TERM_NAME", "CATEGORY_NAME"
  )  AS 
  select st.term_id, st.term_name, category_name
from search_taxonomy_rels str, search_taxonomy st, search_taxonomy_level4 stl4
where parent_id=stl4.term_id
and str.child_id=st.term_id;
---------------------------
--New VIEW
--SEARCH_CATEGORIES
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_CATEGORIES" 
 ( "CATEGORY_ID", "CATEGORY_NAME"
  )  AS 
  select child_id category_id, st.term_name category_name from search_taxonomy_rels str, search_taxonomy st
where parent_id=(select child_id from search_taxonomy_rels where parent_id is null)
and str.child_id=st.term_id;
---------------------------
--New VIEW
--SEARCH_TAXONOMY_LEVEL4
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_TAXONOMY_LEVEL4" 
 ( "TERM_ID", "TERM_NAME", "CATEGORY_NAME"
  )  AS 
  select st.term_id, st.term_name, category_name
from search_taxonomy_rels str, search_taxonomy st, search_taxonomy_level3 stl3
where parent_id=stl3.term_id
and str.child_id=st.term_id;
---------------------------
--New VIEW
--SEARCH_TAXONOMY_LEVEL1
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_TAXONOMY_LEVEL1" 
 ( "TERM_ID", "TERM_NAME", "CATEGORY_NAME"
  )  AS 
  select st.term_id, st.term_name, category_name
from search_taxonomy_rels str, search_taxonomy st, search_categories sc
where parent_id=sc.category_id
and str.child_id=st.term_id;
---------------------------
--New VIEW
--SEARCH_TAXONOMY_LINEAGE
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_TAXONOMY_LINEAGE" 
 ( "CHILD_ID", "PARENT1", "PARENT2", "PARENT3", "PARENT4"
  )  AS 
  select s1.child_id child_id, s2.child_id parent1, s3.child_id parent2, s4.child_id parent3, s5.child_id parent4
from search_taxonomy_rels s1, search_taxonomy_rels s2, search_taxonomy_rels s3, search_taxonomy_rels s4, search_taxonomy_rels s5
where s1.parent_id=s2.child_id(+) 
and s2.parent_id=s3.child_id(+)
and s3.parent_id=s4.child_id(+)
and s4.parent_id=s5.child_id(+);
---------------------------
--New VIEW
--SEARCH_TAXONOMY_TERMS_CATS
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_TAXONOMY_TERMS_CATS" 
 ( "TERM_ID", "TERM_NAME", "CATEGORY_NAME"
  )  AS 
  select distinct term_id, term_name, category_name from 
(
select term_id, term_name, category_name from searchapp.search_taxonomy_level1
UNION
select term_id, term_name, category_name from searchapp.search_taxonomy_level2
UNION
select term_id, term_name, category_name from searchapp.search_taxonomy_level3
UNION
select term_id, term_name, category_name from searchapp.search_taxonomy_level4
UNION
select term_id, term_name, category_name from searchapp.search_taxonomy_level5
);
---------------------------
--New VIEW
--LISTSIG_GENES
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."LISTSIG_GENES" 
 ( "GENE_KEYWORD_ID", "LIST_KEYWORD_ID"
  )  AS 
  select k_gsi.search_keyword_id gene_keyword_id, k_gs.search_keyword_id list_keyword_id
from Search_Keyword k_gs, search_Gene_Signature gs, 
search_Gene_Signature_Item gsi, Search_Keyword k_gsi
where k_gs.bio_Data_Id = gs.search_gene_signature_id
and gs.search_gene_signature_id = gsi.search_gene_signature_id
and gsi.bio_Marker_id = k_gsi.bio_Data_Id;
---------------------------
--New VIEW
--SEARCH_TAXONOMY_LEVEL2
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_TAXONOMY_LEVEL2" 
 ( "TERM_ID", "TERM_NAME", "CATEGORY_NAME"
  )  AS 
  select st.term_id, st.term_name, category_name
from search_taxonomy_rels str, search_taxonomy st, search_taxonomy_level1 stl1
where parent_id=stl1.term_id
and str.child_id=st.term_id;
---------------------------
--New VIEW
--PATHWAY_GENES
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."PATHWAY_GENES" 
 ( "GENE_KEYWORD_ID", "PATHWAY_KEYWORD_ID", "GENE_BIOMARKER_ID"
  )  AS 
  select k_gene.search_keyword_id gene_keyword_id,  k_pathway.search_keyword_id pathway_keyword_id, 
       b.asso_Bio_Marker_Id gene_biomarker_id
from Search_Keyword k_pathway, biomart.Bio_Marker_Correl_MV b,
									Search_Keyword k_gene 
									where b.correl_Type = 'PATHWAY_GENE'   
                  and b.bio_Marker_Id = k_pathway.bio_Data_Id  
									and k_pathway.data_Category = 'PATHWAY' 
									and b.asso_Bio_Marker_Id = k_gene.bio_Data_Id 
									and k_gene.data_Category = 'GENE';
---------------------------
--New VIEW
--SEARCH_TAXONOMY_LEVEL3
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_TAXONOMY_LEVEL3" 
 ( "TERM_ID", "TERM_NAME", "CATEGORY_NAME"
  )  AS 
  select st.term_id, st.term_name, category_name
from search_taxonomy_rels str, search_taxonomy st, search_taxonomy_level2 stl2
where parent_id=stl2.term_id
and str.child_id=st.term_id;
---------------------------
--New VIEW
--SOLR_KEYWORDS_LINEAGE
---------------------------
CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SOLR_KEYWORDS_LINEAGE" 
 ( "TERM_ID", "ANCESTOR_ID", "SEARCH_KEYWORD_ID"
  )  AS 
  select distinct term_id, ancestor_id, search_keyword_id from
(select distinct  l.child_id term_id, l.child_id ancestor_id, st.search_keyword_id
 from searchapp.search_taxonomy_lineage l, search_taxonomy st
 where l.child_id=st.term_id
 and l.child_id is not null 
UNION
 select distinct  l.child_id term_id, l.parent1 ancestor_id, st.search_keyword_id
 from searchapp.search_taxonomy_lineage l, search_taxonomy st
 where l.parent1=st.term_id
 and l.parent1 is not null 
UNION
 select distinct  l.child_id term_id, l.parent2 ancestor_id, st.search_keyword_id
 from searchapp.search_taxonomy_lineage l, search_taxonomy st
 where l.parent2=st.term_id
 and l.parent2 is not null 
UNION
 select distinct  l.child_id term_id, l.parent3 ancestor_id, st.search_keyword_id
 from searchapp.search_taxonomy_lineage l, search_taxonomy st
 where l.parent3=st.term_id
 and l.parent3 is not null 
UNION
 select distinct l.child_id term_id, l.parent4 ancestor_id, st.search_keyword_id
 from searchapp.search_taxonomy_lineage l, search_taxonomy st
 where l.parent4=st.term_id
 and l.parent4 is not null 
)
where search_keyword_id is not null;
---------------------------
--New INDEX
--SEARCH_TAXONOMY_PK
---------------------------
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_TAXONOMY_PK" ON "SEARCHAPP"."SEARCH_TAXONOMY" ("TERM_ID");
---------------------------
--New INDEX
--U_SAVED_SEARCH__USER_ID_NAME
---------------------------
  CREATE UNIQUE INDEX "SEARCHAPP"."U_SAVED_SEARCH__USER_ID_NAME" ON "SEARCHAPP"."SAVED_FACETED_SEARCH" ("USER_ID","NAME");
---------------------------
--New INDEX
--U_CHILD_ID_PARENT_ID
---------------------------
  CREATE UNIQUE INDEX "SEARCHAPP"."U_CHILD_ID_PARENT_ID" ON "SEARCHAPP"."SEARCH_TAXONOMY_RELS" ("CHILD_ID","PARENT_ID");
---------------------------
--New INDEX
--SYS_C0067589
---------------------------
  CREATE UNIQUE INDEX "SEARCHAPP"."SYS_C0067589" ON "SEARCHAPP"."SEARCH_TAXONOMY_RELS" ("SEARCH_TAXONOMY_RELS_ID");
---------------------------
--New TRIGGER
--TRG_UPD_SAVED_FACETED_SEARCH
---------------------------
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_UPD_SAVED_FACETED_SEARCH"
  BEFORE UPDATE ON "SEARCHAPP"."SAVED_FACETED_SEARCH"
  REFERENCING FOR EACH ROW
  BEGIN 
      IF :NEW.modified_dt IS NULL  then
          :NEW.modified_dt := sysdate;
      END IF;
END;
/
---------------------------
--New TRIGGER
--TRG_SEARCH_TAXONOMY_TERM_ID
---------------------------
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_TAXONOMY_TERM_ID"
  BEFORE INSERT ON "SEARCHAPP"."SEARCH_TAXONOMY"
  REFERENCING FOR EACH ROW
  begin     
	if inserting then       
		if :NEW."TERM_ID" is null then          
			select SEQ_SEARCH_DATA_ID.nextval into :NEW."TERM_ID" from dual;       
		end if;    
	end if; 
end;
/
---------------------------
--New TRIGGER
--TRG_SEARCH_TAXONOMY_RELS_ID
---------------------------
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_TAXONOMY_RELS_ID"
  BEFORE INSERT ON "SEARCHAPP"."SEARCH_TAXONOMY_RELS"
  REFERENCING FOR EACH ROW
  begin     
	if inserting then       
		if :NEW."SEARCH_TAXONOMY_RELS_ID" is null then          
			select SEQ_SEARCH_DATA_ID.nextval into :NEW."SEARCH_TAXONOMY_RELS_ID" from dual;       
		end if;    
	end if; 
end;
/
---------------------------
--New TRIGGER
--TRG_SAVED_FACETED_SEARCH_ID
---------------------------
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SAVED_FACETED_SEARCH_ID"
  BEFORE INSERT ON "SEARCHAPP"."SAVED_FACETED_SEARCH"
  REFERENCING FOR EACH ROW
  BEGIN 
      IF :NEW.saved_faceted_search_id IS NULL  then
          SELECT SEQ_saved_faceted_search_id.nextval INTO :NEW.saved_faceted_search_id FROM dual;
      END IF;
      IF :NEW.create_dt IS NULL  then
          :NEW.create_dt := sysdate;
      END IF;
END;
/
