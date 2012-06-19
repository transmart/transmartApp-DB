Prior to executing the scripts:
a. Create transmart database if does not exist
  
b. If TRANSMART and/or INDX tablespaces do not exist:
   In etl/prerequisites.sql, update the locations of the tablespaces to be created TRANSMART and INDX.  Verify that these directories exist with proper permissions.
   
Comment out the line(s) in etl/prerequisites.sql for the index creation(s) if they already exist.     

--------------------

The ETL schemas (tm_cz, tm_lz, tm_wz) can now be created thru the raw scripts. 

a.  In etl/start.sh, update the "pgbin" variable to the path where the psql executable file is on the server being run on
b.  From etl folder, execute the start.sh script
     sh ./start.sh


