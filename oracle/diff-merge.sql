--対象データ

drop table src purge;
create table src as
select
  level as rn
  ,chr(level + 64) as str
from
  dual
connect by
  level <= 10;

drop table tgt purge;
create table tgt as
select
  level as rn
  ,chr(level + 64) as str
from
  dual
where
 level between 3 and 7
connect by
  level <= 10;
  
  

--確認sql

WITH src_minus_tgt AS (
  SELECT
    *
  FROM
    src
  MINUS
  SELECT
    *
  FROM
    tgt
), tgt_minus_src AS (
  SELECT
    *
  FROM
    tgt
  MINUS
  SELECT
    *
  FROM
    src
)
SELECT
  *
FROM
  src_minus_tgt
UNION ALL
SELECT
  *
FROM
  tgt_minus_src;
  
--パタン1

insert into tgt
select
  s1.*
from
  src s1
    left outer join tgt s2
      on
        s1.rn=s2.rn
where
  s2.rn is null
;
commit;


--パタン2
insert into tgt
select
  s1.*
from
  src s1
where
  not exists(
          select
            1
          from
            tgt s2
          where
            s1.rn=s2.rn
          )
;
commit;

--パタン3

merge into tgt
using(
      select
        s1.*
      from
        src s1
      where
        not exists(
                select
                  1
                from
                  tgt s2
                where
                  s1.rn=s2.rn
                )
      ) src
on(tgt.rn=src.rn)
when not matched then
insert values(src.rn,src.str)
;
commit;

--パタン4

merge into tgt
using(
      select
        s1.*
      from
        src s1
      minus
      select
        s2.*
      from
        tgt s2
      ) src
on(tgt.rn=src.rn)
when not matched then
insert values(src.rn,src.str)
;
commit;
