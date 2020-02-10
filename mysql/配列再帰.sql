set @rsv_args='[3, 4,{"a":[21,2,3]}]';
set @rsv_args='{"a":[21,2,3]}';

/*
drop function if exists array_json_table;
create function array_json_table(init_args json)
returns json deterministic
return(
*/

  with recursive rec(rn,tgt,expr,ele,done,rest)as(
    select 0
          ,@rsv_args
          ,json_array(null)
          ,@rsv_args
          ,@rsv_args
          ,@rsv_args
    union all
    select rn+1
          ,tgt
          ,case
            when 'OBJECT'=json_type(done) then json_keys(done) 
            when 'ARRAY'=json_type(done) then concat('[',rn,']')
          end
          ,case
            when 'OBJECT'=json_type(done) then json_extract(done,concat('$.',json_extract(json_keys(done),'$[0]')))
            when 'ARRAY'=json_type(done) then json_extract(done,concat('$[',rn,']'))
          end
          ,case
            when 'OBJECT'=json_type(done) then json_extract(done,concat('$.',json_extract(json_keys(done),'$[0]')))
            when 'ARRAY'=json_type(done) then json_extract(done,concat('$[',rn,']'))
          end
          ,json_replace(rest,case
            when 'OBJECT'=json_type(done) then json_extract(done,concat('$.',json_extract(json_keys(done),'$[0]')))
            when 'ARRAY'=json_type(done) then json_extract(done,concat('$[',rn,']'))
          end,json_array(null))
    from rec
    /*
    where rn+1<=json_depth(@rsv_args)+1
    */
    where rn+1<=3
  )
  select * from rec;
/*
  select
    json_arrayagg(s1.jele)
  from(
    select json_objectagg(rn,json_object(expr,ele))over(partition by rn order by rn) as jele from rec
  ) s1;
);
*/

select @rsv_args;
