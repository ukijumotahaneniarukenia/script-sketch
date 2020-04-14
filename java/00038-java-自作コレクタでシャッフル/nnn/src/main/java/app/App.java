package app;

import java.util.Arrays;
import java.util.Collections;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        String s = "うんこもりもり";
        Stream.of(s).flatMap(e-> Arrays.stream(e.split(""))).collect(shuffle()).forEach(e-> System.out.print(e));
    }

    private static <T> Collector<T,?, Stream<T>> shuffle(){
        //コレクタを作成する際は入力にストリーム＜T＞を受け取ってなにがしかの処理をして戻り値にStreamを返しておくと、次が続けられるので、便利
        return Collectors.collectingAndThen(Collectors.toList(), l->{Collections.shuffle(l);return l.stream();});
    }
}
