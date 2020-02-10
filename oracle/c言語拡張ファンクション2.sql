CREATE OR REPLACE LIBRARY c_lib_ppp as '/opt/oracle/product/19c/dbhome_1/lib/myself/ppp.so';
/

create or replace function ppp(s CHARACTER)
return CHARACTER
as
    LANGUAGE c
    LIBRARY c_lib_ppp
    NAME "ppp"
    PARAMETERS (s String);
/

select ppp('aaa') from dual;

--[oracle💚af009cfe1ee6 (水 12月 25 22:17:10) /opt/oracle/product/19c/dbhome_1/lib/myself]$cat ppp.c
--char *ppp(char *s) {
--  return s;
--}
--[oracle💚af009cfe1ee6 (水 12月 25 22:16:55) /opt/oracle/product/19c/dbhome_1/lib/myself]$gcc -m64 -fPIC -c ppp.c
--[oracle💚af009cfe1ee6 (水 12月 25 22:17:02) /opt/oracle/product/19c/dbhome_1/lib/myself]$gcc -m64 -shared -o ppp.so ppp.o
