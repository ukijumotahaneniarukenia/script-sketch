package app;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.*;
import java.util.function.BiFunction;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    private static String defaultKeyWord="KATAKANA";
    private static Integer defaultSearchMode=1;
    private static Integer defaultHashKeyIdxPtn=1;
    private static Integer defaultGramIdxPtn=2;
    private static Integer defaultNGramIdxPtn=3;
    private static Integer defaultNGram=7;
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
    private static Map<Integer, String> mkIdxUniName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniName(i)).orElse(defaultNonKeyWord))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Map<Integer, String> mkIdxUniScriptName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniScriptName(i)).orElse(defaultNonKeyWord))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Map<Integer, String> mkIdxUniBlockName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniBlockName(i)).orElse(defaultNonKeyWord))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
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
    private static Map<String, List<String>> mkWordIdx(Map<Integer, String> m){
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
    private static Set<Integer> mkIdxShape(List<String> l){
        return l.stream().map(ee->Integer.valueOf(ee.substring(0,ee.indexOf("-")==-1?ee.length():ee.indexOf("-")))).collect(Collectors.toSet());
    }
    private static Set<Integer> mkIdxFilter(Map<Integer,String> m,String s){
        return m.entrySet().stream()
                .filter(v->v.getValue().contains(s)).map(ee->ee.getKey()).collect(Collectors.toSet());
    }
    private static <K,V,N,S,R> Set<N> executeNgramSearch(
            K defaultStartRn
            ,V defaultEndRn
            ,N defaultNGram
            ,S defaultKeyWord
            ,List<R> defaultNonKeyWord
            ,BiFunction<K,V,Map<K,R>> mkInputFunction
            ,BiFunction<Map<K,R>,N,Map<R,List<R>>> mkIdxFunction
            ,Function<List<R>,Set<N>> mkIdxShapeFunction
    ){
        Set<N> rt = new HashSet<>();
        Map<K,R> input = mkInputFunction.apply(defaultStartRn,defaultEndRn);
        Map<R,List<R>> midput = mkIdxFunction.apply(input,defaultNGram);
        List<R> output = Optional.ofNullable(midput.get("BB8")).orElse(defaultNonKeyWord);
        if(output.get(0).equals(defaultNonKeyWord.get(0))){
            System.exit(0);
        }else{
            rt = mkIdxShapeFunction.apply(output);
        }
        return rt;
    }
    private static <K,V,N,S,R> Set<N> executeNonNgramSearch(
            K defaultStartRn
            ,V defaultEndRn
            ,S defaultKeyWord
            ,List<R> defaultNonKeyWord
            ,BiFunction<K,V,Map<K,R>> mkInputFunction
            ,Function<Map<K,R>,Map<R,List<R>>> mkIdxFunction
            ,Function<List<R>,Set<N>> mkIdxShapeFunction
    ){
        Set<N> rt = new HashSet<>();
        Map<K,R> input = mkInputFunction.apply(defaultStartRn,defaultEndRn);
        Map<R,List<R>> midput = mkIdxFunction.apply(input);
        List<R> output = Optional.ofNullable(midput.get(defaultKeyWord)).orElse(defaultNonKeyWord);
        if(output.get(0).equals(defaultNonKeyWord.get(0))){
            System.exit(0);
        }else{
            rt = mkIdxShapeFunction.apply(output);
        }
        return rt;
    }
    private static <K,V,N,S,R> Set<N> executeHashKeySearch(
            K defaultStartRn
            ,V defaultEndRn
            ,S defaultKeyWord
            ,BiFunction<K,V,Map<K,R>> mkInputFunction
            ,BiFunction<Map<K,R>,S,Set<N>> mkIdxFilterFunction
    ){
        Map<K,R> input = mkInputFunction.apply(defaultStartRn,defaultEndRn);
        return mkIdxFilterFunction.apply(input,defaultKeyWord);
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
    public static Integer subMain(final List<String> args ){
        int rt=0;
        defaultSearchMode = Integer.valueOf(checkXXX(1,3,0,args));
        switch (defaultSearchMode){
            case 1:
                defaultGramIdxPtn = Integer.valueOf(checkXXX(1,3,1,args));
                break;
            case 2:
                defaultNGramIdxPtn = Integer.valueOf(checkXXX(1,3,1,args));
                break;
            case 3:
                defaultHashKeyIdxPtn = Integer.valueOf(checkXXX(1,3,1,args));
                break;
            default:
                break;
        }
        defaultNormGrp = Integer.valueOf(checkXXX(0,4,2,args));
        defaultKeyWord = checkXXX(3,3,3,args);

        System.out.printf("defaultSearchMode:%s\tdefaultGramIdxPtn:%s\tdefaultNGramIdxPtn:%s\tdefaultHashKeyIdxPtn:%s\tdefaultNormGrp:%s\tdefaultKeyWord:%s\n"
                ,defaultSearchMode,defaultGramIdxPtn,defaultNGramIdxPtn,defaultHashKeyIdxPtn,defaultNormGrp,defaultKeyWord);

        System.out.printf("defaultSearchMode:%s\tdefaultSearchPtn:%s\tdefaultNGram:%s\tdefaultNormGrp:%s\tdefaultKeyWord:%s\tdefaultStartRn:%s\tdefaultEndRn:%s\n"
                ,defaultSearchMode
                ,defaultSearchMode==1?defaultGramIdxPtn:defaultSearchMode==2?defaultNGramIdxPtn:defaultSearchMode==3?defaultHashKeyIdxPtn:null
                ,defaultNGram
                ,defaultNormGrp
                ,defaultKeyWord
                ,defaultStartRn
                ,defaultEndRn);

        if(2==defaultSearchMode){
            List<String> l = Arrays.asList(defaultKeyWord.split(":"));
            if(2!=l.size()){
                defaultKeyWord = Optional.of(l.get(0)).orElse(defaultKeyWord);
            }else{
                defaultKeyWord = Optional.of(l.get(0)).orElse(defaultKeyWord);
                defaultNGram = Optional.of(Integer.valueOf(l.get(1))).orElse(-1);
            }
        }

        System.out.printf("defaultSearchMode:%s\tdefaultSearchPtn:%s\tdefaultNGram:%s\tdefaultNormGrp:%s\tdefaultKeyWord:%s\tdefaultStartRn:%s\tdefaultEndRn:%s\n"
                ,defaultSearchMode
                ,defaultSearchMode==1?defaultGramIdxPtn:defaultSearchMode==2?defaultNGramIdxPtn:defaultSearchMode==3?defaultHashKeyIdxPtn:null
                ,defaultNGram
                ,defaultNormGrp
                ,defaultKeyWord
                ,defaultStartRn
                ,defaultEndRn);

        return rt;
    }

    private static String checkXXX(Integer s,Integer e,Integer n,final List<String> l){
        Pattern p = Pattern.compile("\\D");
        int mx=l.size();
        if(n>mx){
            return "-1";
        }
        if(-1!=l.get(n).indexOf(":")){
            return l.get(n);
        }else if(p.matcher(l.get(n)).find()) {
            return l.get(n);
        }else{
            return IntStream.rangeClosed(s,e).boxed().noneMatch(ee->ee.equals(Optional.ofNullable(Integer.valueOf(l.get(n))).orElse(-1)))?"-1":l.get(n);
        }
    }

    public static void main(String... args) throws InterruptedException {

        if(args.length!=0){
            if(args.length%4!=0){
                System.exit(1);
            }else{
                subMain(Arrays.asList(args)); //テストパッケージのBiFunctionの戻り値はvoid無理やからここでは捨てる
            }
        }else{

        }

        System.out.printf("defaultSearchMode:%s\tdefaultSearchPtn:%s\tdefaultNGram:%s\tdefaultNormGrp:%s\tdefaultKeyWord:%s\tdefaultStartRn:%s\tdefaultEndRn:%s\n"
                ,defaultSearchMode
                ,defaultSearchMode==1?defaultGramIdxPtn:defaultSearchMode==2?defaultNGramIdxPtn:defaultSearchMode==3?defaultHashKeyIdxPtn:null
                ,defaultNGram
                ,defaultNormGrp
                ,defaultKeyWord
                ,defaultStartRn
                ,defaultEndRn);

        switch (defaultSearchMode){
            case 1://NGRAMの粒度より少し粗い単語単位の分割。
                Set<Integer> s = null;
                switch (defaultGramIdxPtn){
                    case 1:
                        s = executeNonNgramSearch(defaultStartRn,defaultEndRn,defaultKeyWord,Arrays.asList(defaultNonKeyWord),App::mkIdxUniName,App::mkWordIdx,App::mkIdxShape);
                        break;
                    case 2:
                        s = executeNonNgramSearch(defaultStartRn,defaultEndRn,defaultKeyWord,Arrays.asList(defaultNonKeyWord),App::mkIdxUniScriptName,App::mkWordIdx,App::mkIdxShape);
                        break;
                    case 3:
                        s = executeNonNgramSearch(defaultStartRn,defaultEndRn,defaultKeyWord,Arrays.asList(defaultNonKeyWord),App::mkIdxUniBlockName,App::mkWordIdx,App::mkIdxShape);
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
            case 2://ヒットしたという感覚が検索結果の多寡に応じて一喜一憂するなら、NGRAMは網羅性を除いてはあまりヒット率の向上には役に立たないのかもしれない。
                Set<Integer> ss = null;
                switch (defaultNGramIdxPtn){
                    case 1:
                        ss = executeNgramSearch(defaultStartRn,defaultEndRn,defaultNGram,defaultKeyWord,Arrays.asList(defaultNonKeyWord),App::mkIdxUniName,App::mkNGramIdx,App::mkIdxShape);
                        break;
                    case 2:
                        ss = executeNgramSearch(defaultStartRn,defaultEndRn,defaultNGram,defaultKeyWord,Arrays.asList(defaultNonKeyWord),App::mkIdxUniScriptName,App::mkNGramIdx,App::mkIdxShape);
                        break;
                    case 3:
                        ss = executeNgramSearch(defaultStartRn,defaultEndRn,defaultNGram,defaultKeyWord,Arrays.asList(defaultNonKeyWord),App::mkIdxUniBlockName,App::mkNGramIdx,App::mkIdxShape);
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
            case 3://単一文字列に対するハッシュキー検索は文字列に対するcontains関数によるもの。これがはやい。
                Set<Integer> sss = null;
                switch (defaultHashKeyIdxPtn){
                    case 1:
                        sss = executeHashKeySearch(defaultStartRn,defaultEndRn,defaultKeyWord,App::mkIdxUniName,App::mkIdxFilter);
                        break;
                    case 2:
                        sss = executeHashKeySearch(defaultStartRn,defaultEndRn,defaultKeyWord,App::mkIdxUniScriptName,App::mkIdxFilter);
                        break;
                    case 3:
                        sss = executeHashKeySearch(defaultStartRn,defaultEndRn,defaultKeyWord,App::mkIdxUniBlockName,App::mkIdxFilter);
                        break;
                    default:
                        System.exit(1);
                        break;
                }
                if(0!=sss.size()){
                    defaultStartRn = sss.stream().min(Comparator.comparing(e->e)).get();
                    defaultEndRn = sss.stream().max(Comparator.comparing(e->e)).get();
                }else{
                    System.exit(1);
                }
                break;
            default:
                System.exit(1);
                break;
        }

        System.out.printf("defaultSearchMode:%s\tdefaultSearchPtn:%s\tdefaultNGram:%s\tdefaultNormGrp:%s\tdefaultKeyWord:%s\tdefaultStartRn:%s\tdefaultEndRn:%s\n"
                ,defaultSearchMode
                ,defaultSearchMode==1?defaultGramIdxPtn:defaultSearchMode==2?defaultNGramIdxPtn:defaultSearchMode==3?defaultHashKeyIdxPtn:null
                ,defaultNGram
                ,defaultNormGrp
                ,defaultKeyWord
                ,defaultStartRn
                ,defaultEndRn);


        //通番チェックが必要。通番ならフィルタリングなし。通番じゃないならフィルタリングあり。

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

        debug(ret);
//        printOut(ret);
    }
}