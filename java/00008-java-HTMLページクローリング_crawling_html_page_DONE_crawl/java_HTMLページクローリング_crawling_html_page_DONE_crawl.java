import java.io.IOException;
import java.io.File;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import sun.misc.Signal;

import org.jsoup.*;
import org.jsoup.nodes.*;
import java.io.IOException;
import org.jsoup.select.*;

//https://jsoup.org/apidocs/org/jsoup/select/Selector.html

//https://try.jsoup.org/~LGB7rk_atM2roavV0d-czMt3J_g

public class java_HTMLページクローリング_crawling_html_page_DONE_crawl {
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
                    usage();
                }
            }
            crawl(lizz.get(0), lizz.get(1));
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
        "echo 'https://en.wikipedia.org/ a[href]' | " + className.replaceAll(".*_", "")  +"\n"
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
    private static void crawl(String url,String selector){
        try {
            Document doc = Jsoup.connect(url).get();
            System.out.printf("%s\n",doc.title());
            Elements newsHeadlines = doc.select(selector);
            for (Element headline : newsHeadlines) {
                System.out.printf("%s\t%s\n",headline.attr("title"), headline.absUrl("href"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}