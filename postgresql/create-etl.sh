pgbin=/opt/PostgreSQL/9.1/bin

PGOPTIONS='--client-min-messages=error' $pgbin/psql -U postgres -d transmart -f etl/start.sql --quiet
