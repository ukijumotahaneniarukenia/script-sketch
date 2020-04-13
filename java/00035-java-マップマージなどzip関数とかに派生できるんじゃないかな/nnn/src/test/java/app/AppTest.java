package app;

import org.junit.Assert;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static app.App.*;

public class AppTest {

    public static void main(String[] args) {
        j();
    }

    @Test
    private static void j(){
        Map<String, Integer> m1 = new HashMap<>();
        m1.put("a", 1);
        m1.put("b", 2);
        m1.put("c", 3);
        Map<String, Integer> m2 = new HashMap<>();
        m2.put("a", 100);
        m2.put("b", 200);
        m2.put("c", 300);

        yokosen();
        System.out.println(m1);
        System.out.println(m2);
        yokosen();
        Map<String, Integer> rt_merge_with_function_sum = merge_with_function(Integer::sum, m1, m2);
        System.out.println(rt_merge_with_function_sum);
        Map<String, Integer> rt_merge_with_groupBy_sum = merge_with_groupBy(Integer::sum, m1, m2);
        System.out.println(rt_merge_with_groupBy_sum);
        Assert.assertEquals(rt_merge_with_function_sum,rt_merge_with_groupBy_sum);
        yokosen();
    }
}
