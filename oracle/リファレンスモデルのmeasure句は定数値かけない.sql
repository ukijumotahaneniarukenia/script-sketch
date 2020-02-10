with sub as(
    select level as lv from dual connect by level<=10
)
select *
from sub
model
  reference refmdl on(
    select level as lv from dual connect by level<=10
    )
    dimension by(lv)
    --measures(lv as lvv) ok
    measures(1 as lvv) ng
main sub
dimension by (lv)
measures(1 as dummy)
rules (
    dummy[lv]=max(refmdl.lv)over()
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
dimension by (1 as idx)
measures(1 as dummy)
rules (
    dummy[idx]=max(refmdl.lv)over()
  );
