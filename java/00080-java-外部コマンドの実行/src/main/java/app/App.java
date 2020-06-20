package app;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class App {

    private static final String SEPARATOR =  " ";
    private static final String ORS =  "\n";

    public static void main(String[] args) {
        System.out.println(execCmd("ls","うんこ","アイスクリーム"));
        System.out.println(execCmd("ls"));
    }
    private static String execCmd(String cmd, String... cmdLineArgs){
        List<String> rt = new LinkedList<>();
        try {
            List<String> cmdTemplate = new LinkedList(){{
                add("/bin/bash");
                add("-c");
                add(cmd + SEPARATOR + Arrays.asList(cmdLineArgs).stream().collect(Collectors.joining(SEPARATOR)));
            }};

            System.out.println(cmdTemplate.stream().collect(Collectors.joining(SEPARATOR)));

            Process process = new ProcessBuilder(cmdTemplate.toArray(new String[cmdTemplate.size()])).start();
            InputStream inputStream = process.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            String str;
            while ((str = bufferedReader.readLine()) != null) {
                    rt.add(str);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return rt.stream().collect(Collectors.joining(ORS));
    }
}
