package app;

import org.apache.commons.lang3.RandomStringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        IntStream.range(0,10).boxed().flatMap(e->Stream.generate(()->e).limit(e).map(ee->ee.toString())).reduce((a,e)->{System.out.println(a);return a+e;});
//        List<List<String>> rt = ttt(nnn(jjj(1000000),kkk(1,10)),kkk(1,10)); //呼び出し側で型指定
////        System.out.println(rt);
//        System.out.println(rt.size());
//        System.out.println(rt.get(0).size());
    }

    private static Integer kkk (Integer s,Integer e){
        List<Integer> l = IntStream.range(s,e+1).boxed().parallel().collect(Collectors.toList());
        Collections.shuffle(l);
        return l.stream().parallel().limit(1).findFirst().orElse(1);
    }

    private static String jjj(int n){
        return Stream.generate(()->RandomStringUtils.randomAlphanumeric(n)).limit(1).parallel().collect(Collectors.joining());
    }

    private static List<String> nnn(String s,int row){
        List<String> rt = new ArrayList<>();
        int l = s.length();
        int n;
        if(row<=0){
            rt.addAll(new ArrayList<>(Arrays.asList(s)));
        }else {
            n = l / row;
            for (int i = 0; i < row; i++) {
                rt.add(s.substring(i * n, i * n + n));
            }
        }
        return rt;
    }
    private static List<List<String>> ttt (List<String> list,int col){
        List<List<String>> rt = new ArrayList<>();
        int mx = list.size();
        int n = 0;
        for(int i=0;i<mx;i++){
            List<String> rr = new ArrayList<>();
            if(col<=0){
                rt.add(list);
            }else{
                int l = 0;
                for (int j=0;j<col;j++) {
                    l = list.get(i).length();
                    n = l / col;
                    rr.add(list.get(i).substring(j * n,j*n+n));
                }
            }
            rt.add(rr);
        }
        return rt;
    }
}