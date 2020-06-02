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
            HashMap<Integer, List<String>> m = sub_process(pre_process(new Scanner(System.in)));
            for(Map.Entry<Integer, List<String>> entry : m.entrySet()){
                System.out.printf("%s\t%s\n",entry.getKey(),entry.getValue());
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
    private static HashMap<Integer, List<String>> sub_process(List<String> liz){
        HashMap<Integer, List<String>> rt= new HashMap<>();
        for (int i=0;i<liz.size();i++){
            List<String> l = new ArrayList<>(Arrays.asList(liz.get(i).split(DEFAULT_SEPARATOR)));
            rt.put(i,l);
        }
        return rt;
    }
}