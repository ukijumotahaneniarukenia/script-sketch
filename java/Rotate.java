import sun.misc.Signal;

import java.util.*;

public class Rotate {
    public static void main(String[] rsv_args) {
        trap(new String[]{"INT"});
        try{
            if(rsv_args.length==0){
                //via pipe args
                Scanner stdin=new Scanner(System.in);
                List<String> liz = new ArrayList<>(Arrays.asList(stdin.nextLine().split(" ")));
                circle(liz);
                stdin.close();
            }else{
                //via cmdline args
                List<String> liz = new ArrayList<>(Arrays.asList(rsv_args));
                circle(liz);
            }
        }catch(Exception e){
            e.printStackTrace();
            System.exit(0);
        }
    }
    private static void circle(List<String> rsv_liz){
        for (int ind=0;ind<rsv_liz.size();ind++){
            Collections.rotate(rsv_liz, 1);
            System.out.println(rsv_liz);
        }
    }
    private static void trap(String[] sig_args){
        for (String sig:sig_args) {
            catch_sig(sig);
        }
    }
    private static void usage() {
        final String className = new Object(){}.getClass().getEnclosingClass().getName();
        System.out.println("\nUsage:\n" +
                "$echo {a..c} | java "+ className +"\n"+
                "$java "+ className +" {a..c}"+"\n"+
                "$java "+className +"$(echo -e '\\U1f4a'{0..9})\n"+
                "$echo -e '\\U1f4a'{0..9} | java "+className+"\n"
        );
        System.exit(0);
    }
    private static void catch_sig(String sig) {
        Signal signal = new Signal(sig);
        Signal.handle(signal, Signal -> {
            if ("INT".equals(signal.getName())) {
                usage();
            }
        });
    }
}