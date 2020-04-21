package app;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {

    private static final Integer mn = 3;
    private static final Integer one_thousand = 1000;
    private static final Integer ten_thousand = 10000;//
    private static final Integer one_hundred_thousand = 100000;//十万
    private static final Integer one_million = 1000000;//百万
    private static final Integer ten_million = 10000000;//千万
    private static final Integer one_hundred_million = 100000000;//一億

    public static void main(String[] args) {

        List<String> l1 = IntStream.rangeClosed('a', 'c').boxed().map(e -> String.valueOf(Character.toChars(e))).collect(Collectors.toList());
        List<String> l2 = IntStream.rangeClosed('d', 'f').boxed().map(e -> String.valueOf(Character.toChars(e))).collect(Collectors.toList());
        List<String> l3 = IntStream.rangeClosed('g', 'i').boxed().map(e -> String.valueOf(Character.toChars(e))).collect(Collectors.toList());
        List<Integer> l4 = IntStream.rangeClosed(0, 3).boxed().collect(Collectors.toList());
        List<Integer> l5 = IntStream.rangeClosed(4, 5).boxed().collect(Collectors.toList());
        List<Integer> l6 = IntStream.rangeClosed(6, 7).boxed().collect(Collectors.toList());

        System.out.println(ttt(mn, l1, l2, l3));
        System.out.println(ppp(mn, l1, l2, l3));
        System.out.println(ttt(mn, l4, l5, l6));
        System.out.println(ppp(mn, l4, l5, l6));

        ppp(one_thousand, l1, l2, l3);
        ppp(ten_thousand, l1, l2, l3);
        ppp(one_hundred_thousand, l1, l2, l3);
        ppp(one_million, l1, l2, l3);

        System.out.println(ppp(one_million, l1, l2, l3).stream().count());

        ppp(ten_million, l1, l2, l3);

        rrr(ppp(one_hundred_million, l1, l2, l3));

        ttt(one_hundred_million, l1, l2, l3);
    }

    private static <T> List<T> kkk(Integer n, List<T> l) {
        return Stream.generate(() -> l).limit(n).flatMap(e -> e.stream()).collect(Collectors.toList());
    }
    @SafeVarargs
    private static <T> List<List<T>> rrr(List<T>... liz){
        return IntStream.range(0,liz.length).boxed().map(e->liz[e]).collect(Collectors.toList());
    }
    @SafeVarargs
    private static <T> List<List<T>> ttt(Integer n, List<T>... liz) {
        return IntStream.range(0, liz.length).boxed().map(e -> kkk(n, liz[e])).collect(Collectors.toList());
    }
    @SafeVarargs
    private static <T> List<T> ppp(Integer n, List<T>... liz) {
        return IntStream.range(0, liz.length).boxed().flatMap(e -> kkk(n, liz[e]).stream()).collect(Collectors.toList());
    }
}