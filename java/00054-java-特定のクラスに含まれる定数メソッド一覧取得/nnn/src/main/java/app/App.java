package app;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;

public class App {
    private final static String F = "---";
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

    private static final String A1 = "行番号";
    private static final String COL_NAME_SEPARATOR = "-";
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

    public static Map<Integer,String> ccc = hhh(IntStream.rangeClosed(0,1).boxed().collect(toList()), Arrays.asList("クラス名" ,"定数名"));
    public static Map<Integer,String> mmm = hhh(IntStream.rangeClosed(0,9).boxed().collect(toList()), Arrays.asList(
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
    private static final ClassLoader classLoader = Thread.currentThread().getContextClassLoader();

    public static void main( String[] args ) throws ClassNotFoundException {
        Map<Class<?>,String> m = Arrays.asList("java.lang.Thread","java.lang.ClassLoader").stream()
                .map(e->uncheckCall(()->classLoader.loadClass(e))).collect(Collectors.toMap(ee->ee,ee->ee.getName()));
        List<List<String>> ll = unnest(uuu(m)).entrySet().stream().map(e-> flattenList(Arrays.asList(e.getKey().split(F)).subList(0,e.getKey().split(F).length-1).stream().collect(Collectors.toList()),e.getValue())).collect(Collectors.toList());

        ll.stream().limit(30).forEach(l-> System.out.println(l));
//[java.lang.Thread, CCCCC, 00001, 00001, 00, クラス名, java.lang.Thread]
//[java.lang.Thread, CCCCC, 00001, 00001, 01, 定数名, NORM_PRIORITY]
//[java.lang.Thread, CCCCC, 00001, 00002, 00, クラス名, java.lang.Thread]
//[java.lang.Thread, CCCCC, 00001, 00002, 01, 定数名, MAX_PRIORITY]
//[java.lang.Thread, CCCCC, 00001, 00003, 00, クラス名, java.lang.Thread]
//[java.lang.Thread, CCCCC, 00001, 00003, 01, 定数名, MIN_PRIORITY]
//[java.lang.Thread, MMMMM, 00001, 00004, 00, クラス名, java.lang.Thread]
//[java.lang.Thread, MMMMM, 00001, 00004, 01, アクセス修飾子, public final]
//[java.lang.Thread, MMMMM, 00001, 00004, 02, 戻り値の型, boolean]
//[java.lang.Thread, MMMMM, 00001, 00004, 03, メソッド名, isDaemon]
//[java.lang.Thread, MMMMM, 00001, 00004, 04, 可変長引数があるか, false]
//[java.lang.Thread, MMMMM, 00001, 00004, 05, 引数の個数, 0]
//[java.lang.Thread, MMMMM, 00001, 00004, 06, 型パラメータリスト, ]
//[java.lang.Thread, MMMMM, 00001, 00004, 07, 型パラメータ記号リスト, ]
//[java.lang.Thread, MMMMM, 00001, 00004, 08, 引数の型リスト, ]
//[java.lang.Thread, MMMMM, 00001, 00004, 09, 仮引数の変数名リスト, ]
//[java.lang.Thread, MMMMM, 00001, 00005, 00, クラス名, java.lang.Thread]
//[java.lang.Thread, MMMMM, 00001, 00005, 01, アクセス修飾子, public]
//[java.lang.Thread, MMMMM, 00001, 00005, 02, 戻り値の型, java.lang.StackTraceElement[]]
//[java.lang.Thread, MMMMM, 00001, 00005, 03, メソッド名, getStackTrace]
//[java.lang.Thread, MMMMM, 00001, 00005, 04, 可変長引数があるか, false]
//[java.lang.Thread, MMMMM, 00001, 00005, 05, 引数の個数, 0]
//[java.lang.Thread, MMMMM, 00001, 00005, 06, 型パラメータリスト, ]
//[java.lang.Thread, MMMMM, 00001, 00005, 07, 型パラメータ記号リスト, ]
//[java.lang.Thread, MMMMM, 00001, 00005, 08, 引数の型リスト, ]
//[java.lang.Thread, MMMMM, 00001, 00005, 09, 仮引数の変数名リスト, ]
//[java.lang.Thread, MMMMM, 00001, 00006, 00, クラス名, java.lang.Thread]
//[java.lang.Thread, MMMMM, 00001, 00006, 01, アクセス修飾子, public final]
//[java.lang.Thread, MMMMM, 00001, 00006, 02, 戻り値の型, void]
//[java.lang.Thread, MMMMM, 00001, 00006, 03, メソッド名, join]

        int row = ll.size();

        List<List<String>> ll_rearrange = IntStream.range(0,row).boxed()
                .collect(Collectors.mapping(e->Arrays.asList(
                        ll.get(e).get(0)
                        ,ll.get(e).get(2)
                        ,ll.get(e).get(3)
                        ,ll.get(e).get(1)+COL_NAME_SEPARATOR+ll.get(e).get(4)
                        ,ll.get(e).get(1)+COL_NAME_SEPARATOR+ll.get(e).get(4)+COL_NAME_SEPARATOR+ll.get(e).get(5)
                        ,ll.get(e).get(6)
                ),Collectors.toList()));

        ll_rearrange.stream().limit(30).forEach(l-> System.out.println(l));
//[java.lang.Thread, 00001, 00001, CCCCC-00, CCCCC-00-クラス名, java.lang.Thread]
//[java.lang.Thread, 00001, 00001, CCCCC-01, CCCCC-01-定数名, NORM_PRIORITY]
//[java.lang.Thread, 00001, 00002, CCCCC-00, CCCCC-00-クラス名, java.lang.Thread]
//[java.lang.Thread, 00001, 00002, CCCCC-01, CCCCC-01-定数名, MAX_PRIORITY]
//[java.lang.Thread, 00001, 00003, CCCCC-00, CCCCC-00-クラス名, java.lang.Thread]
//[java.lang.Thread, 00001, 00003, CCCCC-01, CCCCC-01-定数名, MIN_PRIORITY]
//[java.lang.Thread, 00001, 00004, MMMMM-00, MMMMM-00-クラス名, java.lang.Thread]
//[java.lang.Thread, 00001, 00004, MMMMM-01, MMMMM-01-アクセス修飾子, public final]
//[java.lang.Thread, 00001, 00004, MMMMM-02, MMMMM-02-戻り値の型, boolean]
//[java.lang.Thread, 00001, 00004, MMMMM-03, MMMMM-03-メソッド名, isDaemon]
//[java.lang.Thread, 00001, 00004, MMMMM-04, MMMMM-04-可変長引数があるか, false]
//[java.lang.Thread, 00001, 00004, MMMMM-05, MMMMM-05-引数の個数, 0]
//[java.lang.Thread, 00001, 00004, MMMMM-06, MMMMM-06-型パラメータリスト, ]
//[java.lang.Thread, 00001, 00004, MMMMM-07, MMMMM-07-型パラメータ記号リスト, ]
//[java.lang.Thread, 00001, 00004, MMMMM-08, MMMMM-08-引数の型リスト, ]
//[java.lang.Thread, 00001, 00004, MMMMM-09, MMMMM-09-仮引数の変数名リスト, ]
//[java.lang.Thread, 00001, 00005, MMMMM-00, MMMMM-00-クラス名, java.lang.Thread]
//[java.lang.Thread, 00001, 00005, MMMMM-01, MMMMM-01-アクセス修飾子, public]
//[java.lang.Thread, 00001, 00005, MMMMM-02, MMMMM-02-戻り値の型, java.lang.StackTraceElement[]]
//[java.lang.Thread, 00001, 00005, MMMMM-03, MMMMM-03-メソッド名, getStackTrace]
//[java.lang.Thread, 00001, 00005, MMMMM-04, MMMMM-04-可変長引数があるか, false]
//[java.lang.Thread, 00001, 00005, MMMMM-05, MMMMM-05-引数の個数, 0]
//[java.lang.Thread, 00001, 00005, MMMMM-06, MMMMM-06-型パラメータリスト, ]
//[java.lang.Thread, 00001, 00005, MMMMM-07, MMMMM-07-型パラメータ記号リスト, ]
//[java.lang.Thread, 00001, 00005, MMMMM-08, MMMMM-08-引数の型リスト, ]
//[java.lang.Thread, 00001, 00005, MMMMM-09, MMMMM-09-仮引数の変数名リスト, ]
//[java.lang.Thread, 00001, 00006, MMMMM-00, MMMMM-00-クラス名, java.lang.Thread]
//[java.lang.Thread, 00001, 00006, MMMMM-01, MMMMM-01-アクセス修飾子, public final]
//[java.lang.Thread, 00001, 00006, MMMMM-02, MMMMM-02-戻り値の型, void]
//[java.lang.Thread, 00001, 00006, MMMMM-03, MMMMM-03-メソッド名, join]

        CrossTab crossTab = new CrossTab();
        crossTab(ll_rearrange,4,6,crossTab);

        Stream.of(crossTab.getTblHead()).forEach(e-> System.out.println(e));
        crossTab.getTblBody().entrySet().stream().limit(30)
                .sorted(Comparator.comparing(e->e.getKey()))
                .forEach(e->System.out.println(e.getKey()+COL_SEPARATOR+e.getValue()));
//        行番号	CCCCC-00-クラス名	CCCCC-01-定数名	MMMMM-00-クラス名	MMMMM-01-アクセス修飾子	MMMMM-02-戻り値の型	MMMMM-03-メソッド名	MMMMM-04-可変長引数があるか	MMMMM-05-引数の個数	MMMMM-06-型パラメータリスト	MMMMM-07-型パラメータ記号リスト	MMMMM-08-引数の型リスト	MMMMM-09-仮引数の変数名リスト
//        java.lang.ClassLoader-00002-00053			java.lang.ClassLoader	public	java.lang.String	toString	false	0
//        java.lang.ClassLoader-00002-00054			java.lang.ClassLoader	public static	java.io.InputStream	getSystemResourceAsStream	false	1			java.lang.String	arg0
//        java.lang.ClassLoader-00002-00055			java.lang.ClassLoader	public	java.lang.Class<?>	loadClass	false	1			java.lang.String	arg0
//        java.lang.ClassLoader-00002-00080			java.lang.ClassLoader	public final native	java.lang.Class<?>	getClass	false	0
//        java.lang.ClassLoader-00002-00081			java.lang.ClassLoader	public final native	void	notifyAll	false	0
//        java.lang.Thread-00001-00001	java.lang.Thread	NORM_PRIORITY
//        java.lang.Thread-00001-00002	java.lang.Thread	MAX_PRIORITY
//        java.lang.Thread-00001-00003	java.lang.Thread	MIN_PRIORITY
//        java.lang.Thread-00001-00004			java.lang.Thread	public final	boolean	isDaemon	false	0
//        java.lang.Thread-00001-00005			java.lang.Thread	public	java.lang.StackTraceElement[]	getStackTrace	false	0
//        java.lang.Thread-00001-00006			java.lang.Thread	public final	void	join	false	0
//        java.lang.Thread-00001-00007			java.lang.Thread	public final synchronized	void	join	false	2			long,int	arg0,arg1
//        java.lang.Thread-00001-00008			java.lang.Thread	public final synchronized	void	join	false	1			long	arg0
//        java.lang.Thread-00001-00009			java.lang.Thread	public	boolean	equals	false	1			java.lang.Object	arg0
//        java.lang.Thread-00001-00030			java.lang.Thread	public static	boolean	interrupted	false	0
//        java.lang.Thread-00001-00031			java.lang.Thread	public final native	void	notifyAll	false	0
//        java.lang.Thread-00001-00032			java.lang.Thread	public static native	void	yield	false	0
//        java.lang.Thread-00001-00033			java.lang.Thread	public static	void	sleep	false	2			long,int	arg0,arg1
//        java.lang.Thread-00001-00034			java.lang.Thread	public static native	void	sleep	false	1			long	arg0
//        java.lang.Thread-00001-00035			java.lang.Thread	public static	int	enumerate	false	1			java.lang.Thread[]	arg0
//        java.lang.Thread-00001-00040			java.lang.Thread	public	java.lang.Thread$State	getState	false	0
//        java.lang.Thread-00001-00041			java.lang.Thread	public static native	boolean	holdsLock	false	1			java.lang.Object	arg0
//        java.lang.Thread-00001-00042			java.lang.Thread	public final	void	setDaemon	false	1			boolean	arg0
//        java.lang.Thread-00001-00043			java.lang.Thread	public	java.lang.String	toString	false	0
//        java.lang.Thread-00001-00044			java.lang.Thread	public native	int	countStackFrames	false	0
//        java.lang.Thread-00001-00045			java.lang.Thread	public final	int	getPriority	false	0
//        java.lang.Thread-00001-00046			java.lang.Thread	public static	void	dumpStack	false	0
//        java.lang.Thread-00001-00047			java.lang.Thread	public	boolean	isInterrupted	false	0
//        java.lang.Thread-00001-00048			java.lang.Thread	public final	void	resume	false	0
//        java.lang.Thread-00001-00049			java.lang.Thread	public static	int	activeCount	false	0
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
                        ,e->(e.getValue().length()-e.getValue().replace(COL_SEPARATOR,"").length()+1)==mmm.size()?
                                COL_SEPARATOR.repeat(mx-(e.getValue().length()-e.getValue().replace(COL_SEPARATOR,"").length()+1)-1)+e.getValue()
                                :e.getValue()+COL_SEPARATOR.repeat(mx-(e.getValue().length()-e.getValue().replace(COL_SEPARATOR,"").length()+1)-1)));

        //Set
        crossTab.setTblHead(tblHead);
        crossTab.setTblBody(tblBody);
        return crossTab;
    }
    private static void fileWriteOut (Map<String,List<String>> m){
        final String SUFFIX = ".tsv";
        String preFileName = m.entrySet().stream().limit(1).map(e->e.getKey().split(F)[0]).collect(Collectors.joining()) + SUFFIX;
        try{
            File destFile = new File(preFileName);
            if(destFile.exists()){
                destFile.delete();
            }
            FileWriter fw = new FileWriter(preFileName, true);
            //前回成果物ファイルを削除
            for(Map.Entry<String,List<String>> entry : m.entrySet()) {
                if (!preFileName.equals(entry.getKey().split(F)[0])) {
                    fw.close();
                    destFile = new File(entry.getKey().split(F)[0] + SUFFIX);
                    destFile.delete();
                    fw = new FileWriter(entry.getKey().split(F)[0] + SUFFIX, true);
                }
                fw.write(Arrays.asList(entry.getKey().split(F)).stream().collect(Collectors.joining(OFS))+OFS+entry.getValue().stream().collect(Collectors.joining(OFS)));
                fw.write(RS);
                preFileName = entry.getKey().split(F)[0];
            }
            fw.close();
        }catch(IOException e){
            e.printStackTrace();
        }
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
    private static Map<Method,Class<?>> ggg(Class<?> e){
        List<Method> l = Arrays.asList(e.getMethods());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
    }
    private static Map<Field,Class<?>> ddd(Class<?> e){
        List<Field> l = Arrays.asList(e.getFields());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i),i->e));
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
                                , Modifier.toString(entry.getKey().getModifiers())//アクセス修飾子
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
}