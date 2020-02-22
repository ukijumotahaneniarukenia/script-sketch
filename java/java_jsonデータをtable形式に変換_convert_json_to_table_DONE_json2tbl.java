import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static java.lang.System.exit;

public class java_jsonデータをtable形式に変換_convert_json_to_table_DONE_json2tbl {
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
