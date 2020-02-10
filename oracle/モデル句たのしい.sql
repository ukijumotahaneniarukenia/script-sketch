select *
from dual
model
dimension by (0 as x,0 as y)
measures(cast(null as varchar2(4000)) as rt)
rules iterate(4294967295) until(iteration_number>:n-1)(
    rt[iteration_number+1,for y from 1 to :n INCREMENT 1 ]=cv(x)||','||cv(y)
);

    select *
    from dual
    model
    dimension by (0 as x,0 as y)
    measures(cast(null as varchar2(4000)) as rt)
    rules iterate(4294967295) until(iteration_number>:n-1)(
        rt[iteration_number+1,for y from 1 to iteration_number+1 INCREMENT 1]=rt[cv(),cv()-1]||','||'{'||cv(x)||'/'||cv(y)||'}'
    )

