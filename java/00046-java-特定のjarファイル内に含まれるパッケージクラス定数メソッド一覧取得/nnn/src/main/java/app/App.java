package app;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.jar.JarFile;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class App {

    public static Map<Integer,String> ccc = hhh(IntStream.rangeClosed(0,1).boxed().collect(Collectors.toList()),Arrays.asList("クラス名" ,"定数名"));
    public static Map<Integer,String> mmm = hhh(IntStream.rangeClosed(0,9).boxed().collect(Collectors.toList()), Arrays.asList(
            "クラス名"
            ,"アクセス修飾子"
            ,"戻り値の型"
            ,"メソッド名"
            ,"可変長引数があるか"
            ,"引数の個数"
            ,"型パラメータリスト"
            ,"型パラメータで使用しているアルファベット大文字記号リスト"
            ,"引数の型リスト"
            ,"仮引数の変数名リスト")
    );

    private static Map<Integer,String> hhh(List<Integer> k,List<String> v){
        if(k.size()!=v.size()){
            return new HashMap<>();
        }else{
            return k.stream().collect(Collectors.toMap(e->e,e->v.get(e)));
        }
    }

    private static List<String> yyy(String s){

        //split使えばいい

        List<String> rt = new ArrayList<>();
        int cnt = s.length()-s.replace(",","").length()+1;
        for(int i=0;i<cnt;i++){
            s=s.substring(s.indexOf(",")+1);
            rt.add(s.substring(0,-1==s.indexOf(",")?s.length():s.indexOf(",")));
        }
        return rt;
    }

    public static void main( String[] args ) throws IOException {

        List<File> filePath = Arrays.asList("/usr/local/src/mecab-java-0.996/MeCab.jar").stream().map(e->new File(e)).collect(Collectors.toList());
//        List<File> filePath = Arrays.asList("/usr/local/src/idea-IC-192.7142.36/plugins/Kotlin/lib/javaslang-2.0.6.jar").stream().map(e->new File(e)).collect(Collectors.toList());
        Set<Class<?>> s = fff(filePath);
        Map<String,List<String>> rt = uuu(s);
        for(Map.Entry<String,List<String>> entry : rt.entrySet()){
            int mx = entry.getValue().size();
            for(int i =0;i<mx;i++){
                List<String> liz = Arrays.asList(entry.getValue().get(i).split(","));
                int cnt = liz.size();
                for(int j=0;j<cnt;j++){
                    System.out.printf("%s\t%s\t%s\t%s\t%s\n"
                            ,entry.getKey()
                            ,i
                            ,j
                            ,entry.getKey().indexOf("C")>0?ccc.get(i):mmm.get(i)
                            ,liz.get(j)
                            ,entry.getValue()
                    );
                }
            }
        }
    }

    private static Map<String,List<String>> uuu(Set<Class<?>> s){
        Map<String,List<String>> rt = new LinkedHashMap<>();

        int grp=0;
        int cnt=0;
        for(Iterator<Class<?>> iterator = s.iterator();iterator.hasNext();){
            Class<?> clz = iterator.next();
            Map<Field,Class<?>> rtF = ddd(clz);
            ++grp;
            for(Map.Entry<Field,Class<?>> entry : rtF.entrySet()){
                ++cnt;
                rt.put("C"+"-"+String.format("%05d",grp)+"-"+String.format("%05d",cnt)
                        , Arrays.asList(
                                String.valueOf(entry.getValue().getName())//クラス名
                                ,String.valueOf(entry.getKey().getName()))//定数名
                );
            }
            Map<Method,Class<?>> rtM = ggg(clz);
            for(Map.Entry<Method,Class<?>> entry : rtM.entrySet()){
                ++cnt;
                rt.put("M"+"-"+String.format("%05d",grp)+"-"+String.format("%05d",cnt)
                        ,Arrays.asList(
                                entry.getValue().getName()//クラス名
                                ,Modifier.toString(entry.getKey().getModifiers())//アクセス修飾子
                                ,entry.getKey().getGenericReturnType().getTypeName()//戻り値の型
                                ,entry.getKey().getName()//メソッド名
                                ,String.valueOf(entry.getKey().isVarArgs())//可変長引数があるか
                                ,String.valueOf(entry.getKey().getParameterCount())//引数の個数
                                ,Arrays.stream(entry.getKey().getTypeParameters()).flatMap(e->Arrays.asList(e.getBounds()).stream()).map(ee->ee.getTypeName()).collect(Collectors.joining(","))//型パラメータリスト
                                ,Arrays.stream(entry.getKey().getTypeParameters()).map(e->e.getTypeName()).collect(Collectors.joining(","))//型パラメータで使用しているアルファベット大文字記号リスト
                                ,Arrays.stream(entry.getKey().getGenericParameterTypes()).map(e->e.getTypeName()).collect(Collectors.joining(",")) //引数の型リスト
                                ,Arrays.stream(entry.getKey().getParameters()).map(e->e.getName()).collect(Collectors.joining(","))//仮引数の変数名リスト
                        ));
            }
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