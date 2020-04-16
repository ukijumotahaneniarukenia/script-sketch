package app;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

//https://github.com/vdurmont/emoji-Java
//https://www.it-swarm.dev/ja/java/java%E6%96%87%E5%AD%97%E5%88%97%E3%81%8B%E3%82%89%E2%9C%85%E3%80%81%E3%80%81%E2%9C%88%E3%80%81%E2%99%9B%E3%81%AA%E3%81%A9%E3%81%AE%E7%B5%B5%E6%96%87%E5%AD%97-imagessign%E3%82%92%E5%89%8A%E9%99%A4%E3%81%97%E3%81%BE%E3%81%99%E3%80%82/837301366/
public class App {
    private static String nnn(String s) {
        String[] ss = s.split("\\\\u");
        char[] ciz = new char[ss.length - 1];
        for (int i = 0; i < ciz.length; i++) {
            ciz[i] = (char)Integer.parseInt(ss[i + 1], 16);
        }
        return new String(ciz);
    }
    private static String ppp(Integer n){
        return "\\u"+Integer.toHexString(n);
    }
    private static String qqq(Integer n){
        return Character.getName(n);
    }
    private static Character.UnicodeBlock rrr(Integer n){
        return Character.UnicodeBlock.of(n);
    }
    private static String sss(Integer n){
        return Character.UnicodeScript.of(n).name();
    }
    private static List<Character.UnicodeBlock> lookUp2(Map<Integer,Character.UnicodeBlock> m, List<Integer> l){
        return l.stream().map(e->m.get(e)).collect(Collectors.toList());
    }
    private static List<String> lookUp(Map<Integer,List<String>> m,List<Integer> l,Integer...n){
        return l.stream().map(e->m.get(e).get(0!=n.length&&m.get(e).size()>n[0]?n[0]:0)).collect(Collectors.toList());
    }
    private static Map<Character.UnicodeBlock,List<Integer>> yyy(Map<Integer,Character.UnicodeBlock> m){
        return m.entrySet().stream().collect(Collectors.groupingBy(e->e.getValue(),Collectors.mapping(e->e.getKey(),Collectors.toList())));
    }
    public static void main( String[] args ) {
        int s=0;
//        int e=0x333B;
//        int e=0xFFF;
//        int e=0xFF;
        int e=0x10FFFF;
        Map<Integer,List<String>> m = new LinkedHashMap<>();
        Map<Integer,Character.UnicodeBlock> mm = new LinkedHashMap<>();
        List<String> l;
        List<Character.UnicodeBlock> ll;
        for(int i=s;i<=e;i++){
            m.put(i, Arrays.asList(nnn(ppp(i)),ppp(i),qqq(i),sss(i)));
            Character.UnicodeBlock rt =rrr(i);
            if(Objects.nonNull(rt)){
                //ブロック名が定義されていないものは除外
                mm.put(i, rt);
            }
        }
        l=lookUp(m,IntStream.rangeClosed(2160,2207).boxed().collect(Collectors.toList()),2);
        l=lookUp(m, IntStream.rangeClosed(2160,2207).boxed().collect(Collectors.toList()));
        ll=lookUp2(mm,IntStream.rangeClosed(0,10).boxed().collect(Collectors.toList()));
        Map<Character.UnicodeBlock,List<Integer>> rt = yyy(mm);
        System.out.println(Character.UnicodeBlock.forName("THAANA"));
        System.out.println(rt.get(Character.UnicodeBlock.forName("THAANA")));
        l=lookUp(m,rt.get(Character.UnicodeBlock.forName("THAANA")),2);
        l=lookUp(m,rt.get(Character.UnicodeBlock.forName("THAANA")));
        System.out.println(l);
    }
}