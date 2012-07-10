pgbin=/opt/PostgreSQL/9.1/bin

$pgbin/psql -U postgres -d transmart -f create-main.sql --quiet