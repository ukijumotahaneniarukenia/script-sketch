--https://docs.oracle.com/cd/F19136_01/jjdev/stored-procedures-runtime-contexts.html#GUID-3FD56429-9F6C-4323-B175-FCD484C367A5

create or replace and resolve java source named Mock
as
public class Mock{
    public static String nack() {
        return "nnn";
    }
}
/

create or replace function nack
return varchar2
as
    language java
    name 'Mock.nack() return java.lang.String';
/

select nack() from dual;