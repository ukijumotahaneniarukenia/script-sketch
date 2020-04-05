package app;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class App {
    public static final String className = new Object(){}.getClass().getEnclosingClass().getName();
    public static final String cmdInput="seq 17 |";
    public static void main(String[] cmdline_args) {
        XXX xxx = new XXX();
        HashMap<Integer, List<String>> maz;
        maz=xxx.KKK(className,cmdInput,cmdline_args,new Scanner(System.in),Arrays.asList("INT"));
        crawl(maz);
    }
    private static void crawl(HashMap<Integer, List<String>> maz){
        maz.forEach((k,v)->{
            System.out.printf("%s:%s\n",k,v);
//            try {
//                Document doc = Jsoup.connect(v.get(0)).get();
//                System.out.printf("%s\n",doc.title());
//                Elements newsHeadlines = doc.select(v.get(1));
//                for (Element headline : newsHeadlines) {
//                    System.out.printf("%s\t%s\n",headline.attr("title"), headline.absUrl("href"));
//                }
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
        });
    }
}