package app;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class App {
    public static void main( String[] cmdline_args ) {
        fill(pre_process(new Scanner(System.in)),cmdline_args).stream().forEach(e-> System.out.println(e));
    }
    private static List<String> pre_process(Scanner stdin){
        List<String> rt = new ArrayList<>();
        while (stdin.hasNextLine()) {
            rt.add(stdin.nextLine());
        }
        stdin.close();
        return rt;
    }
    private static List<List<String>> fill (List<String> l,String ... s){
        String dft = "NA";
        String[] ss = s;
        Integer mx = l.stream().max(Comparator.comparing(e->e.length())).get().split(",").length-1;
        List<List<String>> rt = l.stream().map(e -> Arrays.asList(embeded(e, mx - (e.split(",").length-1),Stream.of(ss).findFirst().orElse(dft)).split(","))).collect(Collectors.toList());
        return rt;
    }
    private static String embeded(String s,Integer n,String p){
        return Stream.of(s)
                .map(e->e.concat(Stream.generate(() -> ","+p).limit(n).collect(Collectors.joining())))
                .collect(Collectors.joining());
    }
}