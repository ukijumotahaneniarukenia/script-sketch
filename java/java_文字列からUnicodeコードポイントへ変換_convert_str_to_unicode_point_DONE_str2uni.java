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

public class java_文字列からUnicodeコードポイントへ変換_convert_str_to_unicode_point_DONE_str2uni {
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
                  str2uni(str);
              }else{
                  str2uni(lizz.get(j));
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
      "echo 'うんこ 💗' | " + className.replaceAll(".*_", "") + "\n" +
      className.replaceAll(".*_", "") + "< <(echo 'うんこ 💗')" + "\n"
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
  private static void str2uni(String str) {
    StringBuilder rt = new StringBuilder();
    for (int i = 0; i < str.length(); i++) {
        rt.append(String.format("\\u%04X", (int)str.charAt(i)));
    }
    System.out.println(rt.toString());
  }
}