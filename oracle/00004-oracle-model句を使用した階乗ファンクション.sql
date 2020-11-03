create or replace function fct(n number)
return number
as
rt number;
begin
    select
        max(case when n in (0,1) or sign(n)<0 then 1 else r end)
        into rt
    from(
    select * from dual
             model dimension by (0 as idx)
                   measures (1 as r)
                   rules iterate (4294967295) until(iteration_number+2>n-1)(
                    r[iteration_number+2]=nvl(r[iteration_number+1],1)*(iteration_number+2)
                  )
    );
    return rt;
end;
/

select
    level as lv
    ,fct(level) as rt
from dual
connect by level<=10;


