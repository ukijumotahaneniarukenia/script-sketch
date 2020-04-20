package app;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.jar.JarFile;
import java.util.stream.Collectors;

public class App {
    public static void main( String[] args ) throws IOException {
        List<File> filePath = Arrays.asList("/usr/local/src/mecab-java-0.996/MeCab.jar").stream().map(e->new File(e)).collect(Collectors.toList());
        Set<Class<?>> s = fff(filePath);
        for(Iterator<Class<?>> iterator = s.iterator();iterator.hasNext();){
            Class<?> clz = iterator.next();
            Map<Field,Class<?>> rtF = ddd(clz);
            for(Map.Entry<Field,Class<?>> entry : rtF.entrySet()){
                System.out.printf("%s\t%s\n",entry.getValue(),entry.getKey());
            }
            Map<Method,Class<?>> rtM = ggg(clz);
            for(Map.Entry<Method,Class<?>> entry : rtM.entrySet()){
                System.out.printf("%s\t%s\n",entry.getValue(),entry.getKey());
            }
        }
    }
    private static Map<Method,Class<?>> ggg(Class<?> e){
        Map<Method,Class<?>> rt = new HashMap<>();
        for (Method m : e.getMethods()){
            rt.put(m,e);
        }
        return rt;
    }
    private static Map<Field,Class<?>> ddd(Class<?> e){
        Map<Field,Class<?>> rt = new HashMap<>();
        for (Field m : e.getFields()){
            rt.put(m,e);
        }
        return rt;
    }
    public static <T> T uncheckCall(Callable<T> callable) {
        //これがいちばんすごいわ
        //https://blog1.mammb.com/entry/2015/03/31/001620
        try {
            return callable.call();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    private static Set<Class<?>> fff(List<File> lf) throws IOException {
        Set<Class<?>> rt = new HashSet<>();
        final ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        int mx = lf.size();
        for (int i=0;i<mx;i++){
            String paz = lf.get(i).getPath();
            if(paz.endsWith(".class")){

            }else{
                JarFile jarFile = new JarFile(paz);
                rt.addAll(Collections.list(jarFile.entries()).stream().map(e->e.getName()).filter(e->e.endsWith(".class")).map(e -> e.replace('/', '.').replaceAll(".class$", "")).map(e->uncheckCall(()->classLoader.loadClass(e))).collect(Collectors.toSet()));
            }
        }
        return rt;
    }
}