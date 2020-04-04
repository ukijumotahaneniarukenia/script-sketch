import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.HashMap;
import sun.misc.Signal;

public class XXX {
    public static HashMap<Integer, List<String>> KKK(String className,String cmdInput,String[] cmdLineArgs,Scanner stdin,List<String> signalArgs) {
        List<String> liz=new ArrayList<>();
        HashMap<Integer, List<String>> maz=new HashMap<Integer, List<String>>();
        trap(className,cmdInput,new ArrayList<>(signalArgs));
        try{
            if(cmdLineArgs.length==0){
                //via pipe args
                liz=pre_process(stdin);
                maz=sub_process(liz);
            }else{
                //via cmdline args
                liz = new ArrayList<>(Arrays.asList(cmdLineArgs));
                if(liz.size()==1){
                    maz=sub_process(new ArrayList<>(Arrays.asList(liz.get(0).split("\n"))));
                }else{
                    maz=sub_process(liz);
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
    private static void trap(String className,String cmdInput,List<String> liz){
        for (String ele:liz) {
            Signal sig = new Signal(ele);
            Signal.handle(sig, Signal -> {
                if (ele.equals(sig.getName())) {
                    usage(className,cmdInput);
                }
            });
        }
    }
    private static void usage(String className,String cmdInput) {
        if(cmdInput.isEmpty()){
            System.out.println("Usageを完成させてから実行してね");
            System.out.println(cmdInput.isEmpty() ? "INPUT" : "Usage:"+ cmdInput + "java" + className.replaceAll(".*_", "") + "\n");
            System.exit(1);
        }
        System.out.println("\nUsage:\n" +
          cmdInput + " java " + className.replaceAll(".*_", "") + "\n"
        );
        System.exit(0);
    }
}
