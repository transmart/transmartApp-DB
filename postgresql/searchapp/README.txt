Prior to executing the scripts:
a. Create transmartdb database if does not exist 
b. In searchapp/prerequisites.sql, update the locations of the tablespace to be created SEARCH_APP.  Verify that these directories exist with proper permissions.  

The searchapp schema can be created thru either the dump file or the raw scripts. 

Using dump file:
a.  execute SQL in preqrequisites file by running script or running the commands manually
b.  execute pg_restore command:
     pg_restore -d transmart searchapp.pgdump.tar

OR 

Using scripts:
a.  In searchapp/start.sh, update the "pgbin" variable to the path where the psql executable file is on the server being run on
b.  From searchapp folder, execute the start.sh script
     sh ./start.sh

