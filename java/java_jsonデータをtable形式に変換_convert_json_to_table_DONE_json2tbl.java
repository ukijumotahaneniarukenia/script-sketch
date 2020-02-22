import sun.misc.Signal;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static java.lang.System.exit;

public class java_jsonデータをtable形式に変換_convert_json_to_table_DONE_json2tbl {
    public static void main(String[] cmdline_args) {
        trap(new ArrayList<>(Arrays.asList("INT")));
        try{
            if(cmdline_args.length==0){
                //via pipe args
                Scanner stdin=new Scanner(System.in);
                List<String> liz = new ArrayList<>();
                while (stdin.hasNextLine()) {
                    liz.add(stdin.nextLine());
                    XXX(liz);
                    liz.remove(0);
                }
                stdin.close();
            }else{
                //via cmdline args
                List<String> liz = new ArrayList<>(Arrays.asList(cmdline_args));
                if(liz.size()==1){
                    XXX(new ArrayList<>(Arrays.asList(liz.get(0).split("\n"))));
                }else{
                    XXX(liz);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
            System.exit(1);
        }
    }
    private static void XXX(List<String> liz) throws IOException,Exception{
        for (int i=0;i<liz.size();i++){
            List<String> lizz = new ArrayList<>(Arrays.asList(liz.get(i).split(" ")));
            for(int j=0;j<lizz.size();j++){
                File file = new File(lizz.get(j));
                if(file.exists()){
                    Path path = Paths.get(lizz.get(j));
                    String str = Files.readString(path);
                    execute(str);
                }else{
                    execute(lizz.get(j));
                }
            }
        }
    }
    private static void trap(List<String> liz){
        for (String ele:liz) {
            catch_sig(ele);
        }
    }
    private static void usage() {
        final String className = new Object(){}.getClass().getEnclosingClass().getName();
        System.out.println("\nUsage:\n" +
            "cat test.txt | "+ className.replaceAll(".*_", "") +" | sort | uniq -c \n" +
            "ls *xml | while read tgt;do echo $tgt; "+className.replaceAll(".*_", "")+" $tgt;done | xargs -n2 \n"
        );
        System.exit(0);
    }
    private static void catch_sig(String str) {
        Signal sig = new Signal(str);
        Signal.handle(sig, Signal -> {
            if ("INT".equals(sig.getName())) {
                usage();
            }
        });
    }
    private static void execute(String str) throws Exception {
        Connection con = null;
        try {
            Class.forName("org.sqlite.JDBC");
            // con = DriverManager.getConnection("jdbc:sqlite:/home/kuraine/testdb");
            con = DriverManager.getConnection("jdbc:sqlite::memory");
            select(con,str);
        } catch (Exception e) {
            e.printStackTrace();
            exit(1);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    private static void select(Connection con,String str) throws SQLException {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<String> colz = null;
        String build_sql="select * from json_tree(" + "'" + str + "'" + ")";
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(build_sql);
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