package app;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class App {

    public static void main( String[] args ) {

        Map<Integer,String> m1 = IntStream.rangeClosed('a','c').boxed().collect(Collectors.toMap(e->e,e->String.valueOf(Character.toChars(e))));
        Map<Integer,String> m2 = IntStream.rangeClosed('d','f').boxed().collect(Collectors.toMap(e->e,e->String.valueOf(Character.toChars(e))));
        Map<Integer,String> m3 = IntStream.rangeClosed('g','i').boxed().collect(Collectors.toMap(e->e,e->String.valueOf(Character.toChars(e))));

        System.out.println(nnn(m1,m2));
        System.out.println(ppp(m1,m2));
        System.out.println(jjj(m1,m2));

    }
    @SafeVarargs
    private static <K,V> List<Map.Entry<K,V>> jjj(Map<K,V>... maz){
        return IntStream.range(0,maz.length).boxed().flatMap(e->maz[e].entrySet().stream()).collect(Collectors.toList());
    }

    @SafeVarargs
    private static <K,V> Map<Integer,Map<K,V>> nnn(Map<K,V>... maz){
        return IntStream.range(0,maz.length).boxed().collect(Collectors.toMap(e->e, e->maz[e]));
    }

    @SafeVarargs
    private static <K,V> Map<K,Map<K,V>> ppp(Map<K,V>... maz){
        return IntStream.range(0,maz.length).boxed().collect(Collectors.toMap(e->maz[e].keySet().stream().findFirst().get(), e->maz[e],(pre,post)->post, LinkedHashMap::new));
    }
}