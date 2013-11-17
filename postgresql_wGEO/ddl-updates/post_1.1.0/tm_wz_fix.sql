DROP TABLE tm_wz.tm_wz.wt_subject_mrna_data;
DROP TABLE tm_wz.wt_subject_microarray_med;
DROP TABLE tm_wz.wt_subject_microarray_calcs;
DROP TABLE tm_wz.wt_subject_microarray_logs;

CREATE TABLE tm_wz.wt_subject_mrna_data (
	probeset varchar(500),
	expr_id varchar(500),
	intensity_value numeric,
	assay_id bigint,
	patient_id bigint,
	sample_id bigint,
	subject_id varchar(100),
	trial_name varchar(200),
	timepoint varchar(200),
	sample_type varchar(200),
	platform varchar(200),
	tissue_type varchar(200)
);
ALTER TABLE tm_wz.wt_subject_mrna_data OWNER TO tm_wz;

CREATE TABLE tm_wz.wt_subject_microarray_med (
	probeset_id bigint,
	intensity_value numeric,
	log_intensity numeric,
	assay_id bigint,
	patient_id bigint,
	sample_id bigint,
	subject_id varchar(50),
	trial_name varchar(50),
	timepoint varchar(100),
	pvalue numeric,
	num_calls numeric,
	mean_intensity numeric,
	stddev_intensity numeric,
	median_intensity numeric,
	zscore numeric
);
ALTER TABLE tm_wz.wt_subject_microarray_med OWNER TO tm_wz;

CREATE TABLE tm_wz.wt_subject_microarray_calcs (
	trial_name varchar(50),
	probeset_id bigint,
	mean_intensity numeric,
	median_intensity numeric,
	stddev_intensity numeric
);
ALTER TABLE tm_wz.wt_subject_microarray_calcs OWNER TO tm_wz;
CREATE INDEX wt_subject_mrna_calcs_i1 ON tm_wz.wt_subject_microarray_calcs (trial_name,probeset_id);

CREATE TABLE tm_wz.wt_subject_microarray_logs (
	probeset_id bigint,
	intensity_value numeric,
	pvalue numeric,
	num_calls numeric,
	assay_id bigint,
	patient_id bigint,
	sample_id bigint,
	subject_id varchar(50),
	trial_name varchar(50),
	timepoint varchar(100),
	log_intensity numeric,
	raw_intensity numeric
);
ALTER TABLE tm_wz.wt_subject_microarray_logs OWNER TO tm_wz;
CREATE INDEX wt_subject_mrna_logs_i1 ON tm_wz.wt_subject_microarray_logs (trial_name,probeset_id);


