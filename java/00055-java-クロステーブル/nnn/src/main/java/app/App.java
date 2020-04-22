package app;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    static class CrossTab{
        private String tblHead;//表頭
        private Map<String,String> tblBody;//表側
        public CrossTab(String tblHead,Map<String,String> tblBody){
            this.tblHead=tblHead;
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
        List<List<String>> ll = Arrays.asList(
                Arrays.asList("00001","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00001","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00001","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00001","03","戻り値の型","boolean")
                ,Arrays.asList("00002","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00002","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00002","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00002","03","戻り値の型","boolean")
        );

        int row = ll.size();

        //表頭
        Map<String, Set<String>> ms = IntStream.range(0,row).boxed().collect(Collectors.groupingBy(i->ll.get(i).get(1),Collectors.mapping(i->ll.get(i).get(2),Collectors.toSet())));
        String tblHead = "行番号\t"+ms.values().stream().flatMap(e->e.stream()).collect(Collectors.joining("\t"));
        //表側

        //Preput
        Map<String, Map<String,String>> tmp = IntStream.range(0,row).boxed()
                .collect(Collectors.groupingBy(i->ll.get(i).get(0)+"-"+ll.get(i).get(1)
                        ,Collectors.groupingBy(i->ll.get(i).get(1)
                                ,Collectors.mapping(i->ll.get(i).get(3),Collectors.joining(",")))));
        //Midput
        Map<String,String> tblBody = tmp.entrySet().stream().sorted(Comparator.comparing(e->e.getKey()))
                .collect(Collectors.groupingBy(e->e.getKey().split("-")[0]
                            ,Collectors.mapping(e->e.getValue().get(e.getKey().split("-")[1]),Collectors.joining("\t"))));

        //Set
        CrossTab crossTab = new CrossTab(tblHead,tblBody);

        //Output
        Stream.of(crossTab.getTblHead()).forEach(e-> System.out.println(e));
        crossTab.getTblBody().entrySet().stream().sorted(Comparator.comparing(e->e.getKey())).forEach(e-> System.out.println(e.getKey()+"\t"+e.getValue()));
    }
}