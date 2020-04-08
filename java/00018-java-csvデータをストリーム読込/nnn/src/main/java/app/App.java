package app;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        List<String> l = new ArrayList<>(Arrays.asList("a,b,c","d,e,f","f,g","h,i,j,k","l"));
        System.out.println(l);

        System.out.println(Stream.generate(()->"-").limit(100).collect(Collectors.joining()));

        List<List<String>> ll = jjj(l);
        System.out.println(ll);

        System.out.println(Stream.generate(()->"-").limit(100).collect(Collectors.joining()));

        ll.stream().forEach(strings -> System.out.println(strings));

        System.out.println(Stream.generate(()->"-").limit(100).collect(Collectors.joining()));

        ll = transpose(ll);
        ll.stream().forEach(strings -> System.out.println(strings));
    }

    private static List<List<String>> jjj (List<String> l,String[] ... s){
        String dft = "NA";
        String[] ss = new String[s.length];
        Integer mx = l.stream().max(Comparator.comparing(e->e.length())).get().split(",").length-1;
        List<List<String>> rt = l.stream().map(e -> Arrays.asList(fill(e, mx - (e.split(",").length-1),Stream.of(ss).findFirst().orElse(dft)).split(","))).collect(Collectors.toList());
        return rt;
    }

    private static String fill(String s,Integer n,String fillment){
        return Stream.of(s)
                .map(e->e.concat(Stream.generate(() -> ","+fillment).limit(n).collect(Collectors.joining())))
                .collect(Collectors.joining());
    }

    private static List<List<String>> transpose(List<List<String>> l){
        String[][] s = new String[l.get(0).size()][l.size()];
        for(int i=0;i<l.size();i++){
            int n = l.get(0).size();
            for(int j=0;j<n;j++){
                s[j][i]=l.get(i).get(j);
            }
        }
        return Arrays.stream(s).map(e->Arrays.asList(e)).collect(Collectors.toList());
    }
}