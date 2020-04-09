select
    level as seq
    ,dense_rank()over(order by ceil(level/7)) as grp
    ,dense_rank()over(partition by ceil(level/7) order by ceil(level/3)) as subgrp
    ,row_number()over(partition by ceil(level/7), ceil(level/3) order by level) as grpseq
    ,to_char(row_number()over(partition by ceil(level/7), ceil(level/3) order by level) + sysdate,'yyyy-mm-dd') as dtm
    ,trunc(dbms_random.value(1,10)) as qty
    ,dbms_random.string('U',trunc(dbms_random.value(1,10))) as name
from dual connect by level<=15;
