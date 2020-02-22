import org.json.XML;
import sun.misc.Signal;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Xml2Json {
    //https://www.code-adviser.com/detail_28451370
    public static void main(String[] rsv_args) {
        trap(new String[]{"INT"});
        try{
            if(rsv_args.length==0){
                //via pipe args
                Scanner stdin=new Scanner(System.in);
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
            usage();
            e.printStackTrace();
            System.exit(1);
        }
    }
    private static void process(List<String> tgt_liz) {
        for(int i=0;i<tgt_liz.size();i++){
            System.out.println(xml2json(tgt_liz.get(i)));
        }
    }
    private static String xml2json(String tgt) {
        Path file = Paths.get(tgt);
        String rt = null;
        try {
            String txt = Files.readString(file);
            rt = XML.toJSONObject(txt).toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return rt;
    }
    private static void trap(String[] sig_args){
        for (String sig:sig_args) {
            catch_sig(sig);
        }
    }
    private static void usage() {
        System.out.println("Usage:\n" +
                "#0. please download jq command.\n"+
                "$yum install -y jq\n"+
                "\n"+
                "#1. please download jar library.\n"+
                "$curl -LO https://repo1.maven.org/maven2/org/json/json/20190722/json-20190722.jar\n"+
                "\n"+
                "#2. please confirm existstence of jar library.\n"+
                "$ll -lh json-20190722.jar\n"+
                "\n"+
                "#3. please complie.\n"+
                "$javac -classpath $(pwd)/lib/json-20190722.jar Xml2Json.java\n"+
                "\n"+
                "#4. please execute.\n"+
                "$java -classpath $(pwd)/out:$(pwd)/lib/json-20190722.jar Xml2Json test.xml | jq\n"+
                "\n"+
                "or\n"+
                "\n"+
                "$echo test.xml | java -classpath $(pwd)/out:$(pwd)/lib/json-20190722.jar Xml2Json | jq\n"+
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
