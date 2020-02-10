--https://docs.oracle.com/cd/F19136_01/jjdev/stored-procedures-runtime-contexts.html#GUID-3FD56429-9F6C-4323-B175-FCD484C367A5

create or replace and resolve java source named Mock
as
import com.ibm.icu.text.Transliterator;
public class Mock{
    public static String half2full(String s){
        return Transliterator.getInstance("Halfwidth-Fullwidth").transliterate(s);
    }
}
/

--data type mapping
--https://docs.oracle.com/cd/F19136_01/jjdev/defining-call-specifications.html#GUID-698850EA-53C0-42C3-84A3-9A590BB15123
create or replace function half2full(s varchar2)
return varchar2
as
    language java
    name 'Mock.half2full(java.lang.String) return java.lang.String';
/

with sub as(
    select
        grp
        ,row_number()over(partition by ceil(rownum/101) order by rownum) as subgrp
        ,unicode
        ,pre
        ,half2full(pre) as post
    from test_tbl
)select * from sub where subgrp<=5;

with sub as(
select
    level as dec
    ,base(level,16) as unicode
from dual
where level>=XXX2dec('FF01',16)
connect by level<=XXX2dec('FF94',16)
)select s2.grp,s2.unicode,dec4utf8(s2.utf8) as pre,half2full(dec4utf8(s2.utf8)) as post
from sub s1,table(unicode2utf8(s1.unicode)) s2
;
