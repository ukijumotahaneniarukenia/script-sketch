package app;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    private static String defaultKeyWord="KATAKANA";
    private static Integer defaultNormGrp=0;
    private static Integer defaultSearchMode=1;
    private static Integer defaultNonGramIdx=1;
    private static Integer defaultGramIdx=1;
    private static Integer defaultSelectColStartRn=0;
    private static Integer defaultSelectColEndRn=8;
    private static Integer defaultStartRn=0;
    private static Integer defaultEndRn=0x10FFFF;
    private static String defaultNonKeyWord="ウンコもりもり森鴎外";

    private static String hexToBin(String s){
        return Integer.toBinaryString(Integer.parseInt(s,16));
    }
    private static String binToHex(String s){
        return Integer.toHexString(Integer.parseInt(s,2));
    }
    private static String cpToStr(Integer n) {
        return new String(Character.toChars(n));
    }
    private static String cpToUniScriptName(Integer n){
        return Character.UnicodeScript.of(n).name();
    }
    private static String cpToUniBlockName(Integer n){
        return String.valueOf(Character.UnicodeBlock.of(n));
    }
    private static String cpToUniName(Integer n){
        return Character.getName(n);
    }
    private static String strToUnicode(String s){
        return IntStream.range(0,s.length()).boxed().map(e->String.format("U+%05X",(int)s.charAt(e))).collect(Collectors.joining("-"));
    }
    private static String strToUtf8(String s) {
        byte[] b = s.getBytes(StandardCharsets.UTF_8);
        Pattern p = Pattern.compile("^1*0");
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<b.length;i++){
            String bin = hexToBin(String.format("%02X",b[i]));
            Matcher mc = p.matcher(bin);
            if(mc.find()){
                if(2!=mc.group().length()){
                    sb.append("\n"+binToHex(bin));
                }else{
                    sb.append(binToHex(bin));
                }
            }
        }
        return Stream.of(sb.toString()).flatMap(e-> Arrays.stream(e.split("\n"))).filter(ee->0!=ee.length()).collect(Collectors.joining("-"));
    }
    private static String strToUtf16(String s) {
        byte[] b = s.getBytes(StandardCharsets.UTF_16);
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<b.length;i++){
            String hex = String.format("%02X",b[i]);
            if(hex.equals("FE")||hex.equals("FF")){

            }else if((sb.length()-sb.toString().split("-").length+1)%4==0&&0<sb.length()){
                sb.append("-"+hex);
            }
            else{
                sb.append(hex);
            }
        }
        return sb.toString();
    }
    private static String strToUtf32(String s) {
        byte[] b = s.getBytes(Charset.forName("UTF-32"));
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<b.length;i++){
            String hex = String.format("%02X",b[i]);
            if((sb.length()-sb.toString().split("-").length+1)%8==0&&0<sb.length()) {
                sb.append("-" + hex);
            }else{
                sb.append(hex);
            }
        }
        return sb.toString();
    }
    private static String strToNorm(String s, Normalizer.Form typ) {
        return Normalizer.normalize(s,typ);
    }
    private static Map<Integer, List<String>> mkTblCore(Integer s,Integer e) {
        Map<Integer, List<String>> rt = new LinkedHashMap<>();
        for(int i=s;i<=e;i++){
            rt.put(i, Arrays.asList(
                    String.valueOf(i)
                    ,cpToUniName(i)
                    ,cpToStr(i)
                    ,cpToUniScriptName(i)
                    ,cpToUniBlockName(i)
                    ,strToUtf8(cpToStr(i))//律速ボトルネック
                    ,strToUtf16(cpToStr(i))//律速ボトルネック
                    ,strToUtf32(cpToStr(i))//律速ボトルネック
                    ,strToUnicode(cpToStr(i))//律速ボトルネック
            ));
        }
        return rt;
    }
    private static Map<Integer, List<String>> mkTblNfc(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(
                i->i
                ,i->Arrays.asList(
                        String.valueOf(i)
                        ,cpToUniName(i)
                        ,cpToStr(i)
                        ,cpToUniScriptName(i)
                        ,cpToUniBlockName(i)
                        ,strToNorm(cpToStr(i), Normalizer.Form.NFC)
                        ,strToUtf8(strToNorm(cpToStr(i), Normalizer.Form.NFC))
                        ,strToUtf16(strToNorm(cpToStr(i), Normalizer.Form.NFC))
                        ,strToUtf32(strToNorm(cpToStr(i), Normalizer.Form.NFC))
                        ,strToUnicode(strToNorm(cpToStr(i), Normalizer.Form.NFC))
                )
                ,((pre, post) -> post)
                ,LinkedHashMap::new
        ));
    }
    private static Map<Integer, List<String>> mkTblNfd(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(
                i->i
                ,i->Arrays.asList(
                        String.valueOf(i)
                        ,cpToUniName(i)
                        ,cpToStr(i)
                        ,cpToUniScriptName(i)
                        ,cpToUniBlockName(i)
                        ,strToNorm(cpToStr(i), Normalizer.Form.NFD)
                        ,strToUtf8(strToNorm(cpToStr(i), Normalizer.Form.NFD))
                        ,strToUtf16(strToNorm(cpToStr(i), Normalizer.Form.NFD))
                        ,strToUtf32(strToNorm(cpToStr(i), Normalizer.Form.NFD))
                        ,strToUnicode(strToNorm(cpToStr(i), Normalizer.Form.NFD))
                )
                ,((pre, post) -> post)
                ,LinkedHashMap::new
        ));
    }
    private static Map<Integer, List<String>> mkTblNfkc(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(
                i->i
                ,i->Arrays.asList(
                        String.valueOf(i)
                        ,cpToUniName(i)
                        ,cpToStr(i)
                        ,cpToUniScriptName(i)
                        ,cpToUniBlockName(i)
                        ,strToNorm(cpToStr(i), Normalizer.Form.NFKC)
                        ,strToUtf8(strToNorm(cpToStr(i), Normalizer.Form.NFKC))
                        ,strToUtf16(strToNorm(cpToStr(i), Normalizer.Form.NFKC))
                        ,strToUtf32(strToNorm(cpToStr(i), Normalizer.Form.NFKC))
                        ,strToUnicode(strToNorm(cpToStr(i), Normalizer.Form.NFKC))
                )
                ,((pre, post) -> post)
                ,LinkedHashMap::new
        ));
    }
    private static Map<Integer, List<String>> mkTblNfkd(Integer s,Integer e){
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(
                i->i
                ,i->Arrays.asList(
                        String.valueOf(i)
                        ,cpToUniName(i)
                        ,cpToStr(i)
                        ,cpToUniScriptName(i)
                        ,cpToUniBlockName(i)
                        ,strToNorm(cpToStr(i), Normalizer.Form.NFKD)
                        ,strToUtf8(strToNorm(cpToStr(i), Normalizer.Form.NFKD))
                        ,strToUtf16(strToNorm(cpToStr(i), Normalizer.Form.NFKD))
                        ,strToUtf32(strToNorm(cpToStr(i), Normalizer.Form.NFKD))
                        ,strToUnicode(strToNorm(cpToStr(i), Normalizer.Form.NFKD))
                )
                ,((pre, post) -> post)
                ,LinkedHashMap::new
        ));
    }
    private static <K,V> void debug(Map<K,V> map){
        for(Map.Entry<K, V> entry : map.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey(),entry.getValue());
        }
    }
    private static void printOut(Map<Integer, List<String>> m){
        m.entrySet().stream().filter(v->Optional.ofNullable(v.getValue().get(defaultNonGramIdx)).orElse(defaultNonKeyWord).contains(defaultKeyWord))
                .forEach(e-> System.out.println(e.getValue().subList(defaultSelectColStartRn,defaultSelectColEndRn)));
    }
    private static Map<Integer, String> mkIdxUniName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniName(i)).orElse(defaultNonKeyWord))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Set<Integer> findIdxUniName(Integer s, Integer e) {
        return mkIdxUniName(s,e).entrySet().stream()
                .filter(v->v.getValue().contains(defaultKeyWord)).map(ee->ee.getKey()).collect(Collectors.toSet());
    }
    private static Map<Integer, String> mkIdxUniScriptName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniScriptName(i)).orElse(defaultNonKeyWord))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Set<Integer> findIdxUniScriptName(Integer s,Integer e) {
        return mkIdxUniScriptName(s,e).entrySet().stream()
                .filter(v->v.getValue().contains(defaultKeyWord)).map(ee->ee.getKey()).collect(Collectors.toSet());
    }
    private static Map<Integer, String> mkIdxUniBlockName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniBlockName(i)).orElse(defaultNonKeyWord))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Set<Integer> findIdxUniBlockName(Integer s,Integer e) {
        return mkIdxUniBlockName(s,e).entrySet().stream()
                .filter(v->v.getValue().contains(defaultKeyWord)).map(ee->ee.getKey()).collect(Collectors.toSet());
    }
    private static Map<String, List<String>> mkGramIdxUniName(Map<Integer, String> m){
        Map<String, String> tmp = new HashMap<>();
        for(Map.Entry<Integer, String> entry : m.entrySet()){
            List<String> l = Arrays.asList(entry.getValue().split("\\W"));
            int mx = l.size();
            for(int i=0;i<mx;i++){
                tmp.put(entry.getKey() +"-"+ i,l.get(i));
            }
        }
        return tmp.entrySet().stream().collect(Collectors.groupingBy(e->e.getValue(),Collectors.mapping(e->e.getKey(),Collectors.toList())));
    }
    private static Set<Integer> findGramIdxUniName(Integer s,Integer e) {
        Set<Integer> rt = new HashSet<>();
        Map<Integer, String> m = mkIdxUniName(defaultStartRn,defaultEndRn);
        List<String> l = Optional.ofNullable(mkGramIdxUniName(m).get(defaultKeyWord)).orElse(Arrays.asList(defaultNonKeyWord));
        if(l.get(0).equals(defaultNonKeyWord)){
            System.exit(0);
        }else{
            rt = l.stream().map(ee->Integer.valueOf(ee.substring(0,ee.indexOf("-")==-1?ee.length():ee.indexOf("-")))).collect(Collectors.toSet());
        }
        return rt;
    }
    public static void main(String... args ) {
        if(args.length!=0){
            if(args.length%3!=0){
                System.exit(1);
            }else{
                List<Integer> chkDefaultNormGrpRange = IntStream.rangeClosed(0,4).boxed().collect(Collectors.toList());
                if(chkDefaultNormGrpRange.stream().noneMatch(e->e.equals(Integer.valueOf(args[0])))){
                    System.exit(1);
                }else{
                    defaultNormGrp=Integer.valueOf(args[0]);
                }
                List<Integer> chkdefaultNonGramIdxRange = IntStream.rangeClosed(1,3).boxed().collect(Collectors.toList());
                if(chkdefaultNonGramIdxRange.stream().noneMatch(e->e.equals(Integer.valueOf(args[1])))){
                    System.exit(1);
                }else{
                    defaultNonGramIdx=Integer.valueOf(args[1]);
                }
                defaultKeyWord=args[2];
            }
        }else{

        }

        switch (defaultSearchMode){
            case 1:
                Set<Integer> s = null;
                switch (defaultGramIdx){
                    case 1:
                        s = findGramIdxUniName(defaultStartRn,defaultEndRn);
                        break;
                    default:
                        System.exit(1);
                }
                defaultStartRn = s.stream().min(Comparator.comparing(e->e)).get();
                defaultEndRn = s.stream().max(Comparator.comparing(e->e)).get();
                break;
            case 2:
                Set<Integer> ss = null;
                switch (defaultNonGramIdx){
                    case 1:
                        ss = findIdxUniName(defaultStartRn,defaultEndRn);
                        break;
                    case 2:
                        ss = findIdxUniScriptName(defaultStartRn,defaultEndRn);
                        break;
                    case 3:
                        ss = findIdxUniBlockName(defaultStartRn,defaultEndRn);
                        break;
                    default:
                        System.exit(1);
                }
                defaultStartRn = ss.stream().min(Comparator.comparing(e->e)).get();
                defaultEndRn = ss.stream().max(Comparator.comparing(e->e)).get();
                break;
            default:
                System.exit(1);
        }

        Map<Integer, List<String>> ret = null;
        switch (defaultNormGrp){
            case 0:
                ret= mkTblCore(defaultStartRn,defaultEndRn);
                break;
            case 1:
                ret= mkTblNfc(defaultStartRn,defaultEndRn);
                break;
            case 2:
                ret= mkTblNfd(defaultStartRn,defaultEndRn);
                break;
            case 3:
                ret= mkTblNfkc(defaultStartRn,defaultEndRn);
                break;
            case 4:
                ret= mkTblNfkd(defaultStartRn,defaultEndRn);
                break;
            default:
                System.exit(1);
        }
        printOut(ret);
    }
}