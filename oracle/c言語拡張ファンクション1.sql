CREATE OR REPLACE LIBRARY c_lib_nnn as '/opt/oracle/product/19c/dbhome_1/lib/myself/nnn.so';
/

create or replace function nnn
return CHARACTER
as
    LANGUAGE c
    LIBRARY c_lib_nnn
    NAME "nnn";
/

select nnn() from dual;

--https://blog.jiubao.org/2012/09/coracle.html
--https://docs.oracle.com/cd/E16338_01/appdev.112/b56259/adfns_externproc.htm#g1039222

--[oracle💚af009cfe1ee6 (水 12月 25 22:19:11) /opt/oracle/product/19c/dbhome_1/lib/myself]$cat nnn.c
--#include <stdlib.h>
--char *nnn(void) {
--    char *lang;
--    lang = getenv("LANG");
--    return lang;
--}
--[oracle💚af009cfe1ee6 (水 12月 25 22:18:43) /opt/oracle/product/19c/dbhome_1/lib/myself]$gcc -m64 -fPIC -c nnn.c
--[oracle💚af009cfe1ee6 (水 12月 25 22:18:45) /opt/oracle/product/19c/dbhome_1/lib/myself]$gcc -m64 -shared -o nnn.so nnn.o
