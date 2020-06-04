package app;

import java.io.File;
import java.io.IOException;
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

//https://www.gwtcenter.com/howto-determine-class-path-or-jar
//https://www.gwtcenter.com/dynamic-classpath
public class App {
    private static Map<Method,Class<?>> getMethodInfo(Class<?> e){
        List<Method> l = Arrays.asList(e.getMethods());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
    }
    private static Map<Field,Class<?>> getFieldInfo(Class<?> e){
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
                .filter(e -> e.isFile())
                .filter(e -> e.getAbsolutePath().matches(includeExtensionPtn))
                .collect(Collectors.toSet());
    }
    private static URLClassLoader newClassLoader(Set<File> files) {
        URL[]urls = files.stream().map(file->getURL(file)).collect(Collectors.toList()).toArray(new URL[files.size()]);
        return new URLClassLoader(urls, null); // これについては下記の※を参照のこと
    }
    private static URL getURL(File file) {
        try {
            return file.toURI().toURL();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
    public static void main(String[] args) throws IOException, ReflectiveOperationException {

        ClassLoader classLoader;

        Set<File> jarFileList = getJarFileList(new File("/home/kuraine/.gradle/caches/modules-2/files-2.1"));

        classLoader = newClassLoader(jarFileList);

        System.out.println("ロードできた？？");

        int jarFileListCnt = jarFileList.size();
        int jarFileClassCnt = 0;
        int jarFileClassLoadCnt = 0;
        int jarFileClassLoadSkipCnt = 0;

        for (File f : jarFileList) {
            JarFile jarFile = new JarFile(f.getPath());
            List<JarEntry> jarEntries = Collections.list(jarFile.entries());
            for (JarEntry jarEntry : jarEntries) {
                if (jarEntry.getName().endsWith(".class")) {
                    jarFileClassCnt++;
                    String className = jarEntry.getName().replace('/', '.').replaceAll(".class$", "");
                    if(
                            //パッケージ名などから除外対象をある程度予測する
                            //その時点での依存関係をすべて解決できる必要はないので
                            jarEntry.getName().contains("module-info")
                            || jarEntry.getName().contains("META-INF") //Exception in thread "main" java.lang.NoClassDefFoundError: org/apache/logging/log4j/core/util/SystemClock (wrong name: META-INF/versions/9/org/apache/logging/log4j/core/util/SystemClock)
                            ||jarEntry.getName().contains("jdbc") //Caused by: java.lang.ClassNotFoundException: javax.sql.DataSource
                            ||jarEntry.getName().contains("JDBC") //Caused by: java.lang.ClassNotFoundException: java.sql.SQLException
                            ||jarEntry.getName().contains("SQL") //Caused by: java.lang.ClassNotFoundException: java.sql.SQLException
                            ||jarEntry.getName().contains("async") //Caused by: java.lang.ClassNotFoundException: com.lmax.disruptor.EventTranslatorTwoArg
                            ||jarEntry.getName().contains("jackson") //Caused by: java.lang.ClassNotFoundException: com.fasterxml.jackson.databind.ser.std.StdSerializer
                            ||jarEntry.getName().contains("osgi") //Caused by: java.lang.ClassNotFoundException: org.osgi.framework.BundleActivator
                            ||jarEntry.getName().contains("plugins") //Caused by: java.lang.ClassNotFoundException: javax.annotation.processing.AbstractProcessor
                            ||jarEntry.getName().contains("appender") //Caused by: java.lang.ClassNotFoundException: javax.annotation.processing.AbstractProcessor
                            ||jarEntry.getName().contains("net") //Caused by: java.lang.ClassNotFoundException: javax.mail.Authenticator
                            ||jarEntry.getName().contains("log4j") //Caused by: java.lang.ClassNotFoundException: com.fasterxml.jackson.dataformat.xml.util.DefaultXmlPrettyPrinter
                            ||jarEntry.getName().contains("layout") //Caused by: java.lang.ClassNotFoundException: com.fasterxml.jackson.dataformat.xml.util.DefaultXmlPrettyPrinter
                            ||jarEntry.getName().contains("jaxen") //Caused by: java.lang.ClassNotFoundException: com.fasterxml.jackson.dataformat.xml.util.DefaultXmlPrettyPrinter
                            ||jarEntry.getName().contains("codehaus") //Caused by: java.lang.ClassNotFoundException: com.fasterxml.jackson.dataformat.xml.util.DefaultXmlPrettyPrinter
                    ){
                        //個別対応でいいか、複数のjarの機能を一気にすべて知りたいことあんまないし
                        System.out.println(className);
                        System.out.println("スキップした");
                        jarFileClassLoadSkipCnt++;
                        continue;
                    }else{
                        System.out.println(className);
                        Class<?> loadClass = classLoader.loadClass(className);

                        //コマンドライン引数にクラスパスを指定せず、プログラム内でダイナミックにロードし、メタプロできるか

                        System.out.println(getFieldInfo(loadClass));

                        System.out.println(getMethodInfo(loadClass));


                        System.out.println("ロードできた");
                        jarFileClassLoadCnt++;
                    }
                }
            }
        }

        System.out.printf(
                "%s\t%s\n" +
                "%s\t%s\n" +
                "%s\t%s\n" +
                "%s\t%s\n"
                ,"jarFileListCnt",jarFileListCnt
                ,"jarFileClassCnt",jarFileClassCnt
                ,"jarFileClassLoadCnt",jarFileClassLoadCnt
                ,"jarFileClassLoadSkipCnt",jarFileClassLoadSkipCnt
        );

    }
}