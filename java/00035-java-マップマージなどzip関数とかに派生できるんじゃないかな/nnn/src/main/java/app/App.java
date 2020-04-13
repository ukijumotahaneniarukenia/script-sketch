package app;

import java.util.*;
import java.util.function.BiFunction;
import java.util.function.Function;
import java.util.stream.Collector;
import java.util.stream.Stream;

import static java.util.stream.Collectors.*;

public class App {
    public static void main( String[] args ) {
        Map<String, Integer> m1 = new HashMap<>();
        m1.put("a", 1);
        m1.put("b", 2);
        m1.put("c", 3);
        Map<String, Integer> m2 = new HashMap<>();
        m2.put("a", 100);
        m2.put("b", 200);
        m2.put("c", 300);

        System.out.println(m1);
        System.out.println(m2);

        Map<String, Integer> rt_merge_with_function_sum = merge_with_function(Integer::sum, m1, m2);
        System.out.println(rt_merge_with_function_sum);
        Map<String, Integer> merge_with_collector_sum = merge_with_collector(summingInt(Integer::intValue), m1, m2);
        System.out.println(merge_with_collector_sum);
        Map<String, Integer> rt_merge_with_groupBy_sum = merge_with_groupBy(Integer::sum, m1, m2);
        System.out.println(rt_merge_with_groupBy_sum);

        Map<String, Integer> rt_merge_with_function_max = merge_with_function(Integer::max, m1, m2);
        System.out.println(rt_merge_with_function_max);
        Map<String, Integer> rt_merge_with_groupBy_max = merge_with_groupBy(Integer::max, m1, m2);
        System.out.println(rt_merge_with_groupBy_max);

        Map<String, Integer> rt_merge_with_function_min = merge_with_function(Integer::min, m1, m2);
        System.out.println(rt_merge_with_function_min);
        Map<String, Integer> rt_merge_with_groupBy_min = merge_with_groupBy(Integer::min, m1, m2);
        System.out.println(rt_merge_with_groupBy_min);

        Map<String, Double> merge_with_collector_avg = merge_with_collector(averagingInt(Integer::intValue), m1, m2);
        System.out.println(merge_with_collector_avg);

        Map<String, List<String>> lm1 = new HashMap<>();
        lm1.put("a", Arrays.asList("a1","a2","a3"));
        lm1.put("b", Arrays.asList("b1","b2","b3"));
        lm1.put("c", Arrays.asList("c1","c2","c3"));

        Map<String, List<String>> lm2 = new HashMap<>();
        lm2.put("a", Arrays.asList("a3","a4","a5"));
        lm2.put("e", Arrays.asList("e1","e2","e3"));
        lm2.put("f", Arrays.asList("f1","f2","f3"));

        System.out.println(lm1);
        System.out.println(lm2);

        Map<String,List<String>> rt = mergeListMap(lm1,lm2);

        System.out.println(rt);

        Map<String,List<String>> rtt = merge_with_function(App::flattenList,lm1,lm2);

        System.out.println(rtt);

        Map<String,List<String>> rttt = merge_with_groupBy(App::flattenList,lm1,lm2);

        System.out.println(rttt);


        Collector<List<String>,List<String>,String> collector = Collector.of(ArrayList::new,List::addAll,App::flattenList,List::toString);//ジェネリクスは呼び出し時に型決めるので、指定する
        Map<String,String> rtttt = merge_with_collector(collector,lm1,lm2);


        System.out.println(rtttt.get("a").split(" ,"));

        Arrays.stream(rtttt.get("a").split(",")).forEach(e-> System.out.println(e));

        Collector<List<String>,List<String>,List<String>> collector2 = Collector.of(ArrayList::new,List::addAll,App::flattenList);//そのまま返却するときはフィニッシャ省略できる

        Map<String,List<String>> rttttt = merge_with_collector(collector2,lm1,lm2);

        System.out.println(rttttt);



    }

    @SafeVarargs//コンパイル時の警告をミュート
    public static <K,V> Map<K,List<V>> mergeListMap(Map<K, List<V>>... maz){
        return merge_with_groupBy(App::flattenList,maz);
    }

    public static void yokosen(){
        System.out.println(Stream.generate(()->"-").limit(80).collect(joining()));
    }
    //handy
    @SafeVarargs//コンパイル時の警告をミュート
    public static <K,V,R> Map<K,R> merge_with_collector(Collector<V, ?, R> collector, Map<K,V>... maz){//自作コレクタ経由は入力型と異なる出力型を得ることができる。これは強い。
        //？の意味合いは特に型は中間生成物に関しては気にしていない意味
        //インとアウトだけ気にして定義していればOK。実行時ないし呼び出し時に決めれば。
        return flattenMap(maz).collect(groupingBy(Map.Entry::getKey, mapping(Map.Entry::getValue, collector)));
    }

    //a little non-handy
    @SafeVarargs//コンパイル時の警告をミュート
    public static <K,V> Map<K,V> merge_with_function(BiFunction<? super V, ? super V, ? extends V> biFunction, Map<K,V>... maz){//自作コレクタ経由でない場合は入力型と同じ出力型しか得ることができない。
        Function<List<V>, V> finisher = e -> e.stream().reduce(biFunction::apply).get();//引数の関数定義をリストの各要素に対してreduceコンテキストで適用するフィにシャーを定義
        Collector<V, ?, V> collector = Collector.of(ArrayList::new, List::add, App::flattenList, finisher);////空リストを生成して、リストを追加し、リストinリストをフラット化したあと、フィニッシャで計算するコレクタを定義
        return merge_with_collector(collector,maz);////自作コレクタを定義したことで、入力型と異なる出力型を受け取れる恩恵を得ることができた。自作コレクタ経由は便利。
    }

    //toMap関数を使用したグループ関数適用
    @SafeVarargs//コンパイル時の警告をミュート
    public static <K,V,R> Map<K,V> merge_with_groupBy(BiFunction<? super V, ? super V, ? extends V> biFunction, Map<K,V>... maz){
        return flattenMap(maz).collect(toMap(Map.Entry::getKey,Map.Entry::getValue,biFunction::apply));
    }

    @SafeVarargs//コンパイル時の警告をミュート
    public static <E> List<E> flattenList(Collection<E>... liz){
        return Arrays.stream(liz).flatMap(e -> e.stream()).collect(toList());
    }

    @SafeVarargs//コンパイル時の警告をミュート
    public static <K,V> Stream<Map.Entry<K,V>> flattenMap(Map<K,V>... maz){
        return Arrays.stream(maz).flatMap(e->e.entrySet().stream());
    }
}
