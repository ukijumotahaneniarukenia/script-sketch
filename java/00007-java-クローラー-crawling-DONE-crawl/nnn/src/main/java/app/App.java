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

import java.util.HashMap;

import sun.misc.Signal;

import org.jsoup.*;
import org.jsoup.nodes.*;
import java.io.IOException;
import org.jsoup.select.*;

//https://jsoup.org/apidocs/org/jsoup/select/Selector.html

//https://try.jsoup.org/~LGB7rk_atM2roavV0d-czMt3J_g

public class App {
    public static final String className = new Object(){}.getClass().getEnclosingClass().getName();
    public static final String cmdInput="seq 17 |";
    public static void main(String[] cmdline_args) {
        XXX xxx = new XXX();
        HashMap<Integer, List<String>> maz=new HashMap<Integer, List<String>>();
        maz=xxx.KKK(className,cmdInput,cmdline_args,new Scanner(System.in),Arrays.asList("INT"));
        crawl(maz);
    }
    private static void crawl(HashMap<Integer, List<String>> maz){
        maz.forEach((k,v)->{
          System.out.println(k+":"+v);
          //if(1 != v.size()){
          //  System.out.println("#1. java "+className+"\n"
          //      + "#2. Enter" + "\n"
          //      + "#3. Ctrl+C" + "\n"
          //  );
          //  System.exit(1);
          //}else{
          //  System.out.println(Integer.toHexString(Integer.valueOf(v.get(0))));
          //}
        });
        //try {
        //    Document doc = Jsoup.connect(url).get();
        //    System.out.printf("%s\n",doc.title());
        //    Elements newsHeadlines = doc.select(selector);
        //    for (Element headline : newsHeadlines) {
        //        System.out.printf("%s\t%s\n",headline.attr("title"), headline.absUrl("href"));
        //    }
        //} catch (IOException e) {
        //    e.printStackTrace();
        //}
    }
}
