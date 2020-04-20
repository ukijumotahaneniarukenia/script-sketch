package app;

import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.jar.JarFile;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class App {

    private final static String F = "---";
    private final static String R = "###";
    private final static String C = ",";
    private final static String CONST_SIGN = "CCCCC";
    private final static String METHOD_SIGN = "MMMMM";
    private final static String OFS = "\t";
    private final static String RS = "\n";
    private final static String CLASS_GRP = "5";
    private final static String CLASS_GRPSEQ = "5";
    private final static String SIGNATURE_GRP = "2";
    private final static String SIGNATURE_GRPSEQ = "2";

    public static Map<Integer,String> ccc = hhh(IntStream.rangeClosed(0,1).boxed().collect(Collectors.toList()),Arrays.asList("クラス名" ,"定数名"));
    public static Map<Integer,String> mmm = hhh(IntStream.rangeClosed(0,9).boxed().collect(Collectors.toList()), Arrays.asList(
            "クラス名"
            ,"アクセス修飾子"
            ,"戻り値の型"
            ,"メソッド名"
            ,"可変長引数があるか"
            ,"引数の個数"
            ,"型パラメータリスト"
            ,"型パラメータ記号リスト"
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
        int cnt = s.length()-s.replace(C,"").length()+1;
        for(int i=0;i<cnt;i++){
            s=s.substring(s.indexOf(C)+1);
            rt.add(s.substring(0,-1==s.indexOf(C)?s.length():s.indexOf(C)));
        }
        return rt;
    }

    public static void main( String[] args ) throws IOException {

        List<File> filePath = Arrays.asList(
                "/usr/local/src/mecab-java-0.996/MeCab.jar" //13K
                ,"/usr/local/src/idea-IC-192.7142.36/plugins/Kotlin/lib/javaslang-2.0.6.jar" //600K
                ,"/home/kuraine/.m2/repository/it/unimi/dsi/fastutil/8.3.0/fastutil-8.3.0.jar" //18M
                ).stream().map(e->new File(e)).collect(Collectors.toList());
//        List<File> filePath = Arrays.asList("/usr/local/src/idea-IC-192.7142.36/plugins/Kotlin/lib/javaslang-2.0.6.jar").stream().map(e->new File(e)).collect(Collectors.toList());
//        fff(filePath);
//        uuu(fff(filePath));
//        unnest(uuu(fff(filePath)));

        fileWriteOut(unnest(uuu(fff(filePath)))); //bottle neck
    }
    private static Map<String,List<String>> unnest(Map<String,List<String>> m){
        Map<String,List<String>> rt = new LinkedHashMap<>();
        for(Map.Entry<String,List<String>> entry : m.entrySet()){
            int mx = entry.getValue().size();
            for(int i =0;i<mx;i++){
                List<String> liz = Arrays.asList(entry.getValue().get(i).split(C));
                int cnt = liz.size();
                for(int j=0;j<cnt;j++){
                    rt.put(
                            entry.getKey()+F+String.format("%0"+SIGNATURE_GRP+"d",i)+F+String.format("%0"+SIGNATURE_GRPSEQ+"d",j)
                            ,Arrays.asList(
                                    entry.getKey().contains(CONST_SIGN)?ccc.get(i):mmm.get(i)
                                    ,liz.get(j).replace(R,C)));
                }
            }
        }
        return rt;
    }
    private static void fileWriteOut (Map<String,List<String>> m){
        final String SEARCH = "jar";
        final String SUFFIX = "tsv";
        String preFileName = m.entrySet().stream().limit(1).map(e->e.getKey().substring(0,e.getKey().indexOf(SEARCH))+SUFFIX).collect(Collectors.joining());
        try{
            File destFile = new File(preFileName);
            destFile.delete();
            FileWriter fw = new FileWriter(preFileName, true);
            //前回成果物ファイルを削除
            for(Map.Entry<String,List<String>> entry : m.entrySet()) {
                if (!preFileName.equals(entry.getKey().substring(0, entry.getKey().indexOf(SEARCH)))) {
                    fw.close();
                    destFile = new File(entry.getKey().substring(0, entry.getKey().indexOf(SEARCH)) + SUFFIX);
                    destFile.delete();
                    fw = new FileWriter(entry.getKey().substring(0, entry.getKey().indexOf(SEARCH)) + SUFFIX, true);
                }
                fw.write(Arrays.asList(entry.getKey().split(F)).stream().collect(Collectors.joining(OFS))+OFS+entry.getValue().stream().collect(Collectors.joining(OFS)));
                fw.write(RS);
                preFileName = entry.getKey().substring(0, entry.getKey().indexOf(SEARCH));
            }
            fw.close();
        }catch(IOException e){
            e.printStackTrace();
        }
    }
    private static Map<String,List<String>> uuu(Map<Class<?>,String> m){
        Map<String,List<String>> rt = new LinkedHashMap<>();
        int grp=0;
        int cnt=0;
        for(Map.Entry<Class<?>,String> eeeee : m.entrySet()){
            Class<?> clz = eeeee.getKey();
            Map<Field,Class<?>> rtF = ddd(clz);
            ++grp;
            for(Map.Entry<Field,Class<?>> entry : rtF.entrySet()){
                ++cnt;
                rt.put(eeeee.getValue()+F+CONST_SIGN+F+String.format("%0"+CLASS_GRP+"d",grp)+F+String.format("%0"+CLASS_GRPSEQ+"d",cnt)
                        , Arrays.asList(
                                String.valueOf(entry.getValue().getName())//クラス名
                                ,String.valueOf(entry.getKey().getName()))//定数名
                );
            }
            Map<Method,Class<?>> rtM = ggg(clz);
            for(Map.Entry<Method,Class<?>> entry : rtM.entrySet()){
                ++cnt;
                rt.put(eeeee.getValue()+F+METHOD_SIGN+F+String.format("%0"+CLASS_GRP+"d",grp)+F+String.format("%0"+CLASS_GRPSEQ+"d",cnt)
                        ,Arrays.asList(
                                entry.getValue().getName()//クラス名
                                ,Modifier.toString(entry.getKey().getModifiers())//アクセス修飾子
                                ,entry.getKey().getGenericReturnType().getTypeName()//戻り値の型
                                ,entry.getKey().getName()//メソッド名
                                ,String.valueOf(entry.getKey().isVarArgs())//可変長引数があるか
                                ,String.valueOf(entry.getKey().getParameterCount())//引数の個数
                                ,Arrays.stream(entry.getKey().getTypeParameters()).flatMap(e->Arrays.asList(e.getBounds()).stream()).map(ee->ee.getTypeName().replace(C,R)).collect(Collectors.joining(C))//型パラメータリスト
                                ,Arrays.stream(entry.getKey().getTypeParameters()).map(e->e.getTypeName().replace(C,R)).collect(Collectors.joining(C))//型パラメータで使用しているアルファベット大文字記号リスト
                                ,Arrays.stream(entry.getKey().getGenericParameterTypes()).map(e->e.getTypeName().replace(C,R)).collect(Collectors.joining(C)) //引数の型リスト
                                ,Arrays.stream(entry.getKey().getParameters()).map(e->e.getName()).collect(Collectors.joining(C))//仮引数の変数名リスト
                        ));
            }
        }
        return rt;
    }
    private static Map<Method,Class<?>> ggg(Class<?> e){
        List<Method> l = Arrays.asList(e.getMethods());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
    }
    private static Map<Field,Class<?>> ddd(Class<?> e){
        List<Field> l = Arrays.asList(e.getFields());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
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
    private static Map<Class<?>,String> fff(List<File> lf) throws IOException {
        Map<Class<?>,String> rt = new LinkedHashMap<>();
        final ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        int mx = lf.size();
        for (int i=0;i<mx;i++){
            String paz = lf.get(i).getPath();
            if(paz.endsWith(".class")){

            }else{
                JarFile jarFile = new JarFile(paz);
                int ii = i;
                rt.putAll(Collections.list(jarFile.entries()).stream().parallel().map(e->e.getName()).filter(e->e.endsWith(".class")).map(e -> e.replace('/', '.').replaceAll(".class$", "")).map(e->uncheckCall(()->classLoader.loadClass(e))).collect(Collectors.toMap(e->e, e->lf.get(ii).getName())));
            }
        }
        return rt;
    }
}