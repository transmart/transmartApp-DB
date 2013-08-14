# tranSMART Postgres database dump
There are two dumps in here: one with GEO studies and one with i2b2 demodata.

psql of course has to have database write acces to import these dumps, so run
as postgres user, or configure pg_hba.conf to allow password access and supply `-U <user> -W`

## GEO studies

This dump includes some example GEO studies, which are also supplied
with the tranSMART GPL 1.0 GA release.

The dumps are in a binary format for pg_restore, import with:

	psql -f roles.sql | psql
	psql -f tablespaces.sql | psql
	pg_restore -c -C -O all_but_tm.dump | psql
	pg_restore -c -C -O tm_schema_only.dump | psql

## i2b2 demodata

This dump contains i2b2 demodata. Beware, tranSMART has at the moment
only limited support for handling this kind of data.

This dump is also used as a shortcut for the installer.
It has the same contents as results from the `postgresql`
scripts in the postgresMigrate branch of this repository.
The hash points to the corresponding commit.

	pg_restore -c -C -O dump_a3b340a_db | psql

The dump imports should work for PostgreSQL 9.1 or higher.
