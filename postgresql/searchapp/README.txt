Prior to executing the scripts:
a. Create transmart database if does not exist 
b. Create user biomart_user if does not exist.  See biomart_user.sql script

c. In searchapp/prerequisites.sql, update the locations of the tablespace to be created SEARCH_APP.  Verify that these directories exist with proper permissions.  

The searchapp schema can be created thru the SQL scripts. 

Using scripts:
a.  In searchapp/start.sh, update the "pgbin" variable to the path where the psql executable file is on the server being run on
b.  From searchapp folder, execute the start.sh script
     sh ./start.sh

