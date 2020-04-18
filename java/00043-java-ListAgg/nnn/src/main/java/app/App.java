package app;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

public class App {
    public static void main( String[] args ) {
        Map<Integer,String> j = new HashMap<>();
        j.put(1,"a");
        j.put(2,"a");
        j.put(3,"a");
        j.put(4,"b");
        j.put(5,"b");
        j.put(6,"c");

        System.out.println(j);

        j.entrySet().stream().collect(Collectors.groupingBy(e->e.getValue())).forEach((s, entries) -> System.out.printf("%s\t%s\n",s,entries));

        j.entrySet().stream().collect(Collectors.groupingBy(e->e.getValue()
                                        ,Collectors.mapping(e->e.getKey()
                                                ,Collectors.toList()))).forEach((k, v) -> System.out.printf("%s\t%s\n",k,v));
    }
}
