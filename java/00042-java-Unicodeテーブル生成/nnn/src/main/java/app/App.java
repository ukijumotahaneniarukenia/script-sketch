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
    private static Integer defaultSearchMode=1;
    private static Integer defaultNonGramIdx=1;
    private static Integer defaultGramIdx=2;
    private static Integer defaultNGram=6;
    private static Integer defaultNormGrp=4;
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
                    ,cpToStr(i)
                    ,cpToUniName(i)
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
                        ,cpToStr(i)
                        ,cpToUniName(i)
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
                        ,cpToStr(i)
                        ,cpToUniName(i)
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
                        ,cpToStr(i)
                        ,cpToUniName(i)
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
                        ,cpToStr(i)
                        ,cpToUniName(i)
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
        m.entrySet().stream().filter(v->v.getValue().contains(defaultKeyWord))
                .forEach(e->System.out.println(e.getValue().subList(defaultSelectColStartRn,defaultSelectColEndRn)));
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
    private static Map<String, List<String>> mkGramIdx(Map<Integer, String> m){
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
        List<String> l = Optional.ofNullable(mkGramIdx(m).get(defaultKeyWord)).orElse(Arrays.asList(defaultNonKeyWord));
        if(l.get(0).equals(defaultNonKeyWord)){
            System.exit(0);
        }else{
            rt = l.stream().map(ee->Integer.valueOf(ee.substring(0,ee.indexOf("-")==-1?ee.length():ee.indexOf("-")))).collect(Collectors.toSet());
        }
        return rt;
    }
    private static Set<Integer> findGramIdxUniScriptName(Integer s,Integer e) {
        Set<Integer> rt = new HashSet<>();
        Map<Integer, String> m = mkIdxUniScriptName(defaultStartRn,defaultEndRn);
        List<String> l = Optional.ofNullable(mkGramIdx(m).get(defaultKeyWord)).orElse(Arrays.asList(defaultNonKeyWord));
        if(l.get(0).equals(defaultNonKeyWord)){
            System.exit(0);
        }else{
            rt = l.stream().map(ee->Integer.valueOf(ee.substring(0,ee.indexOf("-")==-1?ee.length():ee.indexOf("-")))).collect(Collectors.toSet());
        }
        return rt;
    }
    private static Set<Integer> findGramIdxUniBlockName(Integer s,Integer e) {
        Set<Integer> rt = new HashSet<>();
        Map<Integer, String> m = mkIdxUniBlockName(defaultStartRn,defaultEndRn);
        List<String> l = Optional.ofNullable(mkGramIdx(m).get(defaultKeyWord)).orElse(Arrays.asList(defaultNonKeyWord));
        if(l.get(0).equals(defaultNonKeyWord)){
            System.exit(0);
        }else{
            rt = l.stream().map(ee->Integer.valueOf(ee.substring(0,ee.indexOf("-")==-1?ee.length():ee.indexOf("-")))).collect(Collectors.toSet());
        }
        return rt;
    }
    private static String repeat(String str, int n) {
        return Stream.generate(() -> str).limit(n).collect(Collectors.joining());
    }
    private static String salt(String str,String prefix,String suffix) {
        return Stream.of(str).collect(Collectors.joining("",prefix,suffix));
    }
    private static List<String> ngram (String s,Integer n){
        List<String> rt = new ArrayList<>();
        String ngramPtn = Stream.of(repeat(".",n)).map(e->salt(e,"(?=(","))")).collect(Collectors.joining());
        Pattern p = Pattern.compile(ngramPtn);
        Matcher m = p.matcher(s);
        while(m.find()){
            rt.add(m.group(1));
        }
        return rt;
    }
    private static Map<String, List<String>> mkNGramIdx(Map<Integer, String> m,Integer n){
        Map<String, String> tmp = new HashMap<>();
        for(Map.Entry<Integer, String> entry : m.entrySet()){
            List<String> l = Arrays.asList(entry.getValue().split("\\W"));
            int mx = l.size();
            for(int i=0;i<mx;i++){
                List<String> ll = ngram(l.get(i),n);
                int mxmx=ll.size();
                for(int j=0;j<mxmx;j++){
                    tmp.put(entry.getKey() +"-"+ i+"-"+ j,ll.get(j));
                }
            }
        }
        return tmp.entrySet().stream().collect(Collectors.groupingBy(e->e.getValue(),Collectors.mapping(e->e.getKey(),Collectors.toList())));
    }
    private static Set<Integer> findNGramIdxUniName(Integer s,Integer e,Integer n) {
        Set<Integer> rt = new HashSet<>();
        Map<Integer, String> m = mkIdxUniName(defaultStartRn,defaultEndRn);
        List<String> l = Optional.ofNullable(mkNGramIdx(m,n).get(defaultKeyWord)).orElse(Arrays.asList(defaultNonKeyWord));
        if(l.get(0).equals(defaultNonKeyWord)){
            System.exit(0);
        }else{
            rt = l.stream().map(ee->Integer.valueOf(ee.substring(0,ee.indexOf("-")==-1?ee.length():ee.indexOf("-")))).collect(Collectors.toSet());
        }
        return rt;
    }
    private static Set<Integer> findNGramIdxUniScriptName(Integer s,Integer e,Integer n) {
        Set<Integer> rt = new HashSet<>();
        Map<Integer, String> m = mkIdxUniScriptName(defaultStartRn,defaultEndRn);
        List<String> l = Optional.ofNullable(mkNGramIdx(m,n).get(defaultKeyWord)).orElse(Arrays.asList(defaultNonKeyWord));
        if(l.get(0).equals(defaultNonKeyWord)){
            System.exit(0);
        }else{
            rt = l.stream().map(ee->Integer.valueOf(ee.substring(0,ee.indexOf("-")==-1?ee.length():ee.indexOf("-")))).collect(Collectors.toSet());
        }
        return rt;
    }
    private static Set<Integer> findNGramIdxUniBlockName(Integer s,Integer e,Integer n) {
        Set<Integer> rt = new HashSet<>();
        Map<Integer, String> m = mkIdxUniBlockName(defaultStartRn,defaultEndRn);
        List<String> l = Optional.ofNullable(mkNGramIdx(m,n).get(defaultKeyWord)).orElse(Arrays.asList(defaultNonKeyWord));
        if(l.get(0).equals(defaultNonKeyWord)){
            System.exit(0);
        }else{
            rt = l.stream().map(ee->Integer.valueOf(ee.substring(0,ee.indexOf("-")==-1?ee.length():ee.indexOf("-")))).collect(Collectors.toSet());
        }
        return rt;
    }
    private static void subMain(){
        Map<Integer, String> m = mkIdxUniName(defaultStartRn,defaultEndRn);
        Map<String, List<String>> rt = mkNGramIdx(m,5);
        debug(rt);
        System.exit(0);
    }
    public static void main(String... args ) {

        subMain();

        if(args.length!=0){
            if(args.length%4!=0){
                System.exit(1);
            }else{
                List<Integer> checkDefaultSearchModeRange = IntStream.rangeClosed(1,2).boxed().collect(Collectors.toList());
                if(checkDefaultSearchModeRange.stream().noneMatch(e->e.equals(Integer.valueOf(args[0])))){
                    System.exit(1);
                }else{
                    defaultSearchMode=Integer.valueOf(args[0]);
                }
                if(1==defaultSearchMode){
                    List<Integer> checkDefaultGramIdxRange = IntStream.rangeClosed(1,3).boxed().collect(Collectors.toList());
                    if(checkDefaultGramIdxRange.stream().noneMatch(e->e.equals(Integer.valueOf(args[1])))){
                        System.exit(1);
                    }else{
                        defaultGramIdx=Integer.valueOf(args[1]);
                        defaultNGram=Integer.valueOf(args[2]);
                    }
                }else{
                    List<Integer> checkDefaultNonGramIdxRange = IntStream.rangeClosed(1,3).boxed().collect(Collectors.toList());
                    if(checkDefaultNonGramIdxRange.stream().noneMatch(e->e.equals(Integer.valueOf(args[1])))){
                        System.exit(1);
                    }else{
                        defaultNonGramIdx=Integer.valueOf(args[1]);
                    }
                }
                List<Integer> checkDefaultNormGrpRange = IntStream.rangeClosed(0,4).boxed().collect(Collectors.toList());
                if(checkDefaultNormGrpRange.stream().noneMatch(e->e.equals(Integer.valueOf(args[3])))){
                    System.exit(1);
                }else{
                    defaultNormGrp=Integer.valueOf(args[3]);
                }
                defaultKeyWord=args[4];
            }
        }else{

        }

        System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\n",defaultSearchMode,defaultSearchMode==1?defaultGramIdx:defaultNonGramIdx,defaultNormGrp,defaultKeyWord,defaultStartRn,defaultEndRn);

        switch (defaultSearchMode){
            case 1:
                Set<Integer> s = null;
                switch (defaultGramIdx){
                    case 1:
                        s = findGramIdxUniName(defaultStartRn,defaultEndRn);
                        break;
                    case 2:
                        s = findGramIdxUniScriptName(defaultStartRn,defaultEndRn);
                        break;
                    case 3:
                        s = findGramIdxUniBlockName(defaultStartRn,defaultEndRn);
                        break;
                    case 4:
                        s = findNGramIdxUniName(defaultStartRn,defaultEndRn,defaultNGram);
                        break;
                    case 5:
                        s = findNGramIdxUniScriptName(defaultStartRn,defaultEndRn,defaultNGram);
                        break;
                    case 6:
                        s = findNGramIdxUniBlockName(defaultStartRn,defaultEndRn,defaultNGram);
                        break;
                    default:
                        System.exit(1);
                        break;
                }
                if(0!=s.size()){
                    defaultStartRn = s.stream().min(Comparator.comparing(e->e)).get();
                    defaultEndRn = s.stream().max(Comparator.comparing(e->e)).get();
                }else{
                    System.exit(1);
                }
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
                        break;
                }
                if(0!=ss.size()){
                    defaultStartRn = ss.stream().min(Comparator.comparing(e->e)).get();
                    defaultEndRn = ss.stream().max(Comparator.comparing(e->e)).get();
                }else{
                    System.exit(1);
                }
                break;
            default:
                System.exit(1);
                break;
        }

        System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\n",defaultSearchMode,defaultSearchMode==1?defaultGramIdx:defaultNonGramIdx,defaultNormGrp,defaultKeyWord,defaultStartRn,defaultEndRn);

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

        System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\n",defaultSearchMode,defaultSearchMode==1?defaultGramIdx:defaultNonGramIdx,defaultNormGrp,defaultKeyWord,defaultStartRn,defaultEndRn);
    }
}