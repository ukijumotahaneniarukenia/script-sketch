package app;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {

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
    public static void main( String[] args ) {
        List<List<String>> X = Arrays.asList(
                Arrays.asList("00001","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00001","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00001","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00001","03","戻り値の型","boolean")
                ,Arrays.asList("00002","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00002","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00002","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00002","03","戻り値の型","boolean")
        );
//        行番号	クラス名	仮引数の変数名リスト	戻り値の型
//        00001	org.chasen.mecab.Model	arg0,arg1	boolean
//        00002	org.chasen.mecab.Model	arg0,arg1	boolean

        List<List<String>> XX = Arrays.asList(
                Arrays.asList("00001","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00001","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00001","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00001","02","戻り値の型","boolean")
                ,Arrays.asList("00001","04","XXX","~~~")
                ,Arrays.asList("00002","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00002","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00002","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00002","02","戻り値の型","boolean")
                ,Arrays.asList("00002","04","XXX","---")
        );
        //グループ化列名はでたらめにつけると予期せぬ
//        行番号	クラス名	戻り値の型	仮引数の変数名リスト	XXX
//        00001	org.chasen.mecab.Model	arg0,arg1,boolean	~~~
//        00002	org.chasen.mecab.Model	arg0,arg1,boolean	---
        List<List<String>> XXX = Arrays.asList(
                Arrays.asList("00001","M","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00001","M","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00001","M","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00001","M","03","戻り値の型","boolean")
                ,Arrays.asList("00001","C","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00001","C","02","定数名","JJJJJJJJ")
                ,Arrays.asList("00002","M","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00002","M","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00002","M","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00002","M","03","戻り値の型","boolean")
                ,Arrays.asList("00002","C","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00002","C","02","定数名","KKKKKKKK")
        );
//        行番号	C-クラス名	C-定数名	M-クラス名	M-仮引数の変数名リスト	M-戻り値の型
//        00001	org.chasen.mecab.Model	JJJJJJJJ	org.chasen.mecab.Model	arg0,arg1	boolean
//        00002	org.chasen.mecab.Model	KKKKKKKK	org.chasen.mecab.Model	arg0,arg1	boolean
        List<List<String>> XXXX = Arrays.asList(
                Arrays.asList("00001","M","m","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00001","M","m","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00001","M","mm","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00001","M","mm","03","戻り値の型","boolean")
                ,Arrays.asList("00001","C","c","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00001","C","c","02","定数名","JJJJJJJJ")
                ,Arrays.asList("00002","M","m","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00002","M","m","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00002","M","mm","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00002","M","mm","03","戻り値の型","boolean")
                ,Arrays.asList("00002","C","c","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00002","C","c","02","定数名","KKKKKKKK")
        );
//        行番号	C-c-クラス名	C-c-定数名	M-mm-仮引数の変数名リスト	M-mm-戻り値の型	M-m-クラス名	M-m-仮引数の変数名リスト
//        00001	org.chasen.mecab.Model	JJJJJJJJ	org.chasen.mecab.Model	arg0	arg1	boolean
//        00002	org.chasen.mecab.Model	KKKKKKKK	org.chasen.mecab.Model	arg0	arg1	boolean

        CrossTab crossTab = new CrossTab();

        crossTab(X,2,4,crossTab);
        //Output
        Stream.of(crossTab.getTblHead()).forEach(e-> System.out.println(e));
        crossTab.getTblBody().entrySet().stream().sorted(Comparator.comparing(e->e.getKey())).forEach(e-> System.out.println(e.getKey()+COL_SEPARATOR+e.getValue()));

        crossTab(XX,2,4,crossTab);
        //Output
        Stream.of(crossTab.getTblHead()).forEach(e-> System.out.println(e));
        crossTab.getTblBody().entrySet().stream().sorted(Comparator.comparing(e->e.getKey())).forEach(e-> System.out.println(e.getKey()+COL_SEPARATOR+e.getValue()));

        crossTab(XXX,3,5,crossTab);
        //Output
        Stream.of(crossTab.getTblHead()).forEach(e-> System.out.println(e));
        crossTab.getTblBody().entrySet().stream().sorted(Comparator.comparing(e->e.getKey())).forEach(e-> System.out.println(e.getKey()+COL_SEPARATOR+e.getValue()));

        crossTab(XXXX,4,6,crossTab);
        //Output
        Stream.of(crossTab.getTblHead()).forEach(e-> System.out.println(e));
        crossTab.getTblBody().entrySet().stream().sorted(Comparator.comparing(e->e.getKey())).forEach(e-> System.out.println(e.getKey()+COL_SEPARATOR+e.getValue()));
    }

    private static List<List<String>> transpose(List<List<String>> l){
        String[][] s = new String[l.get(0).size()][l.size()];
        for(int i=0;i<l.size();i++){
            int n = l.get(0).size();
            for(int j=0;j<n;j++){
                s[j][i]=l.get(i).get(j);
            }
        }
        return Arrays.stream(s).map(e->Arrays.asList(e)).collect(Collectors.toList());
    }

    private static CrossTab crossTab(List<List<String>> ll,Integer endGrpColIdx,Integer grpColIdx          ,CrossTab crossTab){
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
                ,Collectors.mapping(i->ll.get(i).stream().skip(1).limit(endGrpColIdx-2).collect(Collectors.joining(COL_NAME_SEPARATOR))
                        +(ll.get(i).stream().skip(1).limit(endGrpColIdx-2).collect(Collectors.joining(COL_NAME_SEPARATOR)).isEmpty()?"":COL_NAME_SEPARATOR)
                        +ll.get(i).get(endGrpColIdx),Collectors.toSet())));

        String tblHead = A1+COL_SEPARATOR+ ms.entrySet().stream()
                .flatMap(e->e.getValue().stream())
                .sorted(Comparator.comparing(e->Arrays.asList(e.split(COL_NAME_SEPARATOR)).subList(0,endGrpColIdx).stream().collect(Collectors.joining())))
                .collect(Collectors.joining(COL_SEPARATOR));

        //表側
        //Preput
        Map<String, Map<String,String>> tmp = IntStream.range(0,row).boxed()
                .collect(Collectors.groupingBy(i->ll.get(i).subList(0,endGrpColIdx).stream().collect(Collectors.joining(COL_NAME_SEPARATOR))
                            ,Collectors.groupingBy(i->ll.get(i).get(endGrpColIdx-1)
                                    ,Collectors.mapping(i->ll.get(i).get(grpColIdx-1),Collectors.joining(COL_VALUE_SEPARATOR)))));
        //Midput
        Map<String,String> tblBody = tmp.entrySet().stream().sorted(Comparator.comparing(e->e.getKey()))
                .collect(Collectors.groupingBy(e->Arrays.asList(e.getKey().split(COL_NAME_SEPARATOR)).subList(0,1).stream().collect(Collectors.joining(COL_NAME_SEPARATOR))
                        ,Collectors.mapping(e->e.getValue().values().stream().limit(1).collect(Collectors.joining()),Collectors.joining(COL_SEPARATOR))));

        //Set
        crossTab.setTblHead(tblHead);
        crossTab.setTblBody(tblBody);
        return crossTab;
    }
}