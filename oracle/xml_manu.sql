drop table test_order purge;
create table test_order as
select
    rownum as seq
    ,s0.item
    ,trunc(abs(dbms_random.value(10,100)),0) as prov_inst_qty
    ,s1.cust_id
    ,s2.arrive_date
from
    (select chr(level + 64) || '0001' as item from dual connect by level <= 2) s0
    ,(select 'c_000' || level as cust_id from dual connect by level <= 3) s1
    ,(select to_date(sysdate+level) as arrive_date from dual connect by level<=3 ) s2
;


--https://docs.oracle.com/cd/E16338_01/server.112/b56299/functions002.htm#CIHGFCGD
with sub as(
select XMLELEMENT("test_order", XMLFOREST(SEQ, ITEM, PROV_INST_QTY, CUST_ID, ARRIVE_DATE)) as dom
from test_order
)select dom,DELETEXML(dom,'/test_order/SEQ') from sub;

with sub as(
select SYS_DBURIGEN(SEQ, ITEM, PROV_INST_QTY, CUST_ID, ARRIVE_DATE)
from test_order
)select * from sub;


SELECT comp_name, status, substr(version,1,10) as version
FROM dba_registry;
