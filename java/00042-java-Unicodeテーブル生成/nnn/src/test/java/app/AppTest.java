package app;

import org.junit.Test;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

//import static app.App.processArgs;

public class AppTest {
    private static <S,R> R executeTestMethod(List<S> args, List<S> l, BiFunction<List<S>, List<S>, R> function){
        return function.apply(args, l);
    }

    private static <M,T> void logger(M msg,T testName){
        System.out.printf("%s\t%s\n",msg,testName);
    }

//    @Test
//    public static void main(String[] args) {
//
//        Map<String,List<String>> m = new LinkedHashMap<>();
//        m.put("argsPtn1",Arrays.asList("1","1","1","JJJ:3"));
//        m.put("argsPtn2",Arrays.asList("1","1","2","JJJ:3"));
//        m.put("argsPtn3",Arrays.asList("1","1","3","JJJ:3"));
//        m.put("argsPtn4",Arrays.asList("1","1","4","JJJ:3"));
//        m.put("argsPtn5",Arrays.asList("1","2","1","KKJJJ:5"));
//        m.put("argsPtn6",Arrays.asList("1","2","2","KKJJJ:5"));
//        m.put("argsPtn7",Arrays.asList("1","2","3","KKJJJ:5"));
//        m.put("argsPtn8",Arrays.asList("1","2","4","KKJJJ:5"));
//        m.put("argsPtn9",Arrays.asList("1","3","1","PP:2"));
//        m.put("argsPtn10",Arrays.asList("1","3","2","PP:2"));
//        m.put("argsPtn11",Arrays.asList("1","3","3","PP:2"));
//        m.put("argsPtn12",Arrays.asList("1","3","4","PP:2"));
//        m.put("argsPtn13",Arrays.asList("2","1","1","HIRAGANA:8"));
//        m.put("argsPtn14",Arrays.asList("2","1","2","SQUARE:6"));
//        m.put("argsPtn15",Arrays.asList("2","1","3","DOITU:5"));
//        m.put("argsPtn16",Arrays.asList("2","1","4","KOITU:5"));
//        m.put("argsPtn17",Arrays.asList("2","2","1","HIRAGANA"));
//        m.put("argsPtn18",Arrays.asList("2","2","2","HIRAGANA"));
//        m.put("argsPtn19",Arrays.asList("2","2","3","HIRAGANA"));
//        m.put("argsPtn20",Arrays.asList("2","2","4","HIRAGANA"));
//        m.put("argsPtn21",Arrays.asList("2","3","1","HIRAGANA"));
//        m.put("argsPtn22",Arrays.asList("2","3","2","HIRAGANA"));
//        m.put("argsPtn23",Arrays.asList("2","3","3","HIRAGANA"));
//        m.put("argsPtn24",Arrays.asList("2","3","4","HIRAGANA"));
//        m.put("argsPtn25",Arrays.asList("3","1","1","HIRAGANA:8"));
//        m.put("argsPtn26",Arrays.asList("3","1","2","SQUARE:6"));
//        m.put("argsPtn27",Arrays.asList("3","1","3","DOITU:5"));
//        m.put("argsPtn28",Arrays.asList("3","1","4","KOITU:5"));
//        m.put("argsPtn29",Arrays.asList("3","2","1","HIRAGANA"));
//        m.put("argsPtn30",Arrays.asList("3","2","2","HIRAGANA"));
//        m.put("argsPtn31",Arrays.asList("3","2","3","HIRAGANA"));
//        m.put("argsPtn32",Arrays.asList("3","2","4","HIRAGANA"));
//        m.put("argsPtn33",Arrays.asList("3","3","1","HIRAGANA"));
//        m.put("argsPtn34",Arrays.asList("3","3","2","HIRAGANA"));
//        m.put("argsPtn35",Arrays.asList("3","3","3","HIRAGANA"));
//        m.put("argsPtn36",Arrays.asList("3","3","4","HIRAGANA"));
//        int s=1;
//        int e=m.size();
//
//        for(int i=s;i<=e;i++){
//            executeTestMethod(m.get("argsPtn"+i),Arrays.asList("argsPtn"+i,"start","end"),AppTest::testPtn);
//        }
//    }
//
////    @Test
////    private static Integer testPtn(List<String> args,List<String> l){
////        int rt =0;
////        String testName = l.get(0);
////        String startMsg = l.get(1);
////        String endMsg = l.get(2);
////        logger(startMsg,testName);
////        rt = processArgs(args);
////        logger(endMsg,testName);
////        return rt;
////    }
}
