package app;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        Map<String, List<String>> lm1 = new HashMap<>();
        lm1.put("a", Arrays.asList("a1","a2","a3"));
        lm1.put("b", Arrays.asList("b1","b2","b3"));
        lm1.put("c", Arrays.asList("c1","c2","c3"));

        Map<String, List<String>> lm2 = new HashMap<>();
        lm2.put("a", Arrays.asList("a3","a4","a5"));
        lm2.put("e", Arrays.asList("e1","e2","e3"));
        lm2.put("f", Arrays.asList("f1","f2","f3"));

        System.out.println(lm1);
        System.out.println(lm2);

        Stream.of(lm1,lm2).flatMap(e->e.entrySet().stream()).forEach(e -> System.out.println(e));

        flattenMap(lm1,lm2).forEach(e-> System.out.println(e));

    }

    private static <K,V> Stream<Map.Entry<K,V>> flattenMap(Map<K,V>... maz){
        return Arrays.stream(maz).flatMap(e->e.entrySet().stream());
    }
}
