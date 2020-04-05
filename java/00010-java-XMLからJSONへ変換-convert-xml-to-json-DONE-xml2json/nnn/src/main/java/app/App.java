package app;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import org.json.XML;

public class App {
    public static final String suffix = ".json";
    public static final String className = new Object(){}.getClass().getEnclosingClass().getName();
    public static final String cmdInput="ls *xml |";
    public static void main(String[] cmdline_args) {
        XXX xxx = new XXX();
        HashMap<Integer, List<String>> maz;
        maz=xxx.KKK(className,cmdInput,cmdline_args,new Scanner(System.in),Arrays.asList("INT"));
        xml2json(maz);
    }
    private static void xml2json(HashMap<Integer, List<String>> maz){
        maz.forEach((k,v)->{
            //前回成果物ファイルを削除
            File destFile = new File(v.get(0).replaceAll("\\..*", "")+suffix);
            destFile.delete();

            File srcFile = new File(v.get(0));
            if(srcFile.exists()){
                //ファイルの場合
                Path path = Paths.get(v.get(0));
                String str = null;
                FileWriter fw = null;
                try {
                    fw = new FileWriter(v.get(0).replaceAll("\\..*", "")+suffix, true);
                    str = Files.readString(path);
                    fw.write(XML.toJSONObject(str).toString());
                    fw.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else{
                //ファイルでない場合
                System.out.println("#1. java "+className+"\n"
                        + "#2. Enter" + "\n"
                        + "#3. Ctrl+C" + "\n"
                );
                System.exit(1);
            }
            v.add(v.get(0).replaceAll("\\..*", "")+suffix);
            System.out.printf("%s:%s\n",k,v);
        });
    }
}