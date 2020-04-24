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

    private static Integer SEQ = 0;

    private static final ClassLoader classLoader = Thread.currentThread().getContextClassLoader();

    private final static String F = "~~~";
    private final static String R = "___";
    private final static String C = ",";
    private final static String CONST_SIGN = "CCCCC";
    private final static String METHOD_SIGN = "MMMMM";
    private final static String OFS = "\t";
    private final static String RS = "\n";
    private final static String CLASS_SEQ_DIGIT = "5";
    private final static String CLASS_GRP_DIGIT = "5";
    private final static String CLASS_GRPSEQ_DIGIT = "5";
    private final static String SIGNATURE_GRP_DIGIT = "5";
    private final static String SIGNATURE_GRPSEQ_DIGIT = "5";

    private static final String A1 = "行番号";
    private static final String COL_NAME_SEPARATOR = "~";
    private static final String COL_SEPARATOR = "\t";
    private static final String COL_VALUE_SEPARATOR = ",";

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

    public static Map<Integer,String> mkConstNameHashTbl = mkHashTbl(IntStream.rangeClosed(0,1).boxed().collect(Collectors.toList()),Arrays.asList(
            "クラス名" ,"定数名"));
    public static Map<Integer,String> mkMethodNameHashTbl = mkHashTbl(IntStream.rangeClosed(0,9).boxed().collect(Collectors.toList()), Arrays.asList(
            "クラス名"
            ,"アクセス修飾子"
            ,"戻り値の型"
            ,"メソッド名"
            ,"可変長引数があるか"
            ,"引数の個数"
            ,"型パラメータリスト"
            ,"型パラメータ記号リスト"
            ,"引数の型リスト"
            ,"仮引数の変数名リスト"));

    private static Map<Integer,String> mkHashTbl(List<Integer> k,List<String> v){
        return k.size()!=v.size()?new HashMap<>():k.stream().collect(Collectors.toMap(e->e,e->v.get(e)));
    }
    private static List<List<String>> mkListInList(Map<String,List<String>> m){
        return m.entrySet().stream().parallel().map(e -> flattenList(
                Arrays.asList(e.getKey().split(F)).subList(0, 4).stream().collect(Collectors.toList())
                , Arrays.asList(e.getKey().split(F)).subList(4, 5)
                , e.getValue()
        )).collect(Collectors.toList());
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
        Map<String, Set<String>> ms = IntStream.range(0,row).boxed().parallel().collect(Collectors.groupingBy(i->ll.get(i).get(endGrpColIdx-1)
                ,Collectors.mapping(i->ll.get(i).get(endGrpColIdx),Collectors.toSet())));

        String tblHead = A1+COL_SEPARATOR+ms.entrySet().stream().parallel()
                .flatMap(e->e.getValue().stream())
                .sorted(Comparator.comparing(e->Arrays.asList(e.split(COL_NAME_SEPARATOR)).subList(0,endGrpColIdx-1).stream().collect(Collectors.joining())))
                .collect(Collectors.joining(COL_SEPARATOR));

        //表側
        //PreProcess
        Map<String, Map<String,String>> preBody = IntStream.range(0,row).boxed().parallel()
                .collect(Collectors.groupingBy(i->ll.get(i).subList(0,endGrpColIdx).stream().collect(Collectors.joining(COL_NAME_SEPARATOR))
                        ,Collectors.groupingBy(i->ll.get(i).get(endGrpColIdx-1)
                                ,Collectors.mapping(i->ll.get(i).get(grpColIdx-1),Collectors.joining(COL_VALUE_SEPARATOR)))));

        //MidProcess
        Map<String,String> midBody = preBody.entrySet().stream().parallel().sorted(Comparator.comparing(e->e.getKey()))
                .collect(Collectors.groupingBy(e->Arrays.asList(e.getKey().split(COL_NAME_SEPARATOR)).subList(0,endGrpColIdx-1).stream().collect(Collectors.joining(COL_NAME_SEPARATOR))
                            ,Collectors.mapping(e->e.getValue().values().stream().limit(1).collect(Collectors.joining())
                                    ,Collectors.joining(COL_SEPARATOR))));

        Integer mx = tblHead.length()-tblHead.replace("\t","").length()+1;

        //PostProcess
        Map<String,String> tblBody = midBody.entrySet().stream().parallel()
                .collect(Collectors.toMap(e->e.getKey()
                        ,e->(e.getValue().length()-e.getValue().replace("\t","").length()+1)==mkMethodNameHashTbl.size()?
                                COL_SEPARATOR.repeat(mx-(e.getValue().length()-e.getValue().replace("\t","").length()+1)-1)+e.getValue()
                                :e.getValue()+COL_SEPARATOR.repeat(mx-(e.getValue().length()-e.getValue().replace("\t","").length()+1)-1)));

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
                                    entry.getKey().contains(CONST_SIGN)?mkConstNameHashTbl.get(i):mkMethodNameHashTbl.get(i)
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
    private static Map<String,List<String>> mkFieldMethodInfo(Map<Class<?>,String> m){
        Map<String,List<String>> rt = new LinkedHashMap<>();
        int grp=0;
        for(Map.Entry<Class<?>,String> entry : m.entrySet()){
            Class<?> clz = entry.getKey();
            Map<Field,Class<?>> rtF = mkFieldInfo(clz);
            Map<Method,Class<?>> rtM = mkMethodInfo(clz);
            ++grp;
            rt.putAll(mkFieldDetailInfo(entry.getValue(),rtF,grp));
            rt.putAll(mkMethodDetailInfo(entry.getValue(),rtM,grp));
        }
        return rt;
    }
    private static Map<String,List<String>> mkFieldDetailInfo(String key,Map<Field,Class<?>> rtF,Integer grp){
        //TODO こういうふうに書きたい
//        List<Field> l = new ArrayList<>(rtF.keySet());
//        int mx = l.size();
//        return IntStream.range(0,mx).boxed()
//                .parallel()
//                .reduce(
//                        new LinkedHashMap<>()
//                        ,(a,e)-> new LinkedHashMap<>() {{
//                            put(key + F + CONST_SIGN + F + String.format("%0" + CLASS_GRP_DIGIT + "d", grp) + F + String.format("%0" + CLASS_GRPSEQ_DIGIT + "d", e) + R + String.format("%0" + CLASS_SEQ_DIGIT + "d", ++SEQ)
//                                    , new ArrayList<>(Arrays.asList(String.valueOf(rtF.get(l.get(e)).getName()), l.get(e).getName())));
//                        }}
//                        ,(lft,rgt)->rgt //dummy
//               );
        int cnt = 0;
        Map<String,List<String>> rt = new LinkedHashMap<>();
        for(Map.Entry<Field,Class<?>> entry : rtF.entrySet()){
            rt.put(key+F+CONST_SIGN+F+String.format("%0"+CLASS_GRP_DIGIT+"d",grp)+F+String.format("%0"+CLASS_GRPSEQ_DIGIT+"d",++cnt)+R+String.format("%0"+CLASS_SEQ_DIGIT+"d",++SEQ)
                    , Arrays.asList(
                            String.valueOf(entry.getValue().getName())//クラス名
                            ,String.valueOf(entry.getKey().getName()))//定数名
            );
        }
        return rt;
    }
    private static Map<String,List<String>> mkMethodDetailInfo(String key,Map<Method,Class<?>> rtM,Integer grp){
        //TODO こういうふうに書きたい
//        List<Method> l = new ArrayList<>(rtM.keySet());
//        int mx = l.size();
//        return IntStream.range(0,mx).boxed()
//                .parallel()
//                .reduce(
//                        new LinkedHashMap<>()
//                        ,(a,e)-> new LinkedHashMap<>() {{
//                            put(key + F + METHOD_SIGN + F + String.format("%0" + CLASS_GRP_DIGIT + "d", grp) + F + String.format("%0" + CLASS_GRPSEQ_DIGIT + "d", e) + R + String.format("%0" + CLASS_SEQ_DIGIT + "d", ++SEQ)
//                                    , new ArrayList<>(
//                                            Arrays.asList(
//                                            rtM.get(l.get(e)).getName()//クラス名
//                                            ,Modifier.toString(l.get(e).getModifiers())//アクセス修飾子
//                                            ,l.get(e).getGenericReturnType().getTypeName()//戻り値の型
//                                            ,l.get(e).getName()//メソッド名
//                                            ,String.valueOf(l.get(e).isVarArgs())//可変長引数があるか
//                                            ,String.valueOf(l.get(e).getParameterCount())//引数の個数
//                                            ,Arrays.stream(l.get(e).getTypeParameters()).flatMap(e->Arrays.asList(e.getBounds()).stream()).map(ee->ee.getTypeName().replace(C,R)).collect(Collectors.joining(C))//型パラメータリスト
//                                            ,Arrays.stream(l.get(e).getTypeParameters()).map(e->e.getTypeName().replace(C,R)).collect(Collectors.joining(C))//型パラメータで使用しているアルファベット大文字記号リスト
//                                            ,Arrays.stream(l.get(e).getGenericParameterTypes()).map(e->e.getTypeName().replace(C,R)).collect(Collectors.joining(C)) //引数の型リスト
//                                            ,Arrays.stream(l.get(e).getParameters()).map(e->e.getName()).collect(Collectors.joining(C))//仮引数の変数名リスト
//                                            ))
//                            );
//                        }}
//                        ,(lft,rgt)->rgt //dummy
//               );
        int cnt = 0;
        Map<String,List<String>> rt = new LinkedHashMap<>();
        for(Map.Entry<Method,Class<?>> entry : rtM.entrySet()){
            rt.put(key+F+METHOD_SIGN+F+String.format("%0"+CLASS_GRP_DIGIT+"d",grp)+F+String.format("%0"+CLASS_GRPSEQ_DIGIT+"d",++cnt)+R+String.format("%0"+CLASS_SEQ_DIGIT+"d",++SEQ)
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
        return rt;
    }
    private static Map<Field,Class<?>> mkFieldInfo(Class<?> e){
        List<Field> l = Arrays.asList(e.getFields());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
    }
    private static Map<Method,Class<?>> mkMethodInfo(Class<?> e){
        List<Method> l = Arrays.asList(e.getMethods());
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
    private static void fileWriteOut (String outPutFileName,List<String> l){

        File destFile = new File(outPutFileName);
        if(destFile.exists()){
            destFile.delete();
        }

        try (FileOutputStream fos = new FileOutputStream(new File(outPutFileName));
             OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
             PrintWriter pw = new PrintWriter(new BufferedWriter(osw));) {
            l.stream().forEach(e-> {
                pw.println(e);
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static void main( String[] args ) throws IOException {

        //43 sec
        List<File> filePathList = Arrays.asList(
                "/usr/local/src/mecab-java-0.996/MeCab.jar" //13K
//                ,"/usr/local/src/idea-IC-192.7142.36/plugins/Kotlin/lib/javaslang-2.0.6.jar" //600K
//                ,"/home/kuraine/.m2/repository/it/unimi/dsi/fastutil/8.3.0/fastutil-8.3.0.jar" //18M
        ).stream().map(e->new File(e)).collect(Collectors.toList());

        int mx = filePathList.size();

        IntStream.range(0,mx).boxed().parallel().forEach(i->{
            List<List<String>> ll =mkListInList(unnest(mkFieldMethodInfo(uncheckCall(()->mkJarInfo2ClazzInfo(filePathList.get(i))))));

            int row = ll.size();

            List<List<String>> ll_rearrange = IntStream.range(0, row).boxed().map(e -> Arrays.asList(
                    ll.get(e).get(0)
                    , ll.get(e).get(2)
                    , ll.get(e).get(3)
                    , ll.get(e).get(1) + COL_NAME_SEPARATOR + ll.get(e).get(4)
                    , ll.get(e).get(1) + COL_NAME_SEPARATOR + ll.get(e).get(4) + COL_NAME_SEPARATOR + ll.get(e).get(5)
                    , ll.get(e).get(6)
            )).collect(Collectors.toList());

            CrossTab crossTab = new CrossTab();
            crossTab(ll_rearrange,4,6,crossTab);

            List<String> dat = new ArrayList<>();
            dat.add(crossTab.getTblHead());
            dat.addAll(crossTab.getTblBody().entrySet().stream().sorted(Comparator.comparing(e->e.getKey())).map(e->e.getKey()+COL_SEPARATOR+e.getValue()).collect(Collectors.toList()));

            fileWriteOut(filePathList.get(i).getName().replaceAll(".*/","").replace(".jar",".tsv"),dat);
        });
    }
}