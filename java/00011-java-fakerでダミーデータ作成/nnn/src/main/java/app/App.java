package app;

import com.github.javafaker.Faker;
import com.github.javafaker.PrincessBride;
import sun.misc.Signal;

import java.util.*;

public class App {

    private static final String DEFAULT_SEPARATOR = " ";
    private static final String SIGNAL_HANDLE_INT = "INT";

    public static void main( String... cmdLineArgs ) {

        trap(new ArrayList<>(Arrays.asList(SIGNAL_HANDLE_INT)));

        if(cmdLineArgs.length > 0){
            usage();
        }else{
            Map<Integer, List<String>> map = sub_process(pre_process(new Scanner(System.in)));

            if(!isSingleRow(map)){
                usage();
            }

            if(!isTwoColumn(map)){
                usage();
            }

            wrapperExecute(map);

        }
    }
    private static void wrapperExecute(Map<Integer, List<String>> map){
        Faker faker = new Faker(new Locale(map.get(0).get(0)));
        PrincessBride princessBride = faker.princessBride();
        int cnt = Integer.parseInt(map.get(0).get(1));
        for(int i=0;i<cnt;i++){
            System.out.println(princessBride.quote());
        }
    }
    private static boolean isSingleRow(Map<Integer, List<String>> map){
        return map.size() == 1;
    }
    private static boolean isTwoColumn(Map<Integer, List<String>> map){
        return map.get(0).size() == 2;
    }
    private static void trap(List<String> list){
        for (String e:list) {
            catch_sig(e);
        }
    }
    private static void catch_sig(String str) {
        Signal sig = new Signal(str);
        Signal.handle(sig, Signal -> {
            if ("INT".equals(sig.getName())) {
                usage();
            }
        });
    }
    private static void usage() {
        System.out.println("Usageだよーん");
        System.out.println("\n" +
                "" +
                "CMD: echo ja_JP 10 | java -jar /home/aine/script-sketch/java/00011-java-fakerでダミーデータ作成/nnn/target/TOBE_REPLACE_APP_NAME-1.0-SNAPSHOT-jar-with-dependencies.jar" +
                "" +
                "\n");
        System.exit(0);
    }
    private static List<String> pre_process(Scanner stdin){
        List<String> rt = new ArrayList<>();
        while (stdin.hasNextLine()) {
            rt.add(stdin.nextLine());
        }
        stdin.close();
        return rt;
    }
    private static Map<Integer, List<String>> sub_process(List<String> list){
        Map<Integer, List<String>> rt= new LinkedHashMap<>();
        for (int i=0;i<list.size();i++){
            List<String> l = new ArrayList<>(Arrays.asList(list.get(i).split(DEFAULT_SEPARATOR)));
            rt.put(i,l);
        }
        return rt;
    }
}