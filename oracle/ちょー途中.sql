with sub as(
    select level as seq,chr(level+64) as item from dual connect by level<=:n
)
select *
from sub
model
dimension by (1 as grp,seq)
measures(item,item as rt)
rules iterate(3)(
    item[iteration_number+2,for seq from 1 to :n increment 1]=rt[iteration_number+1,cv()]
    ,rt[iteration_number+2,any]=nvl(rt[iteration_number+1,cv()+1],'')
--        ||case when item[iteration_number+1,cv(seq)]>item[iteration_number+1,cv(seq)] then item[iteration_number+1,cv(seq)] else '' end
)
--order by grp,item
--)
--where y=:n
--)select * from sub s1,table(s1.tgt)
;


SELECT * FROM dual
         model dimension BY (1 n, 1 r) 
               MEASURES (1 value, cast('1' AS VARCHAR2(200)) path)
               RULES iterate (5) (   -- 『レベル15まで』
                     value [iteration_number + 2, FOR r FROM 1 TO iteration_number + 2 INCREMENT 1] = 
                             nvl(value [iteration_number + 1, cv() - 1], 0)
                           + nvl(value [iteration_number + 1, cv()    ], 0)
                    ,path [iteration_number + 2, FOR r FROM 1 TO iteration_number + 2 INCREMENT 1] =nvl(value [iteration_number + 1, cv() - 1], 0)
                                        ||'+'
                                        ||nvl(value [iteration_number + 1, cv()    ], 0)
                           );


drop table test_tbl;
create table test_tbl as
select 1 as c1 from dual;

drop table test2_tbl;
create table test2_tbl as
select 2 as c2 from dual;

select *
from test2_tbl
model
  reference refmdl on(
    select c1 from test_tbl
    )
    dimension by(c1)
    measures(c1 as ss)
main test2_tbl
dimension by (1 as x)
measures(c2)
rules (
    c2[x]=max(refmdl.c1)over()
);

select *
from dual
model
  reference refmdl on(
    select c1 from test_tbl
    )
    dimension by(c1)
    measures(c1 as ss)
main dual
dimension by (1 as x)
measures(1 as dummy)
rules (
    dummy[x]=max(refmdl.c1)over()
);

select *
from dual
model
    reference refmdl on(
        select level as lv from dual connect by level<=10
    )
    dimension by(lv)
    measures(lv as lvv)
main dual
dimension by (1 as x)
measures(1 as rt)
rules ITERATE(10)(
    rt[iteration_number]=rt[cv()-1]||','||case when rt[cv()]<refmdl.lv then refmdl.lv[cv()] else null end
)
order by x
;
