package app;

import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.jar.JarFile;
import java.util.regex.Pattern;
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

    public static Map<Integer,String> mkConstNameHashTbl = uncheckCall(()->mkHashTbl(IntStream.rangeClosed(0,1).boxed().collect(Collectors.toList()),Arrays.asList(
            "クラス名" ,"定数名")));
    public static Map<Integer,String> mkMethodNameHashTbl = uncheckCall(()->mkHashTbl(IntStream.rangeClosed(0,9).boxed().collect(Collectors.toList()), Arrays.asList(
            "クラス名"
            ,"アクセス修飾子"
            ,"戻り値の型"
            ,"メソッド名"
            ,"可変長引数があるか"
            ,"引数の個数"
            ,"型パラメータリスト"
            ,"型パラメータ記号リスト"
            ,"引数の型リスト"
            ,"仮引数の変数名リスト")));

    private static Map<Integer,String> mkHashTbl(List<Integer> k,List<String> v)throws Exception{
        return k.size()!=v.size()?new HashMap<>():k.stream().collect(Collectors.toMap(e->e,e->v.get(e)));
    }
    private static List<List<String>> mkListInList(Map<String,List<String>> m)throws Exception{
        return m.entrySet().stream().parallel().map(e -> uncheckCall(()->flattenList(
                Arrays.asList(e.getKey().split(F)).subList(0, 4).stream().collect(Collectors.toList())
                , Arrays.asList(e.getKey().split(F)).subList(4, 5)
                , e.getValue()
        ))).collect(Collectors.toList());
    }
    private static CrossTab crossTab(List<List<String>> ll,Integer endGrpColIdx,Integer grpColIdx,CrossTab crossTab)throws Exception{
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
    private static Map<String,List<String>> unnest(Map<String,List<String>> m)throws Exception{
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
    private static <E> List<E> flattenList(Collection<E>... liz)throws Exception{
        return Arrays.stream(liz).flatMap(e -> e.stream()).collect(Collectors.toList());
    }
    private static Map<String,List<String>> mkFieldMethodInfo(Map<Class<?>,String> m)throws Exception{
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
    private static Map<String,List<String>> mkFieldDetailInfo(String key,Map<Field,Class<?>> rtF,Integer grp)throws Exception{
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
    private static Map<String,List<String>> mkMethodDetailInfo(String key,Map<Method,Class<?>> rtM,Integer grp)throws Exception{
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
    private static Map<Field,Class<?>> mkFieldInfo(Class<?> e)throws Exception{
        List<Field> l = Arrays.asList(e.getFields());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
    }
    private static Map<Method,Class<?>> mkMethodInfo(Class<?> e)throws Exception{
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
    private static Map<Class<?>,String> mkJarInfo2ClazzInfo(File f) throws Exception{
        String path = f.getPath();
        if(path.endsWith(".class")){
            return new LinkedHashMap<>();
        }else{
            return uncheckCall(()->Collections.list(new JarFile(path).entries()).stream()
                    .parallel()
                    .map(e->e.getName())
                    .filter(e->e.endsWith(".class"))
                    .map(e -> e.replace('/', '.').replaceAll(".class$", ""))
                    .map(e->uncheckCall(()->classLoader.loadClass(e)))
                    .collect(Collectors.toMap(e->e, e->f.getName())));
        }
    }
    private static void fileWriteOut (String outPutFileName,List<String> l)throws Exception{

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
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private static boolean exclude(List<String> nonTgtFile,File f)throws Exception{
        return nonTgtFile.stream().noneMatch(e->f.getName().contains(e));
    }

    private static List<List<String>> rearrange(List<List<String>> ll)throws Exception{
        return IntStream.range(0, ll.size()).boxed().map(e -> Arrays.asList(
                ll.get(e).get(0)
                , ll.get(e).get(2)
                , ll.get(e).get(3)
                , ll.get(e).get(1) + COL_NAME_SEPARATOR + ll.get(e).get(4)
                , ll.get(e).get(1) + COL_NAME_SEPARATOR + ll.get(e).get(4) + COL_NAME_SEPARATOR + ll.get(e).get(5)
                , ll.get(e).get(6)
        )).collect(Collectors.toList());
    }

    private static List<File> skipFileList = new ArrayList<>();
    private static List<File> errorFileList = new ArrayList<>();
    private static List<File> processFileList = new ArrayList<>();

    public static void main( String[] args )throws Exception{

        Path baseDir = Paths.get("/home/kuraine/.m2");
        String targetExtension  = "jar";
        String includeExtensionPtn = ("(?i)^.*\\." + Pattern.quote(targetExtension) + "$");

        List<String> nonTgtFile = Arrays.asList(
                "/home/kuraine/.m2/repository/org/sonatype/aether/aether-impl/1.7/aether-impl-1.7.jar"
                ,"/home/kuraine/.m2/repository/org/apache/maven/surefire/maven-surefire-common/2.12.4/maven-surefire-common-2.12.4.jar"
                ,"/home/kuraine/.m2/repository/org/codehaus/plexus/plexus-utils/1.5.10/plexus-utils-1.5.10.jar"
                ,"/home/kuraine/.m2/repository/org/beanshell/bsh/2.0b4/bsh-2.0b4.jar"
                ,"/home/kuraine/.m2/repository/org/apache/maven/shared/maven-shared-utils/0.3/maven-shared-utils-0.3.jarException"
                ,"/home/kuraine/.m2/repository/com/vladsch/flexmark/flexmark-formatter/0.18.4/flexmark-formatter-0.18.4.jar"
                ,"/home/kuraine/.m2/repository/org/codehaus/plexus/plexus-java/0.9.10/plexus-java-0.9.10.jar"
                ,"/home/kuraine/.m2/repository/org/codehaus/plexus/plexus-utils/3.0/plexus-utils-3.0.jar"
                ,"/home/kuraine/.m2/repository/sslext/sslext/1.2-0/sslext-1.2-0.jar"
                ,"/home/kuraine/.m2/repository/org/apache/maven/shared/maven-shared-utils/3.0.1/maven-shared-utils-3.0.1.jar"
                ,"/home/kuraine/.m2/repository/org/codehaus/plexus/plexus-java/0.9.10/plexus-java-0.9.10.jar"
//                ,"plexus"
                ,"/home/kuraine/.m2/repository/org/apache/maven/maven-error-diagnostics/2.0.6/maven-error-diagnostics-2.0.6.jar"
                ,"/home/kuraine/.m2/repository/org/apache/pdfbox/fontbox/2.0.4/fontbox-2.0.4.jar"
                ,"/home/kuraine/.m2/repository/commons-io/commons-io/2.2/commons-io-2.2.jar"
        );

        List<File> filePathList = uncheckCall(()->Files.walk(baseDir)
                .parallel()
                .map(e->e.toFile())
                .filter(e->e.isFile())
                .filter(e->e.getAbsolutePath().matches(includeExtensionPtn))
                .filter(e->uncheckCall(()->exclude(nonTgtFile,e)))
                .collect(Collectors.toList()));
//        real	0m22.252s
//        user	2m21.820s
//        sys	0m3.428s
//        List<File> filePathList = Arrays.asList(
//                "/usr/local/src/mecab-java-0.996/MeCab.jar" //13K
//                ,"/usr/local/src/idea-IC-192.7142.36/plugins/Kotlin/lib/javaslang-2.0.6.jar" //600K
//                ,"/home/kuraine/.m2/repository/it/unimi/dsi/fastutil/8.3.0/fastutil-8.3.0.jar" //18M
//        ).stream().parallel().map(e->new File(e)).collect(Collectors.toList());
//
        int mx = filePathList.size();


        //TODO jarファイルのなにがしかの異常検知をしたい　んで　スキップ件数だしたい
        IntStream.range(0,mx).boxed().parallel().forEach(i->{

            System.out.println(filePathList.get(i));

            if(uncheckCall(()->exclude(nonTgtFile,filePathList.get(i)))){
                skipFileList.add(filePathList.get(i));
            }

            List<List<String>> ll_rearrange = new ArrayList<>();
            try{
                ll_rearrange =rearrange(mkListInList(unnest(mkFieldMethodInfo(uncheckCall(()->mkJarInfo2ClazzInfo(filePathList.get(i)))))));
            }catch(Exception ex){
                ex.printStackTrace();
                errorFileList.add(filePathList.get(i));
            }

            CrossTab crossTab = new CrossTab();
            try{
                crossTab(ll_rearrange,4,6,crossTab);
            }catch(Exception ex){
                ex.printStackTrace();
                errorFileList.add(filePathList.get(i));
            }

            List<String> dat = new ArrayList<>();
            try{
                dat.add(crossTab.getTblHead());
                dat.addAll(crossTab.getTblBody().entrySet().stream().sorted(Comparator.comparing(e->e.getKey())).map(e->e.getKey()+COL_SEPARATOR+e.getValue()).collect(Collectors.toList()));
            }catch(Exception ex){
                ex.printStackTrace();
                errorFileList.add(filePathList.get(i));
            }

            try{
                fileWriteOut(filePathList.get(i).getName().replaceAll(".*/","").replace(".jar",".tsv.done"),dat);
            }catch(Exception ex){
                ex.printStackTrace();
                errorFileList.add(filePathList.get(i));
            }

            processFileList.add(filePathList.get(i));
        });

        System.out.printf("TGT-CNT:%s\tPROCESS-CNT:%s\tSKIP-CNT:%s\tERROR-CNT:%s\n",filePathList.size(),processFileList.size(),skipFileList.size(),errorFileList.size());

    }
}