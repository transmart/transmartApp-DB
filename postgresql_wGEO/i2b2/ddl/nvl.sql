create or replace function nvl(anyelement, anyelement) returns anyelement
as '
begin
    return coalesce($1,$2);
end;'
language 'plpgsql';

create or replace function nvl(bigint, integer) returns bigint
as '
begin
    return coalesce($1,$2);
end;'
language 'plpgsql';
