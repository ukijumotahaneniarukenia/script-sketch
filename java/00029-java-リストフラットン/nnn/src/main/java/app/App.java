package app;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Stream;

import static java.util.stream.Collectors.*;

public class App {
    public static void main( String[] args ){
        List<String> l1 = new ArrayList<>();
        l1.add("a");
        l1.add("b");
        l1.add("c");
        List<String> l2 = new ArrayList<>();
        l2.add("d");
        l2.add("e");
        l2.add("f");

        System.out.println(l1);
        System.out.println(l2);

        List<String > rt = Stream.of(l1,l2).flatMap(e->e.stream()).collect(toList());

        System.out.println(rt);

        rt = flattenList(l1,l2);

        System.out.println(rt);
    }

    private static <E> List<E> flattenList(Collection<E>... c){
        return Arrays.stream(c).flatMap(e -> e.stream()).collect(toList());
    }
}
