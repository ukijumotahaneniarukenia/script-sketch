--https://docs.oracle.com/cd/F19136_01/jjdev/stored-procedures-runtime-contexts.html#GUID-3FD56429-9F6C-4323-B175-FCD484C367A5

create or replace and resolve java source named Mock
as
import java.math.BigDecimal;
public class Mock{
    public static String nack(String s, BigDecimal n){
        return "args->"+"[String:"+s+"],[BigDecimal:"+n+"]";
    }
}
/

--data type mapping
--https://docs.oracle.com/cd/F19136_01/jjdev/defining-call-specifications.html#GUID-698850EA-53C0-42C3-84A3-9A590BB15123
create or replace function nack(s varchar2,n number)
return varchar2
as
    language java
    name 'Mock.nack(java.lang.String,java.math.BigDecimal) return java.lang.String';
/

select nack(chr(level+96),level) from dual connect by level<=5;