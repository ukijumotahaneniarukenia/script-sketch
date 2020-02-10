create or replace procedure all_drop_obj as

    cursor csr is with sub as (
        select
            object_type
            , object_name
        from
            user_objects s1
        where
            exists (
                select
                    1
                from
                    user_objects s2
                where
                    s1.object_type = s2.object_type
            )
            and not exists (
                select
                    1
                from
                    user_objects s2
                where
                    s2.object_type = 'PROCEDURE'
                    and s2.object_name = 'ALL_DROP_OBJ'
                    and s1.object_type = s2.object_type
                    and s1.object_name = s2.object_name
            )
    ) select
        case
            when s1.object_type = 'JOB' then 'BEGIN DBMS_SCHEDULER.DROP_JOB('|| Q'Q'Q' || s1.object_name || Q'Q'Q' ||'); END;'
            when s1.object_type = 'CREDENTIAL' then 'BEGIN DBMS_SCHEDULER.DROP_CREDENTIAL('|| Q'Q'Q' || s1.object_name || Q'Q'Q' ||'); END;'
            else
                'DROP '
                || s1.object_type
                || ' '
                || s1.object_name
                ||
                    case
                        when s1.object_type = 'TABLE' then ' CASCADE CONSTRAINTS PURGE'
                        when s1.object_type in (
                            'SYNONYM'
                            , 'TYPE'
                        ) then ' FORCE'
                        else ''
                    end
        end as build_sql
      from
        sub s1;

    build_sql   clob;
begin
    build_sql := to_clob(' ');
    open csr;
    loop
        begin
            fetch csr into build_sql;
            exit when csr%notfound;
            dbms_output.put_line(build_sql);
            execute immediate build_sql;
            exception when others then dbms_output.put_line('[ '|| sqlcode||']'||sqlerrm);
        end;
    end loop;
    close csr;
end;
/

exec all_drop_obj;
/
