import java.io.File;

import com.ibm.icu.text.Transliterator;
import sun.misc.Signal;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class java_全角文字から半角文字へ変換_FULL2HALF_DONE_full2half {
    public static void main(String[] rsv_args) {
        trap(new String[]{"INT"});
        try{
            if(rsv_args.length==0){
                //via pipe args
                var stdin=new Scanner(System.in);
                String ln=stdin.nextLine();
                List<String> liz = new ArrayList<>(Arrays.asList(ln.split(" ")));
                process(liz);
                stdin.close();
            }else{
                //via cmdline args
                List<String> liz = new ArrayList<>(Arrays.asList(rsv_args));
                process(liz);
            }
        }catch(Exception e){
            e.printStackTrace();
            usage();
            System.exit(1);
        }
    }
    private static void process(List<String> tgt_liz) throws IOException {
        for(int i=0;i<tgt_liz.size();i++){
            System.out.println(half2full(tgt_liz.get(i)));
        }
    }
    private static String half2full(String tgt) throws IOException {
        File file = new File(tgt);
        if(!file.exists()){
          return Transliterator.getInstance("Fullwidth-Halfwidth").transliterate(tgt);
        }else{
          Path path = Paths.get(tgt);
          String txt = Files.readString(path);
          return Transliterator.getInstance("Fullwidth-Halfwidth").transliterate(txt);
        }
    }
    private static void trap(String[] sig_args){
        for (String sig:sig_args) {
            catch_sig(sig);
        }
    }
    private static void usage() {
        System.out.println("Usage:\n" +
                "");
        System.exit(0);
    }
    private static void catch_sig(String tgt_sig) {
        Signal sig = new Signal(tgt_sig);
        Signal.handle(sig, Signal -> {
            if ("INT".equals(sig.getName())) {
                usage();
            }
        });
    }
}
