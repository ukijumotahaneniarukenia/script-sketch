package app;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {

//        Stream.iterate(0,n->n<5,n->n + 1).forEach(x -> System.out.println(x));
        Stream.iterate(Character.MIN_CODE_POINT,n->n-Character.MIN_CODE_POINT<=128,n->n + 1).parallel().map(e->String.valueOf(Character.toChars(e))).forEach(x -> System.out.println(x));

//        IntStream.rangeClosed('a','c').boxed().flatMap(e->Stream.generate(()->e).limit(e)).forEach(integerStream -> System.out.println(integerStream));
//        Map<Integer,List<String>> ml2 = IntStream.rangeClosed('d','f').boxed().collect(Collectors.groupingBy(e->e,Collectors.mapping(ee->String.valueOf(Character.toChars(ee)),Collectors.toList())));

//        System.out.println(ml1);

//        Map<Integer,String> m1 = IntStream.rangeClosed('a','c').boxed().collect(Collectors.toMap(e->e,e->String.valueOf(Character.toChars(e))));
//        Map<Integer,String> m2 = IntStream.rangeClosed('a','c').boxed().collect(Collectors.toMap(e->e,e->String.valueOf(Character.toChars(e))));
//        Map<Integer,String> m2 = IntStream.rangeClosed('d','f').boxed().collect(Collectors.toMap(e->e,e->String.valueOf(Character.toChars(e))));
//        Map<Integer,String> m3 = IntStream.rangeClosed('g','i').boxed().collect(Collectors.toMap(e->e,e->String.valueOf(Character.toChars(e))));

//        jjj(m1,m2);
//        nnn(m1,m2);
//        System.out.println(nnn(m1,m2));
//        System.out.println(ppp(m1,m2));
//        System.out.println(jjj(m1,m2));
//        List<Map.Entry<Integer,String>> rt = jjj(m1,m2);
//        for(int i=0;i<rt.size();i++){
//            System.out.println(rt.get(i).getKey());
//            System.out.println(rt.get(i).getValue());
//        }
//        jjj(m1,m2).stream().forEach(e-> System.out.println(e));
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