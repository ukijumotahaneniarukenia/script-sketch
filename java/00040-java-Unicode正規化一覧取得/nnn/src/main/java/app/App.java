package app;

import java.text.Normalizer;
import java.util.*;

public class App {
    public static void main( String[] args ) {
        Map<Integer, List<String>> rt = new HashMap<>();
        rt = jjj(0,0x10FFFF);
        rt.entrySet().stream().forEach(e-> System.out.println(e));
        System.out.println(rt.keySet().size());
    }

    private static Map<Integer, List<String>> jjj(Integer s,Integer e){
        Map<Integer, List<String>> rt = new HashMap<>();
        for(int i=s;i<=e;i++){
            String f = String.valueOf(Character.toChars(i));
            String nfd = Normalizer.normalize(f, Normalizer.Form.NFD);// 正規分解
            String nkc = Normalizer.normalize(f, Normalizer.Form.NFC);// 正規分解とそれに続く正規合成
            String nfkd = Normalizer.normalize(f, Normalizer.Form.NFKD);// 互換分解
            String nfkc = Normalizer.normalize(f, Normalizer.Form.NFKC);// 互換分解とそれに続く正規合成
            rt.put(i,new ArrayList<>(Arrays.asList(f,nfd,nkc,nfkd,nfkc)));
        }
        return rt;
    }
}