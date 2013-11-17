CREATE SEQUENCE i2b2metadata.seq_i2b2_tags_tag_id
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 20;

ALTER TABLE i2b2metadata.seq_i2b2_tags_tag_id OWNER TO i2b2metadata;

CREATE FUNCTION i2b2metadata.tf_trg_i2b2_tags_tag_id() 
    RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin      
    if NEW.TAG_ID is null 
    then          
        select nextval('i2b2metadata.seq_i2b2_tags_tag_id') into NEW.TAG_ID ;       
    end if; 
    RETURN NEW;  
end;
$$;

ALTER FUNCTION i2b2metadata.tf_trg_i2b2_tags_tag_id() OWNER TO i2b2metadata;

CREATE TRIGGER trg_i2b2_tags_tag_id 
BEFORE INSERT ON i2b2metadata.i2b2_tags FOR EACH ROW EXECUTE PROCEDURE i2b2metadata.tf_trg_i2b2_tags_tag_id();
