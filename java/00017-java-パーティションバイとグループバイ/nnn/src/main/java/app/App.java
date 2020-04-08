package app;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        Stream<Integer> n = IntStream.range(1,11).boxed();
        Map<Integer, List<Integer>> l = n.collect(Collectors.groupingBy(e->e%3));
        System.out.println(l);

        n = IntStream.range(1,11).boxed();
        Map<Integer, List<Integer>> ll = n.collect(Collectors.groupingBy(e->ceil(e,3)));
        System.out.println(ll);

        n = IntStream.range(1,11).boxed();
        Map<Boolean, List<Integer>> lll = n.collect(Collectors.partitioningBy(e->e%3==0));
        System.out.println(lll);
    }

    private static Integer ceil(Integer n,Integer k){
        if(Math.ceil((double)n/k) == k){
            return (int)k;
        }else{
            return (int)Math.ceil((double)n/k);
        }
    }
}