package app;

import java.util.*;

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
    private static void lookUp(List<Integer> l){

    }
    public static void main( String[] args ) {
        int s=0;
        int e=0x30FF;
        Map<Integer,List<String>> m = new LinkedHashMap<>();
        Map<Integer,Character.UnicodeBlock> mm = new LinkedHashMap<>();
        for(int i=s;i<=e;i++){
            m.put(i, Arrays.asList(ppp(i),qqq(i),sss(i),nnn(ppp(i))));
            mm.put(i, rrr(i));
//            System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\n",i,ppp(i),qqq(i),rrr(i),sss(i),nnn(ppp(i)));
        }
        m.entrySet().stream().forEach(integerListEntry -> System.out.println(integerListEntry));
    }
}