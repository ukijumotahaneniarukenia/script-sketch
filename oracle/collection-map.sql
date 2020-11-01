drop type mp force;

drop type liz force;

create or replace type mp is object(ky clob,vl clob);

create or replace type liz is table of mp;


with sub as( select mod(level,2) as rn,lpad(row_number()over(partition by mod(level,2) order by level),3,0) as ky,chr(64+row_number()over(partition by mod(level,2) order by level)) as vl from dual connect by level <= 7 )select * from sub;


with sub as( select mod(level,2) as rn,lpad(row_number()over(partition by mod(level,2) order by level),3,0) as ky,chr(64+row_number()over(partition by mod(level,2) order by level)) as vl from dual connect by level <= 7 )select rn,mp(ky,vl) as mp from sub;


with sub as( select mod(level,2) as rn,lpad(row_number()over(partition by mod(level,2) order by level),3,0) as ky,chr(64+row_number()over(partition by mod(level,2) order by level)) as vl from dual connect by level <= 7 )select rn,cast(collect(mp(ky,vl)) as liz) as liz from sub group by rn;
