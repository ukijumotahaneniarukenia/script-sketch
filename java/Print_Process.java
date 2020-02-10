import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
//https://blog.no42.org/code/docker-java-signals-pid1/
public class Print_Process {
    public static void main(String[] rsv_args) throws IOException {
        for (int ind=0;ind<rsv_args.length;ind++){
            exec_cmd(rsv_args[ind]);
        }
    }
    private static void exec_cmd(String cmd) throws IOException {
        Process proc = Runtime.getRuntime().exec(cmd);
        BufferedReader input=new BufferedReader(new InputStreamReader(proc.getInputStream()));
        String ln = null;
        while((ln=input.readLine())!=null){
            System.out.println(ln);
        }
    }
}