-- none of these views compile

/*
CREATE OR REPLACE VIEW tm_cz.all_test_detail_view (run_id, test_id, run_name, tab, col, category, sub_category1, sub_category2, sql, start_date, end_date, status, test_severity_cd, act_record_cnt, min_value_allowed, max_value_allowed, error_code, error_message) AS SELECT 
  a.test_run_id RUN_ID,
  c.test_id,
  a.test_run_name RUN_NAME,
  c.test_table tab,
  c.test_column col,
  e.test_category CATEGORY,
  e.test_sub_category1 SUB_CATEGORY1,
  e.test_sub_category2 SUB_CATEGORY2,
  c.test_sql sql,
  to_char(b.start_date,'DD/MM/YYYY HH24:MI:SS') start_date,
  to_char(b.end_date,'DD/MM/YYYY HH24:MI:SS') end_date,
  b.status,
  c.test_severity_cd,
  d.act_record_cnt,
  c.test_min_value MIN_VALUE_ALLOWED,
  c.test_max_value MAX_VALUE_ALLOWED,
  d.return_code error_code,
  d.return_message error_message
 FROM tm_cz.az_test_run a
left outer join tm_cz.az_test_step_run b
  on a.test_run_id = b.test_run_id
join tm_cz.cz_test c
  on c.test_id = b.test_id
left outer join tm_cz.az_test_step_act_result d
  on d.test_step_run_id = b.test_step_run_id
join tm_cz.cz_test_category e
  on e.test_category_id = c.test_category_id
ORDER BY a.TEST_RUN_ID, c.test_table, c.test_column
 ;*/
 /*
CREATE OR REPLACE VIEW tm_cz.all_test_summary_view (test_run_id, test_run_name, start_date, end_date, status, test_category, test_sub_category1, test_sub_category2, pass, warning, fail, error, total, db_version) AS SELECT 
  a.test_run_id,
  a.test_run_name,
  to_char(a.start_date,'DD/MM/YYYY HH24:MI:SS') start_date,
  to_char(a.end_date,'DD/MM/YYYY HH24:MI:SS') end_date,
  a.status,
  d.test_category,
  d.test_sub_category1,
  D.test_sub_category2,
  sum(case when b.status = 'PASS' then 1
    else 0 end) PASS,
  sum(case when b.status = 'WARNING' then 1
    else 0 end) WARNING,
  sum(case when b.status = 'FAIL' then 1
    else 0 end) FAIL,
  sum(case when b.status = 'ERROR' then 1
    else 0 end) ERROR,
  count(b.status) TOTAL,
  c.version_name as DB_Version
 FROM tm_cz.az_test_run a
join tm_cz.az_test_step_run b
  on a.test_run_id = b.test_run_id
JOIN tm_cz.cz_dw_version C
  ON c.dw_version_id = a.dw_version_id
JOIN tm_cz.cz_test_category d
  ON d.test_category_id = a.test_category_id
group by
  a.test_run_id,
  a.test_run_name,
  to_char(a.start_date,'DD/MM/YYYY HH24:MI:SS'),
  to_char(a.end_date,'DD/MM/YYYY HH24:MI:SS'),
  a.status,
  d.test_category,
  d.test_sub_category1,
  d.test_sub_category2,
  c.version_name;
 */
 /*
CREATE OR REPLACE VIEW tm_cz.czv_pivot_sample_categories (trial_cd, sample_id, trial_name, pathology, race, tissue_type, gender, biomarker, access_type, institution, program_initiative, organism) AS SELECT  x.trial_cd
      ,x.sample_cd as sample_id			--	RDC tranSMART
	  ,x.trial_name
	  ,coalesce(x.pathology,'Not Applicable') as pathology
	  ,coalesce(x.race,'Not Applicable') as race
	  ,coalesce(x.tissue_type,'Not Applicable') as tissue_type
	  ,coalesce(x.gender,'Not Applicable') as gender
	  ,coalesce(x.biomarker,'Not Applicable') as biomarker
	  ,coalesce(x.access_type,'Not Applicable') as biomarker
	  ,coalesce(x.institution,'Not Applicable') as institution
	  ,coalesce(x.program_initiative,'Not Applicable') as program_initiative
	  ,coalesce(x.organism,'Not Applicable') as organism
 FROM 
	(select s.trial_cd
		   ,s.sample_cd
		   --,p.sourcesystem_cd as sample_cd
		   --,to_char(p.patient_num) as sample_cd
		   ,f.c_name as trial_name
		   ,max((CASE WHEN s.category_cd='PATHOLOGY' THEN s.category_value ELSE null END)) as PATHOLOGY
		   ,max((CASE WHEN s.category_cd='RACE' THEN s.category_value ELSE null END)) as RACE
		   ,max((CASE WHEN s.category_cd='TISSUE_TYPE' THEN s.category_value ELSE null END)) as TISSUE_TYPE
		   ,max((CASE WHEN s.category_cd='GENDER' THEN s.category_value ELSE null END)) as GENDER
		   ,max((CASE WHEN s.category_cd='BIOMARKER' THEN s.category_value ELSE null END)) as BIOMARKER
		   ,max((CASE WHEN s.category_cd='ACCESS' THEN s.category_value ELSE null END)) as ACCESS_TYPE
		   ,max((CASE WHEN s.category_cd='INSTITUTION' THEN s.category_value ELSE null END)) as INSTITUTION
		   ,max((CASE WHEN s.category_cd='PROGRAM/INITIATIVE' THEN s.category_value ELSE null END)) as PROGRAM_INITIATIVE
		   ,max((CASE WHEN s.category_cd='ORGANISM' THEN s.category_value ELSE null END)) as ORGANISM
	 from tm_lz.lz_src_sample_categories s
		,i2b2_metadata.i2b2 f		
		--,patient_dimension p
	 where s.trial_cd = f.sourcesystem_cd
	   and f.c_hlevel = (select min(x.c_hlevel) from i2b2 x
                         where f.sourcesystem_cd = x.sourcesystem_cd
						)
	   --and f.c_hlevel = 0 
	   --and p.sourcesystem_cd = 
		--	case when coalesce(s.sample_cd::text, '') = '' 
		--		 then regexp_replace(s.trial_cd || ':' || s.site_cd || ':' || s.subject_cd,'(::){1,}', ':')
		--	     else regexp_replace(s.trial_cd || 'S:' || s.site_cd || ':' || s.subject_cd || ':' || s.sample_cd,'(::){1,}', ':')
		--	end
	group by s.trial_cd
			,s.sample_cd
			--,p.sourcesystem_cd
			--,p.patient_num
			,f.c_name 
) x;
*/
/*
CREATE OR REPLACE VIEW tm_cz.last_test_detail_view (run_id, test_id, run_name, tab, col, category, sub_category1, sub_category2, sql, start_date, end_date, status, test_severity_cd, act_record_cnt, min_value_allowed, max_value_allowed, error_code, error_message) AS SELECT 
  a.test_run_id RUN_ID,
  c.test_id,
  a.test_run_name RUN_NAME,
  c.test_table tab,
  c.test_column col,
  e.test_category CATEGORY,
  e.test_sub_category1 SUB_CATEGORY1,
  e.test_sub_category2 SUB_CATEGORY2,
  c.test_sql sql,
  to_char(b.start_date,'DD/MM/YYYY HH24:MI:SS') start_date,
  to_char(b.end_date,'DD/MM/YYYY HH24:MI:SS') end_date,
  b.status,
  c.test_severity_cd,
  d.act_record_cnt,
  c.test_min_value MIN_VALUE_ALLOWED,
  c.test_max_value MAX_VALUE_ALLOWED,
  d.return_code error_code,
  d.return_message error_message
 FROM tm_cz.az_test_run a
left outer join tm_cz.az_test_step_run b
  on a.test_run_id = b.test_run_id
join tm_cz.cz_test c
  on c.test_id = b.test_id
left outer join tm_cz.az_test_step_act_result d
  on d.test_step_run_id = b.test_step_run_id
join tm_cz.cz_test_category e
  on e.test_category_id = c.test_category_id
WHERE A.TEST_RUN_ID = (select max(test_Run_id) from az_test_run)
ORDER BY a.TEST_RUN_ID, c.test_table, c.test_column
 ;
 */
 /*
CREATE OR REPLACE VIEW tm_cz.last_test_summary_view (test_run_id, test_run_name, start_date, end_date, status, test_category, test_sub_category1, test_sub_category2, pass, warning, fail, error, total, db_version) AS SELECT 
  a.test_run_id,
  a.test_run_name,
  to_char(a.start_date,'DD/MM/YYYY HH24:MI:SS') start_date,
  to_char(a.end_date,'DD/MM/YYYY HH24:MI:SS') end_date,
  a.status,
  d.test_category,
  d.test_sub_category1,
  D.test_sub_category2,
  sum(case when b.status = 'PASS' then 1
    else 0 end) PASS,
  sum(case when b.status = 'WARNING' then 1
    else 0 end) WARNING,
  sum(case when b.status = 'FAIL' then 1
    else 0 end) FAIL,
  sum(case when b.status = 'ERROR' then 1
    else 0 end) ERROR,
  count(b.status) TOTAL,
  c.version_name as DB_Version
 FROM tm_cz.az_test_run a
join tm_cz.az_test_step_run b
  on a.test_run_id = b.test_run_id
JOIN tm_cz.cz_dw_version C
  ON c.dw_version_id = a.dw_version_id
JOIN tm_cz.cz_test_category d
  ON d.test_category_id = a.test_category_id
WHERE a.test_run_id = (select max(test_run_id) from az_test_run)
group by
  a.test_run_id,
  a.test_run_name,
  to_char(a.start_date,'DD/MM/YYYY HH24:MI:SS'),
  to_char(a.end_date,'DD/MM/YYYY HH24:MI:SS'),
  a.status,
  d.test_category,
  d.test_sub_category1,
  d.test_sub_category2,
  c.version_name
 ;
*/
