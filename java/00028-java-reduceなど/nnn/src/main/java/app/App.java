package app;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    public static void main(String[] args) {
        List<String> l = new ArrayList<>(Arrays.asList("a", "b", "c","d"));

        String s = Stream.generate(()->"a").limit(30).collect(Collectors.joining());

        String txt = "うんこのおまもり";
        String dottxt = "う.ん.こ.の.お.ま.も.り";
//        System.out.println(nnn(l).get());
//        System.out.println(kkk(l));
//        System.out.println(jjj(l));
//        System.out.println(lll(l));
//        System.out.println(ooo(l));
//        System.out.println(ppp(l));
        System.out.println(qqq(l));//末尾要素取得
        System.out.println(rrr(l));//先頭要素取得
        System.out.println(eee(txt));//逆順
        System.out.println(uuu(dottxt));//逆順
        fff(txt,3);
    }

    private static Optional<String> nnn(List<String> l){
        return l.stream().reduce((String a, String e)-> a + "/" +e);
    }

    private static String kkk(List<String> l){
        return l.stream().reduce("",(String a, String e)-> a + "/" +e);
    }

    private static String jjj(List<String> l){
        return l.stream().reduce("",(String a, String e)-> a + "/" +e,(String lft, String rgt)-> lft + "-" +rgt);
    }

    private static String lll(List<String> l){
        return l.stream().parallel().reduce("",(String a, String e)-> a + "/" +e,(String lft, String rgt)-> lft + "-" +rgt);
    }

    private static StringBuilder ooo(List<String> l){
        return l.stream().map(e->new StringBuilder(e)).sequential().reduce(
                new StringBuilder()
                ,(StringBuilder a, StringBuilder e)-> a.append("/").append(e)
                ,(StringBuilder lft, StringBuilder rgt)-> lft.append("-").append(rgt));
    }

    private static StringBuilder ppp(List<String> l){
        return l.stream().map(e->new StringBuilder(e)).parallel().reduce(
                new StringBuilder()
                ,(StringBuilder a, StringBuilder e)-> a.append("/").append(e)
                ,(StringBuilder lft, StringBuilder rgt)-> lft.append("-").append(rgt));
    }

    private static Optional<String> qqq(List<String> l){
        return l.stream().reduce((a,e)->e);
    }

    private static Optional<String> rrr(List<String> l){
        return l.stream().reduce((a,e)->a);
    }

    private static Optional<String> eee(String s){
        return Arrays.stream(s.split("")).reduce((a,e)->e+a);
    }

    private static Optional<String> uuu(String s){
        return Arrays.stream(s.split("\\.")).reduce((a,e)->e+"."+a);
    }

    private static void fff(String s,int grp){
        List<String> rt = new ArrayList<>();
        int n = s.length()/grp;
        IntStream.range(0,n+1).reduce((a, e)->{
            System.out.println(e);
            return 0;//dummy
        });
    }
}