package app;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

public class App {
    public static void main( String[] args ) {
        List<String> l = new ArrayList<>(Arrays.asList("abcde","fghijklm","nopq","rstuvwxyz"));
        List<List<String>> rt = jjj(l,20);
        System.out.println(rt);
    }
    private static List<List<String>> jjj(List<String> l, int n){
        int mx = l.size();
        List<List<String>> rt = new ArrayList<>();
        IntStream.range(0,mx).boxed().reduce(
                0//supplier
                ,(a,e)->{//accumulator
                    if(0==a+e){
                        //１回目以降
                        rt.add(new ArrayList<>(Arrays.asList(l.get(a+e))));
                    }else{
                        //２回目以降
                        if(rt.get(rt.size()-1).stream().reduce(0,(aa,ee)->aa+ee.length(),(ll,rr)->ll+rr)>n//前回グループに含まれる要素の文字列長合計値が引数で指定した閾値を超えている場合
                                ||rt.get(rt.size()-1).stream().reduce(0,(aa,ee)->aa+ee.length(),(ll,rr)->ll+rr)+l.get(a+e).length()>n)//前回グループに含まれる要素の文字列長合計値に今回の要素長を足しこんだ値が引数で指定した閾値を超えている場合
                        {
                            rt.add(new ArrayList<>(Arrays.asList(l.get(a+e))));
                        }else{
                            rt.get(rt.size()-1).add(l.get(a+e));
                        }
                    }
                    return a;//dummy
                }
                ,(lft,rgt)->null//parallel
        );
        return rt;
    }
}