package app;

import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
//        int s=0;
//        int e=0x10ffff;
//        Map<Integer,String> c1 = IntStream.rangeClosed(s,e).boxed().collect(Collectors.toMap(i->i,i->Character.UnicodeScript.of(i).name()));
//        Map<Integer,String> c2 = IntStream.rangeClosed(s,e).boxed().collect(Collectors.toMap(i->i,i->Optional.ofNullable(Character.getName(i)).orElse("NA")));
//        Map<Integer,String> c3 = IntStream.rangeClosed(s,e).boxed().collect(Collectors.toMap(i->i,i->Optional.ofNullable(String.valueOf(Character.toChars(i)[0])).orElse("NA")));
//        for(int i=s;i<=e;i++){
//            System.out.printf("%s\t%s\t%s\t%s\n"
//                    ,i
//                    ,c1.get(i)
//                    ,c2.get(i)
//                    ,c3.get(i)
//            );
//        }

        List<String> l = new ArrayList<>(Arrays.asList("アンドロメダ","チンドロメダ"));
//        List<String> l = new ArrayList<>(Arrays.asList("アンドロメダ"));

        List<List<String>> ll = l.stream().map(e->new ArrayList<>(Arrays.asList(e.split("")))).collect(Collectors.toList());

        System.out.println(ll);

//        Map<String,List<String>> rt = jjj(ll);
//        Map<String,List<String>> rt = jjj(ll,Normalizer.Form.NFC);
//        Map<String,List<String>> rt = jjj(ll,Normalizer.Form.NFC,Normalizer.Form.NFD);
//        Map<String,List<String>> rt = jjj(ll,Normalizer.Form.NFC,Normalizer.Form.NFD,Normalizer.Form.NFKC);
        Map<String,List<String>> rt = jjj(ll,Normalizer.Form.NFC,Normalizer.Form.NFD,Normalizer.Form.NFKD);

        rt.entrySet().stream().sorted(Comparator.comparing(e->e.getKey().substring(0,3))).forEach(e-> System.out.println(e));
    }

    private static String fff(List<String> l){
        Pattern p = Pattern.compile("^1*0");
        int mx = l.size();
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<mx;i++){
            Matcher mc = p.matcher(l.get(i));
            while (mc.find()){
                if(2!=mc.group().length()){
                    sb.append("\n"+l.get(i));
                }else{
                    sb.append(l.get(i));
                }
            }
        }
        return new ArrayList<>(Arrays.asList(sb.toString().split("\n"))).stream().filter(e->0!=e.length()).map(e->Integer.toHexString((Integer.parseInt(e,2))))
                .collect(Collectors.toList()).stream().collect(Collectors.joining("-"));
    }

    private static List<String> ppp(String s){
        byte[] b = s.getBytes(StandardCharsets.UTF_8);
        int mx = b.length;
        return IntStream.range(0,mx).boxed().map(e->Integer.toBinaryString(Integer.parseInt(String.format("%02X",b[e]),16))).collect(Collectors.toList());
    }

    private static Map<String,List<String>> jjj (List<List<String>> ll,Normalizer.Form... typ) {
        int typ_cnt = typ.length;
        int row = ll.size();
        int col = ll.get(0).size();
        Map<String,List<String>> rt = new LinkedHashMap<>();
        for(int grp=0;grp<=typ_cnt;grp++){
            for(int i=0;i<row;i++){
                for(int j=0;j<col;j++){
                    List<String> l = new ArrayList<>();
                    String src = ll.get(i).get(j);
                    String tgt = src;
                    if(grp>0){
                        tgt=Normalizer.normalize(src,typ[grp-1]);
                    }
                    l.add(src);
                    l.add(tgt);
                    l.add(String.valueOf(tgt.length()));
                    l.add(fff(ppp(tgt)));
                    String key = Stream.of(String.valueOf(i),String.valueOf(j),grp>0?typ[grp-1].toString():"SRC").collect(Collectors.joining("-"));
                    rt.put(key,l);
                }
            }
        }
        return rt;
    }
}