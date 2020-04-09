package app;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

public class App {
    public static final String className = new Object(){}.getClass().getEnclosingClass().getName();
    public static final String cmdInput="cat test.tsv |";
    public static void main(String[] cmdline_args) {
        XXX xxx = new XXX();
        HashMap<Integer, List<String>> maz;
        maz=xxx.KKK(className,cmdInput,cmdline_args,new Scanner(System.in), Arrays.asList("INT"),"\t");
//        System.out.println(maz.get(0));//header
        List<Item> l = maz.entrySet().stream().skip(2).map(e->new Item(e.getValue())).collect(Collectors.toList());//body
//        Map<Boolean,Map<Integer,List<Item>>> m = l.stream().collect(Collectors.partitioningBy(e->e.qty>=5
//                                                                        ,Collectors.groupingBy(e->e.grp
//                                                                                ,Collectors.toList())));
//        for(Map.Entry<Boolean,Map<Integer,List<Item>>> entry : m.entrySet()){
//            System.out.println(entry);
//        }

        Map<Boolean,Map<Integer,List<String>>> m = l.stream().collect(Collectors.partitioningBy(e->e.qty>=5
                ,Collectors.groupingBy(e->e.grp
                        ,Collectors.mapping(e->e.getDtm().format(DateTimeFormatter.ofPattern("uuuu-MM-dd"))
                            ,Collectors.toList()))));
        for(Map.Entry<Boolean,Map<Integer,List<String>>> entry : m.entrySet()){
            System.out.println(entry);
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