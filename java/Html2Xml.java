import org.htmlcleaner.*;
import sun.misc.Signal;

import java.io.IOException;
import java.io.StringWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Html2Xml {
    //http://htmlcleaner.sourceforge.net/javause.php
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
            System.out.println(html2xml(tgt_liz.get(i)));
        }
    }
    private static String html2xml(String tgt) {
        Path file = Paths.get(tgt);
        String rt =null;
        try {
            String txt = Files.readString(file);
            HtmlCleaner cleaner = new HtmlCleaner();
            CleanerProperties props = cleaner.getProperties();
            //http://htmlcleaner.sourceforge.net/parameters.php#transform
            TagNode node = cleaner.clean(txt);
            XmlSerializer serializer = new PrettyXmlSerializer(props);
            StringWriter writer = new StringWriter();
            serializer.write(node, writer, "utf-8");
            System.out.println(writer.getBuffer());
            rt = writer.getBuffer().toString();
            writer.close();
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
                "#1. please download jar library zip.\n"+
                "$curl -LO https://sourceforge.net/projects/htmlcleaner/files/htmlcleaner/htmlcleaner%20v2.23/htmlcleaner-2.23.zip\n"+
                "\n"+
                "#2. please unzip jar library zip.\n"+
                "$unzip htmlcleaner-2.23.zip\n"+
                "\n"+
                "#3. please confirm existstence of jar library.\n"+
                "$ll -lh htmlcleaner-2.23.jar\n"+
                "\n"+
                "#4. please complie.\n"+
                "$javac -classpath $(pwd)/htmlcleaner-2.23.jar Html2Xml.java\n"+
                "\n"+
                "#5. please execute.\n"+
                "$java -classpath $(pwd):$(pwd)/htmlcleaner-2.23.jar Html2Xml test.html\n"+
                "\n"+
                "or\n"+
                "\n"+
                "$echo test.html | java -classpath $(pwd):$(pwd)/htmlcleaner-2.23.jar Html2Xml\n"+
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