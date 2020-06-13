package app;

import sun.misc.Signal;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;

import static java.lang.System.exit;

public class App {

    //https://bitbucket.org/xerial/sqlite-jdbc/src/default/LICENSE

    private static final String DEFAULT_SEPARATOR = " ";
    private static final String SIGNAL_HANDLE_INT = "INT";
    private static final String ORS = "\n";
    private static final String OFS = "\t";
    private static final String PRE_REPLACE_SIGNATURE = "\'";
    private static final String POST_REPLACE_SIGNATURE = "\'\'";
    private static final Integer SUCCESS_STATUS = 0;
    private static final Integer FAIL_STATUS = 1;

    public static void main( String... cmdLineArgs ) {
        trap(new ArrayList<>(Arrays.asList(SIGNAL_HANDLE_INT)));

        if(cmdLineArgs.length > 0){
            usage();
        }else{
            Map<Integer, List<String>> m = sub_process(pre_process(new Scanner(System.in)));

            wrapperExecute(m);

        }
    }

    private static boolean isExistsFile(String fileName){
        File file = new File(fileName);
        if(file.exists()){
            return true;
        }else{
            return false;
        }
    }

    private static boolean isZeroByteFile(String fileName){
        File file = new File(fileName);
        if(file.length()!=0L){
            return true;
        }else{
            return false;
        }
    }

    private static void wrapperExecute(Map<Integer, List<String>> m){

        if(m.size()!=1){
            //単一行チェック
            usage();
        }

        Set<String> fileNameSet = m.get(0).stream()
                .filter(e->isExistsFile(e))
                .filter(e->isZeroByteFile(e))
                .collect(Collectors.toSet());

        for(String fileName : fileNameSet){
            String str = "";
            try {
                str = Files.readString(Paths.get(fileName));
                execute(str,fileName);
            } catch (IOException e) {
                e.printStackTrace();
                exit(FAIL_STATUS);
            } catch (Exception e) {
                e.printStackTrace();
                exit(FAIL_STATUS);
            }
        }
    }

    private static void execute(String str,String fileName) throws Exception {
        Connection con = null;
        try {
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite::memory:");
            select(con,str,fileName);
        } catch (Exception e) {
            e.printStackTrace();
            exit(FAIL_STATUS);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    private static void select(Connection con,String str,String fileName){
        Statement stmt = null;
        ResultSet rs = null;
        List<String> columnList = new ArrayList<>();

        //シングルクォーテーションのエスケープ対応
        String build_sql="select * from json_tree(" + "'" + str.replaceAll(PRE_REPLACE_SIGNATURE,POST_REPLACE_SIGNATURE) + "'" + ")";

        try {

            stmt = con.createStatement();
            rs = stmt.executeQuery(build_sql);

            while (rs.next()) {
                if (columnList.size()==0) {
                    //初回
                    ResultSetMetaData header = rs.getMetaData();
                    int cnt = header.getColumnCount();
                    for (int i = 0; i < cnt; i++) {
                        if(i==cnt-1){
                            System.out.print(header.getColumnName(i + 1));
                        }else{
                            System.out.print(header.getColumnName(i + 1)+OFS);
                        }
                        columnList.add(header.getColumnName(i + 1));
                    }
                }else{
                    //２回目以降
                    int cnt = columnList.size();
                    System.out.print(ORS);
                    for (int i = 0; i < cnt; i++) {
                        if(i==cnt-1){
                            System.out.print(rs.getObject(columnList.get(i)));
                        }else{
                            System.out.print(rs.getObject(columnList.get(i))+OFS);
                        }
                    }
                }
            }
            System.out.print(ORS);
        } catch (SQLException e) {
            e.printStackTrace();
            exit(FAIL_STATUS);
        } finally {
            try{
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            }catch (SQLException e) {
                e.printStackTrace();
                exit(FAIL_STATUS);
            }
        }
    }

    private static void trap(List<String> liz){
        for (String ele:liz) {
            catch_sig(ele);
        }
    }
    private static void catch_sig(String str) {
        Signal sig = new Signal(str);
        Signal.handle(sig, Signal -> {
            if (SIGNAL_HANDLE_INT.equals(sig.getName())) {
                usage();
            }
        });
    }
    private static void usage() {
        System.out.println("Usageだよーん");
        exit(SUCCESS_STATUS);
    }
    private static List<String> pre_process(Scanner stdin){
        List<String> rt = new ArrayList<>();
        while (stdin.hasNextLine()) {
            rt.add(stdin.nextLine());
        }
        stdin.close();
        return rt;
    }
    private static Map<Integer, List<String>> sub_process(List<String> liz){
        Map<Integer, List<String>> rt= new LinkedHashMap<>();
        for (int i=0;i<liz.size();i++){
            List<String> l = new ArrayList<>(Arrays.asList(liz.get(i).split(DEFAULT_SEPARATOR)));
            rt.put(i,l);
        }
        return rt;
    }
}