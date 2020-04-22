package app;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
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
        List<List<String>> ll = Arrays.asList(
                Arrays.asList("00001","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00001","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00001","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00001","03","戻り値の型","boolean")
                ,Arrays.asList("00001","04","XXX","~~~")
                ,Arrays.asList("00002","01","クラス名","org.chasen.mecab.Model")
                ,Arrays.asList("00002","02","仮引数の変数名リスト","arg0")
                ,Arrays.asList("00002","02","仮引数の変数名リスト","arg1")
                ,Arrays.asList("00002","03","戻り値の型","boolean")
                ,Arrays.asList("00002","04","XXX","---")
        );
//
//        int row = ll.size();
//
//        //表頭
//        Map<String, Set<String>> ms = IntStream.range(0,row).boxed().collect(Collectors.groupingBy(i->ll.get(i).get(1),Collectors.mapping(i->ll.get(i).get(2),Collectors.toSet())));
//        String tblHead = "行番号\t"+ms.values().stream().flatMap(e->e.stream()).collect(Collectors.joining("\t"));
//
//
//        //表側
//        //Preput
//        Map<String, Map<String,String>> tmp = IntStream.range(0,row).boxed()
//                .collect(Collectors.groupingBy(i->ll.get(i).subList(0,2).stream().collect(Collectors.joining("-"))
//                            ,Collectors.groupingBy(i->ll.get(i).get(2-1)
//                                    ,Collectors.mapping(i->ll.get(i).get(3),Collectors.joining(",")))));
//
//        //Midput
//        Map<String,String> tblBody = tmp.entrySet().stream().sorted(Comparator.comparing(e->e.getKey()))
//                .collect(Collectors.groupingBy(e->e.getKey().split("-")[0]
//                            ,Collectors.mapping(e->e.getValue().get(e.getKey().split("-")[1]),Collectors.joining("\t"))));
//
//        //Set
        CrossTab crossTab = new CrossTab();


//        crossTab=crossTab(ll,2,4,crossTab);//OK
//        crossTab=crossTab(ll,2,7,crossTab); //Error
//        crossTab=crossTab(ll,2,2,crossTab); //Error
//        crossTab=crossTab(ll,3,2,crossTab); //Error
//        crossTab=crossTab(ll,7,2,crossTab); //Error
//        crossTab=crossTab(ll,7,2,crossTab); //Error
//        crossTab=crossTab(ll,7,-1,crossTab); //Error
//        crossTab=crossTab(ll,-1,-1,crossTab); //Error
//        crossTab=crossTab(ll,-1,7,crossTab); //Error
//        crossTab=crossTab(ll,0,7,crossTab); //Error
//        crossTab=crossTab(ll,2,0,crossTab); //Error
//        crossTab=crossTab(ll,0,0,crossTab); //Error

        if(!Optional.ofNullable(crossTab).isPresent()){
            System.out.println("Error.");
            System.exit(1);
        }

        //Output
        Stream.of(crossTab.getTblHead()).forEach(e-> System.out.println(e));
        crossTab.getTblBody().entrySet().stream().sorted(Comparator.comparing(e->e.getKey())).forEach(e-> System.out.println(e.getKey()+"\t"+e.getValue()));

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
        //表頭
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
        Map<String,String> tblBody = tmp.entrySet().stream().sorted(Comparator.comparing(e->e.getKey()))
                .collect(Collectors.groupingBy(e->e.getKey().split("-")[0]
                        ,Collectors.mapping(e->e.getValue().get(e.getKey().split("-")[1]),Collectors.joining("\t"))));

        //Set
        crossTab.setTblHead(tblHead);
        crossTab.setTblBody(tblBody);
        return crossTab;
    }
}