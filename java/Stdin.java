import sun.misc.Signal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Stdin {
    public static void main(String[] rsv_args) {
        trap(new String[]{"INT"});
        try{
            if(rsv_args.length==0){
                //via pipe args
                Scanner stdin=new Scanner(System.in);
                String ln=stdin.nextLine();
                System.out.println("via pipe args");
                List<String> liz = new ArrayList<>(Arrays.asList(ln.split(" ")));
                System.out.println(liz);
                stdin.close();
            }else{
                //via cmdline args
                System.out.println("via cmdline args");
                List<String> liz = new ArrayList<>(Arrays.asList(rsv_args));
                System.out.println(liz);
            }
        }catch(Exception e){
            usage();
            e.printStackTrace();
            System.exit(1);
        }
    }
    private static void trap(String[] sig_args){
        for (String sig:sig_args) {
            catch_sig(sig);
        }
    }
    //https://blog.no42.org/code/docker-java-signals-pid1/
    private static void usage() {
        System.out.println("Usage:\n" +
                "");
        System.exit(0);
    }
    private static void catch_sig(String sig) {
        Signal signal = new Signal(sig);
        Signal.handle(signal, Signal -> {
            System.out.println("Signal received: " + signal.getName());
            if ("INT".equals(signal.getName())) {
                usage();
            }
        });
    }
}