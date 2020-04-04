import sun.misc.Signal;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

import java.util.Locale;

import com.github.javafaker.*;
import com.github.javafaker.service.*;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.Executors;
import java.lang.InterruptedException;

public class java_テストデータ生成_generate_test_data_DONE_gendat {
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
    private static void XXX(List<String> liz) throws IOException,InterruptedException{
        for (int i=0;i<liz.size();i++){
            gendat();
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
            className.replaceAll(".*_", "") + " {1..10} | awk -v FS='\n' -v RS='' -v OFS='\t' '{print $1,$2,$3,$4,$5,$6,$7}' \n"
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
    private static void gendat() throws InterruptedException{
        Faker faker = new Faker(new Locale("ja_JP"));
        System.out.println(faker.number().randomNumber(10, true));
        System.out.println(faker.name().firstName());
        System.out.println(faker.name().lastName());
        System.out.println(faker.address().zipCode());
        System.out.println(String.join(faker.address().state(), faker.address().city(), faker.address().cityName()));
        System.out.println(new FakeValuesService(new Locale("ja_JP"), new RandomService()).bothify("??####@gmail.com")); // ?は英字、#は数字
        System.out.println(faker.lorem().sentence(5).replaceAll("\\s{1,}",""));
        System.out.println();
    }
}