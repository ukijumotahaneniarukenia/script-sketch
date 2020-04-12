package app;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Stream;

import static java.util.stream.Collectors.*;

public class App {
    public static void main(String... cmdline_args) {
        String[][] dat = {
                {"1","1","1","1","2020-04-10","7","LVJMLDEB"}
                ,{"2","1","1","2","2020-04-11","3","ORDNJMJG"}
                ,{"3","1","1","3","2020-04-12","5","UIVUF"}
                ,{"4","1","2","1","2020-04-10","2","DATQ"}
                ,{"5","1","2","2","2020-04-11","6","J"}
                ,{"6","1","2","3","2020-04-12","9","JAPJ"}
                ,{"7","1","3","1","2020-04-10","5","SXPQDH"}
                ,{"8","2","1","1","2020-04-10","9","LAROPRBUQ"}
                ,{"9","2","1","2","2020-04-11","5","UQKFMCMNY"}
                ,{"10","2","2","1","2020-04-10","8","VEKJZZCE"}
                ,{"11","2","2","2","2020-04-11","1","ERHFFDDO"}
                ,{"12","2","2","3","2020-04-12","8","UFT"}
                ,{"13","2","3","1","2020-04-10","7","U"}
                ,{"14","2","3","2","2020-04-11","4","PZ"}
                ,{"15","3","1","1","2020-04-10","2","BVJQNRVE"}
        };
        int row = dat.length;
        int col = dat[0].length;
        List<List<String>> l = new ArrayList<>();
        for(int i=0;i<row;i++){
            List<String> c = new ArrayList<>();
            for (int j =0;j<col;j++){
                c.add(dat[i][j]);
            }
            l.add(c);
        }
        List<Item> in = l.stream().map(e->new Item(e)).collect(toList());//body
        //単一グループによる件数取得
        Map<LocalDateTime,Long> m = in.stream().collect(groupingBy(e->e.getDtm(),counting()));
        for(Map.Entry<LocalDateTime,Long> entry : m.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey().format(DateTimeFormatter.ofPattern("uuuu-MM-dd")),entry.getValue());
        }
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
        //単一グループによる最大値取得
        Map<LocalDateTime, Optional<Item>> mm = in.stream().collect(groupingBy(e->e.getDtm(),maxBy(Comparator.comparingInt(e->e.getQty()))));
        for(Map.Entry<LocalDateTime,Optional<Item>> entry : mm.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey().format(DateTimeFormatter.ofPattern("uuuu-MM-dd")),entry.getValue().get().getQty());
        }
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
        //単一グループによる最小値取得
        Map<LocalDateTime, Optional<Item>> mmm = in.stream().collect(groupingBy(e->e.getDtm(),minBy(Comparator.comparingInt(e->e.getQty()))));
        for(Map.Entry<LocalDateTime,Optional<Item>> entry : mmm.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey().format(DateTimeFormatter.ofPattern("uuuu-MM-dd")),entry.getValue().get().getQty());
        }
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
        //単一グループによる合計値取得
        Map<LocalDateTime, Integer> mmmm = in.stream().collect(groupingBy(e->e.getDtm(),summingInt(e->e.getQty())));
        for(Map.Entry<LocalDateTime, Integer> entry : mmmm.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey().format(DateTimeFormatter.ofPattern("uuuu-MM-dd")),entry.getValue());
        }
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
        //単一グループによるListAgg
        Map<LocalDateTime, String> mmmmm = in.stream().collect(groupingBy(e->e.getDtm(),mapping(e->String.valueOf(e.getQty()),joining(","))));
        for(Map.Entry<LocalDateTime, String> entry : mmmmm.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey().format(DateTimeFormatter.ofPattern("uuuu-MM-dd")),entry.getValue());
        }
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
        //複数グループによる件数取得
        Map<Integer,Map<Integer,Long>> dm =  in.stream().collect(groupingBy(e->e.getGrp(),
                groupingBy(e->e.getSubgrp(),counting())));
        for(Map.Entry<Integer,Map<Integer,Long>> e : dm.entrySet()){
            for(Map.Entry<Integer,Long> ee : e.getValue().entrySet()){
                System.out.printf("%s\t%s\t%s\n",e.getKey(),ee.getKey(),ee.getValue());
            }
        }
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
        //複数グループによる最大値取得
        Map<Integer,Map<Integer,Optional<Item>>> ddm =  in.stream().collect(groupingBy(e->e.getGrp()
                                                                        ,groupingBy(e->e.getSubgrp(),maxBy(Comparator.comparingInt(e->e.getQty())))));
        for(Map.Entry<Integer,Map<Integer,Optional<Item>>> e : ddm.entrySet()){
            for(Map.Entry<Integer,Optional<Item>> ee : e.getValue().entrySet()){
                System.out.printf("%s\t%s\t%s\n",e.getKey(),ee.getKey(),ee.getValue().get().getQty());
            }
        }
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
        //複数グループによる最小値取得
        Map<Integer,Map<Integer,Optional<Item>>> dddm =  in.stream().collect(groupingBy(e->e.getGrp()
                ,groupingBy(e->e.getSubgrp(),minBy(Comparator.comparingInt(e->e.getQty())))));
        for(Map.Entry<Integer,Map<Integer,Optional<Item>>> e : dddm.entrySet()){
            for(Map.Entry<Integer,Optional<Item>> ee : e.getValue().entrySet()){
                System.out.printf("%s\t%s\t%s\n",e.getKey(),ee.getKey(),ee.getValue().get().getQty());
            }
        }
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
        //複数グループによる合計値取得
        Map<Integer,Map<Integer,Integer>> ddddm =  in.stream().collect(groupingBy(e->e.getGrp()
                ,groupingBy(e->e.getSubgrp(),summingInt(e->e.getQty()))));
        for(Map.Entry<Integer,Map<Integer,Integer>> e : ddddm.entrySet()){
            for(Map.Entry<Integer,Integer> ee : e.getValue().entrySet()){
                System.out.printf("%s\t%s\t%s\n",e.getKey(),ee.getKey(),ee.getValue());
            }
        }
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
        //複数グループによるListAgg
        Map<Integer,Map<Integer,String>> dddddm =  in.stream().collect(groupingBy(e->e.getGrp()
                ,groupingBy(e->e.getSubgrp(),mapping(e->String.valueOf(e.getQty()),joining(",")))));
        for(Map.Entry<Integer,Map<Integer,String>> e : dddddm.entrySet()){
            for(Map.Entry<Integer,String> ee : e.getValue().entrySet()){
                System.out.printf("%s\t%s\t%s\n",e.getKey(),ee.getKey(),ee.getValue());
            }
        }
        //オール・インワン
        Map<LocalDateTime,IntSummaryStatistics> mmmmmm = in.stream().collect(groupingBy(e->e.getDtm(),summarizingInt(e->e.getQty())));
        System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\n","grp","cnt","min","max","avg","sum");
        for(Map.Entry<LocalDateTime,IntSummaryStatistics> entry : mmmmmm.entrySet()){
            System.out.printf("%s\t%s\t%s\t%s\t%.3f\t%s\n",entry.getKey().format(DateTimeFormatter.ofPattern("uuuu-MM-dd"))
                                                        ,entry.getValue().getCount()
                                                        ,entry.getValue().getMin()
                                                        ,entry.getValue().getMax()
                                                        ,entry.getValue().getAverage()
                                                        ,entry.getValue().getSum());
        }
    }
    static class Item{
        private Integer seq;
        private Integer grp;
        private Integer subgrp;
        private Integer grpseq;
        private LocalDateTime dtm;
        private Integer qty;
        private String name;

        public Item(List<String> l){
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm:ss,SSS");
            this.seq=Integer.parseInt(l.get(0));
            this.grp=Integer.parseInt(l.get(1));
            this.subgrp=Integer.parseInt(l.get(2));
            this.grpseq=Integer.parseInt(l.get(3));
            this.dtm=LocalDateTime.parse(l.get(4)+" 23:59:59,999", formatter);
            this.qty=Integer.parseInt(l.get(5));
            this.name=l.get(6);
        }

        @Override
        public String toString() {
            return "["+this.seq+","+this.grp+","+this.subgrp+","+this.grpseq+","+this.dtm.format(DateTimeFormatter.ofPattern("uuuu-MM-dd"))+","+this.qty+","+this.name+"]";
        }

        public Integer getSeq() {
            return seq;
        }
        public Integer getGrp() {
            return grp;
        }
        public Integer getSubgrp() {
            return subgrp;
        }
        public Integer getGrpseq() {
            return grpseq;
        }
        public LocalDateTime getDtm() {
            return dtm;
        }
        public Integer getQty() {
            return qty;
        }
        public String getName() {
            return name;
        }
    }
}