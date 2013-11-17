create or replace function tm_cz.I2B2_LOAD_STUDY_METADATA
(
  currentJobID numeric default -1
)
returns numeric
AS $$
	--	NOTE****	The CleanCell macro must be run for all the data in Dataset_Explorer_MetaData.xls file before it is saved to a text file!!  CleanCell will remove
	--				any embedded line feeds in the data.

	-- JEA@20110720	New, cloned for tranSMART consortia

Declare  
	--Audit variables
	newJobFlag		integer;
	databaseName 	VARCHAR(100);
	procedureName 	VARCHAR(100);
	jobID 			numeric(18,0);
	stepCt 			numeric(18,0);
	rowCt			numeric(18,0);
	errorNumber		character varying;
	errorMessage	character varying;
	rtnCd			integer;
	tText			character varying;
	
	dcount 				integer;
	lcount 				integer;
	tmp_compound		character varying;
	tmp_disease			character varying;
	tmp_pubmed			character varying;
	pubmed_id			character varying;
	pubmed_title		character varying;

	sc record;
	sd record;
	sp record;

	
BEGIN
    
	--Set Audit Parameters
	newJobFlag := 0; -- False (Default)
	jobID := currentJobID;

	databaseName := 'TM_CZ';
	procedureName := 'I2B2_LOAD_STUDY_METADATA';

	--Audit JOB Initialization
	--If Job ID does not exist, then this is a single procedure run and we need to create it

	IF(jobID IS NULL or jobID < 1)
	THEN
		newJobFlag := 1; -- True
		select tm_cz.cz_start_audit (procedureName, databaseName) into jobID;
	END IF;
    	
	stepCt := 0;
	stepCt := stepCt + 1;
	tText := 'Start i2b2_load_study_metadata';
	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,tText,0,stepCt,'Done') into rtnCd;
  
 --	figure out study_type
  /* select sourcesystem_cd, c_fullname, parse_nth_value(c_fullname,2,'\') as study_type from i2b2
where c_hlevel = 0
order by c_fullname
*/

	--	Update existing bio_experiment data
	
	begin
	update biomart.bio_experiment b
	set (title
	    ,description
		,design
		,completion_date
		,primary_investigator
		,overall_design) =
	    (		m.title
		       ,m.description
			   ,m.design
			   ,case is_date(m.completion_date) when 1 then null else to_date(m.completion_date,'YYYYMMDD') end
			   ,m.primary_investigator
			   ,substr(case m.primary_end_points when null then '' when 'N/A' then '' else m.primary_end_points end ||
					    case m.inclusion_criteria when null then '' when 'N/A' then '' else ' Inclusion Criteria: ' || m.inclusion_criteria end ||
						case m.exclusion_criteria when null then '' when 'N/A' then '' else ' Exclusion Criteria: ' || m.exclusion_criteria end,1,2000)
		)
		 from lt_src_study_metadata m
		 where m.study_id is not null
		   and b.accession = m.study_id
		and exists
		(select 1 from lt_src_study_metadata x
		 where b.accession = x.study_id
		   and b.etl_id = 'METADATA:' || x.study_id
		   and x.study_id is not null)
	;
	exception
	when others then
		errorNumber := SQLSTATE;
		errorMessage := SQLERRM;
		--Handle errors.
		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
		--End Proc
		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
		return -16;
	end;
	get diagnostics rowCt := ROW_COUNT;
	
	stepCt := stepCt + 1;
	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Updated trial data in BIOMART bio_experiment',rowCt,stepCt,'Done') into rtnCd;

	
	--	Update existing bio_clinical_trial data only for true Clinical Trials or JnJ Experimental Medicine Studies
	begin
	update biomart.bio_clinical_trial b
	set study_owner = m.study_owner
	    ,study_phase = m.study_phase
		,blinding_procedure = m.blinding_procedure
		,studytype = m.studytype
		,duration_of_study_weeks = case is_numeric(m.duration_of_study_weeks) 
								when 1 then null else m.duration_of_study_weeks ::numeric end
		,number_of_patients = case is_numeric(m.number_of_patients) 
								when 1 then null else m.number_of_patients ::numeric end
		,number_of_sites = case is_numeric(m.number_of_sites) 
								when 1 then null else m.number_of_sites ::numeric end
		,route_of_administration = m.route_of_administration
		,dosing_regimen = m.dosing_regimen
		,group_assignment = m.group_assignment
		,type_of_control = m.type_of_control
		,completion_date = case is_date(m.completion_date)
								when 1 then null else to_date(m.completion_date,'YYYYMMDD') end
		,primary_end_points = m.primary_end_points
		,secondary_end_points = m.secondary_end_points
		,inclusion_criteria = m.inclusion_criteria
		,exclusion_criteria = m.exclusion_criteria
		,subjects = m.subjects
		,gender_restriction_mfb = m.gender_restriction_mfb
		,min_age = case is_numeric(m.min_age)
					when 1 then null else m.min_age ::numeric end
		,max_age = case is_numeric(m.min_age)
					when 1 then null else m.max_age ::numeric end
		,secondary_ids = m.secondary_ids
		,development_partner = m.development_partner
		,main_findings = m.main_findings
		,geo_platform = m.geo_platform
		--,platform_name
		,search_area = m.search_area
        from lt_src_study_metadata m
		 where m.study_id is not null
		   and b.trial_number = m.study_id
	;
	exception
	when others then
		errorNumber := SQLSTATE;
		errorMessage := SQLERRM;
		--Handle errors.
		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
		--End Proc
		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
		return -16;
	end;
	stepCt := stepCt + 1;
	get diagnostics rowCt := ROW_COUNT;
	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Updated trial data in BIOMART bio_clinical_trial',rowCt,stepCt,'Done') into rtnCd;
	
	
	--	Add new trial data to bio_experiment
	begin
	insert into biomart.bio_experiment
	(bio_experiment_type
	,title
	,description
	,design
	,start_date
	,completion_date
	,primary_investigator
	,contact_field
	,etl_id
	,status
	,overall_design
	,accession)
	select 'Experiment'
	      ,m.title
		  ,m.description
		  ,m.design
		  ,case is_date(m.start_date) when 1 then null else to_date(m.start_date,'YYYYMMDD') end
		  ,case is_date(m.completion_date) when 1 then null else to_date(m.completion_date,'YYYYMMDD') end
		  ,m.primary_investigator
		  ,m.contact_field
		  ,M.STUDY_ID
		  ,'METADATA:' || M.STUDY_ID -- commented by Eugr below
		  ,NULL/*decode(m.primary_end_points,null,null,'N/A',null,replace(m.primary_end_points,'"',null)) ||
					    decode(m.inclusion_criteria,null,null,'N/A',null,' Inclusion Criteria: ' || replace(m.inclusion_criteria,'"',null)) ||
						decode(m.exclusion_criteria,null,null,'N/A',null,' Exclusion Criteria: ' || replace(m.exclusion_criteria,'"',null))*/
		  ,m.study_id
	from lt_src_study_metadata m
	where m.study_id is not null
	  and not exists
	      (select 1 from biomart.bio_experiment x
		   where m.study_id = x.accession
		     and m.study_id is not null)
	;
	exception
	when others then
		errorNumber := SQLSTATE;
		errorMessage := SQLERRM;
		--Handle errors.
		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
		--End Proc
		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
		return -16;
	end;
	get diagnostics rowCt := ROW_COUNT;
	
	stepCt := stepCt + 1;
	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted trial data in BIOMART bio_experiment',rowCt,stepCt,'Done') into rtnCd;
	
	--	Add new trial data to bio_clinical_trial
	
	begin
	insert into biomart.bio_clinical_trial
	(trial_number
	,study_owner
	,study_phase
	,blinding_procedure
	,studytype
	,duration_of_study_weeks
	,number_of_patients
	,number_of_sites
	,route_of_administration
	,dosing_regimen
	,group_assignment
	,type_of_control
	,completion_date
	,primary_end_points
	,secondary_end_points
	,inclusion_criteria
	,exclusion_criteria
	,subjects
	,gender_restriction_mfb
	,min_age
	,max_age
	,secondary_ids
	,bio_experiment_id
	,development_partner
	,main_findings
	,geo_platform
	--,platform_name
	,search_area
	)
	select m.study_id
          ,m.study_owner
          ,m.study_phase
          ,m.blinding_procedure
          ,m.studytype
		  ,case is_numeric(m.duration_of_study_weeks) when 1 then null else m.duration_of_study_weeks ::numeric end
		  ,case is_numeric(m.number_of_patients) when 1 then null else m.number_of_patients ::numeric end
		  ,case is_numeric(m.number_of_sites) when 1 then null else m.number_of_sites ::numeric end
          ,m.route_of_administration
          ,m.dosing_regimen
          ,m.group_assignment
          ,m.type_of_control
          ,case is_date(m.completion_date) when 1 then null else to_date(m.completion_date,'YYYYMMDD') end
          ,m.primary_end_points
          ,m.secondary_end_points
          ,m.inclusion_criteria
          ,m.exclusion_criteria
          ,m.subjects
          ,m.gender_restriction_mfb
		  ,case is_numeric(m.min_age) when 1 then null else m.min_age ::numeric end
		  ,case is_numeric(m.max_age) when 1 then null else m.max_age ::numeric end
          ,m.secondary_ids
          ,b.bio_experiment_id
		  ,m.development_partner
		  ,m.main_findings
		  ,m.geo_platform
		  --,m.platform_name
		  ,m.search_area
	from lt_src_study_metadata m
	    ,biomart.bio_experiment b
	where m.study_id is not null
	  and m.study_id = b.accession
	  and not exists
	      (select 1 from biomart.bio_clinical_trial x
		   where m.study_id = x.trial_number);
	   	exception
	   	when others then
	   		errorNumber := SQLSTATE;
	   		errorMessage := SQLERRM;
	   		--Handle errors.
	   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
	   		--End Proc
	   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
	   		return -16;
	   	end;
	   	get diagnostics rowCt := ROW_COUNT;
	
	   	stepCt := stepCt + 1;
	   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted trial data in BIOMART bio_clinical_trial',rowCt,stepCt,'Done') into rtnCd;
		
		
	--	Insert new trial into bio_data_uid
	
	begin
	insert into biomart.bio_data_uid
	(bio_data_id
	,unique_id
	,bio_data_type
	)
	select distinct b.bio_experiment_id
	      ,'EXP:' || m.study_id
		  ,'EXP'
	from biomart.bio_experiment b
		,lt_src_study_metadata m
	where m.study_id is not null
	  and m.study_id = b.accession
	  and not exists
	      (select 1 from biomart.bio_data_uid x
		   where x.unique_id = 'EXP:' || m.study_id)
	;
   	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted trial data into BIOMART bio_data_uid',rowCt,stepCt,'Done') into rtnCd;
	
	--	delete existing compound data for study, compound list may change
	
	begin
	delete from bio_data_compound
	where bio_data_id = 
		 (select x.bio_experiment_id
		  from bio_experiment x
			  ,lt_src_study_metadata y
		  where x.accession = y.study_id
		    and x.etl_id = 'METADATA:' || y.study_id);

   	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Delete existing data from bio_data_compound',rowCt,stepCt,'Done') into rtnCd;
	

	for sc in 
	select distinct study_id, compound 
	from lt_src_study_metadata
	where compound is not null
	loop
		select length(sc.compound) - length(replace(sc.compound,';',null))+1 into dcount;
		while dcount > 0
		loop
			select parse_nth_value(sc.compound,dcount,';') into tmp_compound;
			
			--	add new compound
			
			begin
			insert into bio_compound 
			(generic_name)
			select tmp_compound
			where not exists
				 (select 1 from bio_compound x
				  where upper(x.generic_name) = upper(tmp_compound))
			  and tmp_compound is not null;
	     	exception
	     	when others then
	     		errorNumber := SQLSTATE;
	     		errorMessage := SQLERRM;
	     		--Handle errors.
	     		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
	     		--End Proc
	     		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
	     		return -16;
	     	end;
	     	get diagnostics rowCt := ROW_COUNT;

	     	stepCt := stepCt + 1;
	     	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Added compound to bio_compound',rowCt,stepCt,'Done') into rtnCd;
			
			--	Insert new trial data into bio_data_compound
			begin
			insert into bio_data_compound
			(bio_data_id
			,bio_compound_id
			,etl_source
			)
			select b.bio_experiment_id
				  ,c.bio_compound_id
				  ,'METADATA:' || sc.study_id
			from biomart.bio_experiment b
				,biomart.bio_compound c
			where upper(tmp_compound) = upper(c.generic_name) 
			  and tmp_compound is not null
			  and b.accession = sc.study_id
			  and not exists
					 (select 1 from biomart.bio_data_compound x
					  where b.bio_experiment_id = x.bio_data_id
						and c.bio_compound_id = x.bio_compound_id);

	     	exception
	     	when others then
	     		errorNumber := SQLSTATE;
	     		errorMessage := SQLERRM;
	     		--Handle errors.
	     		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
	     		--End Proc
	     		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
	     		return -16;
	     	end;
	     	get diagnostics rowCt := ROW_COUNT;

	     	stepCt := stepCt + 1;
	     	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted trial data in BIOMART bio_data_compound',rowCt,stepCt,'Done') into rtnCd;
						
			dcount := dcount - 1;
			
		end loop;
	end loop;
	

	--	delete existing disease data for studies
	
	begin
	delete from bio_data_disease
	where bio_data_id = 
		 (select x.bio_experiment_id
		  from bio_experiment x
			  ,lt_src_study_metadata y
		  where x.accession = y.study_id
		    and x.etl_id = 'METADATA:' || y.study_id);

 	exception
 	when others then
 		errorNumber := SQLSTATE;
 		errorMessage := SQLERRM;
 		--Handle errors.
 		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
 		--End Proc
 		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
 		return -16;
 	end;
 	get diagnostics rowCt := ROW_COUNT;

 	stepCt := stepCt + 1;
 	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Delete existing data from bio_data_disease',rowCt,stepCt,'Done') into rtnCd;
	

	for sd in 
	select distinct study_id, disease
	from lt_src_study_metadata
	where disease is not null
	loop
		select length(sd.disease) -
				   length(replace(sd.disease,';',null))+1
				into dcount;

		while dcount > 0
		loop
			select parse_nth_value(sd.disease,dcount,';') into tmp_disease;
			
			--	add new disease
			
			begin
			insert into bio_disease
			(disease
			,prefered_name)
			select tmp_disease
				  ,tmp_disease
			from dual
			where not exists
				 (select 1 from bio_disease x
				  where upper(x.disease) = upper(tmp_disease))
			  and tmp_compound is not null;
		   	exception
		   	when others then
		   		errorNumber := SQLSTATE;
		   		errorMessage := SQLERRM;
		   		--Handle errors.
		   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
		   		--End Proc
		   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
		   		return -16;
		   	end;
		   	get diagnostics rowCt := ROW_COUNT;

		   	stepCt := stepCt + 1;
		   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Added disease to bio_disease',rowCt,stepCt,'Done') into rtnCd;
						
			--	Insert new trial data into bio_data_disease

			begin
			insert into bio_data_disease
			(bio_data_id
			,bio_disease_id
			,etl_source
			)
			select b.bio_experiment_id
				  ,c.bio_disease_id
				  ,'METADATA:' || sd.study_id
			from biomart.bio_experiment b
				,biomart.bio_disease c
			where upper(tmp_disease) = upper(c.disease) 
			  and tmp_disease is not null
			  and b.accession = sd.study_id
			  and not exists
					 (select 1 from biomart.bio_data_disease x
					  where b.bio_experiment_id = x.bio_data_id
						and c.bio_disease_id = x.bio_disease_id);

		   	exception
		   	when others then
		   		errorNumber := SQLSTATE;
		   		errorMessage := SQLERRM;
		   		--Handle errors.
		   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
		   		--End Proc
		   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
		   		return -16;
		   	end;
		   	get diagnostics rowCt := ROW_COUNT;

		   	stepCt := stepCt + 1;
		   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted trial data in BIOMART bio_data_disease',rowCt,stepCt,'Done') into rtnCd;
			
			dcount := dcount - 1;

		end loop;
	end loop;
	
	--	add ncbi/GEO linking
	
	--	check if ncbi exists in bio_content_repository, if not, add
	
	select count(*) into dcount
	from bio_content_repository
	where repository_type = 'NCBI'
	  and location_type = 'URL';
	
	if dcount = 0 then
		begin
		insert into bio_content_repository
		(location
		,active_y_n
		,repository_type
		,location_type) 
		values ('http://www.ncbi.nlm.nih.gov/','Y','NCBI','URL');
		exception
	   	when others then
	   		errorNumber := SQLSTATE;
	   		errorMessage := SQLERRM;
	   		--Handle errors.
	   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
	   		--End Proc
	   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
	   		return -16;
	   	end;
	   	get diagnostics rowCt := ROW_COUNT;

	   	stepCt := stepCt + 1;
	   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted NCBI URL in bio_content_repository',rowCt,stepCt,'Done') into rtnCd;		
	end if;

	
	--	insert GSE studies into bio_content
	
	begin
	insert into bio_content
	(repository_id
	,location
	,file_type
	,etl_id_c
	)
	select bcr.bio_content_repo_id
		  ,'geo/query/acc.cgi?acc=' || m.study_id
		  ,'Experiment Web Link'
		  ,'METADATA:' || m.study_id
	from lt_src_study_metadata m
		,bio_content_repository bcr
	where m.study_id like 'GSE%'
	  and bcr.repository_type = 'NCBI'
	  and bcr.location_type = 'URL'
	  and not exists
		 (select 1 from bio_content x
		  where x.etl_id_c like '%' || m.study_id || '%'
		    and x.file_type = 'Experiment Web Link'
			and x.location = 'geo/query/acc.cgi?acc=' || m.study_id);
	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted GEO study into bio_content',rowCt,stepCt,'Done') into rtnCd;		
	
	--	insert GSE studies into bio_content_reference
	
	begin
	insert into bio_content_reference
	(bio_content_id
	,bio_data_id
	,content_reference_type
	,etl_id_c
	)
	select bc.bio_file_content_id
		  ,be.bio_experiment_id
		  ,'Experiment Web Link'
		  ,'METADATA:' || m.study_id
	from lt_src_study_metadata m
		,bio_experiment be
		,bio_content bc
	where m.study_id like 'GSE%'
	  and m.study_id = be.accession
	  and bc.file_type = 'Experiment Web Link'
	  and bc.etl_id_c = 'METADATA:' || m.study_id
	  and bc.location = 'geo/query/acc.cgi?acc=' || m.study_id
	  and not exists
		 (select 1 from bio_content_reference x
		  where bc.bio_file_content_id = x.bio_content_id
		    and be.bio_experiment_id = x.bio_data_id);

	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted GEO study into bio_content_reference',rowCt,stepCt,'Done') into rtnCd;	

	--	add PUBMED linking
	
--	check if PubMed url exists in bio_content_repository, if not, add
	select count(*) into dcount
	from bio_content_repository
	where repository_type = 'PubMed';	

	if dcount = 0 then
		begin
		insert into bio_content_repository
		(location
		,active_y_n
		,repository_type
		,location_type) 
		values ('http://www.ncbi.nlm.nih.gov/pubmed/','Y','PubMed','URL');
		exception
	   	when others then
	   		errorNumber := SQLSTATE;
	   		errorMessage := SQLERRM;
	   		--Handle errors.
	   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
	   		--End Proc
	   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
	   		return -16;
	   	end;
	   	get diagnostics rowCt := ROW_COUNT;

	   	stepCt := stepCt + 1;
	   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted GEO study into bio_content_reference',rowCt,stepCt,'Done') into rtnCd;
	end if;

	for sp in select distinct study_id, pubmed_ids
	from lt_src_study_metadata
	where pubmed_ids is not null
	loop

		select length(sp.pubmed)-length(replace(sp.pubmed,';',null))+1
		into dcount;

		while dcount > 0
		Loop	
			-- multiple pubmed id can be separated by ;, pubmed id and title are separated by :
			
			select parse_nth_value(sp.pubmed,dcount,';') into tmp_pubmed;			
			select instr(tmp_pubmed,':') into lcount;
			
			if lcount = 0 then
				pubmed_id := tmp_pubmed;
				pubmed_title := null;
			else
				pubmed_id := substr(tmp_pubmed,1,instr(tmp_pubmed,':')-1);
				select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'pubmed_id:' || coalesce(pubmed_id, ''),1,stepCt,'Done') into rtnCd;
				pubmed_title := substr(tmp_pubmed,instr(tmp_pubmed,':')+1);
				select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'pubmed_title:' || coalesce(pubmed_title, ''),1,stepCt,'Done') into rtnCd;
			end if;

			begin
			insert into bio_content
			(repository_id
			,location
			,title
			,file_type
			,etl_id_c
			)
			select bcr.bio_content_repo_id
				  ,pubmed_id
				  ,pubmed_title
				  ,'Publication Web Link'
				  ,'METADATA:' || sp.study_id
			from bio_content_repository bcr
			where bcr.repository_type = 'PubMed'
			  and not exists
				 (select 1 from bio_content x
				  where x.etl_id_c like '%' || sp.study_id || '%'
				    and x.file_type = 'Publication Web Link'
					and x.location = pubmed_id);

			exception
		   	when others then
		   		errorNumber := SQLSTATE;
		   		errorMessage := SQLERRM;
		   		--Handle errors.
		   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
		   		--End Proc
		   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
		   		return -16;
		   	end;
		   	get diagnostics rowCt := ROW_COUNT;

		   	stepCt := stepCt + 1;
		   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted pubmed for study into bio_content',rowCt,stepCt,'Done') into rtnCd;			
	
			begin
			insert into bio_content_reference
			(bio_content_id
			,bio_data_id
			,content_reference_type
			,etl_id_c
			)
			select bc.bio_file_content_id
				  ,be.bio_experiment_id
				  ,'Publication Web Link'
				  ,'METADATA:' || sp.study_id
			from bio_experiment be
				,bio_content bc
			where be.accession = sp.study_id
			  and bc.file_type = 'Publication Web Link'
			  and bc.etl_id_c = 'METADATA:' || sp.study_id
			  and bc.location = pubmed_id
			  and not exists
				 (select 1 from bio_content_reference x
				  where bc.bio_file_content_id = x.bio_content_id
					and be.bio_experiment_id = x.bio_data_id);	

			exception
		   	when others then
		   		errorNumber := SQLSTATE;
		   		errorMessage := SQLERRM;
		   		--Handle errors.
		   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
		   		--End Proc
		   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
		   		return -16;
		   	end;
		   	get diagnostics rowCt := ROW_COUNT;

		   	stepCt := stepCt + 1;
		   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Inserted pubmed for study into bio_content_reference',rowCt,stepCt,'Done') into rtnCd;				

			dcount := dcount - 1;
		end loop;
	end loop;
	
		--	Create i2b2_tags

	begin
	delete from i2b2_tags
	where upper(tag_type) = 'Trial';
	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Delete existing Trial tags in i2b2_tags',rowCt,stepCt,'Done') into rtnCd;
	
	begin
	insert into i2b2_tags
	(path, tag, tag_type, tags_idx)
	select min(b.c_fullname) as path
		  ,be.accession as tag
		  ,'Trial' as tag_type
		  ,1 as tags_idx
	from bio_experiment be
		,i2b2 b
	where be.accession = b.sourcesystem_cd
	group by be.accession;
	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'DAdd Trial tags in i2b2_tags',rowCt,stepCt,'Done') into rtnCd;
					 
	--	Insert trial data tags - COMPOUND
	
	begin
	delete from i2b2_tags t
	where upper(t.tag_type) = 'COMPOUND';
	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Delete existing Compound tags in I2B2METADATA i2b2_tags',rowCt,stepCt,'Done') into rtnCd;
	

	begin
	insert into i2b2_tags
	(path, tag, tag_type, tags_idx)
	select distinct min(o.c_fullname) as path
		  ,case x.rec_num when 1 then c.generic_name else c.brand_name end as tag
		  ,'Compound' as tag_type
		  ,2 as tags_idx
	from bio_experiment be
		,bio_data_compound bc
		,bio_compound c
		,i2b2 o
		,(select rec_num from generate_series(1,2) rec_num) x
	where be.bio_experiment_id = bc.bio_data_id
       and bc.bio_compound_id = c.bio_compound_id
       and be.accession = o.sourcesystem_cd
       and case x.rec_num when 1 then c.generic_name else c.brand_name end is not null
	group by case x.rec_num when 1 then c.generic_name else c.brand_name end;
	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Insert Compound tags in I2B2METADATA i2b2_tags',rowCt,stepCt,'Done') into rtnCd;

					 
	--	Insert trial data tags - DISEASE
	
	begin
	delete from i2b2_tags t
	where upper(t.tag_type) = 'DISEASE';
	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Delete existing DISEASE tags in I2B2METADATA i2b2_tags',rowCt,stepCt,'Done') into rtnCd;


	begin	
	insert into i2b2_tags
	(path, tag, tag_type, tags_idx)
	select distinct min(o.c_fullname) as path
		   ,c.prefered_name
		   ,'Disease' as tag_type
		   ,3 as tags_idx
	from bio_experiment be
		,bio_data_disease bc
		,bio_disease c
		,i2b2 o
      --,(select rownum as rec_num from table_access where rownum < 3) x
	where be.bio_experiment_id = bc.bio_data_id
      and bc.bio_disease_id = c.bio_disease_id
      and be.accession = o.sourcesystem_cd
    --and decode(x.rec_num,1,c.generic_name,c.brand_name) is not null
	group by c.prefered_name;
	exception
   	when others then
   		errorNumber := SQLSTATE;
   		errorMessage := SQLERRM;
   		--Handle errors.
   		select tm_cz.cz_error_handler (jobID, procedureName, errorNumber, errorMessage) into rtnCd;
   		--End Proc
   		select tm_cz.cz_end_audit (jobID, 'FAIL') into rtnCd;
   		return -16;
   	end;
   	get diagnostics rowCt := ROW_COUNT;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'Insert Disease tags in I2B2METADATA i2b2_tags',rowCt,stepCt,'Done') into rtnCd;

   	stepCt := stepCt + 1;
   	select tm_cz.cz_write_audit(jobId,databaseName,procedureName,'End i2b2_load_study_metadata',1,stepCt,'Done') into rtnCd;
	
	
	---Cleanup OVERALL JOB if this proc is being run standalone
	IF newJobFlag = 1
	THEN
		select tm_cz.cz_end_audit (jobID, 'SUCCESS') into rtnCd;
	END IF;

	return 1;
	
END;


/*	ignore for now
	--	Add trial/study to search_secure_object
	
	insert into searchapp.search_secure_object
	(bio_data_id
	,display_name
	,data_type
	,bio_data_unique_id
	)
	select b.bio_experiment_id
	      ,parse_nth_value(md.c_fullname,2,'\') || ' - ' || b.accession as display_name
		  ,'BIO_CLINICAL_TRIAL' as data_type
		  ,'EXP:' || b.accession as bio_data_unique_id
	from i2b2metadata.i2b2 md
		,biomart.bio_experiment b
	where b.accession = md.sourcesystem_cd
	  and md.c_hlevel = 0
	  and md.c_fullname not like '\Public Studies\%'
	  and md.c_fullname not like '\Internal Studies\%'
	  and md.c_fullname not like '\Experimental Medicine Study\NORMALS\%'
	  and not exists
		 (select 1 from searchapp.search_secure_object so
		  where b.bio_experiment_id = so.bio_data_id)
	;
	stepCt := stepCt + 1;
	cz_write_audit(jobId,databaseName,procedureName,'Inserted new trial/study into SEARCHAPP search_secure_object',SQL%ROWCOUNT,stepCt,'Done');
	commit;
*/


/*	not used	
	--	Insert WORKFLOW tags
	
	delete from i2b2_tags
	where tag_type = 'WORKFLOW';
	stepCt := stepCt + 1;
	cz_write_audit(jobId,databaseName,procedureName,'Delete existing trial WORKFLOW in I2B2METADATA i2b2_tags',SQL%ROWCOUNT,stepCt,'Done');
	commit;	
	
	insert into i2b2_tags
	(path
	,tag_type
	,tag
	)
	select distinct b.c_fullname
		  ,'WORKFLOW'
		  ,decode(d.platform,'MRNA_AFFYMETRIX','Gene Expression','RBM','RBM','Protein','Protein',null) as tag
	from deapp.de_subject_sample_mapping d
		,i2b2 b
	where d.platform is not null
	  and d.trial_name = b.sourcesystem_cd
	  and b.c_hlevel = 0
	  and b.c_fullname not like '%Across Trials%';
	stepCt := stepCt + 1;
	cz_write_audit(jobId,databaseName,procedureName,'Inserted heatmap WORKFLOW in I2B2METADATA i2b2_tags',SQL%ROWCOUNT,stepCt,'Done');
	commit;	

	insert into i2b2_tags
	(path
	,tag_type
	,tag
	)
	select distinct c.c_fullname
		  ,'WORKFLOW'
		  ,'SNP'
	from deapp.de_snp_data_by_patient snp
	,i2b2 c
	where snp.trial_name = c.sourcesystem_cd
	  and c.c_hlevel = 0;
	stepCt := stepCt + 1;
	cz_write_audit(jobId,databaseName,procedureName,'Inserted SNP WORKFLOW in I2B2METADATA i2b2_tags',SQL%ROWCOUNT,stepCt,'Done');
	commit;		
*/

$$ LANGUAGE plpgsql
security definer 
-- set a secure search_path: trusted schema(s), then pg_temp
set search_path=tm_cz, tm_lz, tm_wz, biomart, i2b2demodata, i2b2metadata, deapp, pg_temp;
