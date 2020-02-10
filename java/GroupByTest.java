import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

//with sub as(
//        select 'apple' as item from dual union all
//        select 'kiwi' from dual union all
//        select 'orange' from dual union all
//        select 'banana' from dual
//        )
//        select
//        'liz.add(new Order('||listagg(order_id||','||'"'||item||'"'||','||trunc(dbms_random.value(1,11)))within group(order by order_id)over(partition by item,order_id)||'));' as ptn
//        from(
//        select
//        row_number()over(order by item,grp) as order_id
//        ,item
//        ,trunc(dbms_random.value(1,11)) as qty
//        from (select level as grp from dual connect by level<=3) s1,sub s2
//        )s1
//        ;

public class GroupByTest {
    public static void main(String[] args) {
        List<Order> liz = new ArrayList<Order>();
        liz.add(new Order(1,"apple",5));
        liz.add(new Order(2,"apple",7));
        liz.add(new Order(3,"apple",2));
        liz.add(new Order(4,"banana",2));
        liz.add(new Order(5,"banana",10));
        liz.add(new Order(6,"banana",9));
        liz.add(new Order(7,"kiwi",4));
        liz.add(new Order(8,"kiwi",2));
        liz.add(new Order(9,"kiwi",6));
        liz.add(new Order(10,"orange",9));
        liz.add(new Order(11,"orange",7));
        liz.add(new Order(12,"orange",4));
        var cnt = liz.stream().collect(Collectors.groupingBy(Order::getItem, Collectors.counting()));
        var cntz = liz.stream().collect(Collectors.groupingBy(Order::getItem, Collectors.summarizingInt(Order::getQty)));
        var cntzz = liz.stream().collect(Collectors.groupingBy(Order::getItem, Collectors.collectingAndThen(Collectors.maxBy(Comparator.comparing(Order::getQty)), Optional::get)));
//        cntzz.entrySet().stream().map(e -> e.getKey()+":"+e.getValue()).forEach(System.out::println);
        cntzz.entrySet().stream().map(e -> e.getKey() + "=" + e.getValue().getQty()).forEach(System.out::println);
//        System.out.println(cnt);
//        System.out.println(cntz);
//        System.out.println(cntzz);
    }
}