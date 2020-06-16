package app;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class App {
    public static void main(String... args){
        String classFileName = System.getProperty("sun.boot.library.path") + "/classlist";

        File file = new File(classFileName);

        Set<String> classFIleList = new TreeSet<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));){
            String classFile;
            while ((classFile = reader.readLine()) != null) {
                classFIleList.add(classFile);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        classFIleList.stream().forEach(e-> System.out.println(e));

    }
}