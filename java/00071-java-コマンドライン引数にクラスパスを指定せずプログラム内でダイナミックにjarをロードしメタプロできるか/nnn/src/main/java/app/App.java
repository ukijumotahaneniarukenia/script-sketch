package app;

import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

//gradleタスクでcleanしてshadowJarからのjava -jar ./nnn/build/libs/nnn-1.0-SNAPSHOT-all.jar

//shadowjar作成後、cacheレポディレクトリはすべて削除し、調査したいjarのみ入れておくようにする

//https://www.gwtcenter.com/howto-determine-class-path-or-jar
//https://www.gwtcenter.com/dynamic-classpath
public class App {

    private static final ClassLoader parent = ClassLoader.getSystemClassLoader();;

    private static Map<Method,Class<?>> getMethodInfo(Class<?> e) throws NoClassDefFoundError{
        List<Method> l = Arrays.asList(e.getMethods());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
    }
    private static Map<Field,Class<?>> getFieldInfo(Class<?> e) throws NoClassDefFoundError{
        List<Field> l = Arrays.asList(e.getFields());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
    }
    private static Set<File> getJarFileList(File dir) throws IOException {
        Path baseDir = Paths.get(dir.getAbsolutePath());
        String targetExtension = "jar";

        String includeExtensionPtn = ("(?i)^.*\\." + Pattern.quote(targetExtension) + "$"); //完全一致パタンを作成している

        return Files.walk(baseDir)
                .parallel()
                .map(e -> e.toFile())
                .filter(e ->e.isFile())
                .filter(e ->e.getAbsolutePath().matches(includeExtensionPtn))
                .filter(e->!e.getAbsolutePath().contains("sources"))
                .collect(Collectors.toSet());
    }
    private static URLClassLoader newClassLoader(Set<File> files) {
        URL[]urls = files.stream().map(file->getURL(file)).collect(Collectors.toList()).toArray(new URL[files.size()]);
        return new URLClassLoader(urls, parent);
    }
    private static URL getURL(File file) {
        try {
            return file.toURI().toURL();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    private static final String jarFileClassLoadDoneFileName = "jarFileClassLoadDone.tsv";
    private static final String jarFileClassLoadSkipFileName = "jarFileClassLoadSkip.tsv";

    public static void main(String... args) throws IOException {

        String defaultBaseDir = "/home/kuraine/.gradle/caches/modules-2/files-2.1/";

        if(args.length>2){
            System.exit(1);
        }else if(args.length==1){
            //デフォを上書き
            defaultBaseDir = args[0];
        }else{
            //デフォでいく
        }

        Set<File> jarFileList = getJarFileList(new File(defaultBaseDir));

        ClassLoader classLoader = newClassLoader(jarFileList);

        int jarFileListCnt = jarFileList.size();
        int jarFileClassCnt = 0;
        int jarFileClassLoadDoneCnt = 0;
        int jarFileClassLoadSkipCnt = 0;

        Map<String,List<String>> classLoadDoneResult = new LinkedHashMap<>();
        Map<String,List<String>> classLoadSkipResult = new LinkedHashMap<>();

        for (File f : jarFileList) {
            JarFile jarFile = new JarFile(f.getPath());
            List<JarEntry> jarEntries = Collections.list(jarFile.entries());
            List<String> classLoadList = new ArrayList<>();
            List<String> classLoadSkipList = new ArrayList<>();
            for (JarEntry jarEntry : jarEntries) {
                if (jarEntry.getName().endsWith(".class")) {
                    jarFileClassCnt++;
                    String className = jarEntry.getName().replace('/', '.').replaceAll(".class$", "");
                    try {
                        Class<?> loadClass = classLoader.loadClass(className);

                        getFieldInfo(loadClass);
                        getMethodInfo(loadClass);

                        classLoadList.add(className);

                        jarFileClassLoadDoneCnt++;
                    }catch (ClassNotFoundException | NoClassDefFoundError e){
                        classLoadSkipList.add(className);
                        jarFileClassLoadSkipCnt++;
                    }
                }
            }
            classLoadDoneResult.put(f.getPath(),classLoadList);
            classLoadSkipResult.put(f.getPath(),classLoadSkipList);
        }

        File jarFileClassLoadDoneFile = new File(jarFileClassLoadDoneFileName);
        if(jarFileClassLoadDoneFile.exists()){
            jarFileClassLoadDoneFile.delete();
        }else{
            jarFileClassLoadDoneFile.createNewFile();
        }

        File jarFileClassLoadSkipFile = new File(jarFileClassLoadSkipFileName);
        if(jarFileClassLoadSkipFile.exists()){
            jarFileClassLoadSkipFile.delete();
        }else{
            jarFileClassLoadSkipFile.createNewFile();
        }

        OutputStreamWriter oswJarFileClassLoadDoneFileName  = new OutputStreamWriter(new FileOutputStream(jarFileClassLoadDoneFileName), "UTF-8");
        BufferedWriter bwJarFileClassLoadDoneFileName = new BufferedWriter(oswJarFileClassLoadDoneFileName);
        for(Map.Entry<String,List<String>> entry : classLoadDoneResult.entrySet()){
            for(String className:entry.getValue()){
                bwJarFileClassLoadDoneFileName.write(entry.getKey().replace(defaultBaseDir,"").replace("/",".")+"\t"+className);
                bwJarFileClassLoadDoneFileName.newLine();
            }
        }
        bwJarFileClassLoadDoneFileName.close();

        OutputStreamWriter oswJarFileClassLoadSkipFileName  = new OutputStreamWriter(new FileOutputStream(jarFileClassLoadSkipFileName), "UTF-8");
        BufferedWriter bwJarFileClassLoadSkipFileName = new BufferedWriter(oswJarFileClassLoadSkipFileName);
        for(Map.Entry<String,List<String>> entry : classLoadSkipResult.entrySet()){
            for(String className:entry.getValue()){
                bwJarFileClassLoadSkipFileName.write(entry.getKey().replace(defaultBaseDir,"").replace("/",".")+"\t"+className);
                bwJarFileClassLoadSkipFileName.newLine();
            }
        }
        bwJarFileClassLoadSkipFileName.close();

        System.out.printf(
                "%s\t%s\n" +
                        "%s\t%s\n" +
                        "%s\t%s\n" +
                        "%s\t%s\n"
                ,"jarFileListCnt",jarFileListCnt
                ,"jarFileClassCnt",jarFileClassCnt
                ,"jarFileClassLoadDoneCnt",jarFileClassLoadDoneCnt
                ,"jarFileClassLoadSkipCnt",jarFileClassLoadSkipCnt
        );

    }
}