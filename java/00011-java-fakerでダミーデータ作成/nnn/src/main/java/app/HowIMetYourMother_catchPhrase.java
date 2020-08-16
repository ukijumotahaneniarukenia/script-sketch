package app;

import com.github.javafaker.Faker;
import com.github.javafaker.*;
import sun.misc.Signal;

import java.util.*;

public class HowIMetYourMother_catchPhrase {

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
        HowIMetYourMother howIMetYourMother = faker.howIMetYourMother();
        int cnt = Integer.parseInt(map.get(0).get(1));
        for(int i=0;i<cnt;i++){
            System.out.println(howIMetYourMother.catchPhrase());
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
                "LOCALE:\n" +
                "a ar\n" +
                "b bg by\n" +
                "c ca ca-CAT cs-CZ\n" +
                "d da-DK de de-AT de-CH\n" +
                "e ee en en-AU en-BORK en-CA en-GB en-IND en-MS en-NEP en-NG en-NZ en-PAK en-SG en-UG en-US en-ZA en-au-ocker es es-MX\n" +
                "f fa fi-FI fr fr-CA fr-CH\n" +
                "h he hu hy\n" +
                "i id in-ID it\n" +
                "j ja\n" +
                "k ko\n" +
                "l lv\n" +
                "n nb-NO nl no-NO\n" +
                "p pl pt pt-BR\n" +
                "r ru\n" +
                "s sk sv sv-SE\n" +
                "t th tr\n" +
                "u uk\n" +
                "v vi\n" +
                "z zh-CN zh-TW\n" +
                "\n" +
                "CMD: echo ja 10 | java -jar /home/aine/script-sketch/java/00011-java-fakerでダミーデータ作成/nnn/target/howIMetYourMother-catchPhrase-1.0-SNAPSHOT-jar-with-dependencies.jar" +
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
