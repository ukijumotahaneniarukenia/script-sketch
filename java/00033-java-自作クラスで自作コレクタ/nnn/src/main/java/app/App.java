package app;

import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.function.Supplier;
import java.util.stream.Collector;

public class App {

    static class ListAggCollector implements Collector<String,StringBuffer,String> {

        @Override
        public Supplier<StringBuffer> supplier() {
            //サプライヤーなので、戻り値なし中間生成物を格納する入れ物を生成するのみ
            return ()->new StringBuffer();
        }

        @Override
        public BiConsumer<StringBuffer, String> accumulator() {
            //コンシューマなので、戻り値なし
            return (a,e)->{
              if(0!=a.length()){
                a.append(",");
              }
              a.append(e);
            };
        }

        @Override
        public BinaryOperator<StringBuffer> combiner() {
            //並列処理に呼ばれるメソッド
            return (a,e)->{
                if(0!=a.length()){
                    a.append(",");
                }
                a.append(e);
                return a;
            };
        }

        @Override
        public Function<StringBuffer, String> finisher() {
            return a->a.toString();
        }

        @Override
        public Set<Characteristics> characteristics() {
            //なぞ
            return EnumSet.noneOf(Characteristics.class);
        }
    }

    public static void main( String[] args ) {
        List<String> l = Arrays.asList("a", "b", "c", "d", "e");
        System.out.println(l);
        Collector<String, StringBuffer, String> collector = new ListAggCollector();
        String rt = l.stream().collect(collector);
        System.out.println(rt);

        String rtt = l.stream().parallel().collect(collector);
        System.out.println(rtt);
    }
}