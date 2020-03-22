with rec(rn,str)as(select 1,"a" union all select s1.rn+1,s1.str||"a" from rec s1 where s1.rn+1<=5)select * from rec;
