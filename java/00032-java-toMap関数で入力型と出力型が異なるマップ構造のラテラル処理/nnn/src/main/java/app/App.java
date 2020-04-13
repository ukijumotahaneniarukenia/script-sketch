package app;

import java.util.HashMap;
import java.util.Map;
import static java.util.stream.Collectors.*;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        Map<String, Integer> m1 = new HashMap<>();
        m1.put("a", 1);
        m1.put("b", 2);
        m1.put("c", 3);
        Map<String, Integer> m2 = new HashMap<>();
        m2.put("a", 100);
        m2.put("b", 200);
        m2.put("c", 300);

        System.out.println(m1);
        System.out.println(m2);

        Map<String, Double> rt = Stream.of(m1,m2).flatMap(e->e.entrySet().stream()).collect(groupingBy(e->e.getKey()
                ,averagingDouble(e->e.getValue())));

        System.out.println(rt);

        Map<String, String> rtt = Stream.of(m1,m2).flatMap(e->e.entrySet().stream()).collect(groupingBy(e->e.getKey()
                                                                    ,mapping(e->e.getValue().toString(),joining("-"))));

        System.out.println(rtt);
    }
}
