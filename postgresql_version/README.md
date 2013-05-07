# tranSMART Postgres database dump

This dump includes some example GEO studies, which are also supplied
with the tranSMART GPL 1.0 GA release.

The dump is in a binary format for pg_restore, import with:

	pg_restore -c -C -O dump_4d6e6eb_db | psql

This should work for PostgreSQL 9.1 or higher.
