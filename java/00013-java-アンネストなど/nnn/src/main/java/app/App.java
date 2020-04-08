package app;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class App {
    public static void main( String[] args ) {
        Map<String, List<Integer>> m = new HashMap<String, List<Integer>>(){
            {
                put("apple", niz(3,5));
                put("banana", niz(2,3));
                put("orange", niz(5,9));
                put("kiwii", niz(2,6));
            }
        };
        System.out.println(m);
        System.out.println(unnest(m));
        List<Map<String, Integer>> l = unnest(m);
        for(int i=0;i<l.size();i++){
          System.out.println(l.get(i));
        }
    }
    private static List<Integer> niz(Integer s,Integer e){
        return IntStream.range(s,e+1).boxed().collect(Collectors.toList());
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
