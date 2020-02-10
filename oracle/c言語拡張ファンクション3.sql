CREATE OR REPLACE LIBRARY c_lib_lll as '/opt/oracle/product/19c/dbhome_1/lib/myself/lll.so';
/

create or replace function lll(x PLS_INTEGER,y PLS_INTEGER)
return PLS_INTEGER
as
    LANGUAGE c
    LIBRARY c_lib_lll
    NAME "lll"
    PARAMETERS (x int,y int);
/

select lll(level,level+10) from dual connect by level<=10;
--
--[oracle💚af009cfe1ee6 (水 12月 25 22:14:46) /opt/oracle/product/19c/dbhome_1/lib/myself]$cat lll.c
--int lll(int x, int y) {
--  return x + y;
--}
--[oracle💚af009cfe1ee6 (水 12月 25 22:15:31) /opt/oracle/product/19c/dbhome_1/lib/myself]$gcc -m64 -fPIC -c lll.c
--[oracle💚af009cfe1ee6 (水 12月 25 22:15:33) /opt/oracle/product/19c/dbhome_1/lib/myself]$gcc -m64 -shared -o lll.so lll.o

--[oracle💚af009cfe1ee6 (水 12月 25 22:15:34) /opt/oracle/product/19c/dbhome_1/lib/myself]$cat $ORACLE_HOME/hs/admin/extproc.ora
--SET EXTPROC_DLLS=/opt/oracle/product/19c/dbhome_1/lib/myself/nnn.so:/opt/oracle/product/19c/dbhome_1/lib/myself/ppp.so:/opt/oracle/product/19c/dbhome_1/lib/myself/lll.so
