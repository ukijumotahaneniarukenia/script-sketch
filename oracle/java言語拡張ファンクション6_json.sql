--https://oracle-base.com/articles/12c/json-support-in-oracle-database-12cr1

DROP TABLE test_tbl PURGE;
/

CREATE TABLE test_tbl (
    id     RAW(16) NOT NULL
    , data   CLOB
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
         }')
;
/

commit;

create or replace and resolve java source named Mock
as
import javax.sql.rowset.serial.SerialClob;
import java.sql.Clob;
import java.sql.SQLException;
public class Mock{
    public static Clob build_cmd(Clob str_dat) throws SQLException {
        Clob clob_dat = new SerialClob(("gron <<< '"+str_dat+"'").toCharArray());
        return clob_dat;
    }
}
/

create or replace function build_cmd(s clob)
return clob
as
    language java
    name 'Mock.build_cmd(java.sql.Clob) return java.sql.Clob';
/

select id,data,mmm(data) from test_tbl;
