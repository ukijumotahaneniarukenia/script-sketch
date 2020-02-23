import java.io.IOException;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import sun.misc.Signal;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class java_URLエンコードから文字列へ変換_convert_url_encoding_to_str_DONE_urlenc2str {

    private static String encoding = "UTF-8";//usage decoding

    public static void main(String[] cmdline_args) {
        trap(new ArrayList<>(Arrays.asList("INT")));
        try{
            if(cmdline_args.length==0){
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
                List<String> liz = new ArrayList<>(Arrays.asList(cmdline_args));
                if(liz.size()==1){
                    XXX(new ArrayList<>(Arrays.asList(liz.get(0).split("\n"))));
                }else{
                    XXX(liz);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
            System.exit(1);
        }
    }
    private static void XXX(List<String> liz) throws IOException{
        for (int i=0;i<liz.size();i++){
            List<String> lizz = new ArrayList<>(Arrays.asList(liz.get(i).split(" ")));
            for(int j=0;j<lizz.size();j++){
                File file = new File(lizz.get(j));
                if(file.exists()){
                    Path path = Paths.get(lizz.get(j));
                    String str = Files.readString(path);
                    urlenc2dec(str);
                }else{
                    urlenc2dec(lizz.get(j));
                }
            }
        }
    }
    private static void trap(List<String> liz){
        for (String ele:liz) {
            catch_sig(ele);
        }
    }
    private static void usage() {
        final String className = new Object(){}.getClass().getEnclosingClass().getName();
        System.out.println("\nUsage:\n" +
            "cat test.tsv.done | "+ className.replaceAll(".*_", "") +" | xargs -n$(cat test.tsv.done|awk 'END{print NF}') \n" +
            "for i in {0..29};do bash -c \"echo {{A..F},{0..9},%}\"|tr ' ' \\n|shuf -rn$(seq 2 3 | shuf -rn1) |tr -d \\n;echo;done | xargs -n3 | head -n10 | " + className.replaceAll(".*_", "") +" | xargs -n3 \n" +
            "for i in {0..29};do bash -c \"echo {{A..F},{0..9},%}\"|tr ' ' \\n|shuf -rn$(seq 2 3 | shuf -rn1) |tr -d \\n;echo;done | head -n10 | " + className.replaceAll(".*_", "") +"\n"
        );
        System.exit(0);
    }
    private static void catch_sig(String str) {
        Signal sig = new Signal(str);
        Signal.handle(sig, Signal -> {
            if ("INT".equals(sig.getName())) {
                usage();
            }
        });
    }
    private static void urlenc2dec(String str) throws UnsupportedEncodingException {
        System.out.println(URLDecoder.decode(str, encoding));
    }
}