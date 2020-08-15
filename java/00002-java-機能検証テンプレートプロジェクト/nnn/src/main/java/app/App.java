package app;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import static java.util.stream.Collectors.*;

public class App {
    public static void main( String[] args ) {
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

        l.stream().map(e->e.stream()).forEach(stringStream -> System.out.println(stringStream));

        //各行の３列まで取得 入れ子配列の展開によく使うのでは
        l.stream().flatMap(e-> Stream.of(e.stream().limit(3).collect(joining(",")))).forEach(stringStream -> System.out.println(stringStream));

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
