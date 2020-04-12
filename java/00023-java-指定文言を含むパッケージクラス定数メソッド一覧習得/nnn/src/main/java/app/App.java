package app;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.jar.JarFile;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

//Exception in thread "main" java.lang.VerifyError: class com.google.common.collect.EmptyImmutableList overrides final method com.google.common.collect.ImmutableCollection.toArray([Ljava/lang/Object;)[Ljava/lang/Object

public class App {
    private static List<String> SEARCH_WORD = null;

    private static List<String> DEFAULT_SEARCH_WORD = new ArrayList<>(Arrays.asList("string","icu"));

    public static <T> T uncheckCall(Callable<T> callable) {
        //これがいちばんすごいわ
        //https://blog1.mammb.com/entry/2015/03/31/001620
        try {
            return callable.call();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String... args) throws Exception {

        if(0==args.length){
            SEARCH_WORD = DEFAULT_SEARCH_WORD;
        }else{
            SEARCH_WORD = new ArrayList<>(Arrays.asList(args));
        }

        //外部ファイルのみも含めた全て
        List<String> l = new ArrayList<>(Arrays.asList(System.getProperty("java.class.path").split(":")));
        List<File> ll = l.stream().map(e->new File(e)).collect(Collectors.toList());
        List<File> rt = new ArrayList<>();
        rt = jjj(ll,rt);
        Set<Class<?>> sss = fff(rt);
        for(Iterator<Class<?>> iterator = sss.iterator();iterator.hasNext();){
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

    private static Map<Field,Class<?>> ddd(Class<?> e){
        Map<Field,Class<?>> rt = new HashMap<>();
        for (Field m : e.getFields()){
            rt.put(m,e);
        }
        return rt;
    }

    private static Map<Method,Class<?>> ggg(Class<?> e){
        Map<Method,Class<?>> rt = new HashMap<>();
        for (Method m : e.getMethods()){
            rt.put(m,e);
        }
        return rt;
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
                rt.addAll(Collections.list(jarFile.entries()).stream().map(e->e.getName()).filter(e->e.endsWith(".class")).filter(e->include(e)).filter(e->exclude(e)).map(e -> e.replace('/', '.').replaceAll(".class$", "")).map(e->uncheckCall(()->classLoader.loadClass(e))).collect(Collectors.toSet()));
            }
        }
        return rt;
    }

    private static boolean include(String s){
        List<String> includePtnList = new ArrayList<>() ;
        includePtnList.addAll(SEARCH_WORD);
        String includePtn = includePtnList.stream().map(e -> "|".concat(e)).collect(Collectors.joining()).replaceAll("^\\|","");
        Pattern p = Pattern.compile(includePtn);
        Matcher m = p.matcher(s);
        return m.find();
    }

    private static boolean exclude(String s){
        List<String> excludePtnList = new ArrayList<>(Arrays.asList("javax","servlet")) ;
        String excludePtn = excludePtnList.stream().map(e -> "|".concat(e)).collect(Collectors.joining()).replaceAll("^\\|","");
        Pattern p = Pattern.compile(excludePtn);
        Matcher m = p.matcher(s);
        return !m.find();
    }

    private static List<File> jjj(List<File> lf,List<File> rt){
        for(int i=0;i<lf.size();i++){
            if(lf.get(i).isFile()){
                rt.add(lf.get(i));
            }else{
                for(File e : lf.get(i).listFiles()){
                    if(e.isDirectory()){
                        jjj(new ArrayList<>(Arrays.asList(e)),rt);
                    }else{
                        rt.add(e);
                    }
                }
            }
        }
        return rt;
    }
}