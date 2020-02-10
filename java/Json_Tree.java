//https://github.com/xerial/sqlite-jdbc/blob/master/src/test/java/org/sqlite/JSON1Test.java
//https://tokkan.net/etc/sqlite2.html
//https://bitbucket.org/xerial/sqlite-jdbc/downloads/
//$curl -LO https://bitbucket.org/xerial/sqlite-jdbc/downloads/sqlite-jdbc-3.30.1.jar
//$javac -classpath /home/kuraine/script_scratch/java/lib/sqlite-jdbc-3.30.1.jar Json_Tree.java
//$java -classpath $(pwd):/home/kuraine/script_scratch/java/lib/sqlite-jdbc-3.30.1.jar Json_Tree
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static java.lang.System.exit;

//SpreadSheet add
//https://developers.google.com/sheets/api/quickstart/java



//test data
//drop table fruits;
//create table fruits(id,name);
//insert into fruits values(1,'apple');
//insert into fruits values(2,'orange');
//insert into fruits values(3,'banana');
//insert into fruits values(4,'peach');

public class Json_Tree {
    public static void main(String[] args) {
        try {
            execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private static void execute() throws Exception {
        Connection con = null;
        try {
            Class.forName("org.sqlite.JDBC");
//            con = DriverManager.getConnection("jdbc:sqlite:/home/kuraine/testdb");
            con = DriverManager.getConnection("jdbc:sqlite::memory");
            select(con);
        } catch (Exception e) {
            e.printStackTrace();
            exit(1);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    private static void select(Connection con) throws SQLException {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<String> colz = null;
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from json_tree('[\"a\", {\"b\": [1, 2]}, [3, 4,null,true,false],[{\"c\": [11, 12]},\"eee\",{\"d\": [111, 112]}],{\"f\":true}]')");
            while (rs.next()) {
                if (colz == null) {
                    colz = new ArrayList<>();
                    ResultSetMetaData header = rs.getMetaData();
                    int cnt = header.getColumnCount();
                    for (int i = 0; i < cnt; i++) {
                        System.out.print(header.getColumnName(i + 1)+"\t");
                        colz.add(header.getColumnName(i + 1));
                    }
                }
                System.out.print("\n");
                for (String col : colz) {
                    System.out.print(rs.getObject(col)+"\t");
                }
            }
            System.out.print("\n");
        } catch (Exception e) {
            e.printStackTrace();
            exit(1);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        }
    }
}