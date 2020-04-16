package app;

import java.util.Arrays;
import java.util.Comparator;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class App {
    public static void main( String[] args ) {
        int s=0x3040;
        int e=0x30FF;
//        int e=0x10ffff;
        Map<Integer,String> c0 = IntStream.rangeClosed(s,e).boxed().collect(Collectors.toMap(i->i, i->Character.UnicodeBlock.of(i).toString()));
        Map<Integer,String> c1 = IntStream.rangeClosed(s,e).boxed().collect(Collectors.toMap(i->i, i->Character.UnicodeScript.of(i).name()));
        Map<Integer,String> c2 = IntStream.rangeClosed(s,e).boxed().collect(Collectors.toMap(i->i,i-> Optional.ofNullable(Character.getName(i)).orElse("NA")));
        Map<Integer,String> c3 = IntStream.rangeClosed(s,e).boxed().collect(Collectors.toMap(i->i,i->Optional.ofNullable(String.valueOf(Character.toChars(i)[0])).orElse("NA")));
        for(int i=s;i<=e;i++){
            System.out.printf("%s\t%s\t%s\t%s\t%s\n"
                    ,i
                    ,c0.get(i)
                    ,c1.get(i)
                    ,c2.get(i)
                    ,c3.get(i)
            );
        }
    }
}