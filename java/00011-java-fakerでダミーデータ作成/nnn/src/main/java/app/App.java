package app;

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

            if(isSingleRow(map)){
                //単一行チェック
                usage();
            }

            System.out.println(map);

        }
    }
    private static boolean isSingleRow(Map<Integer, List<String>> map){
        return map.size() != 1;
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