package app;

import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

public class App {

    //それ用の型をもつのが楽なのか

    static Item newItem(String key, int value) {
        Item o = new Item();
        o.key = key;
        o.value = value;
        return o;
    }

    static class Item {
        private String key;
        private int value;
        public String key() {
            return key;
        }
        public int value() {
            return value;
        }
    }

    public static void main( String[] args ) {
        List<Item> l = new ArrayList<>();
        l.add(newItem("banana",2));
        l.add(newItem("banana",3));
        l.add(newItem("orange",5));
        l.add(newItem("orange",6));
        l.add(newItem("orange",7));
        l.add(newItem("orange",8));
        l.add(newItem("orange",9));
        l.add(newItem("apple",3));
        l.add(newItem("apple",4));
        l.add(newItem("apple",5));
        l.add(newItem("kiwii",2));
        l.add(newItem("kiwii",3));
        l.add(newItem("kiwii",4));
        l.add(newItem("kiwii",5));
        l.add(newItem("kiwii",6));
        System.out.println(l);

        Map<String ,List<Integer>> m = l.stream().collect(Collectors.groupingBy(e->e.key,Collectors.mapping(e->e.value,Collectors.toList())));

        m.entrySet().stream().forEach((Map.Entry<String,List<Integer>> entry) -> System.out.printf("%s:%s\n",entry.getKey(),entry.getValue()));

        unnest(m).stream().forEach(stringIntegerMap -> System.out.println(stringIntegerMap));

    }
    private static List<Map<String, Integer>> unnest (Map<String, List<Integer>> m){
        List<Map<String, Integer>> rt = new ArrayList<>();
        for (Map.Entry<String, List<Integer>> entry : m.entrySet()){
            for (int i=0;i<entry.getValue().size();i++){
                Map<String, Integer> mm = new HashMap<>();
                mm.put(entry.getKey(),entry.getValue().get(i));
                rt.add(mm);
            }
        }
        return rt;
    }
}
