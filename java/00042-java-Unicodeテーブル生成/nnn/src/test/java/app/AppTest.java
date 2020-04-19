package app;

import org.junit.Test;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

import static app.App.subMain;

public class AppTest {
    private static <S,R> R executeTestMethod(List<S> args, List<S> l, BiFunction<List<S>, List<S>, R> function){
        return function.apply(args, l);
    }

    private static <M,T> void logger(M msg,T testName){
        System.out.printf("%s\t%s\n",msg,testName);
    }

    @Test
    public static void main(String[] args) {

        Map<String,List<String>> m = new LinkedHashMap<>();
        m.put("argsPtn1",Arrays.asList("1","1","1","JJJ:3"));
        m.put("argsPtn2",Arrays.asList("1","2","1","KKJJJ:5"));
        m.put("argsPtn3",Arrays.asList("1","3","1","PP:2"));

        int s=1;
        int e=3;

        for(int i=s;i<=e;i++){
            executeTestMethod(m.get("argsPtn"+i),Arrays.asList("argsPtn"+i,"start","end"),AppTest::testPtn);
        }
    }

    @Test
    private static Integer testPtn(List<String> args,List<String> l){
        int rt =0;
        String testName = l.get(0);
        String startMsg = l.get(1);
        String endMsg = l.get(2);
        logger(startMsg,testName);
        rt = subMain(args);
        logger(endMsg,testName);
        return rt;
    }
}