package app;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        List<String> l = Stream.of("Nam","est","at","maiores","velit","earum","sit","commodi","Tempore","facere","et","iste.","Dignissimos","aut","quaerat").collect(Collectors.toList());
        Map<String, List<String>> rt = ngrp(l,1);
        System.out.println(rt);
    }

    private static Map<String, List<String>> ngrp (List<String> s,Integer n){
        if(n > s.stream().min(Comparator.comparing(e -> e.length())).get().length()){
            return new HashMap<>();
        }else{
            return s.stream().collect(Collectors.groupingBy(e->e.substring(0,n)
                    ,Collectors.mapping(e->e
                            ,Collectors.toList())));
        }
    }
}