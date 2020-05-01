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
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;

public class App {



    private static final String PROGRAM_NAME = "jardump";

    private static Integer SEQ = 0;
    private static final Integer SUCCESS_STATUS = 0;
    private static final Integer ERROR_STATUS = 1;
    private static final String F = "---";
    private static final String R = "###";
    private static final String C = ",";
    private static final String CONST_SIGN = "CCCCC";
    private static final String METHOD_SIGN = "MMMMM";
    private static final String CLASS_SEQ_DIGIT = "5";
    private static final String CLASS_GRP_DIGIT = "5";
    private static final String CLASS_GRPSEQ_DIGIT = "5";
    private static final String SIGNATURE_GRP_DIGIT = "2";
    private static final String SIGNATURE_GRPSEQ_DIGIT = "2";

    private static final String A1 = "行番号";
    private static final String COL_NAME_SEPARATOR = "-";
    private static final String COL_SEPARATOR = "\t";
    private static final String COL_VALUE_SEPARATOR = ",";

    private static final ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    private static final Map<Integer,String> CONST_COL_NAME_LIST = mkColHashMap(IntStream.rangeClosed(0,1).boxed().collect(toList()), Arrays.asList("クラス名" ,"定数名"));
    private static final Map<Integer,String> METHOD_COL_NAME_LIST = mkColHashMap(IntStream.rangeClosed(0,9).boxed().collect(toList()), Arrays.asList(
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

    public static class CrossTab{
        private String tblHead;//表頭
        private Map<String,String> tblBody;//表側
        public void setTblHead(String tblHead) {
            this.tblHead=tblHead;
        }
        public void setTblBody(Map<String,String> tblBody) {
            this.tblBody=tblBody;
        }
        public String getTblHead() {
            return tblHead;
        }
        public Map<String, String> getTblBody() {
            return tblBody;
        }
    }

    private static Map<Integer,String> mkColHashMap(List<Integer> k,List<String> v){
        if(k.size()!=v.size()){
            return new HashMap<>();
        }else{
            return k.stream().collect(Collectors.toMap(e->e, e->v.get(e)));
        }
    }
    public static <T> T uncheckCall(Callable<T> callable) {
        //パールの暗黙の変数みたいなものだろう。すべてのコンテキストに含まれている隠しオブジェクト。callableはすべての例外をグルーピングしている
        //これがいちばんすごいわ
        //https://blog1.mammb.com/entry/2015/03/31/001620
        try {
            return callable.call();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    private static List<List<String>> preProcess(Map<Class<?>,String> m ) {
        return unnest(wrapperClassInfo(m)).entrySet().stream()
                .map(e-> flattenList(new ArrayList<>(Arrays.asList(e.getKey().split(F)).subList(0, e.getKey().split(F).length - 1)),e.getValue())).collect(Collectors.toList());
    }
    private static List<List<String>> midProcess(List<List<String>> ll) {
        int row = ll.size();
        return IntStream.range(0, row).boxed().parallel().map(e -> Arrays.asList(
                ll.get(e).get(0).replace(COL_NAME_SEPARATOR,R)
                , ll.get(e).get(2)
                , ll.get(e).get(3)
                , ll.get(e).get(1) + COL_NAME_SEPARATOR + ll.get(e).get(4)
                , ll.get(e).get(1) + COL_NAME_SEPARATOR + ll.get(e).get(4) + COL_NAME_SEPARATOR + ll.get(e).get(5)
                , ll.get(e).get(6)
        )).collect(Collectors.toList());
    }
    private static void postProcess(List<List<String>> ll_rearrange,CrossTab crossTab){
        crossTab(ll_rearrange,4,6,crossTab);
        Stream.of(crossTab.getTblHead()).forEach(e-> System.out.println(e));
        crossTab.getTblBody().entrySet().stream()
                .sorted(Comparator.comparing(e->e.getKey()))
                .forEach(e->{
                    ++SEQ;
                    System.out.println(String.format("%0"+CLASS_SEQ_DIGIT+"d",SEQ)+COL_NAME_SEPARATOR+e.getKey().replace(R,COL_NAME_SEPARATOR)+COL_SEPARATOR+e.getValue());
                });
    }
    @SafeVarargs
    private static <E> List<E> flattenList(Collection<E>... liz){
        return Arrays.stream(liz).flatMap(e -> e.stream()).collect(Collectors.toList());
    }
    private static CrossTab crossTab(List<List<String>> ll,Integer endGrpColIdx,Integer grpColIdx,CrossTab crossTab){
        int row = ll.size();
        int col = IntStream.range(0,row).boxed().map(i->ll.get(i).size()).min(Comparator.comparingInt(e->e)).get();

        if(Stream.of(endGrpColIdx,grpColIdx).anyMatch(e->e<=0)){
            return null;
        }
        if(col<grpColIdx||col <= endGrpColIdx){
            return null;
        }
        if(grpColIdx <= endGrpColIdx){
            return null;
        }
        //表頭
        Map<String, Set<String>> ms = IntStream.range(0,row).boxed().collect(Collectors.groupingBy(i->ll.get(i).get(endGrpColIdx-1)
                ,Collectors.mapping(i->ll.get(i).get(endGrpColIdx),Collectors.toSet())));

        String tblHead = A1+COL_SEPARATOR+ms.entrySet().stream()
                .flatMap(e->e.getValue().stream())
                .sorted(Comparator.comparing(e->Arrays.asList(e.split(COL_NAME_SEPARATOR)).subList(0,endGrpColIdx-1).stream().collect(Collectors.joining())))
                .collect(Collectors.joining(COL_SEPARATOR));

        //表側
        //PreProcess
        Map<String, Map<String,String>> preBody = IntStream.range(0,row).boxed()
                .collect(Collectors.groupingBy(i->ll.get(i).subList(0,endGrpColIdx).stream().collect(Collectors.joining(COL_NAME_SEPARATOR))
                        ,Collectors.groupingBy(i->ll.get(i).get(endGrpColIdx-1)
                                ,Collectors.mapping(i->ll.get(i).get(grpColIdx-1),Collectors.joining(COL_VALUE_SEPARATOR)))));

        //MidProcess
        Map<String,String> midBody = preBody.entrySet().stream().sorted(Comparator.comparing(e->e.getKey()))
                .collect(Collectors.groupingBy(e->Arrays.asList(e.getKey().split(COL_NAME_SEPARATOR)).subList(0,endGrpColIdx-1).stream().collect(Collectors.joining(COL_NAME_SEPARATOR))
                        ,Collectors.mapping(e->e.getValue().values().stream().limit(1).collect(Collectors.joining())
                                ,Collectors.joining(COL_SEPARATOR))));

        Integer mx = tblHead.length()-tblHead.replace(COL_SEPARATOR,"").length()+1;

        //PostProcess
        Map<String,String> tblBody = midBody.entrySet().stream()
                .collect(Collectors.toMap(e->e.getKey()
                        ,e->(e.getValue().length()-e.getValue().replace(COL_SEPARATOR,"").length()+1)==METHOD_COL_NAME_LIST.size()?
                                COL_SEPARATOR.repeat(mx-(e.getValue().length()-e.getValue().replace(COL_SEPARATOR,"").length()+1)-1)+e.getValue()
                                :e.getValue()+COL_SEPARATOR.repeat(mx-(e.getValue().length()-e.getValue().replace(COL_SEPARATOR,"").length()+1)-1)));

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
                                    entry.getKey().contains(CONST_SIGN)?CONST_COL_NAME_LIST.get(i):METHOD_COL_NAME_LIST.get(i)
                                    ,liz.get(j).replace(R,C)));
                }
            }
        }
        return rt;
    }
    private static Map<Method,Class<?>> getMethodInfo(Class<?> e){
        List<Method> l = Arrays.asList(e.getMethods());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
    }
    private static Map<Field,Class<?>> getFieldInfo(Class<?> e){
        List<Field> l = Arrays.asList(e.getFields());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
    }
    private static Map<String,List<String>> wrapperFieldInfo(Integer grp,Map.Entry<Class<?>,String> entryClass,Class<?> clz){
        Map<String,List<String>> rt = new LinkedHashMap<>();
        int cnt = 0;
        for(Map.Entry<Field,Class<?>> entryField : getFieldInfo(clz).entrySet()){
            ++cnt;
            rt.put(entryClass.getValue()+F+CONST_SIGN+F+String.format("%0"+CLASS_GRP_DIGIT+"d",grp)+F+String.format("%0"+CLASS_GRPSEQ_DIGIT+"d",cnt)
                    ,Arrays.asList(
                            String.valueOf(entryField.getValue().getName())//クラス名
                            ,String.valueOf(entryField.getKey().getName())//定数名
                    )
            );
        }
        return rt;
    }
    private static Map<String,List<String>> wrapperMethodInfo(Integer grp,Map.Entry<Class<?>,String> entryClass,Class<?> clz){
        Map<String,List<String>> rt = new LinkedHashMap<>();
        int cnt = 0;
        for(Map.Entry<Method,Class<?>> entryMethod : getMethodInfo(clz).entrySet()){
            ++cnt;
            rt.put(entryClass.getValue()+F+METHOD_SIGN+F+String.format("%0"+CLASS_GRP_DIGIT+"d",grp)+F+String.format("%0"+CLASS_GRPSEQ_DIGIT+"d",cnt)
                    ,Arrays.asList(
                            entryMethod.getValue().getName()//クラス名
                            , Modifier.toString(entryMethod.getKey().getModifiers())//アクセス修飾子
                            ,entryMethod.getKey().getGenericReturnType().getTypeName()//戻り値の型
                            ,entryMethod.getKey().getName()//メソッド名
                            ,String.valueOf(entryMethod.getKey().isVarArgs())//可変長引数があるか
                            ,String.valueOf(entryMethod.getKey().getParameterCount())//引数の個数
                            ,Arrays.stream(entryMethod.getKey().getTypeParameters()).flatMap(e->Arrays.asList(e.getBounds()).stream()).map(ee->ee.getTypeName().replace(C,R)).collect(Collectors.joining(C))//型パラメータリスト
                            ,Arrays.stream(entryMethod.getKey().getTypeParameters()).map(e->e.getTypeName().replace(C,R)).collect(Collectors.joining(C))//型パラメータで使用しているアルファベット大文字記号リスト
                            ,Arrays.stream(entryMethod.getKey().getGenericParameterTypes()).map(e->e.getTypeName().replace(C,R)).collect(Collectors.joining(C)) //引数の型リスト
                            ,Arrays.stream(entryMethod.getKey().getParameters()).map(e->e.getName()).collect(Collectors.joining(C))//仮引数の変数名リスト
                    ));
        }
        return rt;
    }
    private static Map<String,List<String>> wrapperClassInfo(Map<Class<?>,String> classsInfoMap){
        Map<String,List<String>> rt = new LinkedHashMap<>();
        int grp=0;
        for(Map.Entry<Class<?>,String> entryClass : classsInfoMap.entrySet()){
            Class<?> clz = entryClass.getKey();
            ++grp;
            rt.putAll(wrapperFieldInfo(grp,entryClass,clz));
            rt.putAll(wrapperMethodInfo(grp,entryClass,clz));
        }
        return rt;
    }
    private static Map<Class<?>,String> mkJarInfo2ClazzInfo(File f) throws IOException {
        String path = f.getPath();
        if(path.endsWith(".class")){
            return new LinkedHashMap<>();
        }else{
            JarFile jarFile = new JarFile(path);
            return Collections.list(jarFile.entries()).stream()
                    .parallel()
                    .map(e->e.getName())
                    .filter(e->e.endsWith(".class"))
                    .map(e -> e.replace('/', '.').replaceAll(".class$", ""))
                    .map(e->uncheckCall(()->classLoader.loadClass(e)))
                    .collect(Collectors.toMap(e->e, e->f.getName()));
        }
    }
    public static void main(String... args){
        List<File> cmdLineArgs = Arrays.asList(args).stream().parallel().map(e->new File(e)).collect(Collectors.toList());
        int ret = SUCCESS_STATUS;
        if(cmdLineArgs.size()==0){
            System.out.printf("Usage\n"+PROGRAM_NAME +" "+ Stream.of("/home/kuraine/.m2/repository/commons-lang/commons-lang/2.4/commons-lang-2.4.jar").collect(Collectors.joining(" "))+"\n");
            System.exit(SUCCESS_STATUS);
        }

        Map<Class<?>,String> m = cmdLineArgs.stream().flatMap(e->uncheckCall(()->mkJarInfo2ClazzInfo(e)).entrySet().stream()).collect(Collectors.toMap(e->e.getKey(),e->e.getValue(),(pre,post)->post,LinkedHashMap::new));

        List<List<String>> ll = preProcess(m);

        List<List<String>> ll_rearrange = midProcess(ll);

        CrossTab crossTab = new CrossTab();
        postProcess(ll_rearrange,crossTab);
        System.exit(ret);
    }
}