with sub as(
select level as lv from dual connect by level<=10
)
select *
from sub
model
  reference refmdl on(
    with subb as(
        select level as lv from dual connect by level<=10
    )
    select lv from subb
    )
    dimension by(lv)
    measures(lv as ss)
main sub
dimension by (lv)
measures(1 as dummy)
rules (
    dummy[lv]=max(refmdl.lv)over()
);
