import java.util.Arrays;
import java.util.Scanner;
import java.util.stream.Stream;

//import java.util.ArrayList;
//import java.util.List;
//https://docs.oracle.com/javase/jp/8/docs/api/java/util/Scanner.html

public class 標準入力 {
  public static void main(String[] rsv_args) {
    try{
      if(rsv_args.length==0){
        Scanner stdin=new Scanner(System.in);
        while (stdin.hasNextLine()) {
          String ln=stdin.nextLine();
          System.out.println(ln);
        }
        stdin.close();
      }else{
        Stream<String> stream=Arrays.stream(rsv_args);
        stream.forEach(System.out::println);
      }
    }catch(Exception e){
      e.printStackTrace();
      System.exit(1);
    }
  }
//https://stackoverflow.com/questions/1216172/how-can-i-intercept-ctrlc-in-a-cli-application
//https://rosettacode.org/wiki/Handle_a_signal#Java
  private static void usage(){
    System.out.println("Usage:");
    System.exit(1);
  }
}

//[sqlite💘ceacf3fb0808 (金 11月 15 00:10:19) ~/script_scratch/java]$echo $(seq 10 | xargs -n3) | xxd -c1 -ps
//31
//20
//32
//20
//33
//20
//34
//20
//35
//20
//36
//20
//37
//20
//38
//20
//39
//20
//31
//30
//0a
//[sqlite💘ceacf3fb0808 (金 11月 15 00:10:51) ~/script_scratch/java]$echo "$(seq 10 | xargs -n3)" | xxd -c1 -ps
//31
//20
//32
//20
//33
//0a
//34
//20
//35
//20
//36
//0a
//37
//20
//38
//20
//39
//0a
//31
//30
//0a
//
