import java.io.IOException;

import sun.misc.Signal;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class 標準入力 {
    public static void main(String[] rsv_args) {
        trap(new String[]{"INT"});
        try{
            if(rsv_args.length==0){
                //via pipe args
                Scanner stdin=new Scanner(System.in);
                List<String> liz = new ArrayList<>();
                while (stdin.hasNextLine()) {
                    liz.add(stdin.nextLine());
                    XXX(liz);
                    liz.remove(0);
                }
                stdin.close();
            }else{
                //via cmdline args
                List<String> liz = new ArrayList<>(Arrays.asList(rsv_args));
                if(liz.size()==1){
                    XXX(new ArrayList<>(Arrays.asList(liz.get(0).split("\n"))));
                }else{
                    XXX(liz);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
            System.exit(0);
        }
    }
    private static void XXX(List<String> rsv_liz) throws IOException{
        for (int i=0;i<rsv_liz.size();i++){
            List<String> liz = new ArrayList<>(Arrays.asList(rsv_liz.get(i).split(" ")));
            for(int j=0;j<liz.size();j++){
                File file = new File(liz.get(j));
                if(file.exists()){
                    System.out.println("file dayo-");
                    Path path = Paths.get(liz.get(j));
                    String txt = Files.readString(path);
                    YYY(txt);
                }else{
                    System.out.println("file janaiyo-");
                    YYY(liz.get(j));
                }
            }
        }
    }
    private static void YYY(String tgt){
        System.out.print(tgt);
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
