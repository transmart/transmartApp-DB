--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.2.3
-- Started on 2013-07-23 16:44:41 BST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 11 (class 2615 OID 24067)
-- Name: i2b2demodata; Type: SCHEMA; Schema: -; Owner: i2b2demodata
--

CREATE SCHEMA i2b2demodata;


ALTER SCHEMA i2b2demodata OWNER TO i2b2demodata;

SET search_path = i2b2demodata, pg_catalog;

--
-- TOC entry 713 (class 1255 OID 24164)
-- Name: create_temp_concept_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_concept_table(tempconcepttablename character varying, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$

BEGIN 
execute 'create table ' ||  tempConceptTableName || ' (
        CONCEPT_CD VARCHAR(50) NOT NULL, 
	CONCEPT_PATH VARCHAR(900) NOT NULL , 
	NAME_CHAR VARCHAR(2000), 
	CONCEPT_BLOB TEXT, 
	UPDATE_DATE date, 
	DOWNLOAD_DATE DATE, 
	IMPORT_DATE DATE, 
	SOURCESYSTEM_CD VARCHAR(50)
	 )';

 execute 'CREATE INDEX idx_' || tempConceptTableName || '_pat_id ON ' || tempConceptTableName || '  (CONCEPT_PATH)';
  
   

EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '% - %', SQLSTATE, SQLERRM;
END;

$$;


ALTER FUNCTION i2b2demodata.create_temp_concept_table(tempconcepttablename character varying, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 715 (class 1255 OID 24165)
-- Name: create_temp_eid_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_eid_table(temppatientmappingtablename character varying, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$

BEGIN 
execute 'create table ' ||  tempPatientMappingTableName || ' (
	ENCOUNTER_MAP_ID       	VARCHAR(200) NOT NULL,
    ENCOUNTER_MAP_ID_SOURCE	VARCHAR(50) NOT NULL,
    PATIENT_MAP_ID          VARCHAR(200), 
	PATIENT_MAP_ID_SOURCE   VARCHAR(50), 
    ENCOUNTER_ID       	    VARCHAR(200) NOT NULL,
    ENCOUNTER_ID_SOURCE     VARCHAR(50) ,
    ENCOUNTER_NUM           NUMERIC, 
    ENCOUNTER_MAP_ID_STATUS    VARCHAR(50),
    PROCESS_STATUS_FLAG     CHAR(1),
	UPDATE_DATE DATE, 
	DOWNLOAD_DATE DATE, 
	IMPORT_DATE DATE, 
	SOURCESYSTEM_CD VARCHAR(50)
)';

execute 'CREATE INDEX idx_' || tempPatientMappingTableName || '_eid_id ON ' || tempPatientMappingTableName || '  (ENCOUNTER_ID, ENCOUNTER_ID_SOURCE, ENCOUNTER_MAP_ID, ENCOUNTER_MAP_ID_SOURCE, ENCOUNTER_NUM)';

 execute 'CREATE INDEX idx_' || tempPatientMappingTableName || '_stateid_eid_id ON ' || tempPatientMappingTableName || '  (PROCESS_STATUS_FLAG)';  
    
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '% - %', SQLSTATE, SQLERRM;
END;

$$;


ALTER FUNCTION i2b2demodata.create_temp_eid_table(temppatientmappingtablename character varying, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 716 (class 1255 OID 24166)
-- Name: create_temp_patient_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_patient_table(temppatientdimensiontablename character varying, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 

BEGIN 
	-- Create temp table to store encounter/visit information
	execute 'create table ' ||  tempPatientDimensionTableName || ' (
		PATIENT_ID VARCHAR(200), 
		PATIENT_ID_SOURCE VARCHAR(50),
		PATIENT_NUM NUMERIC(38,0),
	    VITAL_STATUS_CD VARCHAR(50), 
	    BIRTH_DATE DATE, 
	    DEATH_DATE DATE, 
	    SEX_CD CHAR(50), 
	    AGE_IN_YEARS_NUM NUMERIC(5,0), 
	    LANGUAGE_CD VARCHAR(50), 
		RACE_CD VARCHAR(50 ), 
		MARITAL_STATUS_CD VARCHAR(50), 
		RELIGION_CD VARCHAR(50), 
		ZIP_CD VARCHAR(50), 
		STATECITYZIP_PATH VARCHAR(700), 
		PATIENT_BLOB TEXT, 
		UPDATE_DATE DATE, 
		DOWNLOAD_DATE DATE, 
		IMPORT_DATE DATE, 
		SOURCESYSTEM_CD VARCHAR(50)
	)';

execute 'CREATE INDEX idx_' || tempPatientDimensionTableName || '_pat_id ON ' || tempPatientDimensionTableName || '  (PATIENT_ID, PATIENT_ID_SOURCE,PATIENT_NUM)';
  
     
    
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '% - %', SQLSTATE, SQLERRM;
END;

$$;


ALTER FUNCTION i2b2demodata.create_temp_patient_table(temppatientdimensiontablename character varying, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 717 (class 1255 OID 24167)
-- Name: create_temp_pid_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_pid_table(temppatientmappingtablename character varying, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$

BEGIN 
execute 'create table ' ||  tempPatientMappingTableName || ' (
	   	PATIENT_MAP_ID VARCHAR(200), 
		PATIENT_MAP_ID_SOURCE VARCHAR(50), 
		PATIENT_ID_STATUS VARCHAR(50), 
		PATIENT_ID  VARCHAR(200),
	    PATIENT_ID_SOURCE varchar(50),
		PATIENT_NUM NUMERIC(38,0),
	    PATIENT_MAP_ID_STATUS VARCHAR(50), 
		PROCESS_STATUS_FLAG CHAR(1), 
		UPDATE_DATE DATE, 
		DOWNLOAD_DATE DATE, 
		IMPORT_DATE DATE, 
		SOURCESYSTEM_CD VARCHAR(50)

	 )';

execute 'CREATE INDEX idx_' || tempPatientMappingTableName || '_pid_id ON ' || tempPatientMappingTableName || '  ( PATIENT_ID, PATIENT_ID_SOURCE )';

execute 'CREATE INDEX idx_' || tempPatientMappingTableName || 'map_pid_id ON ' || tempPatientMappingTableName || '  
( PATIENT_ID, PATIENT_ID_SOURCE,PATIENT_MAP_ID, PATIENT_MAP_ID_SOURCE,  PATIENT_NUM )';
 
execute 'CREATE INDEX idx_' || tempPatientMappingTableName || 'stat_pid_id ON ' || tempPatientMappingTableName || '  
(PROCESS_STATUS_FLAG)';


    
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '% - %', SQLSTATE, SQLERRM;
END;

$$;


ALTER FUNCTION i2b2demodata.create_temp_pid_table(temppatientmappingtablename character varying, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 714 (class 1255 OID 24168)
-- Name: create_temp_provider_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_provider_table(tempprovidertablename character varying, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 

BEGIN 

execute 'create table ' ||  tempProviderTableName || ' (
    PROVIDER_ID VARCHAR(50) NOT NULL, 
	PROVIDER_PATH VARCHAR(700) NOT NULL, 
	NAME_CHAR VARCHAR(2000), 
	PROVIDER_BLOB TEXT, 
	UPDATE_DATE DATE, 
	DOWNLOAD_DATE DATE, 
	IMPORT_DATE DATE, 
	SOURCESYSTEM_CD VARCHAR(50), 
	UPLOAD_ID NUMERIC(*,0)
	 )';
 execute 'CREATE INDEX idx_' || tempProviderTableName || '_ppath_id ON ' || tempProviderTableName || '  (PROVIDER_PATH)';

    
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '% - %', SQLSTATE, SQLERRM;
END;

$$;


ALTER FUNCTION i2b2demodata.create_temp_provider_table(tempprovidertablename character varying, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 719 (class 1255 OID 24169)
-- Name: create_temp_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_table(temptablename character varying, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 

BEGIN 
	execute 'create table ' ||  tempTableName || '  (		
		encounter_id 		varchar(200) not null, 
        encounter_id_source varchar(50) not null,
		encounter_num  		NUMERIC(38,0),
		concept_cd 	 		VARCHAR(50) not null, 
        patient_num 		NUMERIC(38,0), 
		patient_id  		varchar(200) not null,
        patient_id_source  	varchar(50) not null,
		provider_id   		VARCHAR(50),
 		start_date   		DATE, 
		modifier_cd 		VARCHAR(100),
	    instance_num 		NUMERIC(18,0),
 		valtype_cd 			VARCHAR(50),
		tval_char 			varchar(255),
 		nval_num 			NUMERIC(18,5),
		valueflag_cd 		CHAR(50),
 		quantity_num 		NUMERIC(18,5),
		confidence_num 		NUMERIC(18,0),
 		observation_blob 	TEXT,
		units_cd 			VARCHAR(50),
 		end_date    		DATE,
		location_cd 		VARCHAR(50),
 		update_date  		DATE,
		download_date 		DATE,
 		import_date 		DATE,
		sourcesystem_cd 	VARCHAR(50) ,
 		upload_id 			INTEGER
	)';

    
    execute 'CREATE INDEX idx_' || tempTableName || '_pk ON ' || tempTableName || '  ( encounter_num,patient_num,concept_cd,provider_id,start_date,modifier_cd,instance_num)';
    execute 'CREATE INDEX idx_' || tempTableName || '_enc_pat_id ON ' || tempTableName || '  (encounter_id,encounter_id_source, patient_id,patient_id_source )';
    
    
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '% - %', SQLSTATE, SQLERRM;
END;

$$;


ALTER FUNCTION i2b2demodata.create_temp_table(temptablename character varying, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 718 (class 1255 OID 24170)
-- Name: create_temp_visit_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION create_temp_visit_table(temptablename character varying, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 

BEGIN 
	-- Create temp table to store encounter/visit information
	execute 'create table ' ||  tempTableName || ' (
		encounter_id 			VARCHAR(200) not null,
		encounter_id_source 	VARCHAR(50) not null, 
		patient_id  			VARCHAR(200) not null,
		patient_id_source 		VARCHAR(50) not null,
		encounter_num	 		    NUMERIC(38,0), 
		inout_cd   			VARCHAR(50),
		location_cd 			VARCHAR(50),
		location_path 			VARCHAR(900),
 		start_date   			DATE, 
 		end_date    			DATE,
 		visit_blob 				TEXT,
 		update_date  			DATE,
		download_date 			DATE,
 		import_date 			DATE,
		sourcesystem_cd 		VARCHAR(50)
	)';

    execute 'CREATE INDEX idx_' || tempTableName || '_enc_id ON ' || tempTableName || '  ( encounter_id,encounter_id_source,patient_id,patient_id_source )';
    execute 'CREATE INDEX idx_' || tempTableName || '_patient_id ON ' || tempTableName || '  ( patient_id,patient_id_source )';
    
    
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '% - %', SQLSTATE, SQLERRM;
END;

$$;


ALTER FUNCTION i2b2demodata.create_temp_visit_table(temptablename character varying, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 721 (class 1255 OID 24171)
-- Name: insert_concept_fromtemp(character varying, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_concept_fromtemp(tempconcepttablename character varying, upload_id numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 

BEGIN 
	--Delete duplicate rows with same encounter and patient combination
	-- smuniraju: Rowid not supported in postgres, using combination of ctid (and gp_segment_id for greenplum)
	-- execute 'DELETE FROM ' || tempConceptTableName || ' t1 WHERE rowid > 
	-- 				   (SELECT  min(rowid) FROM ' || tempConceptTableName || ' t2
	-- 				     WHERE t1.concept_cd = t2.concept_cd 
    --                                         AND t1.concept_path = t2.concept_path
    --                                         )';
	execute 'DELETE FROM ' || tempConceptTableName || ' t1 WHERE ( ctid) not in ( 
			   SELECT   max(ctid) FROM ' || tempConceptTableName || ' t2
			   group by concept_path,concept_cd)';
						
    execute ' 	UPDATE concept_dimension cd set 
				name_char= temp.name_char,
				concept_blob= temp.concept_blob,
				update_date= temp.update_date,
				import_date = now(),
				DOWNLOAD_DATE=temp.DOWNLOAD_DATE,
				SOURCESYSTEM_CD=temp.SOURCESYSTEM_CD,
				UPLOAD_ID = '|| upload_id || '
				from ' || tempConceptTableName || ' temp
				where cd.concept_path = temp.concept_path
				and temp.update_date >= cd.update_date';
   
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	-- smuniraju: not exists results in co-related query.
	-- execute 'insert into concept_dimension  --(concept_cd,concept_path,name_char,concept_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
	-- 		    select concept_cd, concept_path, name_char,concept_blob, update_date,download_date,
    --          sysdate,sourcesystem_cd, ' || upload_id || '  
	--			from ' || tempConceptTableName || '  temp
	-- 			where not exists (select concept_cd from concept_dimension cd where cd.concept_path = temp.concept_path)';
	execute 'insert into concept_dimension  (concept_cd,concept_path,name_char,concept_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  temp.concept_cd, temp.concept_path, temp.name_char,temp.concept_blob, temp.update_date,temp.download_date, current_timestamp,temp.sourcesystem_cd, ' || upload_id || '  
				from ' || tempConceptTableName || '  temp left outer join concept_dimension cd
				on cd.concept_path = temp.concept_path
				where cd.concept_path is null';					
    
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '% - %', SQLSTATE, SQLERRM;
END;

$$;


ALTER FUNCTION i2b2demodata.insert_concept_fromtemp(tempconcepttablename character varying, upload_id numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 720 (class 1255 OID 24172)
-- Name: insert_eid_map_fromtemp(character varying, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_eid_map_fromtemp(tempeidtablename character varying, upload_id numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$

DECLARE
 existingEncounterNum VARCHAR(32);
 maxEncounterNum NUMERIC;
 -- TYPE distinctEIdCurTyp IS REF CURSOR;
 -- distinctEidCur   distinctEIdCurTyp;
 distinctEidCur REFCURSOR;
 sql_stmt  VARCHAR(400); 
 disEncounterId VARCHAR(100); 
 disEncounterIdSource VARCHAR(100);

BEGIN
 sql_stmt := ' SELECT distinct encounter_id,encounter_id_source from ' || tempEidTableName ||' ';

-- smuniraju: rowid not supported in postgres/greenplum, instead using ctid (and gp_segment_id in greenplum)
-- execute ' delete  from ' || tempEidTableName ||  ' t1  where 
-- rowid > (select min(rowid) from ' || tempEidTableName || ' t2 
-- where t1.encounter_map_id = t2.encounter_map_id
-- and t1.encounter_map_id_source = t2.encounter_map_id_source
-- and t1.encounter_id = t2.encounter_id
-- and t1.encounter_id_source = t2.encounter_id_source) ';

 execute 'delete  from ' || tempEidTableName ||  ' t1  
		  where ( ctid) NOT IN (select  max(ctid) from ' || tempEidTableName || ' t2 
		  group by  encounter_map_id,encounter_map_id_source,encounter_id,encounter_id_source )';


 LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;
 select max(encounter_num) into maxEncounterNum from encounter_mapping ; 
 
if maxEncounterNum is null then 
  maxEncounterNum := 0;
end if;

  open distinctEidCur for EXECUTE(sql_stmt) ;
 
   loop
     FETCH distinctEidCur INTO disEncounterId, disEncounterIdSource;
      -- smuniraju: %NOTFOUND not supported in postgres.
	  -- EXIT WHEN distinctEidCur%NOTFOUND;
	 EXIT WHEN NOT FOUND;
      -- dbms_output.put_line(disEncounterId);
        
  if  disEncounterIdSource = 'HIVE'  THEN    
   begin
    --check if hive NUMERIC exist, if so assign that NUMERIC to reset of map_id's within that pid
    select encounter_num into existingEncounterNum from encounter_mapping where encounter_num = disEncounterId and encounter_ide_source = 'HIVE';
    
    EXCEPTION  
       when NO_DATA_FOUND THEN
           existingEncounterNum := null;
    end;
   
   if existingEncounterNum is not null then 
		-- smuniraju: NOT EXISTS clause reults in a co-related queries which are not supported in greenplum
        -- execute ' update ' || tempEidTableName ||' set encounter_num = encounter_id, process_status_flag = ''P''
        -- where encounter_id = ' || disEncounterId || ' and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
        -- and em.encounter_ide_source = encounter_map_id_source)';		
		execute ' 	update ' || tempEidTableName ||' set 
					encounter_num = encounter_id::numeric, process_status_flag = ''P''
					from encounter_mapping em 
					where em.encounter_ide = encounter_map_id
					and em.encounter_ide_source = encounter_map_id_source
					and encounter_id = ' || disEncounterId || ' 
					and em.encounter_ide is null
					and em.encounter_ide_source is null ';
   else 
        -- generate new patient_num i.e. take max(_num) + 1 
        if maxEncounterNum < disEncounterId then 
            maxEncounterNum := disEncounterId;
        end if ;
		-- smuniraju : NOT EXISTS clause reults in a co-related queries which are not supported in greenplum
        -- execute ' update ' || tempEidTableName ||' set encounter_num = encounter_id, process_status_flag = ''P'' where 
        -- encounter_id = ' || disEncounterId || ' and encounter_id_source = ''HIVE'' and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
        -- and em.encounter_ide_source = encounter_map_id_source)' ;		
		execute '   update ' || tempEidTableName ||' set 
					encounter_num = encounter_id::numeric, process_status_flag = ''P''
					from encounter_mapping em 
					where em.encounter_ide = encounter_map_id
					and em.encounter_ide_source = encounter_map_id_source
					and encounter_id = ' || disEncounterId || ' 
					and encounter_id_source = ''HIVE'' 
					and em.encounter_ide is null
					and em.encounter_ide_source is null ';      
   end if;    
   
   -- test if record fectched
   -- dbms_output.put_line(' HIVE ');

 else 
    begin
       select encounter_num into existingEncounterNum from encounter_mapping where encounter_ide = disEncounterId and 
        encounter_ide_source = disEncounterIdSource ; 

       -- test if record fetched. 
       EXCEPTION
           WHEN NO_DATA_FOUND THEN
           existingEncounterNum := null;
       end;
       if existingEncounterNum is not  null then 
			-- smuniraju: NOT EXISTS clause reults in a co-related queries which are not supported in greenplum
            -- execute ' update ' || tempEidTableName ||' set encounter_num = ' || existingEncounterNum || ' , process_status_flag = ''P''
            -- where encounter_id = ' || disEncounterId || ' and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
			-- and em.encounter_ide_source = encounter_map_id_source)' ;
		execute ' update ' || tempEidTableName ||' set 
				  encounter_num = ' || existingEncounterNum || '::numeric , process_status_flag = ''P''
				  from encounter_mapping em 
				  where em.encounter_ide = encounter_map_id and em.encounter_ide_source = encounter_map_id_source
				  and encounter_id = ' || disEncounterId || ' 
				  and em.encounter_ide is null 
				  and em.encounter_ide_source is null' ;
       else 
            maxEncounterNum := maxEncounterNum + 1 ;
			
			--TODO : add update colunn
             execute ' insert into ' || tempEidTableName ||' (encounter_map_id,encounter_map_id_source,encounter_id,encounter_id_source,encounter_num,process_status_flag
             ,encounter_map_id_status,update_date,download_date,import_date,sourcesystem_cd) 
             values(' || maxEncounterNum || ',''HIVE'',' || maxEncounterNum || ',''HIVE'',' || maxEncounterNum ||',''P'',''A'',current_timestamp,current_timestamp,current_timestamp,''edu.harvard.i2b2.crc'')'; 
             
            -- smuniraju: NOT EXISTS clause reults in a co-related queries which are not supported in greenplum
	        -- execute ' update ' || tempEidTableName ||' set encounter_num =  ' || maxEncounterNum || ' , process_status_flag = ''P'' 
            -- where encounter_id = ' || disEncounterId || ' and  not exists (select 1 from 
            -- encounter_mapping em where em.encounter_ide = encounter_map_id
            -- and em.encounter_ide_source = encounter_map_id_source)' ;
			execute ' update ' || tempEidTableName ||' set 
					  encounter_num = ' || maxEncounterNum || ' , process_status_flag = ''P''
					  from encounter_mapping em 
					  where em.encounter_ide = encounter_map_id and em.encounter_ide_source = encounter_map_id_source
					  and encounter_id = ' || disEncounterId || ' 
					  and em.encounter_ide is null 
					  and em.encounter_ide_source is null' ;
            
       end if ;
 end if; 

END LOOP;
close distinctEidCur ;

-- smuniraju Postgres doesn't allow commit within procedures because it is explicity done upon 'END;'
-- commit;

 -- do the mapping update if the update date is old
   execute 'update encounter_mapping em set 
			encounter_num = temp.encounter_id::numeric,
			patient_ide = temp.patient_map_id ,
			patient_ide_source  = temp.patient_map_id_source ,
			encounter_ide_status = temp.encounter_map_id_status  ,
			update_date = temp.update_date,
			download_date = temp.download_date ,
			import_date = now() ,
			sourcesystem_cd  = temp.sourcesystem_cd ,
			upload_id = ' || upload_id || ' 
			from ' || tempEidTableName || ' temp
            where em.encounter_ide = temp.encounter_map_id 
			and em.encounter_ide_source = temp.encounter_map_id_source 
			and temp.encounter_id_source = ''HIVE'' and temp.process_status_flag is null  
			and coalesce(em.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))<= coalesce(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) ' ;

-- insert new mapping records i.e flagged P

execute ' insert into encounter_mapping (encounter_ide,encounter_ide_source,encounter_ide_status,encounter_num,patient_ide,patient_ide_source,update_date,download_date,import_date,sourcesystem_cd,upload_id) 
			select 	encounter_map_id,encounter_map_id_source,encounter_map_id_status,encounter_num,patient_map_id,patient_map_id_source,update_date,download_date,current_timestamp,sourcesystem_cd,' || upload_id || ' 
			from ' || tempEidTableName || '  
			where process_status_flag = ''P'' ' ; 

-- smuniraju Postgres doesn't allow commit within procedures because it is explicity done upon 'END;'
-- commit;
EXCEPTION
   WHEN OTHERS THEN
	  -- smuniraju
      /*if distinctEidCur%isopen then
          close distinctEidCur;
      end if;*/
	  RAISE EXCEPTION 'An error was encountered - % -ERROR- %', SQLSTATE, SQLERRM;
	  
	  begin
		close distinctEidCur;
		EXCEPTION
			WHEN OTHERS THEN
			RAISE NOTICE 'Error occurred when attempting to close cursor.';
	  end;	
      -- smuniraju Postgres doesn't allow rollback within procedures because it is explicity when a transaction fails.
      -- rollback;
      
end;
$$;


ALTER FUNCTION i2b2demodata.insert_eid_map_fromtemp(tempeidtablename character varying, upload_id numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 722 (class 1255 OID 24175)
-- Name: insert_encountervisit_fromtemp(character varying, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_encountervisit_fromtemp(temptablename character varying, upload_id numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 

DECLARE
maxEncounterNum NUMERIC; 
BEGIN 

    --Delete duplicate rows with same encounter and patient combination
	-- smuniraju
	-- execute  'DELETE FROM ' || tempTableName || ' t1 WHERE rowid > 
	-- 				   (SELECT  min(rowid) FROM ' || tempTableName || ' t2
	-- 				     WHERE t1.encounter_id = t2.encounter_id 
    --                   AND t1.encounter_id_source = t2.encounter_id_source
    --                   AND nvl(t1.patient_id,'''') = nvl(t2.patient_id,'''')
    --                   AND nvl(t1.patient_id_source,'''') = nvl(t2.patient_id_source,''''))';
	execute  'DELETE FROM ' || tempTableName || ' t1 
			  WHERE ( ctid) NOT IN (
					SELECT  max(ctid) FROM ' || tempTableName || ' t2
					GROUP BY  encounter_id,encounter_id_source)';
	
	 LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;
    -- select max(encounter_num) into maxEncounterNum from encounter_mapping ;

	--Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	-- smuniraju
    --  execute  ' insert into encounter_mapping (encounter_ide,encounter_ide_source,encounter_num,patient_ide,patient_ide_source,encounter_ide_status, upload_id)
    --  	(select distinctTemp.encounter_id, distinctTemp.encounter_id_source, distinctTemp.encounter_id,  distinctTemp.patient_id,distinctTemp.patient_id_source,''A'',  '|| upload_id ||'
	-- 			from 
	-- 				(select distinct encounter_id, encounter_id_source,patient_id,patient_id_source from ' || tempTableName || '  temp
	-- 				where 
	-- 			     not exists (select encounter_ide from encounter_mapping em where em.encounter_ide = temp.encounter_id and em.encounter_ide_source = temp.encounter_id_source)
	-- 				 and encounter_id_source = ''HIVE'' )   distinctTemp) ' ;

	execute  ' insert into encounter_mapping (encounter_ide,encounter_ide_source,encounter_num,patient_ide,patient_ide_source,encounter_ide_status, upload_id) (
					select distinctTemp.encounter_id, distinctTemp.encounter_id_source, distinctTemp.encounter_id::numeric,  distinctTemp.patient_id,distinctTemp.patient_id_source,''A'',  '|| upload_id ||'
					from (
						select distinct encounter_id, encounter_id_source,patient_id,patient_id_source 
						from ' || tempTableName || ' temp left outer join encounter_mapping em
						on em.encounter_ide = temp.encounter_id and em.encounter_ide_source = temp.encounter_id_source
						where em.encounter_ide_source is null
						and  em.encounter_ide is null
						and encounter_id_source = ''HIVE'' )   distinctTemp) ' ;
	
	-- update patient_num for temp table
	-- smuniraju: Greenplum doesn't support sub query for setting a column value.
	-- update patient_num for temp table
	-- execute  ' UPDATE ' ||  tempTableName || ' SET encounter_num = (SELECT em.encounter_num
	-- 	     FROM encounter_mapping em
	-- 	     WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
    --       and em.encounter_ide_source = '|| tempTableName ||'.encounter_id_source 
	-- 	     and coalesce(em.patient_ide_source,'''') = coalesce('|| tempTableName ||'.patient_id_source,'''')
	-- 	     and coalesce(em.patient_ide,'''')= coalesce('|| tempTableName ||'.patient_id,''''))
	-- 	     WHERE EXISTS (SELECT em.encounter_num
	-- 	     FROM encounter_mapping em
	-- 	     WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
    --   	 and em.encounter_ide_source = '||tempTableName||'.encounter_id_source
	-- 	     and coalesce(em.patient_ide_source,'''') = coalesce('|| tempTableName ||'.patient_id_source,'''')
	-- 	     and coalesce(em.patient_ide,'''')= coalesce('|| tempTableName ||'.patient_id,''''))';	
		     
	execute  ' UPDATE ' ||  tempTableName || ' temp SET encounter_num = em.encounter_num
		     FROM encounter_mapping em
		     WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
             and em.encounter_ide_source = '|| tempTableName ||'.encounter_id_source 
		     and coalesce(em.patient_ide_source,'''') = coalesce(temp.patient_id_source,'''')
		     and coalesce(em.patient_ide,'''')= coalesce(temp.patient_id,'''')
		     and EXISTS (
				SELECT em.encounter_num
				FROM encounter_mapping em
				WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
				and em.encounter_ide_source = '||tempTableName||'.encounter_id_source
				and coalesce(em.patient_ide_source,'''') = coalesce(temp.patient_id_source,'''')
				and coalesce(em.patient_ide,'''')= coalesce(temp.patient_id,''''))';	

	 execute  'UPDATE visit_dimension vd set 
				inout_cd = temp.inout_cd,
				location_cd = temp.location_cd,
				location_path = temp.location_path,
				start_date = temp.start_date,
				end_date = temp.end_date,
				visit_blob = temp.visit_blob,
				update_date = temp.update_date,
				download_date = temp.download_date,
				import_date = now(),
				sourcesystem_cd = temp.sourcesystem_cd
				from ' || tempTableName || ' temp
				where vd.encounter_num = temp.encounter_num
				and temp.update_date >= vd.update_date';

	-- smuniraju
    -- execute  'insert into visit_dimension  (encounter_num,patient_num,START_DATE,END_DATE,INOUT_CD,LOCATION_CD,VISIT_BLOB,UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,SOURCESYSTEM_CD, UPLOAD_ID)
	--  	select temp.encounter_num, pm.patient_num, temp.START_DATE,temp.END_DATE,temp.INOUT_CD,temp.LOCATION_CD,temp.VISIT_BLOB,
	-- 		temp.update_date, temp.download_date, sysdate, -- import date temp.sourcesystem_cd, '|| upload_id ||'
	-- 		from ' || tempTableName || '  temp , patient_mapping pm 
	-- 		where temp.encounter_num is not null and 
	-- 	      	 not exists (select encounter_num from visit_dimension vd where vd.encounter_num = temp.encounter_num) and 
	-- 			 pm.patient_ide = temp.patient_id and pm.patient_ide_source = temp.patient_id_source
	-- ';
	execute  'insert into visit_dimension (encounter_num,patient_num,START_DATE,END_DATE,INOUT_CD,LOCATION_CD,VISIT_BLOB,UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,SOURCESYSTEM_CD, UPLOAD_ID)
				select temp.encounter_num, pm.patient_num, temp.START_DATE,temp.END_DATE,temp.INOUT_CD,temp.LOCATION_CD,temp.VISIT_BLOB,
				temp.update_date, temp.download_date, current_timestamp, -- import date temp.sourcesystem_cd, '|| upload_id ||'
				from ' || tempTableName || '  temp left outer join patient_mapping pm  
				on	pm.patient_ide = temp.patient_id and pm.patient_ide_source = temp.patient_id_source
				left outer join visit_dimension vd 
				on vd.encounter_num = temp.encounter_num
				where temp.encounter_num is not null 				
				and vd.encounter_num  is null'; 
				
-- smuniraju: Postgres doesn't allow commit within procedures because it is explicity done upon 'END;'	 
-- commit;
		        
EXCEPTION
	WHEN OTHERS THEN
		-- smuniraju: Postgres doesn't allow rollback within procedures because it is explicity when a transaction fails.	 
		-- rollback;
		Raise exception 'An error(-20001) was encountered - % -ERROR- %', SQLSTATE, SQLERRM;	
END;
$$;


ALTER FUNCTION i2b2demodata.insert_encountervisit_fromtemp(temptablename character varying, upload_id numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 723 (class 1255 OID 24178)
-- Name: insert_modifier_fromtemp(character varying, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_modifier_fromtemp(tempmodifiertablename character varying, upload_id numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 

BEGIN 
	--Delete duplicate rows 
	-- smuniraju rowid not implemented in postgres
	-- execute  'DELETE FROM ' || tempModifierTableName || ' t1 WHERE rowid > 
	-- 				(SELECT  min(rowid) FROM ' || tempModifierTableName || ' t2
	-- 				 WHERE t1.modifier_cd = t2.modifier_cd 
    --               AND t1.modifier_path = t2.modifier_path)';
	execute  'DELETE FROM ' || tempModifierTableName || ' t1 WHERE ( ctid) NOT IN  
			   (SELECT   max(ctid) FROM ' || tempModifierTableName || ' t2
				GROUP BY  modifier_path,modifier_cd)';
						 
    execute 'UPDATE modifier_dimension cd set 
			name_char= temp.name_char,
			modifier_blob= temp.modifier_blob,
			update_date= temp.update_date,
			import_date = now(),
			DOWNLOAD_DATE=temp.DOWNLOAD_DATE,
			SOURCESYSTEM_CD=temp.SOURCESYSTEM_CD,
			UPLOAD_ID = '|| upload_id || '
			from ' || tempModifierTableName || ' temp
			where cd.modifier_path = temp.modifier_path
			and temp.update_date >= cd.update_date';

    --Create new modifier if temp table modifier_path does not exists 
	-- in modifier dimension table.
	-- smuniraju: not exists => co-related query
	-- execute  'insert into modifier_dimension  (modifier_cd,modifier_path,name_char,modifier_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
	-- 		    select  modifier_cd, modifier_path,
    --                     name_char,modifier_blob,
    --                     update_date,download_date,
    --                     sysdate,sourcesystem_cd,
    --                      ' || upload_id || '  from ' || tempModifierTableName || '  temp
	-- 				where not exists (select modifier_cd from modifier_dimension cd where cd.modifier_path = temp.modifier_path)					 
	-- 	';
	
	execute  'insert into modifier_dimension  (modifier_cd,modifier_path,name_char,modifier_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  modifier_cd, modifier_path, name_char,modifier_blob, update_date,download_date, current_timestamp, sourcesystem_cd,' || upload_id || '  
					from ' || tempModifierTableName || '  temp left outer join modifier_dimension cd
					on cd.modifier_path = temp.modifier_path 
					where cd.modifier_path is null)';
	 
EXCEPTION
	WHEN OTHERS THEN
		raise exception 'An error(-20001) was encountered - %-ERROR- %', SQLSTATE, SQLERRM;	
END;
$$;


ALTER FUNCTION i2b2demodata.insert_modifier_fromtemp(tempmodifiertablename character varying, upload_id numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 725 (class 1255 OID 24179)
-- Name: insert_patient_map_fromtemp(character varying, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_patient_map_fromtemp(temppatienttablename character varying, upload_id numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 

BEGIN 
	
	-- Create new patient mapping entry for HIVE patient's if they are not already mapped in mapping table
	-- smuniraju: not exists => co-related
	-- execute 'insert into patient_mapping (
	-- 		select distinct temp.patient_id, temp.patient_id_source,''A'',temp.patient_id ,' || upload_id || '
	-- 		from ' || tempPatientTableName ||'  temp 
	-- 		where temp.patient_id_source = ''HIVE'' and 
   	-- 		not exists (
	--			select patient_ide from patient_mapping pm where pm.patient_num = temp.patient_id and pm.patient_ide_source = temp.patient_id_source) 
	-- 	)'; 
    
	execute 'insert into patient_mapping (patient_ide, patient_ide_source, patient_ide_status, patient_num, upload_id) (
				select distinct temp.patient_id, temp.patient_id_source,''A'',temp.patient_id::numeric ,' || upload_id || '
				from ' || tempPatientTableName ||'  temp left outer join patient_mapping pm
				on pm.patient_num = temp.patient_id and pm.patient_ide_source = temp.patient_id_source			
				where temp.patient_id_source = ''HIVE'' 
				and pm.patient_num is null 
				and pm.patient_ide_source is null)'; 
		
    --Create new visit for above inserted encounter's
	--If Visit table's encounter and patient num does match temp table,
	--then new visit information is created.
	execute 'UPDATE patient_dimension pd set 
			 VITAL_STATUS_CD= temp.VITAL_STATUS_CD,
			 BIRTH_DATE= temp.BIRTH_DATE,
			 DEATH_DATE= temp.DEATH_DATE,
			 SEX_CD= temp.SEX_CD,
			 AGE_IN_YEARS_NUM=temp.AGE_IN_YEARS_NUM,
			 LANGUAGE_CD=temp.LANGUAGE_CD,
			 RACE_CD=temp.RACE_CD,
			 MARITAL_STATUS_CD=temp.MARITAL_STATUS_CD,
			 RELIGION_CD=temp.RELIGION_CD,
			 ZIP_CD=temp.ZIP_CD,
			 STATECITYZIP_PATH =temp.STATECITYZIP_PATH,
			 PATIENT_BLOB=temp.PATIENT_BLOB,
			 UPDATE_DATE=temp.UPDATE_DATE,
			 DOWNLOAD_DATE=temp.DOWNLOAD_DATE,
			 SOURCESYSTEM_CD=temp.SOURCESYSTEM_CD,
			 UPLOAD_ID = '|| upload_id || '
			 from ' || tempPatientTableName || ' temp
			 where pd.patient_num = temp.patient_num
			 and temp.update_date > pd.update_date';
EXCEPTION
	WHEN OTHERS THEN
		RAISE EXCEPTION 'An error was encountered - % -ERROR- %', SQLSTATE, SQLERRM;	
END;

$$;


ALTER FUNCTION i2b2demodata.insert_patient_map_fromtemp(temppatienttablename character varying, upload_id numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 724 (class 1255 OID 24180)
-- Name: insert_pid_map_fromtemp(character varying, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_pid_map_fromtemp(temppidtablename character varying, upload_id numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 

DECLARE
 existingPatientNum VARCHAR(32);
 maxPatientNum NUMERIC;
 --TYPE distinctPidCurTyp IS REF CURSOR;
 --distinctPidCurTyp refcursor;
 --distinctPidCur   distinctPidCurTyp;
 distinctPidCur REFCURSOR;
 sql_stmt  VARCHAR(400);
disPatientId VARCHAR(100); 
disPatientIdSource VARCHAR(100);

BEGIN
 sql_stmt := ' SELECT distinct patient_id,patient_id_source from ' || tempPidTableName ||' ';
 
  --delete the data if they miss 
  -- smuniraju: rowid not implemented in postgres/ greenplum
  -- execute ' delete  from ' || tempPidTableName ||  ' t1  
  --			where rowid > (select min(rowid) from ' || tempPidTableName || ' t2 
  -- 			where t1.patient_map_id = t2.patient_map_id
  -- 			and t1.patient_map_id_source = t2.patient_map_id_source) ';
  execute 'delete  from ' || tempPidTableName ||  ' t1  
		   where ( ctid) 
		    not in (select  max(ctid) from  ' || tempPidTableName ||  ' 
			group  BY patient_map_id,patient_map_id_source,patient_id,patient_id_source)';
  
  LOCK TABLE  patient_mapping IN EXCLUSIVE MODE NOWAIT;
  select max(patient_num) into maxPatientNum from patient_mapping ; 
 
 -- set max patient num to zero of the value is null
  if maxPatientNum is null then 
    maxPatientNum := 0;
  end if;

  open distinctPidCur for execute(sql_stmt);

  loop   
     FETCH distinctPidCur INTO disPatientId, disPatientIdSource;
      -- smuniraju: %NOTFOUND is not supported in POSTGRES
	  -- EXIT WHEN distinctPidCur%NOTFOUND;
	  EXIT WHEN NOT FOUND;    
        
	  if  disPatientIdSource = 'HIVE' THEN 
		begin
		 --check if hive NUMERIC exist, if so assign that NUMERIC to reset of map_id's within that pid
		 select patient_num into existingPatientNum from patient_mapping where patient_num = disPatientId and patient_ide_source = 'HIVE';
		   EXCEPTION  
			 when NO_DATA_FOUND THEN
			   existingPatientNum := null;
		end;
   
		if existingPatientNum is not null then 
			-- smuniraju: not exists results in corelated queries not supported by greenplum
			-- execute ' update ' || tempPidTableName ||' set patient_num = patient_id, process_status_flag = ''P''
			-- where patient_id = ' || disPatientId || ' and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
			-- and pm.patient_ide_source = patient_map_id_source)';
			execute 'update ' || tempPidTableName ||' temp set patient_num = patient_id::numeric, process_status_flag = ''P''
					 from patient_mapping pm 
					 where pm.patient_ide = temp.patient_map_id
					 and pm.patient_ide_source = temp.patient_map_id_source
					 and pm.patient_ide is null
					 and patient_id = ' || disPatientId || '';
		else 
			-- generate new patient_num i.e. take max(patient_num) + 1 
			if maxPatientNum < disPatientId then 
			   maxPatientNum := disPatientId;
			end if ;
	
		-- smuniraju: not exists results in corelated queries not supported by greenplum
		-- execute ' update ' || tempPidTableName ||' set patient_num = patient_id, process_status_flag = ''P'' where 
		-- patient_id = ' || disPatientId || ' and patient_id_source = ''HIVE'' and not exists (select 1 from patient_mapping pm where pm.patient_ide -- = patient_map_id and pm.patient_ide_source = patient_map_id_source)';
		execute 'update ' || tempPidTableName ||' temp set patient_num = patient_id::numeric, process_status_flag = ''P'' 
				 from patient_mapping pm
				 where pm.patient_ide = temp.patient_map_id
				 and pm.patient_ide_source = temp.patient_map_id_source
				 and pm.patient_ide is null and  pm.patient_ide_source is null
				 and patient_id = ' || disPatientId || ' and patient_id_source = ''HIVE'''; 
	end if;    
    
	  -- test if record fectched
	  -- dbms_output.put_line(' HIVE ');
	else 
		begin
		   select patient_num into existingPatientNum from patient_mapping where patient_ide = disPatientId and 
			patient_ide_source = disPatientIdSource ; 

		   -- test if record fetched. 
		   EXCEPTION
			   WHEN NO_DATA_FOUND THEN
			   existingPatientNum := null;
		   end;
		   if existingPatientNum is not null then 
				-- smuniraju: not exists results in corelated queries not supported by greenplum
				-- execute ' update ' || tempPidTableName ||' set patient_num = ' || existingPatientNum || ', process_status_flag = ''P''
				-- where patient_id = ' || disPatientId || ' and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
				-- and pm.patient_ide_source = patient_map_id_source)' ;
				execute 'update ' || tempPidTableName ||' temp set patient_num = ' || existingPatientNum || '::numeric, process_status_flag = ''P''
						 from patient_mapping pm 
						 where pm.patient_ide = temp.patient_map_id
						 and pm.patient_ide_source = temp.patient_map_id_source
						 and pm.patient_ide is null and pm.patient_ide_source is null
						 and patient_id = ' || disPatientId || '';
		   else 
				maxPatientNum := maxPatientNum + 1 ; 
				 execute 'insert into ' || tempPidTableName ||' (patient_map_id,patient_map_id_source,patient_id,patient_id_source,patient_num,process_status_flag
				 ,patient_map_id_status,update_date,download_date,import_date,sourcesystem_cd) 
				 values(' || maxPatientNum || ',''HIVE'',' || maxPatientNum || ',''HIVE'',' || maxPatientNum || ',''P'',''A'',current_timestamp,current_timestamp,current_timestamp,''edu.harvard.i2b2.crc'')'; 
			   
			   -- smuniraju: not exists results in corelated queries not supported by greenplum
			   -- execute 'update ' || tempPidTableName ||' set patient_num =  ' || maxPatientNum || ' , process_status_flag = ''P'' 
			   -- where patient_id = ' || disPatientId || ' and  not exists (select 1 from 
			   --  patient_mapping pm where pm.patient_ide = patient_map_id
			   --  and pm.patient_ide_source = patient_map_id_source)' ;
				execute 'update ' || tempPidTableName ||' temp set patient_num =  ' || maxPatientNum || ' , process_status_flag = ''P'' 
						 from patient_mapping pm 
						 where pm.patient_ide = temp.patient_map_id
						 and pm.patient_ide_source = temp.patient_map_id_source
						 and pm.patient_ide is null 
						 and pm.patient_ide_source is null
						 and patient_id = ' || disPatientId || ' ';						
		   end if ;
      -- dbms_output.put_line(' NOT HIVE ');
	end if; 
  END LOOP;
  close distinctPidCur ;
  -- smuniraju: Postgres doesn't allow commit and rollback within procedures because it is explicity done upon 'END;'	 
  -- commit;

  -- do the mapping update if the update date is old
  -- smuniraju: merge resulting in errors.
   /* execute ' merge into patient_mapping
      using ' || tempPidTableName ||' temp
      on (temp.patient_map_id = patient_mapping.patient_IDE 
  		  and temp.patient_map_id_source = patient_mapping.patient_IDE_SOURCE
	   ) when matched then 
  		update set patient_num = temp.patient_id,
    	patient_ide_status	= temp.patient_map_id_status  ,
    	update_date = temp.update_date,
    	download_date  = temp.download_date ,
		import_date = sysdate ,
    	sourcesystem_cd  = temp.sourcesystem_cd ,
		upload_id = ' || upload_id ||'  
    	where  temp.patient_id_source = ''HIVE'' and temp.process_status_flag is null  and
        nvl(patient_mapping.update_date,to_date(''1900-01-01'',''YYYY-MM-DD''))<= nvl(temp.update_date,to_date(''1900-01-01'',''YYYY-MM-DD'')) ' ;
	*/
  execute ' update patient_mapping pm set 
			patient_num = temp.patient_id::numeric,
			patient_ide_status	= temp.patient_map_id_status  ,
			update_date = temp.update_date,
			download_date  = temp.download_date ,
			import_date = now() ,
			sourcesystem_cd  = temp.sourcesystem_cd ,
			upload_id = ' || upload_id ||'  	
			from ' || tempPidTableName ||' temp
			where pm.patient_ide = temp.patient_map_id and pm.patient_ide_source = temp.patient_map_id_source
			and temp.patient_id_source = ''HIVE'' and temp.process_status_flag is null  and 
			coalesce(pm.update_date,to_date(''1900-01-01'',''YYYY-MM-DD''))<= coalesce(temp.update_date,to_date(''1900-01-01'',''YYYY-MM-DD'')) ' ;
	
  -- insert new mapping records i.e flagged P
  execute ' insert into patient_mapping (patient_ide,patient_ide_source,patient_ide_status,patient_num,update_date,download_date,import_date,sourcesystem_cd,upload_id) 
				select patient_map_id,patient_map_id_source,patient_map_id_status,patient_num,update_date,download_date,now(),sourcesystem_cd,' || upload_id ||' from '|| tempPidTableName || ' 
				where process_status_flag = ''P'' ' ; 
  -- smuniraju: Postgres doesn't allow commit and rollback within procedures because it is explicity done upon 'END;'	 
  -- commit;
  EXCEPTION
   WHEN OTHERS THEN
		RAISE EXCEPTION'An error was encountered - % -ERROR- %', SQLSTATE, SQLERRM;
		  -- postgres  doesn't support isOpen
		  -- if distinctPidCur%isopen then
		  --    close distinctPidCur;
		  -- end if;
	  begin
		close distinctPidCur;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'Error occured closing cursor.';
	  end;
      -- smuniraju: Postgres doesn't allow rollback within procedures because it is explicity when a transaction fails.
	  -- rollback;      
end;

$$;


ALTER FUNCTION i2b2demodata.insert_pid_map_fromtemp(temppidtablename character varying, upload_id numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 726 (class 1255 OID 24183)
-- Name: insert_provider_fromtemp(character varying, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION insert_provider_fromtemp(tempprovidertablename character varying, upload_id numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$

BEGIN 
	--Delete duplicate rows with same encounter and patient combination
	-- smuniraju: rowid not supported
	-- execute 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE rowid > 
	-- 				   (SELECT  min(rowid) FROM ' || tempProviderTableName || ' t2
	-- 				     WHERE t1.provider_id = t2.provider_id 
    --                                         AND t1.provider_path = t2.provider_path
    --                                         )';
	execute 'DELETE FROM ' || tempProviderTableName || ' t1 
			 WHERE ( ctid) NOT IN ( 
				SELECT  max(ctid)
				FROM ' || tempProviderTableName || ' t2
				GROUP BY  provider_path)';
	
 execute 'UPDATE patient_dimension set 
			provider_id = temp.provider_id,
			name_char = temp.name_char,
			provider_blob = provider_blob,
			IMPORT_DATE=now(),
			UPDATE_DATE=temp.UPDATE_DATE,
			DOWNLOAD_DATE=temp.DOWNLOAD_DATE,
			SOURCESYSTEM_CD=temp.SOURCESYSTEM_CD,
			UPLOAD_ID = '||  upload_id || '
			from provider_dimension pd 
			inner join ' || tempProviderTableName || ' temp
			on  pd.provider_path = temp.provider_path
			where temp.update_date >= pd.update_date) ';

   
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	-- smuniraju: not exists => co-related query.
	-- execute 'insert into provider_dimension  (provider_id,provider_path,name_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
	-- 		    select  provider_id,provider_path, 
    --                     name_char,provider_blob,
    --                     update_date,download_date,
    --                     now(),sourcesystem_cd, ' || upload_id || '	                    
    --                      from ' || tempProviderTableName || '  temp
	-- 				where not exists (select provider_id from provider_dimension pd where pd.provider_path = temp.provider_path )';
	execute 'insert into provider_dimension  (provider_id,provider_path,name_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  provider_id,provider_path, 
                        name_char,provider_blob,
                        update_date,download_date,
                        now(),sourcesystem_cd, ' || upload_id || '	                    
                        from ' || tempProviderTableName || '  temp left outer join provider_dimension pd 
						on pd.provider_path = temp.provider_path 
						where pd.provider_path is null';   
EXCEPTION
	WHEN OTHERS THEN
		RAISE EXCEPTION 'An error was encountered - % -ERROR- %', SQLSTATE, SQLERRM;	
END;

$$;


ALTER FUNCTION i2b2demodata.insert_provider_fromtemp(tempprovidertablename character varying, upload_id numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 727 (class 1255 OID 24184)
-- Name: remove_temp_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION remove_temp_table(temptablename character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN 
	execute 'drop table ' || tempTableName || ' cascade';
	
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '% - %', SQLSTATE, SQLERRM;
END;
$$;


ALTER FUNCTION i2b2demodata.remove_temp_table(temptablename character varying) OWNER TO i2b2demodata;

--
-- TOC entry 728 (class 1255 OID 24185)
-- Name: sync_clear_concept_table(character varying, character varying, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION sync_clear_concept_table(tempconcepttablename character varying, backupconcepttablename character varying, uploadid numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ DECLARE

DECLARE
interConceptTableName  varchar(400);

BEGIN 
	interConceptTableName := backupConceptTableName || '_inter';
	
		--Delete duplicate rows with same encounter and patient combination
		-- smuniraju
	-- execute 'DELETE FROM ' || tempConceptTableName || ' t1 WHERE rowid > 
	-- 				   (SELECT  min(rowid) FROM ' || tempConceptTableName || ' t2
	-- 				     WHERE t1.concept_cd = t2.concept_cd 
    --                                         AND t1.concept_path = t2.concept_path
    --                                         )';
	execute 'DELETE FROM ' || tempConceptTableName || ' t1 
	         WHERE ( ctid) NOT IN  
					   (SELECT   max(rowid) FROM ' || tempConceptTableName || ' t2
					     GROUP BY  concept_path,concept_cd)';
						 
    execute 'create table ' ||  interConceptTableName || ' (
    CONCEPT_CD          VARCHAR(50) NOT NULL,
	CONCEPT_PATH    	VARCHAR(700) NOT NULL,
	NAME_CHAR       	VARCHAR(2000) NULL,
	CONCEPT_BLOB        TEXT NULL,
	UPDATE_DATE         DATE NULL,
	DOWNLOAD_DATE       DATE NULL,
	IMPORT_DATE         DATE NULL,
	SOURCESYSTEM_CD     VARCHAR(50) NULL,
	UPLOAD_ID       	NUMERIC(38,0) NULL,
    CONSTRAINT '|| interConceptTableName ||'_pk  PRIMARY KEY(CONCEPT_PATH)
	 )';
    
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	execute 'insert into '|| interConceptTableName ||'  (concept_cd,concept_path,name_char,concept_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  concept_cd, substr(concept_path,1,700),
                        name_char,concept_blob,
                        update_date,download_date,
                        current_timestamp,sourcesystem_cd,
                         ' || uploadId || '  from ' || tempConceptTableName || '  temp ';
	--backup the concept_dimension table before creating a new one
	execute 'alter table concept_dimension rename to ' || backupConceptTableName  ||'' ;
    
	-- add index on upload_id 
    execute 'CREATE INDEX ' || interConceptTableName || '_uid_idx ON ' || interConceptTableName || '(UPLOAD_ID)';

    -- add index on upload_id 
    execute 'CREATE INDEX ' || interConceptTableName || '_cd_idx ON ' || interConceptTableName || '(concept_cd)';

    
    --backup the concept_dimension table before creating a new one
	execute 'alter table ' || interConceptTableName  || ' rename to concept_dimension' ;
 
EXCEPTION
	WHEN OTHERS THEN
		RAISE EXCEPTION 'An error was encountered - % -ERROR- %', SQLSTATE, SQLERRM;	
END;
$$;


ALTER FUNCTION i2b2demodata.sync_clear_concept_table(tempconcepttablename character varying, backupconcepttablename character varying, uploadid numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 730 (class 1255 OID 24186)
-- Name: sync_clear_provider_table(character varying, character varying, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION sync_clear_provider_table(tempprovidertablename character varying, backupprovidertablename character varying, uploadid numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ DECLARE 

DECLARE
interProviderTableName  varchar(400);

BEGIN 
	interProviderTableName := backupProviderTableName || '_inter';
	
	--Delete duplicate rows with same encounter and patient combination
	-- smuniraju: rowid not supported in postgres	
	-- execute 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE rowid > 
	-- 				   (SELECT  min(rowid) FROM ' || tempProviderTableName || ' t2
	-- 				     WHERE t1.provider_id = t2.provider_id 
    --                                        AND t1.provider_path = t2.provider_path
    --                                         )';
	execute 'DELETE FROM ' || tempProviderTableName || ' t1 
			 WHERE ( ctid) NOT IN (
				SELECT  max(ctid) 
				FROM ' || tempProviderTableName || ' t2
				GROUP BY   provider_path,provider_id)';				
											
    execute 'create table ' ||  interProviderTableName || ' (
    PROVIDER_ID         VARCHAR(50) NOT NULL,
	PROVIDER_PATH       VARCHAR(700) NOT NULL,
	NAME_CHAR       	VARCHAR(850) NULL,
	PROVIDER_BLOB       TEXT NULL,
	UPDATE_DATE     	DATE NULL,
	DOWNLOAD_DATE       DATE NULL,
	IMPORT_DATE         DATE NULL,
	SOURCESYSTEM_CD     VARCHAR(50) NULL,
	UPLOAD_ID        	NUMERIC(38,0) NULL ,
    CONSTRAINT  ' || interProviderTableName || '_pk PRIMARY KEY(PROVIDER_PATH,provider_id)
	 )';
    
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
	-- in patient_mapping table.
	execute 'insert into ' ||  interProviderTableName || ' (provider_id,provider_path,name_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
			    select  provider_id,provider_path, 
                        name_char,provider_blob,
                        update_date,download_date,
                        now(),sourcesystem_cd, ' || uploadId || '
	                     from ' || tempProviderTableName || '  temp ';
					
	--backup the concept_dimension table before creating a new one
	execute 'alter table provider_dimension rename to ' || backupProviderTableName  ||'' ;
    
	-- add index on provider_id, name_char 
    execute 'CREATE INDEX ' || interProviderTableName || '_id_idx ON ' || interProviderTableName  || '(Provider_Id,name_char)';
    execute 'CREATE INDEX ' || interProviderTableName || '_uid_idx ON ' || interProviderTableName  || '(UPLOAD_ID)';

	--backup the concept_dimension table before creating a new one
	execute 'alter table ' || interProviderTableName  || ' rename to provider_dimension' ;
 
EXCEPTION
	WHEN OTHERS THEN
		RAISE EXCEPTION 'An error was encountered - % -ERROR- %', SQLSTATE, SQLERRM;	
END;

$$;


ALTER FUNCTION i2b2demodata.sync_clear_provider_table(tempprovidertablename character varying, backupprovidertablename character varying, uploadid numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

--
-- TOC entry 731 (class 1255 OID 24187)
-- Name: update_observation_fact(character varying, numeric, numeric); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION update_observation_fact(upload_temptable_name character varying, upload_id numeric, appendflag numeric, OUT errormsg character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN



--Delete duplicate records(encounter_ide,patient_ide,concept_cd,start_date,modifier_cd,provider_id)
-- smuniraju: rowid not implemented in postgres
-- execute 'DELETE FROM ' || upload_temptable_name ||'  t1 
--  where rowid > (select min(rowid) from ' || upload_temptable_name ||' t2 
--    where t1.encounter_id = t2.encounter_id  
--          and
--          t1.encounter_id_source = t2.encounter_id_source
--          and
--          t1.patient_id = t2.patient_id 
--          and 
--          t1.patient_id_source = t2.patient_id_source
--          and 
--          t1.concept_cd = t2.concept_cd                
--          and 
--          t1.start_date = t2.start_date
--          and 
--          nvl(t1.modifier_cd,''xyz'') = nvl(t2.modifier_cd,''xyz'')
--		  and 
--		  t1.instance_num = t2.instance_num
--          and 
--          t1.provider_id = t2.provider_id)';
execute 'DELETE FROM ' || upload_temptable_name ||'  
		 WHERE ( ctid) not in (
			SELECT  max(ctid) FROM ' || upload_temptable_name ||' 
			GROUP BY  encounter_id,encounter_id_source,patient_id,patient_id_source, concept_cd,start_date,modifier_cd,provider_id,instance_num ORDER BY encounter_id,encounter_id_source)';
          
--Delete records having null in start_date
execute 'DELETE FROM ' || upload_temptable_name ||'  t1           
 where t1.start_date is null';
           
           
--One time lookup on encounter_ide to get encounter_num 
-- smuniraju: Greenplum doesn't support sub query for assigning values.
-- execute 'UPDATE ' ||  upload_temptable_name
--  || ' SET encounter_num = (SELECT em.encounter_num
-- 		     FROM encounter_mapping em
-- 		     WHERE em.encounter_ide = ' || upload_temptable_name||'.encounter_id
--                   and em.encounter_ide_source = '|| upload_temptable_name||'.encounter_id_source) 
--                   WHERE EXISTS (SELECT em.encounter_num
-- 		     FROM encounter_mapping em
-- 		     WHERE em.encounter_ide = '|| upload_temptable_name||'.encounter_id
--		     and em.encounter_ide_source = '||upload_temptable_name||'.encounter_id_source)';		     

execute 'UPDATE ' ||  upload_temptable_name || ' SET encounter_num = em.encounter_num
	FROM encounter_mapping em
	WHERE em.encounter_ide = ' || upload_temptable_name||'.encounter_id
        and em.encounter_ide_source = '|| upload_temptable_name||'.encounter_id_source) 
        and EXISTS (
		SELECT em.encounter_num
		FROM encounter_mapping em
		WHERE em.encounter_ide = '|| upload_temptable_name||'.encounter_id
                and em.encounter_ide_source = '||upload_temptable_name||'.encounter_id_source)';	     

--One time lookup on patient_ide to get patient_num 
-- smuniraju: Greenplum doesn't support sub query for assigning values.
-- execute 'UPDATE ' ||  upload_temptable_name
--  || ' SET patient_num = (SELECT pm.patient_num
-- 		     FROM patient_mapping pm
-- 		     WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
--                      and pm.patient_ide_source = '|| upload_temptable_name||'.patient_id_source
-- 	 	    )WHERE EXISTS (SELECT pm.patient_num 
-- 		     FROM patient_mapping pm
-- 		     WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
--                      and pm.patient_ide_source = '||upload_temptable_name||'.patient_id_source)';		     

execute 'UPDATE ' ||  upload_temptable_name || ' SET patient_num = pm.patient_num
	FROM patient_mapping pm
	WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
        and pm.patient_ide_source = '|| upload_temptable_name||'.patient_id_source
	and EXISTS (
		SELECT pm.patient_num 
		FROM patient_mapping pm
		WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
                and pm.patient_ide_source = '||upload_temptable_name||'.patient_id_source)';		     

IF (appendFlag = 0) THEN
--Archive records which are to be deleted in observation_fact table
execute 'INSERT ALL INTO  archive_observation_fact 
		SELECT obsfact.*, ' || upload_id ||' archive_upload_id 
		FROM observation_fact obsfact
		WHERE obsfact.encounter_num IN 
			(SELECT temp_obsfact.encounter_num
			FROM  ' ||upload_temptable_name ||' temp_obsfact
                        group by temp_obsfact.encounter_num  
            )';


--Delete above archived row from observation_fact
execute 'DELETE  observation_fact 
		 WHERE EXISTS (
				SELECT archive.encounter_num
				FROM archive_observation_fact  archive
				where archive.archive_upload_id = '||upload_id ||'
                AND archive.encounter_num=observation_fact.encounter_num
				AND archive.concept_cd = observation_fact.concept_cd
				AND archive.start_date = observation_fact.start_date
         )';
END IF;

-- if the append is true, then do the update else do insert all
IF (appendFlag = 0) THEN

--Transfer all rows from temp_obsfact to observation_fact
execute 'INSERT ALL INTO observation_fact(encounter_num,concept_cd, patient_num,provider_id, start_date,modifier_cd,instance_num,valtype_cd,tval_char,nval_num,valueflag_cd,
quantity_num,confidence_num,observation_blob,units_cd,end_date,location_cd, update_date,download_date,import_date,sourcesystem_cd,
upload_id) 
SELECT encounter_num,concept_cd, patient_num,provider_id, start_date,modifier_cd,instance_num,valtype_cd,tval_char,nval_num,valueflag_cd,
quantity_num,confidence_num,observation_blob,units_cd,end_date,location_cd, update_date,download_date,current_timestamp import_date,sourcesystem_cd,
temp.upload_id 
FROM ' || upload_temptable_name ||' temp
where temp.patient_num is not null and  temp.encounter_num is not null';
ELSE				
	execute ' UPDATE observation_fact  set 
			valtype_cd = temp.valtype_cd,
            tval_char = temp.tval_char,
			nval_num = temp.nval_num ,
			valueflag_cd = temp.valueflag_cd,
			quantity_num = temp.quantity_num,
			confidence_num = temp.confidence_num ,
			observation_blob = temp.observation_blob,
			units_cd = temp.units_cd,
			end_date = temp.end_date,
			location_cd = temp.location_cd,
			update_date= temp.update_date,
			download_date = temp.download_date,
			import_date = now(),
			sourcesystem_cd = temp.sourcesystem_cd,
			UPLOAD_ID = ' || upload_id || '
			from observation_fact obsfact 
			inner join ' || upload_temptable_name || ' temp
			on  obsfact.encounter_num = temp.encounter_num 
			and obsfact.patient_num = temp.patient_num
			and obsfact.concept_cd = temp.concept_cd
			and obsfact.start_date = temp.start_date
			and obsfact.provider_id = temp.provider_id
			and obsfact.modifier_cd = temp.modifier_cd
			and obsfact.instance_num = temp.instance_num
			where coalesce(observation_fact.update_date,to_date(''1900-01-01'',''YYYY-MM-DD''))<= coalesce(temp.update_date,to_date(''1900-01-01'',''YYYY-MM-DD'')) ';
END IF;

EXCEPTION
	WHEN OTHERS THEN
		RAISE EXCEPTION 'An error was encountered - % -ERROR- % ', SQLSTATE, SQLERRM;	
END;
$$;


ALTER FUNCTION i2b2demodata.update_observation_fact(upload_temptable_name character varying, upload_id numeric, appendflag numeric, OUT errormsg character varying) OWNER TO i2b2demodata;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 326 (class 1259 OID 24894)
-- Name: archive_observation_fact; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE archive_observation_fact (
    encounter_num numeric(38,0),
    patient_num numeric(38,0),
    concept_cd character varying(50),
    provider_id character varying(50),
    start_date timestamp without time zone,
    modifier_cd character varying(100),
    instance_num numeric(18,0),
    valtype_cd character varying(50),
    tval_char character varying(255),
    nval_num numeric(18,5),
    valueflag_cd character varying(50),
    quantity_num numeric(18,5),
    units_cd character varying(50),
    end_date timestamp without time zone,
    location_cd character varying(50),
    observation_blob text,
    confidence_num numeric(18,5),
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0),
    archive_upload_id numeric(22,0)
);


ALTER TABLE i2b2demodata.archive_observation_fact OWNER TO i2b2demodata;

--
-- TOC entry 327 (class 1259 OID 24900)
-- Name: async_job; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE async_job (
    id integer,
    job_name character varying(200),
    job_status character varying(200),
    run_time character varying(200),
    last_run_on timestamp(6) without time zone,
    viewer_url character varying(4000),
    alt_viewer_url character varying(600),
    job_results text,
    job_type character varying(20)
);


ALTER TABLE i2b2demodata.async_job OWNER TO i2b2demodata;

--
-- TOC entry 328 (class 1259 OID 24906)
-- Name: code_lookup; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE code_lookup (
    table_cd character varying(100) NOT NULL,
    column_cd character varying(100) NOT NULL,
    code_cd character varying(50) NOT NULL,
    name_char character varying(650),
    lookup_blob text,
    upload_date timestamp without time zone,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);


ALTER TABLE i2b2demodata.code_lookup OWNER TO i2b2demodata;

--
-- TOC entry 329 (class 1259 OID 24912)
-- Name: concept_counts; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE concept_counts (
    concept_path character varying(500),
    parent_concept_path character varying(500),
    patient_count numeric(18,0)
);


ALTER TABLE i2b2demodata.concept_counts OWNER TO i2b2demodata;

--
-- TOC entry 330 (class 1259 OID 24918)
-- Name: concept_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE concept_dimension (
    concept_path character varying(700) NOT NULL,
    concept_cd character varying(50) NOT NULL,
    name_char character varying(2000),
    concept_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);


ALTER TABLE i2b2demodata.concept_dimension OWNER TO i2b2demodata;

--
-- TOC entry 331 (class 1259 OID 24924)
-- Name: concept_id; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE concept_id
    START WITH 200
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.concept_id OWNER TO i2b2demodata;

--
-- TOC entry 332 (class 1259 OID 24926)
-- Name: datamart_report; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE datamart_report (
    total_patient numeric(38,0),
    total_observationfact numeric(38,0),
    total_event numeric(38,0),
    report_date timestamp without time zone
);


ALTER TABLE i2b2demodata.datamart_report OWNER TO i2b2demodata;

--
-- TOC entry 333 (class 1259 OID 24929)
-- Name: encounter_mapping; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE encounter_mapping (
    encounter_ide character varying(200) NOT NULL,
    encounter_ide_source character varying(50) NOT NULL,
    encounter_num numeric(38,0) NOT NULL,
    patient_ide character varying(200),
    patient_ide_source character varying(50),
    encounter_ide_status character varying(50),
    upload_date timestamp without time zone,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);


ALTER TABLE i2b2demodata.encounter_mapping OWNER TO i2b2demodata;

--
-- TOC entry 334 (class 1259 OID 24935)
-- Name: modifier_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE modifier_dimension (
    modifier_path character varying(700) NOT NULL,
    modifier_cd character varying(50),
    name_char character varying(2000),
    modifier_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);


ALTER TABLE i2b2demodata.modifier_dimension OWNER TO i2b2demodata;

--
-- TOC entry 335 (class 1259 OID 24941)
-- Name: news_updates; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE news_updates (
    newsid integer,
    ranbyuser character varying(200),
    rowsaffected integer,
    operation character varying(200),
    datasetname character varying(200),
    updatedate timestamp(6) without time zone,
    commentfield character varying(200)
);


ALTER TABLE i2b2demodata.news_updates OWNER TO i2b2demodata;

--
-- TOC entry 336 (class 1259 OID 24947)
-- Name: observation_fact; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE observation_fact (
    encounter_num numeric(38,0),
    patient_num numeric(38,0) NOT NULL,
    concept_cd character varying(50) NOT NULL,
    provider_id character varying(50) NOT NULL,
    start_date timestamp without time zone,
    modifier_cd character varying(100) NOT NULL,
    instance_num numeric(18,0) NOT NULL,
    valtype_cd character varying(50),
    tval_char character varying(255),
    nval_num numeric(18,5),
    valueflag_cd character varying(50),
    quantity_num numeric(18,5),
    units_cd character varying(50),
    end_date timestamp without time zone,
    location_cd character varying(50),
    observation_blob text,
    confidence_num numeric(18,5),
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);


ALTER TABLE i2b2demodata.observation_fact OWNER TO i2b2demodata;

--
-- TOC entry 337 (class 1259 OID 24953)
-- Name: patient_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE patient_dimension (
    patient_num numeric(38,0) NOT NULL,
    vital_status_cd character varying(50),
    birth_date timestamp without time zone,
    death_date timestamp without time zone,
    sex_cd character varying(50),
    age_in_years_num numeric(38,0),
    language_cd character varying(50),
    race_cd character varying(50),
    marital_status_cd character varying(50),
    religion_cd character varying(50),
    zip_cd character varying(10),
    statecityzip_path character varying(700),
    income_cd character varying(50),
    patient_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);


ALTER TABLE i2b2demodata.patient_dimension OWNER TO i2b2demodata;

--
-- TOC entry 338 (class 1259 OID 24959)
-- Name: patient_mapping; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE patient_mapping (
    patient_ide character varying(200) NOT NULL,
    patient_ide_source character varying(50) NOT NULL,
    patient_num numeric(38,0) NOT NULL,
    patient_ide_status character varying(50),
    upload_date timestamp without time zone,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);


ALTER TABLE i2b2demodata.patient_mapping OWNER TO i2b2demodata;

--
-- TOC entry 339 (class 1259 OID 24962)
-- Name: patient_trial; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE patient_trial (
    patient_num numeric,
    trial character varying(30),
    secure_obj_token character varying(50)
);


ALTER TABLE i2b2demodata.patient_trial OWNER TO i2b2demodata;

--
-- TOC entry 340 (class 1259 OID 24968)
-- Name: provider_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE provider_dimension (
    provider_id character varying(50) NOT NULL,
    provider_path character varying(700) NOT NULL,
    name_char character varying(850),
    provider_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);


ALTER TABLE i2b2demodata.provider_dimension OWNER TO i2b2demodata;

--
-- TOC entry 341 (class 1259 OID 24974)
-- Name: qt_analysis_plugin; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_analysis_plugin (
    plugin_id numeric(10,0) NOT NULL,
    plugin_name character varying(2000),
    description character varying(2000),
    version_cd character varying(50),
    parameter_info text,
    parameter_info_xsd character varying(2000),
    command_line character varying(2000),
    working_folder character varying(2000),
    commandoption_cd character varying(2000),
    plugin_icon character varying(2000),
    status_cd character varying(50),
    user_id character varying(50),
    group_id character varying(50),
    create_date timestamp without time zone,
    update_date timestamp without time zone
);


ALTER TABLE i2b2demodata.qt_analysis_plugin OWNER TO i2b2demodata;

--
-- TOC entry 342 (class 1259 OID 24980)
-- Name: qt_analysis_plugin_result_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_analysis_plugin_result_type (
    plugin_id numeric(10,0) NOT NULL,
    result_type_id numeric(10,0) NOT NULL
);


ALTER TABLE i2b2demodata.qt_analysis_plugin_result_type OWNER TO i2b2demodata;

--
-- TOC entry 343 (class 1259 OID 24983)
-- Name: qt_breakdown_path; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_breakdown_path (
    name character varying(100),
    value character varying(2000),
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    user_id character varying(50)
);


ALTER TABLE i2b2demodata.qt_breakdown_path OWNER TO i2b2demodata;

--
-- TOC entry 344 (class 1259 OID 24989)
-- Name: qt_sq_qper_pecid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_sq_qper_pecid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_sq_qper_pecid OWNER TO i2b2demodata;

--
-- TOC entry 345 (class 1259 OID 24991)
-- Name: qt_patient_enc_collection; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_patient_enc_collection (
    patient_enc_coll_id numeric(10,0) DEFAULT nextval('qt_sq_qper_pecid'::regclass) NOT NULL,
    result_instance_id numeric(5,0),
    set_index numeric(10,0),
    patient_num numeric(10,0),
    encounter_num numeric(10,0)
);


ALTER TABLE i2b2demodata.qt_patient_enc_collection OWNER TO i2b2demodata;

--
-- TOC entry 346 (class 1259 OID 24995)
-- Name: qt_sq_qpr_pcid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_sq_qpr_pcid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_sq_qpr_pcid OWNER TO i2b2demodata;

--
-- TOC entry 347 (class 1259 OID 24997)
-- Name: qt_patient_set_collection; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_patient_set_collection (
    patient_set_coll_id numeric(10,0) DEFAULT nextval('qt_sq_qpr_pcid'::regclass) NOT NULL,
    result_instance_id numeric(5,0),
    set_index numeric(10,0),
    patient_num numeric(10,0)
);


ALTER TABLE i2b2demodata.qt_patient_set_collection OWNER TO i2b2demodata;

--
-- TOC entry 348 (class 1259 OID 25001)
-- Name: qt_sq_pqm_qmid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_sq_pqm_qmid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_sq_pqm_qmid OWNER TO i2b2demodata;

--
-- TOC entry 349 (class 1259 OID 25003)
-- Name: qt_pdo_query_master; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_pdo_query_master (
    query_master_id numeric(5,0) DEFAULT nextval('qt_sq_pqm_qmid'::regclass) NOT NULL,
    user_id character varying(50) NOT NULL,
    group_id character varying(50) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    request_xml text,
    i2b2_request_xml text
);


ALTER TABLE i2b2demodata.qt_pdo_query_master OWNER TO i2b2demodata;

--
-- TOC entry 350 (class 1259 OID 25010)
-- Name: qt_privilege; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_privilege (
    protection_label_cd character varying(1500),
    dataprot_cd character varying(1000),
    hivemgmt_cd character varying(1000),
    plugin_id numeric(10,0)
);


ALTER TABLE i2b2demodata.qt_privilege OWNER TO i2b2demodata;

--
-- TOC entry 351 (class 1259 OID 25016)
-- Name: qt_sq_qi_qiid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_sq_qi_qiid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_sq_qi_qiid OWNER TO i2b2demodata;

--
-- TOC entry 352 (class 1259 OID 25018)
-- Name: qt_query_instance; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_instance (
    query_instance_id numeric(5,0) DEFAULT nextval('qt_sq_qi_qiid'::regclass) NOT NULL,
    query_master_id numeric(5,0),
    user_id character varying(50) NOT NULL,
    group_id character varying(50) NOT NULL,
    batch_mode character varying(50),
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    delete_flag character varying(3),
    status_type_id numeric(5,0),
    message text
);


ALTER TABLE i2b2demodata.qt_query_instance OWNER TO i2b2demodata;

--
-- TOC entry 353 (class 1259 OID 25025)
-- Name: qt_sq_qm_qmid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_sq_qm_qmid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_sq_qm_qmid OWNER TO i2b2demodata;

--
-- TOC entry 354 (class 1259 OID 25027)
-- Name: qt_query_master; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_master (
    query_master_id numeric(5,0) DEFAULT nextval('qt_sq_qm_qmid'::regclass) NOT NULL,
    name character varying(250) NOT NULL,
    user_id character varying(50) NOT NULL,
    group_id character varying(50) NOT NULL,
    master_type_cd character varying(2000),
    plugin_id numeric(10,0),
    create_date timestamp without time zone NOT NULL,
    delete_date timestamp without time zone,
    delete_flag character varying(3),
    generated_sql text,
    request_xml text,
    i2b2_request_xml text
);


ALTER TABLE i2b2demodata.qt_query_master OWNER TO i2b2demodata;

--
-- TOC entry 355 (class 1259 OID 25034)
-- Name: qt_sq_qri_qriid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_sq_qri_qriid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_sq_qri_qriid OWNER TO i2b2demodata;

--
-- TOC entry 356 (class 1259 OID 25036)
-- Name: qt_query_result_instance; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_result_instance (
    result_instance_id numeric(5,0) DEFAULT nextval('qt_sq_qri_qriid'::regclass) NOT NULL,
    query_instance_id numeric(5,0),
    result_type_id numeric(3,0) NOT NULL,
    set_size numeric(10,0),
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    delete_flag character varying(3),
    status_type_id numeric(3,0) NOT NULL,
    message text,
    description character varying(200),
    real_set_size numeric(10,0),
    obfusc_method character varying(500)
);


ALTER TABLE i2b2demodata.qt_query_result_instance OWNER TO i2b2demodata;

--
-- TOC entry 357 (class 1259 OID 25043)
-- Name: qt_sq_qr_qrid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_sq_qr_qrid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_sq_qr_qrid OWNER TO i2b2demodata;

--
-- TOC entry 358 (class 1259 OID 25045)
-- Name: qt_query_result_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_result_type (
    result_type_id numeric(3,0) DEFAULT nextval('qt_sq_qr_qrid'::regclass) NOT NULL,
    name character varying(100),
    description character varying(200),
    display_type_id character varying(500),
    visual_attribute_type_id character varying(3)
);


ALTER TABLE i2b2demodata.qt_query_result_type OWNER TO i2b2demodata;

--
-- TOC entry 359 (class 1259 OID 25052)
-- Name: qt_sq_qs_qsid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_sq_qs_qsid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_sq_qs_qsid OWNER TO i2b2demodata;

--
-- TOC entry 360 (class 1259 OID 25054)
-- Name: qt_query_status_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_query_status_type (
    status_type_id numeric(3,0) DEFAULT nextval('qt_sq_qs_qsid'::regclass) NOT NULL,
    name character varying(100),
    description character varying(200)
);


ALTER TABLE i2b2demodata.qt_query_status_type OWNER TO i2b2demodata;

--
-- TOC entry 361 (class 1259 OID 25058)
-- Name: qt_sq_qxr_xrid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE qt_sq_qxr_xrid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_sq_qxr_xrid OWNER TO i2b2demodata;

--
-- TOC entry 362 (class 1259 OID 25060)
-- Name: qt_xml_result; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE qt_xml_result (
    xml_result_id numeric(5,0) DEFAULT nextval('qt_sq_qxr_xrid'::regclass) NOT NULL,
    result_instance_id numeric(5,0),
    xml_value character varying(4000)
);


ALTER TABLE i2b2demodata.qt_xml_result OWNER TO i2b2demodata;

--
-- TOC entry 363 (class 1259 OID 25067)
-- Name: sample_categories; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE sample_categories (
    trial_name character varying(100),
    tissue_type character varying(2000),
    data_types character varying(2000),
    disease character varying(2000),
    tissue_state character varying(2000),
    sample_id character varying(250),
    biobank character varying(3),
    source_organism character varying(255),
    treatment character varying(255),
    sample_treatment character varying(2000),
    subject_treatment character varying(2000),
    timepoint character varying(250)
);


ALTER TABLE i2b2demodata.sample_categories OWNER TO i2b2demodata;

--
-- TOC entry 364 (class 1259 OID 25073)
-- Name: seq_patient_num; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE seq_patient_num
    START WITH 1000000200
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.seq_patient_num OWNER TO i2b2demodata;

--
-- TOC entry 365 (class 1259 OID 25075)
-- Name: sq_up_patdim_patientnum; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE sq_up_patdim_patientnum
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i2b2demodata.sq_up_patdim_patientnum OWNER TO i2b2demodata;

--
-- TOC entry 366 (class 1259 OID 25077)
-- Name: set_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE set_type (
    id integer DEFAULT nextval('sq_up_patdim_patientnum'::regclass) NOT NULL,
    name character varying(500),
    create_date timestamp without time zone
);


ALTER TABLE i2b2demodata.set_type OWNER TO i2b2demodata;

--
-- TOC entry 367 (class 1259 OID 25084)
-- Name: set_upload_status; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE set_upload_status (
    upload_id numeric NOT NULL,
    set_type_id integer NOT NULL,
    source_cd character varying(50) NOT NULL,
    no_of_record numeric,
    loaded_record numeric,
    deleted_record numeric,
    load_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    load_status character varying(100),
    message text,
    input_file_name character varying(500),
    log_file_name character varying(500),
    transform_name character varying(500)
);


ALTER TABLE i2b2demodata.set_upload_status OWNER TO i2b2demodata;

--
-- TOC entry 368 (class 1259 OID 25090)
-- Name: source_master; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE source_master (
    source_cd character varying(50) NOT NULL,
    description character varying(300),
    create_date timestamp without time zone
);


ALTER TABLE i2b2demodata.source_master OWNER TO i2b2demodata;

--
-- TOC entry 369 (class 1259 OID 25093)
-- Name: sq_up_encdim_encounternum; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE sq_up_encdim_encounternum
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i2b2demodata.sq_up_encdim_encounternum OWNER TO i2b2demodata;

--
-- TOC entry 370 (class 1259 OID 25095)
-- Name: sq_uploadstatus_uploadid; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE sq_uploadstatus_uploadid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i2b2demodata.sq_uploadstatus_uploadid OWNER TO i2b2demodata;

--
-- TOC entry 371 (class 1259 OID 25097)
-- Name: upload_status; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE upload_status (
    upload_id numeric(38,0) DEFAULT nextval('sq_uploadstatus_uploadid'::regclass) NOT NULL,
    upload_label character varying(500) NOT NULL,
    user_id character varying(100) NOT NULL,
    source_cd character varying(50) NOT NULL,
    no_of_record numeric,
    loaded_record numeric,
    deleted_record numeric,
    load_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    load_status character varying(100),
    message text,
    input_file_name character varying(500),
    log_file_name character varying(500),
    transform_name character varying(500)
);


ALTER TABLE i2b2demodata.upload_status OWNER TO i2b2demodata;

--
-- TOC entry 372 (class 1259 OID 25104)
-- Name: visit_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE TABLE visit_dimension (
    encounter_num numeric(38,0) NOT NULL,
    patient_num numeric(38,0) NOT NULL,
    active_status_cd character varying(50),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    inout_cd character varying(50),
    location_cd character varying(50),
    location_path character varying(900),
    length_of_stay numeric(38,0),
    visit_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0)
);


ALTER TABLE i2b2demodata.visit_dimension OWNER TO i2b2demodata;

--
-- TOC entry 3898 (class 2606 OID 25883)
-- Name: analysis_plugin_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_analysis_plugin
    ADD CONSTRAINT analysis_plugin_pk PRIMARY KEY (plugin_id);


--
-- TOC entry 3901 (class 2606 OID 25885)
-- Name: analysis_plugin_result_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_analysis_plugin_result_type
    ADD CONSTRAINT analysis_plugin_result_pk PRIMARY KEY (plugin_id, result_type_id);


--
-- TOC entry 3861 (class 2606 OID 25887)
-- Name: code_lookup_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY code_lookup
    ADD CONSTRAINT code_lookup_pk PRIMARY KEY (table_cd, column_cd, code_cd);


--
-- TOC entry 3864 (class 2606 OID 25889)
-- Name: concept_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY concept_dimension
    ADD CONSTRAINT concept_dimension_pk PRIMARY KEY (concept_path);


--
-- TOC entry 3871 (class 2606 OID 25891)
-- Name: encounter_mapping_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY encounter_mapping
    ADD CONSTRAINT encounter_mapping_pk PRIMARY KEY (encounter_ide, encounter_ide_source);


--
-- TOC entry 3874 (class 2606 OID 25893)
-- Name: modifier_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY modifier_dimension
    ADD CONSTRAINT modifier_dimension_pk PRIMARY KEY (modifier_path);


--
-- TOC entry 3881 (class 2606 OID 25895)
-- Name: observation_fact_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY observation_fact
    ADD CONSTRAINT observation_fact_pkey PRIMARY KEY (patient_num, concept_cd, provider_id, modifier_cd);


--
-- TOC entry 3884 (class 2606 OID 25897)
-- Name: patient_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY patient_dimension
    ADD CONSTRAINT patient_dimension_pk PRIMARY KEY (patient_num);


--
-- TOC entry 3889 (class 2606 OID 25899)
-- Name: patient_mapping_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY patient_mapping
    ADD CONSTRAINT patient_mapping_pk PRIMARY KEY (patient_ide, patient_ide_source);


--
-- TOC entry 3930 (class 2606 OID 25901)
-- Name: pk_sourcemaster_sourcecd; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY source_master
    ADD CONSTRAINT pk_sourcemaster_sourcecd PRIMARY KEY (source_cd);


--
-- TOC entry 3926 (class 2606 OID 25903)
-- Name: pk_st_id; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY set_type
    ADD CONSTRAINT pk_st_id PRIMARY KEY (id);


--
-- TOC entry 3928 (class 2606 OID 25905)
-- Name: pk_up_upstatus_idsettypeid; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY set_upload_status
    ADD CONSTRAINT pk_up_upstatus_idsettypeid PRIMARY KEY (upload_id, set_type_id);


--
-- TOC entry 3932 (class 2606 OID 25907)
-- Name: pk_up_upstatus_uploadid; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY upload_status
    ADD CONSTRAINT pk_up_upstatus_uploadid PRIMARY KEY (upload_id);


--
-- TOC entry 3896 (class 2606 OID 25909)
-- Name: provider_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY provider_dimension
    ADD CONSTRAINT provider_dimension_pk PRIMARY KEY (provider_path, provider_id);


--
-- TOC entry 3903 (class 2606 OID 25911)
-- Name: qt_patient_enc_collection_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_patient_enc_collection
    ADD CONSTRAINT qt_patient_enc_collection_pkey PRIMARY KEY (patient_enc_coll_id);


--
-- TOC entry 3906 (class 2606 OID 25913)
-- Name: qt_patient_set_collection_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_patient_set_collection
    ADD CONSTRAINT qt_patient_set_collection_pkey PRIMARY KEY (patient_set_coll_id);


--
-- TOC entry 3909 (class 2606 OID 25915)
-- Name: qt_pdo_query_master_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_pdo_query_master
    ADD CONSTRAINT qt_pdo_query_master_pkey PRIMARY KEY (query_master_id);


--
-- TOC entry 3913 (class 2606 OID 25917)
-- Name: qt_query_instance_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_instance
    ADD CONSTRAINT qt_query_instance_pkey PRIMARY KEY (query_instance_id);


--
-- TOC entry 3916 (class 2606 OID 25919)
-- Name: qt_query_master_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_master
    ADD CONSTRAINT qt_query_master_pkey PRIMARY KEY (query_master_id);


--
-- TOC entry 3918 (class 2606 OID 25921)
-- Name: qt_query_result_instance_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_result_instance
    ADD CONSTRAINT qt_query_result_instance_pkey PRIMARY KEY (result_instance_id);


--
-- TOC entry 3920 (class 2606 OID 25923)
-- Name: qt_query_result_type_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_result_type
    ADD CONSTRAINT qt_query_result_type_pkey PRIMARY KEY (result_type_id);


--
-- TOC entry 3922 (class 2606 OID 25925)
-- Name: qt_query_status_type_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_query_status_type
    ADD CONSTRAINT qt_query_status_type_pkey PRIMARY KEY (status_type_id);


--
-- TOC entry 3924 (class 2606 OID 25927)
-- Name: qt_xml_result_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY qt_xml_result
    ADD CONSTRAINT qt_xml_result_pkey PRIMARY KEY (xml_result_id);


--
-- TOC entry 3936 (class 2606 OID 25929)
-- Name: visit_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

ALTER TABLE ONLY visit_dimension
    ADD CONSTRAINT visit_dimension_pk PRIMARY KEY (encounter_num, patient_num);


--
-- TOC entry 3862 (class 1259 OID 26127)
-- Name: cd_uploadid_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX cd_uploadid_idx ON concept_dimension USING btree (upload_id);


--
-- TOC entry 3858 (class 1259 OID 26128)
-- Name: cl_idx_name_char; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX cl_idx_name_char ON code_lookup USING btree (name_char);


--
-- TOC entry 3859 (class 1259 OID 26129)
-- Name: cl_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX cl_idx_uploadid ON code_lookup USING btree (upload_id);


--
-- TOC entry 3867 (class 1259 OID 26130)
-- Name: em_encnum_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX em_encnum_idx ON encounter_mapping USING btree (encounter_num);


--
-- TOC entry 3868 (class 1259 OID 26131)
-- Name: em_idx_encpath; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX em_idx_encpath ON encounter_mapping USING btree (encounter_ide, encounter_ide_source, patient_ide, patient_ide_source, encounter_num);


--
-- TOC entry 3869 (class 1259 OID 26132)
-- Name: em_uploadid_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX em_uploadid_idx ON encounter_mapping USING btree (upload_id);


--
-- TOC entry 3875 (class 1259 OID 26133)
-- Name: fact_cnpt_pat_enct_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX fact_cnpt_pat_enct_idx ON observation_fact USING btree (concept_cd, instance_num, patient_num, encounter_num);


--
-- TOC entry 3876 (class 1259 OID 26134)
-- Name: fact_nolob; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX fact_nolob ON observation_fact USING btree (patient_num, start_date, concept_cd, encounter_num, instance_num, nval_num, tval_char, valtype_cd, modifier_cd, valueflag_cd, provider_id, quantity_num, units_cd, end_date, location_cd, confidence_num, update_date, download_date, import_date, sourcesystem_cd, upload_id);


--
-- TOC entry 3877 (class 1259 OID 26135)
-- Name: fact_patcon_date_prvd_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX fact_patcon_date_prvd_idx ON observation_fact USING btree (patient_num, concept_cd, start_date, end_date, encounter_num, instance_num, provider_id, nval_num, valtype_cd);


--
-- TOC entry 3865 (class 1259 OID 26136)
-- Name: idx_concept_dim_1; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX idx_concept_dim_1 ON concept_dimension USING btree (concept_cd);


--
-- TOC entry 3866 (class 1259 OID 26137)
-- Name: idx_concept_dim_2; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX idx_concept_dim_2 ON concept_dimension USING btree (concept_path);


--
-- TOC entry 3878 (class 1259 OID 26138)
-- Name: idx_ob_fact_1; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX idx_ob_fact_1 ON observation_fact USING btree (concept_cd);


--
-- TOC entry 3879 (class 1259 OID 26139)
-- Name: idx_ob_fact_2; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX idx_ob_fact_2 ON observation_fact USING btree (concept_cd, patient_num, encounter_num);


--
-- TOC entry 3872 (class 1259 OID 26140)
-- Name: md_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX md_idx_uploadid ON modifier_dimension USING btree (upload_id);


--
-- TOC entry 3882 (class 1259 OID 26141)
-- Name: patd_uploadid_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX patd_uploadid_idx ON patient_dimension USING btree (upload_id);


--
-- TOC entry 3885 (class 1259 OID 26142)
-- Name: pd_idx_allpatientdim; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pd_idx_allpatientdim ON patient_dimension USING btree (patient_num, vital_status_cd, birth_date, death_date, sex_cd, age_in_years_num, language_cd, race_cd, marital_status_cd, religion_cd, zip_cd, income_cd);


--
-- TOC entry 3886 (class 1259 OID 26143)
-- Name: pd_idx_dates; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pd_idx_dates ON patient_dimension USING btree (patient_num, vital_status_cd, birth_date, death_date);


--
-- TOC entry 3893 (class 1259 OID 26144)
-- Name: pd_idx_name_char; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pd_idx_name_char ON provider_dimension USING btree (provider_id, name_char);


--
-- TOC entry 3887 (class 1259 OID 26145)
-- Name: pd_idx_statecityzip; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pd_idx_statecityzip ON patient_dimension USING btree (statecityzip_path, patient_num);


--
-- TOC entry 3857 (class 1259 OID 26146)
-- Name: pk_archive_obsfact; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pk_archive_obsfact ON archive_observation_fact USING btree (encounter_num, patient_num, concept_cd, provider_id, start_date, modifier_cd, archive_upload_id);


--
-- TOC entry 3890 (class 1259 OID 26147)
-- Name: pm_encpnum_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pm_encpnum_idx ON patient_mapping USING btree (patient_ide, patient_ide_source, patient_num);


--
-- TOC entry 3891 (class 1259 OID 26148)
-- Name: pm_patnum_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pm_patnum_idx ON patient_mapping USING btree (patient_num);


--
-- TOC entry 3892 (class 1259 OID 26149)
-- Name: pm_uploadid_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX pm_uploadid_idx ON patient_mapping USING btree (upload_id);


--
-- TOC entry 3894 (class 1259 OID 26150)
-- Name: prod_uploadid_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX prod_uploadid_idx ON provider_dimension USING btree (upload_id);


--
-- TOC entry 3899 (class 1259 OID 26151)
-- Name: qt_apnamevergrp_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_apnamevergrp_idx ON qt_analysis_plugin USING btree (plugin_name, version_cd, group_id);


--
-- TOC entry 3907 (class 1259 OID 26152)
-- Name: qt_idx_pqm_ugid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_pqm_ugid ON qt_pdo_query_master USING btree (user_id, group_id);


--
-- TOC entry 3910 (class 1259 OID 26153)
-- Name: qt_idx_qi_mstartid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_qi_mstartid ON qt_query_instance USING btree (query_master_id, start_date);


--
-- TOC entry 3911 (class 1259 OID 26154)
-- Name: qt_idx_qi_ugid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_qi_ugid ON qt_query_instance USING btree (user_id, group_id);


--
-- TOC entry 3914 (class 1259 OID 26155)
-- Name: qt_idx_qm_ugid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_qm_ugid ON qt_query_master USING btree (user_id, group_id, master_type_cd);


--
-- TOC entry 3904 (class 1259 OID 26156)
-- Name: qt_idx_qpsc_riid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX qt_idx_qpsc_riid ON qt_patient_set_collection USING btree (result_instance_id);


--
-- TOC entry 3933 (class 1259 OID 26157)
-- Name: vd_uploadid_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX vd_uploadid_idx ON visit_dimension USING btree (upload_id);


--
-- TOC entry 3934 (class 1259 OID 26158)
-- Name: visit_dim_pk; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE UNIQUE INDEX visit_dim_pk ON visit_dimension USING btree (patient_num, encounter_num);


--
-- TOC entry 3937 (class 1259 OID 26159)
-- Name: visitdim_en_pn_lp_io_sd_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX visitdim_en_pn_lp_io_sd_idx ON visit_dimension USING btree (encounter_num, patient_num, location_path, inout_cd, start_date);


--
-- TOC entry 3938 (class 1259 OID 26160)
-- Name: visitdim_std_edd_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata; Tablespace: 
--

CREATE INDEX visitdim_std_edd_idx ON visit_dimension USING btree (start_date, end_date);


--
-- TOC entry 3947 (class 2606 OID 26522)
-- Name: fk_up_set_type_id; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY set_upload_status
    ADD CONSTRAINT fk_up_set_type_id FOREIGN KEY (set_type_id) REFERENCES set_type(id);


--
-- TOC entry 3939 (class 2606 OID 26527)
-- Name: qt_fk_pesc_ri; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_patient_enc_collection
    ADD CONSTRAINT qt_fk_pesc_ri FOREIGN KEY (result_instance_id) REFERENCES qt_query_result_instance(result_instance_id);


--
-- TOC entry 3940 (class 2606 OID 26532)
-- Name: qt_fk_psc_ri; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_patient_set_collection
    ADD CONSTRAINT qt_fk_psc_ri FOREIGN KEY (result_instance_id) REFERENCES qt_query_result_instance(result_instance_id);


--
-- TOC entry 3941 (class 2606 OID 26537)
-- Name: qt_fk_qi_mid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_instance
    ADD CONSTRAINT qt_fk_qi_mid FOREIGN KEY (query_master_id) REFERENCES qt_query_master(query_master_id);


--
-- TOC entry 3942 (class 2606 OID 26542)
-- Name: qt_fk_qi_stid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_instance
    ADD CONSTRAINT qt_fk_qi_stid FOREIGN KEY (status_type_id) REFERENCES qt_query_status_type(status_type_id);


--
-- TOC entry 3943 (class 2606 OID 26547)
-- Name: qt_fk_qri_rid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_result_instance
    ADD CONSTRAINT qt_fk_qri_rid FOREIGN KEY (query_instance_id) REFERENCES qt_query_instance(query_instance_id);


--
-- TOC entry 3944 (class 2606 OID 26552)
-- Name: qt_fk_qri_rtid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_result_instance
    ADD CONSTRAINT qt_fk_qri_rtid FOREIGN KEY (result_type_id) REFERENCES qt_query_result_type(result_type_id);


--
-- TOC entry 3945 (class 2606 OID 26557)
-- Name: qt_fk_qri_stid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_query_result_instance
    ADD CONSTRAINT qt_fk_qri_stid FOREIGN KEY (status_type_id) REFERENCES qt_query_status_type(status_type_id);


--
-- TOC entry 3946 (class 2606 OID 26562)
-- Name: qt_fk_xmlr_riid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY qt_xml_result
    ADD CONSTRAINT qt_fk_xmlr_riid FOREIGN KEY (result_instance_id) REFERENCES qt_query_result_instance(result_instance_id);


-- Completed on 2013-07-23 16:44:41 BST

--
-- PostgreSQL database dump complete
--

