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
import java.util.stream.Stream;

public class App {

    private final static String F = "~~~";
    private final static String R = "###";
    private final static String C = ",";
    private final static String CONST_SIGN = "CCCCC";
    private final static String METHOD_SIGN = "MMMMM";
    private final static String OFS = "\t";
    private final static String RS = "\n";
    private final static String CLASS_GRP_DIGIT = "5";
    private final static String CLASS_GRPSEQ_DIGIT = "5";
    private final static String SIGNATURE_GRP_DIGIT = "2";
    private final static String SIGNATURE_GRPSEQ_DIGIT = "2";

    public static class CrossTab {
        private String tblHead;//表頭
        private Map<String, String> tblBody;//表側

        public void setTblHead(String tblHead) {
            this.tblHead = tblHead;
        }

        public void setTblBody(Map<String, String> tblBody) {
            this.tblBody = tblBody;
        }

        public String getTblHead() {
            return tblHead;
        }

        public Map<String, String> getTblBody() {
            return tblBody;
        }
    }

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

    @SafeVarargs
    private static <K,V> List<Map.Entry<K,V>> jjj(Map<K,V>... maz){
        return IntStream.range(0,maz.length).boxed().flatMap(e->maz[e].entrySet().stream()).collect(Collectors.toList());
    }

    @SafeVarargs
    private static <K,V> Map<Integer,Map<K,V>> nnn(Map<K,V>... maz){
        return IntStream.range(0,maz.length).boxed().collect(Collectors.toMap(e->e,e->maz[e]));
    }

    public static void main( String[] args ) throws IOException {

        List<File> filePath = Arrays.asList(
                "/usr/local/src/mecab-java-0.996/MeCab.jar" //13K
//                ,"/usr/local/src/idea-IC-192.7142.36/plugins/Kotlin/lib/javaslang-2.0.6.jar" //600K
//                ,"/home/kuraine/.m2/repository/it/unimi/dsi/fastutil/8.3.0/fastutil-8.3.0.jar" //18M
                ).stream().map(e->new File(e)).collect(Collectors.toList());
//        List<File> filePath = Arrays.asList("/usr/local/src/idea-IC-192.7142.36/plugins/Kotlin/lib/javaslang-2.0.6.jar").stream().map(e->new File(e)).collect(Collectors.toList());

//        fileWriteOut(unnest(uuu(fff(filePath)))); //bottle neck
//        sss(unnest(uuu(fff(filePath)))).stream().forEach(list -> System.out.println(list));
        CrossTab crossTab = new CrossTab();
        crossTab(sss(unnest(uuu(fff(filePath)))),2,4,crossTab);
        Stream.of(crossTab.getTblHead()).forEach(e-> System.out.println(e));
        crossTab.getTblBody().entrySet().stream().sorted(Comparator.comparing(e->e.getKey())).forEach(e-> System.out.println(e.getKey()+"\t"+e.getValue()));
    }

    private static List<List<String>> sss(Map<String,List<String>> m){
        List<List<String>> ll = new ArrayList<>();
        for(Map.Entry<String,List<String>> entry : m.entrySet()){
            ll.add(flattenList(
                                List.of(Arrays.asList(entry.getKey().split(F)).subList(0,4).stream().collect(Collectors.joining(F)))
                                ,Arrays.asList(entry.getKey().split(F)).subList(4,5)
                                ,entry.getValue()
                                )
            );
        }
        return ll;
    }

    private static CrossTab crossTab(List<List<String>> ll,Integer endGrpColIdx,Integer grpColIdx          ,CrossTab crossTab){
        int row = ll.size();
        int col = ll.get(0).size();

        if(Stream.of(endGrpColIdx,grpColIdx).anyMatch(e->e<=0)){
            return null;
        }
        if(col<grpColIdx||col <= endGrpColIdx){
            return null;
        }
        if(grpColIdx <= endGrpColIdx){
            return null;
        }

        //表頭 //hard kaku konoke-sugatokusyu
        Map<String, Set<String>> ms = IntStream.range(0,row).boxed().collect(Collectors.groupingBy(i->ll.get(i).get(endGrpColIdx-1)
                ,Collectors.mapping(i->ll.get(i).get(endGrpColIdx),Collectors.toSet())));
        String tblHead = "行番号\t"+ms.values().stream().flatMap(e->e.stream()).collect(Collectors.joining("\t"));
        //表側
        //Preput
        Map<String, Map<String,String>> tmp = IntStream.range(0,row).boxed()
                                                    .collect(Collectors.groupingBy(i->ll.get(i).subList(0,endGrpColIdx).stream().collect(Collectors.joining("-"))
                                                            ,Collectors.groupingBy(i->ll.get(i).get(endGrpColIdx-1)
                                                                    ,Collectors.mapping(i->ll.get(i).get(grpColIdx-1),Collectors.joining(",")))));

        //Midput
        Map<String,String> tblBodyTmp = tmp.entrySet().stream().sorted(Comparator.comparing(e->e.getKey()))
                .collect(Collectors.groupingBy(e->e.getKey().split("-")[0]
                            ,Collectors.mapping(e->e.getValue().get(e.getKey().split("-")[1])
                                ,Collectors.joining("\t"))));

        Set<String> s = new HashSet<String>(ccc.values());
        Set<String> r = new HashSet<String>(ccc.values());
        s.retainAll(mmm.values());
        r.addAll(mmm.values());
        r.removeAll(s);

        Map<String,String> tblBody = new LinkedHashMap<>();
        for(Map.Entry<String,String> entry : tblBodyTmp.entrySet()){
            tblBody.put(entry.getKey()
                    ,entry.getValue()+Stream.generate(()->"\t").limit(r.size() - (entry.getValue().length()-entry.getValue().replace("\t","").length())).collect(Collectors.joining())
            );
        }
        //Set
        crossTab.setTblHead(tblHead);
        crossTab.setTblBody(tblBody);
        return crossTab;
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
                            entry.getKey()+F+String.format("%0"+SIGNATURE_GRP_DIGIT+"d",i)+F+String.format("%0"+SIGNATURE_GRPSEQ_DIGIT+"d",j)
                            ,Arrays.asList(
                                    entry.getKey().contains(CONST_SIGN)?ccc.get(i):mmm.get(i)
                                    ,liz.get(j).replace(R,C)));
                }
            }
        }
        return rt;
    }
    @SafeVarargs
    private static <E> List<E> flattenList(Collection<E>... liz){
        return Arrays.stream(liz).flatMap(e -> e.stream()).collect(Collectors.toList());
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
                rt.put(eeeee.getValue()+F+CONST_SIGN+F+String.format("%0"+CLASS_GRP_DIGIT+"d",grp)+F+String.format("%0"+CLASS_GRPSEQ_DIGIT+"d",cnt)
                        , Arrays.asList(
                                String.valueOf(entry.getValue().getName())//クラス名
                                ,String.valueOf(entry.getKey().getName()))//定数名
                );
            }
            Map<Method,Class<?>> rtM = ggg(clz);
            for(Map.Entry<Method,Class<?>> entry : rtM.entrySet()){
                ++cnt;
                rt.put(eeeee.getValue()+F+METHOD_SIGN+F+String.format("%0"+CLASS_GRP_DIGIT+"d",grp)+F+String.format("%0"+CLASS_GRPSEQ_DIGIT+"d",cnt)
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