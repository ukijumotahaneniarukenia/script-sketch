package app;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class App {
    public static void main(String[] args) {
        System.out.println(execCmd());
    }
    private static String execCmd(String... cmdLineArgs){
        List<String> rt = new LinkedList<>();
        try {
            String cmd = "ls";
            String[] cmdTemplate = {"/bin/bash", "-c", cmd};
            Process process = new ProcessBuilder(cmdTemplate).start();
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
        return rt.stream().collect(Collectors.joining("\n"));
    }
}
