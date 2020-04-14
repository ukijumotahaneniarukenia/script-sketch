package app;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import static java.text.Normalizer.Form.*;

public class App {
    public static void main( String[] args ) {

        List<String> l = new ArrayList<>(Arrays.asList(
                "ＡＢＣ０１２"// 全角英数
                ,"アンドロメダﾊﾞｶﾎﾞﾝ"// 全半角文字
                ,"㍆㌋㌋㌧㌨㌰㌣㌈"// 組み文字
        ));

        List<List<String>> ll = l.stream().map(e->new ArrayList<>(Arrays.asList(e.split("")))).collect(Collectors.toList());

        System.out.println(ll);

//        int row = mtx.length;
//        System.out.println(row);
//        System.out.println(Stream.of(mtx).max(Comparator.comparing(e->e.length)).get());
//
//        for(int i=0;i<row;i++){
//            System.out.println(mtx[i]);
//        }

//        for(int){
//
//        }

//        System.out.println(mtx);

//        Stream.of(samples)
//                .flatMap(e->sep.splitAsStream(e))
//                .map(e->jjj(e,NFD,NFC,NFKD,NFKC)).forEach(integerMapMap -> System.out.println(integerMapMap));
//        ;
    }

    private static Map<Integer,Map<String,List<String>>> jjj (Integer n,String s,Normalizer.Form... typ) throws UnsupportedEncodingException {
        int typ_cnt = typ.length;
        Map<Integer,Map<String,List<String>>> rt = new HashMap<>();
        Map<String,List<String>> v;
        List<String> l;
        for(int i=0;i<=typ_cnt;i++){
            v = new HashMap<>();
            l = new ArrayList<>();
            if(typ_cnt>0){
                s=Normalizer.normalize(s,typ[0]);
            }
            byte[] bb = s.getBytes(StandardCharsets.UTF_8);
            l.add(s);
            l.add(String.valueOf(s.length()));
            l.add(IntStream.range(0,bb.length).boxed().map(e->String.format("%02X",bb[e])).collect(Collectors.joining("-")));
            v.put(typ_cnt>0?typ[0].toString():"SRC",l);
            rt.put(n,v);
        }
        return rt;
    }
}