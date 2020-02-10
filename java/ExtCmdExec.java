import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

//usage:
//        java ExtCmdExec cat

public class ExtCmdExec {
    public static void main(String[] args) {
        String ret=execCmd(args[0]);
        System.out.println(ret);
    }
    public static String execCmd(String dat){
        String result="";
        try {
            String cmd="ls | xargs | "+dat;
            String[] cmd_tmpl = {"/bin/bash", "-c", cmd};
            Process p = new ProcessBuilder(cmd_tmpl).start();
            InputStream is = p.getInputStream();
            InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(isr);
            result=br.readLine();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return result;
    }
}