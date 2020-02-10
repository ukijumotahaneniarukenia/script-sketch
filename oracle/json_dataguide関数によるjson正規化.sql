DROP TABLE test_tbl PURGE;
/

CREATE TABLE test_tbl (
  id    RAW(16) NOT NULL,
  data  CLOB
);
/

INSERT INTO test_tbl (id, data)
VALUES (SYS_GUID(),
        '{
          "FirstName"      : "John",
          "LastName"       : "Doe",
          "Job"            : "Clerk",
          "Address"        : {
                              "Street"   : "99 My Street",
                              "City"     : "My City",
                              "Country"  : "UK",
                              "Postcode" : "A12 34B"
                             },
          "ContactDetails" : {
                              "Email"    : "john.doe@example.com",
                              "Phone"    : "44 123 123456",
                              "Twitter"  : "@johndoe"
                             },
          "DateOfBirth"    : "01-JAN-1980",
          "Active"         : true
         }');
/

INSERT INTO test_tbl (id, data)
VALUES (SYS_GUID(),
        '{
          "FirstName"      : "Jayne",
          "LastName"       : "Doe",
          "Job"            : "Manager",
          "Address"        : {
                              "Street"   : "100 My Street",
                              "City"     : "My City",
                              "Country"  : "UK",
                              "Postcode" : "A12 34B"
                             },
          "ContactDetails" : {
                              "Email"    : "jayne.doe@example.com",
                              "Phone"    : ""
                             },
          "DateOfBirth"    : "01-JAN-1982",
          "Active"         : false
         }');
/
commit;

with summary as(
    select id,json_dataguide(data) as agg_jjj from test_tbl group by id
),detail as(
    select id,data from test_tbl
),src as(
    select
        s1.id
        ,s3.pth
        ,s3.typ
        ,'select id,json_value(data,'||''''||s3.pth||''''||') as ele from test_tbl' as build_sql
    from summary s1
        ,detail s2
        ,json_table(
            s1.agg_jjj,'$[*]'
            columns
                pth varchar2(4000) path '$."o:path"'
                ,typ varchar2(4000) path '$."type"'
        )s3
    where s1.id=s2.id
)select
    id,grp,pth,typ,ele
from(
    select
        s1.id
        ,dense_rank()over(order by s1.id) as grp
        ,s1.pth
        ,s1.typ
        ,s2.ele
    from
        (select * from src) s1
        ,xmltable(
            '/ROWSET/ROW'
            PASSING DBMS_XMLGEN.getxmltype(
                build_sql
            )
            COLUMNS id raw(16) ,ele varchar2(4000)
        )s2
    where s1.id=s2.id
)
where grp=1
;
