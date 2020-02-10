import sun.misc.Signal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

//https://53ningen.com/singly-linked-linear-list/
//https://ja.wikipedia.org/wiki/%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88
public class Right_Stair {
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
            usage();
            e.printStackTrace();
            System.exit(1);
        }
    }
    private static void circle(List<String> rsv_liz){
        for (int ind=0;ind<rsv_liz.size();ind++){
            String ele=rsv_liz.get(rsv_liz.size()-1);
            rsv_liz.remove(rsv_liz.indexOf(ele));
            rsv_liz.add(0,ele);
            System.out.println(rsv_liz);
        }
    }
    private static void trap(String[] sig_args){
        for (String sig:sig_args) {
            catch_sig(sig);
        }
    }
    //https://blog.no42.org/code/docker-java-signals-pid1/
    private static void usage() {
        //https://qiita.com/munieru_jp/items/02533ebe5c822e6e29bb
        final String className = new Object(){}.getClass().getEnclosingClass().getName();
        System.out.println("\nUsage:\n" +
                "$echo {a..c} | java "+ className +"\n"+
                "$java "+ className +" {a..c}"+"\n"+
                "$java "+className +"$(echo -e '\\U1f4a'{0..9})\n"+
                "$echo -e '\\U1f4a'{0..9} | java "+className+"\n"
        );
        System.exit(1);
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
