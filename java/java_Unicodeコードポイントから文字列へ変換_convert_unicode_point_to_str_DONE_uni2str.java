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

public class java_Unicodeコードポイントから文字列へ変換_convert_unicode_point_to_str_DONE_uni2str {
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
                  uni2str(str);
              }else{
                  uni2str(lizz.get(j));
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
          "echo '\\u3046\\u3093\\u3053 \\uD83D\\uDC97' | " + className.replaceAll(".*_", "") + "\n" +
          className.replaceAll(".*_", "")  + " < <(echo '\\u3046\\u3093\\u3053 \\uD83D\\uDC97') " + "\n"
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
  private static void uni2str(String str) {
    List<String> rt = new ArrayList<>();
    String[] ary = str.split("\\\\u");
    char[] pool = new char[ary.length - 1];
    for (int i = 0; i < pool.length; i++) {
        pool[i] = (char)Integer.parseInt(ary[i + 1], 16);
        rt.add(new String(pool));
    }
    System.out.println(rt.get(rt.size()-1));
  }
}