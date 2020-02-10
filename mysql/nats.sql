drop function if exists nats;
create function nats(start_rn bigint,end_rn bigint)
returns json deterministic
return(
  with recursive rec(n)as(
    select start_rn
    union all
    select n + 1 from rec where n < end_rn
  )select
    json_arrayagg(s1.jele)
  from(
       select json_objectagg("key",s1.n)over(order by s1.n) as jele from rec s1
  )s1
);
