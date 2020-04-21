package app;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        List<String> l1 =Stream.iterate(Character.MIN_CODE_POINT,n->n-Character.MIN_CODE_POINT<=Character.MAX_CODE_POINT,n->n + 1)
                .parallel()
                .map(e->String.valueOf(Character.toChars(e)))
                .collect(Collectors.toList());

        List<String> l2 =Stream.iterate(Character.MIN_CODE_POINT,n->n-Character.MIN_CODE_POINT<=Character.MAX_CODE_POINT,n->n + 1)
                .parallel()
                .filter(e->includeHighSurrogate(e))
                .map(e->String.valueOf(Character.toChars(e)))
                .collect(Collectors.toList());

        List<String> l3 =Stream.iterate(Character.MIN_CODE_POINT,n->n-Character.MIN_CODE_POINT<=Character.MAX_CODE_POINT,n->n + 1)
                .parallel()
                .filter(e->includeLowSurrogate(e))
                .map(e->String.valueOf(Character.toChars(e)))
                .collect(Collectors.toList());

        List<String> l4 =Stream.iterate(Character.MIN_CODE_POINT,n->n-Character.MIN_CODE_POINT<=Character.MAX_CODE_POINT,n->n + 1)
                .parallel()
                .filter(e->includeSurrogate(e))
                .map(e->String.valueOf(Character.toChars(e)))
                .collect(Collectors.toList());

        List<String> l5 =Stream.iterate(Character.MIN_CODE_POINT,n->n-Character.MIN_CODE_POINT<=Character.MAX_CODE_POINT,n->n + 1)
                .parallel()
                .filter(e->excludeSurrogate(e))
                .map(e->String.valueOf(Character.toChars(e)))
                .collect(Collectors.toList());

        System.out.println(l1.size());
        System.out.println(l2.size());
        System.out.println(l3.size());
        System.out.println(l4.size());
        System.out.println(l5.size());


//        String s = "ぁ";
//        String e = "ん";
//        String s = "a";
//        String e = "z";
//        String s = "0";
//        String e = "9";
//        System.out.println(l1.subList(s.codePointAt(0),e.codePointAt(0)+1));//枝刈り
    }

    private static boolean excludeSurrogate(Integer n){
        return n < (int) Character.MIN_HIGH_SURROGATE || (int) Character.MAX_LOW_SURROGATE < n;
    }

    private static boolean includeSurrogate(Integer n){
        return (int) Character.MIN_HIGH_SURROGATE <= n && n <= (int) Character.MAX_LOW_SURROGATE;
    }

    private static boolean includeHighSurrogate(Integer n){
        return (int) Character.MIN_HIGH_SURROGATE <= n && n <= (int) Character.MAX_HIGH_SURROGATE;
    }

    private static boolean includeLowSurrogate(Integer n){
        return (int) Character.MIN_LOW_SURROGATE <= n && n <= (int) Character.MAX_LOW_SURROGATE;
    }

    private static String strToUnicode(String s){
        return IntStream.range(0,s.length()).boxed().map(e->String.format("U+%05X",(int)s.charAt(e))).collect(Collectors.joining("-"));
    }
}