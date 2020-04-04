import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.HashMap;
import sun.misc.Signal;

public class XXX {
    public static void main(String[] cmdline_args) {
        HashMap<Integer, List<String>> maz=new HashMap<Integer, List<String>>();
        maz=KKK(cmdline_args,new Scanner(System.in),Arrays.asList("INT"));
        debug_maz(maz);
    }
    public static HashMap<Integer, List<String>> KKK(String[] cmdline_args,Scanner stdin,List<String> signal_args) {
        List<String> liz=new ArrayList<>();
        HashMap<Integer, List<String>> maz=new HashMap<Integer, List<String>>();
        trap(new ArrayList<>(signal_args));
        try{
            if(cmdline_args.length==0){
                //via pipe args
                liz=pre_process(stdin);
                maz=sub_process(liz);
                //debug_maz(maz);
            }else{
                //via cmdline args
                liz = new ArrayList<>(Arrays.asList(cmdline_args));
                if(liz.size()==1){
                    maz=sub_process(new ArrayList<>(Arrays.asList(liz.get(0).split("\n"))));
                    //debug_maz(maz);
                }else{
                    maz=sub_process(liz);
                    //debug_maz(maz);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
            System.exit(1);
        }
        return maz;
    }
    private static void debug_maz(HashMap<Integer, List<String>> maz){
        maz.forEach((k,v)->{
          System.out.println(k+":"+v);
        });
    }
    private static void debug_liz(List<String> liz){
        for(int i=0;i<liz.size();i++){
          System.out.println(i+":"+liz.get(i));
        }
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
        HashMap<Integer, List<String>> maz=new HashMap<Integer, List<String>>();
        for (int i=0;i<liz.size();i++){
            List<String> coz = new ArrayList<>(Arrays.asList(liz.get(i).split(" ")));
            maz.put(i,coz);
        }
        return maz;
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
        final String className = new Object(){}.getClass().getEnclosingClass().getName();
        System.out.println("\nUsage:\n" +
          "seq 17 | " + className.replaceAll(".*_", "") + "\n"
        );
        System.exit(0);
    }
}
