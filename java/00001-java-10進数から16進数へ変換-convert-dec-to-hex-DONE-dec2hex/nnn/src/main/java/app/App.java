package app;

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
        dec2hex(maz);
    }
    private static void dec2hex(HashMap<Integer, List<String>> maz){
        maz.forEach((k,v)->{
          if(1 != v.size()){
            System.out.println("#1. java "+className+"\n"
                + "#2. Enter" + "\n"
                + "#3. Ctrl+C" + "\n"
            );
            System.exit(1);
          }else{
            System.out.println(Integer.toHexString(Integer.valueOf(v.get(0))));
          }
        });
    }
}
