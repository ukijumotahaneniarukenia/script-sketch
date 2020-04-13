package app;

import java.util.Arrays;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.function.Supplier;
import java.util.stream.Collector;

public class App {
    //関数インターフェースはクラス単位で使用することを想定している。外部から使用する想定はないはず。
    public static void main( String[] args ) {
        Supplier<StringBuffer> supplier = ()->new StringBuffer();//サプライヤーなので、戻り値なし中間生成物を格納する入れ物を生成するのみ

        BiConsumer<StringBuffer, String> accumulator = (a,e) -> {
            //コンシューマなので、戻り値なし
            if(0 != a.length()){
            a.append(",");
            }
            a.append(e);
        };

        BinaryOperator<StringBuffer> combiner = (a,e) ->{
            //並列処理に呼ばれるメソッド
            if(0 != a.length()){
                a.append(",");
            }
            a.append(e);
            return a;
        };

        Function<StringBuffer, String> finisher = (e)-> e.toString();

        Collector<String, StringBuffer, String> collector = Collector.of(supplier,accumulator,combiner,finisher);

        List<String> l = Arrays.asList("a", "b", "c", "d", "e");
        System.out.println(l);

        String rt = l.stream().collect(collector);

        System.out.println(rt);

        String rtt = l.stream().parallel().collect(collector);

        System.out.println(rtt);

        Collector<String, StringBuffer, String> collector_static = Collector.of(supplier_static,accumulator_static,combiner_static,finisher_static);

        List<String> l_static = Arrays.asList("a", "b", "c", "d", "e");
        System.out.println(l_static);

        String rt_static = l.stream().collect(collector_static);

        System.out.println(rt_static);

        String rtt_static = l.stream().parallel().collect(collector_static);

        System.out.println(rtt_static);

    }

    static Supplier<StringBuffer> supplier_static = ()->new StringBuffer();//サプライヤーなので、戻り値なし中間生成物を格納する入れ物を生成するのみ

    static BiConsumer<StringBuffer, String> accumulator_static = (a,e) -> {
        //コンシューマなので、戻り値なし
        if(0 != a.length()){
            a.append(",");
        }
        a.append(e);
    };

    static BinaryOperator<StringBuffer> combiner_static = (a,e) ->{
        //並列処理に呼ばれるメソッド
        if(0 != a.length()){
            a.append(",");
        }
        a.append(e);
        return a;
    };

    static Function<StringBuffer, String> finisher_static = (e)-> e.toString();
}
