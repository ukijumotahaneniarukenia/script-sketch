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

    private static Integer SUCCESS_STATUS=0;
    private static Integer FAILURE_STATUS=1;
    private static String DEFAULT_SEARCH_KEY_WORD="KATAKANA";

    private static String MAPKEY_SEARCH_MODE="DEFAULT_SEARCH_MODE";
    private static String MAPKEY_IDX_INPUT_PTN="DEFAULT_IDX_INPUT_PTN";
    private static String MAPKEY_NORM_GRP="DEFAULT_NORM_GRP";
    private static String MAPKEY_SEARCH_KEY_WORD="DEFAULT_SEARCH_KEY_WORD";
    private static String MAPKEY_NGRAM_CNT="DEFAULT_NGRAM_CNT";

    private static String DEFAULT_SEARCH_MODE="1";
    private static final String SEARCH_MODE_WORD = "1";
    private static final String SEARCH_MODE_NGRAM = "2";
    private static final String SEARCH_MODE_HASH_KEY = "3";

    private static String DEFAULT_IDX_INPUT_PTN="1";
    private static final String IDX_INPUT_UNICODE_NAME = "1";
    private static final String IDX_INPUT_UNICODE_SCRIPT_NAME = "2";
    private static final String IDX_INPUT_UNICODE_BLOCK_NAME = "3";

    private static String DEFAULT_NORM_GRP="4";
    private static final String NORM_GRP_CORE="0";
    private static final String NORM_GRP_NFC="1";
    private static final String NORM_GRP_NFD="2";
    private static final String NORM_GRP_NFKC="3";
    private static final String NORM_GRP_NFKD="4";

    private final static String OPTION_ON = "1";
    private final static String OPTION_OFF = "-9999";
    private final static String OPTION_HELP = "OPTION_HELP";
    private final static String OPTION_VERSION = "OPTION_VERSION";
    private final static String OPTION_USAGE = "OPTION_USAGE";

    private final static String OPTION_WORD_SEARCH = "WORD_SEARCH";
    private final static String OPTION_NGRAM_SEARCH = "NGRAM_SEARCH";
    private final static String OPTION_HASH_KEY_SEARCH = "HASH_KEY_SEARCH";

    private final static String ARTIFACT_ID = "1-0-0";
    private final static String ARGS_SEPARATOR = ":";

    private static Integer DEFAULT_NGRAM_CNT=7;

    private static Integer DEFAULT_START_RN=Character.MIN_CODE_POINT;
    private static Integer DEFAULT_END_RN=Character.MAX_CODE_POINT;

    private static String DEFAULT_NONE_KEY_WORD="ウンコもりもり森鴎外";

    private final static Map<String, List<String>> prepareParseOptPtn = new LinkedHashMap<>(){{
        put(OPTION_HELP, Arrays.asList("true", "-h", "--h", "--help", "-help"));
        put(OPTION_VERSION, Arrays.asList("true", "-v", "--v", "-V", "--V", "-version", "--version"));
        put(OPTION_WORD_SEARCH, Arrays.asList("false","4", "-w.*", "--w.*", "-word.*", "--word.*")); //-w
        put(OPTION_NGRAM_SEARCH, Arrays.asList("false","5", "-n.*", "--n.*", "-ngram.*", "--ngram.*"));
        put(OPTION_HASH_KEY_SEARCH, Arrays.asList("false","4", "-{1,}hh.*", "-{1,}hash.*", "-{1,}hash-?key.*", "-{1,}hash-?Key.*", "-{1,}Hash-?Key.*", "-{1,}Hash-?key.*"));
    }};

    private final static Map<String, List<String>> prepareParseOptPtnName = new LinkedHashMap<>(){{
        put(OPTION_WORD_SEARCH, Arrays.asList("DEFAULT_SEARCH_MODE","DEFAULT_IDX_INPUT_PTN","DEFAULT_NORM_GRP","DEFAULT_SEARCH_KEY_WORD"));
        put(OPTION_NGRAM_SEARCH, Arrays.asList("DEFAULT_SEARCH_MODE","DEFAULT_IDX_INPUT_PTN","DEFAULT_NORM_GRP","DEFAULT_NGRAM_CNT","DEFAULT_SEARCH_KEY_WORD"));
        put(OPTION_HASH_KEY_SEARCH, Arrays.asList("DEFAULT_SEARCH_MODE","DEFAULT_IDX_INPUT_PTN","DEFAULT_NORM_GRP","DEFAULT_SEARCH_KEY_WORD"));
    }};

    private final static Map<String, Map<String,String>> prepareParseOptPtnRangeChk = new LinkedHashMap<>(){{
        put(OPTION_WORD_SEARCH, Map.of("DEFAULT_SEARCH_MODE","1:3","DEFAULT_IDX_INPUT_PTN","1:3","DEFAULT_NORM_GRP","0:4","DEFAULT_SEARCH_KEY_WORD","[A-Z]+"));
        put(OPTION_NGRAM_SEARCH, Map.of("DEFAULT_SEARCH_MODE","1:3","DEFAULT_IDX_INPUT_PTN","1:3","DEFAULT_NORM_GRP","0:4","DEFAULT_NGRAM_CNT","0:7","DEFAULT_SEARCH_KEY_WORD","[A-Z]+"));
        put(OPTION_HASH_KEY_SEARCH, Map.of("DEFAULT_SEARCH_MODE","1:3","DEFAULT_IDX_INPUT_PTN","1:3","DEFAULT_NORM_GRP","0:4","DEFAULT_SEARCH_KEY_WORD","[A-Z]+"));
    }};

    private static void optionUsage(String... optionPtn){
        for(String option : optionPtn){
            switch (option){
                case OPTION_HELP:
                case OPTION_USAGE:
                    optionHelp();
                    break;
                case OPTION_VERSION:
                    optionVersion();
                    break;
                case OPTION_WORD_SEARCH:
                    usageWordSearch();
                    break;
                case OPTION_NGRAM_SEARCH:
                    usageNgramSearch();
                    break;
                case OPTION_HASH_KEY_SEARCH:
                    usageHashKeySearch();
                    break;
                default:
                    break;
            }
        }
    }
    private static void optionHelp(){
        System.out.println("optionHelp");
    }
    private static void optionVersion(){
        System.out.println(ARTIFACT_ID);
    }
    private static void usageWordSearch(){
        //TODO ヒアドキュメント対応する
        System.out.println("usageWordSearch");
    }
    private static void usageNgramSearch(){
        //TODO ヒアドキュメント対応する
        System.out.println("usageNgramSearch");
    }
    private static void usageHashKeySearch(){
        //TODO ヒアドキュメント対応する
        System.out.println("usageHashKeySearch");
    }

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
    private static Map<Integer, String> mkInputUnicodeName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniName(i)).orElse(DEFAULT_NONE_KEY_WORD))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Map<Integer, String> mkInputUnicodeScriptName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniScriptName(i)).orElse(DEFAULT_NONE_KEY_WORD))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Map<Integer, String> mkInputUnicodeBlockName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniBlockName(i)).orElse(DEFAULT_NONE_KEY_WORD))).entrySet().stream()
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
            K startRn
            ,V endRn
            ,N ngramCnt
            ,S search_key_word
            ,List<R> noneKeyWord
            ,BiFunction<K,V,Map<K,R>> mkInputFunction
            ,BiFunction<Map<K,R>,N,Map<R,List<R>>> mkIdxFunction
            ,Function<List<R>,Set<N>> mkIdxShapeFunction
    ){
        Set<N> rt;
        Map<K,R> input = mkInputFunction.apply(startRn,endRn);
        Map<R,List<R>> midput = mkIdxFunction.apply(input,ngramCnt);
        List<R> output = Optional.ofNullable(midput.get(search_key_word)).orElse(noneKeyWord);
//        output.stream().limit(10).forEach(e-> System.out.println(e));
        if(output.get(0).equals(noneKeyWord.get(0))){
            return new HashSet<>();
        }else{
            rt = mkIdxShapeFunction.apply(output);
        }
        return rt;
    }
    private static <K,V,N,S,R> Set<N> executeWordNgramSearch(
            K startRn
            ,V endRn
            ,S search_key_word
            ,List<R> noneKeyWord
            ,BiFunction<K,V,Map<K,R>> mkInputFunction
            ,Function<Map<K,R>,Map<R,List<R>>> mkIdxFunction
            ,Function<List<R>,Set<N>> mkIdxShapeFunction
    ){
        Set<N> rt;
        Map<K,R> input = mkInputFunction.apply(startRn,endRn);
//        input.entrySet().stream().forEach(e-> System.out.println(e));
        Map<R,List<R>> midput = mkIdxFunction.apply(input);
//        midput.entrySet().stream().forEach(e-> System.out.println(e));
        List<R> output = Optional.ofNullable(midput.get(search_key_word)).orElse(noneKeyWord);
//        output.stream().limit(10).forEach(e-> System.out.println(e));
        if(output.get(0).equals(noneKeyWord.get(0))){
            return new HashSet<>();
        }else{
            rt = mkIdxShapeFunction.apply(output);
        }
        return rt;
    }
    private static <K,V,N,S,R> Set<N> executeHashKeySearch(
            K startRn
            ,V endRn
            ,S search_key_word
            ,BiFunction<K,V,Map<K,R>> mkInputFunction
            ,BiFunction<Map<K,R>,S,Set<N>> mkIdxFilterFunction
    ){
        Map<K,R> input = mkInputFunction.apply(startRn,endRn);
        return mkIdxFilterFunction.apply(input,search_key_word);
    }
    private static void debug(Map<Integer,List<String>> map){
        for(Map.Entry<Integer,List<String>> entry : map.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey(),entry.getValue().stream().collect(Collectors.joining("\t")));
        }
    }
    private static List<List<String>> grpKeTsuBanMnMx(List<Integer> r){
        Map<Integer,Integer> m = r.stream().sorted(Comparator.naturalOrder()).collect(Collectors.toMap(e->e,e->e+1,(pre,post)->post,LinkedHashMap::new));
        StringBuilder sb = new StringBuilder();
        Integer preKey=-1;
        for(Map.Entry<Integer,Integer> entry : m.entrySet()){
            if(entry.getKey().intValue()==preKey){
                sb.append(","+entry.getKey().intValue());
            }else{
                sb.append("\n"+","+entry.getKey());
            }
            preKey = entry.getValue().intValue();
        }
        return Stream.of(sb.toString()).flatMap(e->Arrays.asList(e.split("\n")).stream().filter(ee->0!=ee.length())).map(ee->Arrays.asList(Arrays.asList(ee.split(",")).stream().filter(eee->0!=eee.length()).toArray(String[]::new))).collect(Collectors.toList());
    }
    private static Map<Integer, List<String>> searchTbl(Integer startRn,Integer endRn){
        Map<Integer, List<String>> rt = null;
        switch (DEFAULT_NORM_GRP){
            case NORM_GRP_CORE:
                rt= mkTblCore(startRn,endRn);
                break;
            case NORM_GRP_NFC:
                rt= mkTblNfc(startRn,endRn);
                break;
            case NORM_GRP_NFD:
                rt= mkTblNfd(startRn,endRn);
                break;
            case NORM_GRP_NFKC:
                rt= mkTblNfkc(startRn,endRn);
                break;
            case NORM_GRP_NFKD:
                rt= mkTblNfkd(startRn,endRn);
                break;
            default:
                System.exit(FAILURE_STATUS);
        }
        return rt;
    }
    private static Map<Integer,List<Integer>> grpStartEndRn(List<Integer> r){
        List<List<String>> ll = grpKeTsuBanMnMx(r);
        Map<Integer,List<Integer>> rt = new HashMap<>();
        int row=ll.size();
        for(int i=0;i<row;i++){
            rt.put(i,Arrays.asList(Integer.valueOf(ll.get(i).stream().min(Comparator.comparing(e->Integer.valueOf(e))).get())
                    ,Integer.valueOf(ll.get(i).stream().max(Comparator.comparing(e->Integer.valueOf(e))).get())));
        }
        return rt;
    }
    private static Integer printOut(Map<Integer,List<Integer>> rr){
        int ret = SUCCESS_STATUS;
        int cnt = 0;
        for(int i=0;i<rr.size();i++){
            cnt+=(rr.get(i).get(1)-rr.get(i).get(0)+1);
            debug(searchTbl(rr.get(i).get(0),rr.get(i).get(1)));
        }
        return ret+cnt;
    }
    private static void subMain(){
        //https://qiita.com/kiida/items/9d26b850194fa1a02e67
        System.exit(0);
    }

    private static Set<Integer> searchCodePointStartEndWithSearchModeWord(Map<String,String> searchCondition){
        Set<Integer> rt = null;

        return rt;
    }

    private static Set<Integer> searchCodePointStartEnd(Map<String,String> searchCondition){
//        searchCondition.entrySet().stream().forEach(e-> System.out.println(e));
//        System.out.println(Stream.generate(()->"~").limit(100).collect(Collectors.joining()));

        Set<Integer> rt = null;
        switch (searchCondition.get(MAPKEY_SEARCH_MODE)){
            case SEARCH_MODE_WORD:
                switch (searchCondition.get(MAPKEY_IDX_INPUT_PTN)){
                    case IDX_INPUT_UNICODE_NAME:
                        rt = executeWordNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(searchCondition.get(MAPKEY_SEARCH_KEY_WORD)).orElse(DEFAULT_SEARCH_KEY_WORD),Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeName,App::mkWordIdx,App::mkIdxShape);
                        break;
                    case IDX_INPUT_UNICODE_SCRIPT_NAME:
                        rt = executeWordNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(searchCondition.get(MAPKEY_SEARCH_KEY_WORD)).orElse(DEFAULT_SEARCH_KEY_WORD),Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeScriptName,App::mkWordIdx,App::mkIdxShape);
                        break;
                    case IDX_INPUT_UNICODE_BLOCK_NAME:
                        rt = executeWordNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(searchCondition.get(MAPKEY_SEARCH_KEY_WORD)).orElse(DEFAULT_SEARCH_KEY_WORD),Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeBlockName,App::mkWordIdx,App::mkIdxShape);
                        break;
                    default:
                        System.exit(FAILURE_STATUS);
                        break;
                }
                break;
            case SEARCH_MODE_NGRAM:
                switch (searchCondition.get(MAPKEY_IDX_INPUT_PTN)){
                    case IDX_INPUT_UNICODE_NAME:
                        rt = executeNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(Integer.parseInt(searchCondition.get(MAPKEY_NGRAM_CNT))).orElse(DEFAULT_NGRAM_CNT),Optional.ofNullable(searchCondition.get(MAPKEY_SEARCH_KEY_WORD)).orElse(DEFAULT_SEARCH_KEY_WORD),Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeName,App::mkNGramIdx,App::mkIdxShape);
                        break;
                    case IDX_INPUT_UNICODE_SCRIPT_NAME:
                        rt = executeNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(Integer.parseInt(searchCondition.get(MAPKEY_NGRAM_CNT))).orElse(DEFAULT_NGRAM_CNT),Optional.ofNullable(searchCondition.get(MAPKEY_SEARCH_KEY_WORD)).orElse(DEFAULT_SEARCH_KEY_WORD),Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeScriptName,App::mkNGramIdx,App::mkIdxShape);
                        break;
                    case IDX_INPUT_UNICODE_BLOCK_NAME:
                        rt = executeNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(Integer.parseInt(searchCondition.get(MAPKEY_NGRAM_CNT))).orElse(DEFAULT_NGRAM_CNT),Optional.ofNullable(searchCondition.get(MAPKEY_SEARCH_KEY_WORD)).orElse(DEFAULT_SEARCH_KEY_WORD),Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeBlockName,App::mkNGramIdx,App::mkIdxShape);
                        break;
                    default:
                        System.exit(FAILURE_STATUS);
                        break;
                }
                break;
            case SEARCH_MODE_HASH_KEY:
                switch (searchCondition.get(MAPKEY_IDX_INPUT_PTN)){
                    case IDX_INPUT_UNICODE_NAME:
                        rt = executeHashKeySearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(searchCondition.get(MAPKEY_SEARCH_KEY_WORD)).orElse(DEFAULT_SEARCH_KEY_WORD),App::mkInputUnicodeName,App::mkIdxFilter);
                        break;
                    case IDX_INPUT_UNICODE_SCRIPT_NAME:
                        rt = executeHashKeySearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(searchCondition.get(MAPKEY_SEARCH_KEY_WORD)).orElse(DEFAULT_SEARCH_KEY_WORD),App::mkInputUnicodeScriptName,App::mkIdxFilter);
                        break;
                    case IDX_INPUT_UNICODE_BLOCK_NAME:
                        rt = executeHashKeySearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(searchCondition.get(MAPKEY_SEARCH_KEY_WORD)).orElse(DEFAULT_SEARCH_KEY_WORD),App::mkInputUnicodeBlockName,App::mkIdxFilter);
                        break;
                    default:
                        System.exit(FAILURE_STATUS);
                        break;
                }
                break;
            default:
                System.exit(FAILURE_STATUS);
                break;
        }
        return rt;
    }


    private static boolean argsRangeChk(Map<String,Map<String,String>> m){
        int b = 0;
//        Stream.generate(()->"=").limit(100).forEach(e-> System.out.printf(e));
//        System.out.println();
        for(Map.Entry<String,Map<String,String>> e1 : m.entrySet()){
            Map<String,String> chkMap = prepareParseOptPtnRangeChk.get(e1.getKey());
            for(Map.Entry<String,String> e2 : e1.getValue().entrySet()){
//                System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\n",chkMap.size(),e1.getKey(),e1.getValue(),e2.getKey(),e2.getValue(),chkMap.get(e2.getKey()));
                if(e1.getKey().contains(OPTION_NGRAM_SEARCH) && e2.getKey().contains(MAPKEY_SEARCH_KEY_WORD) && !e2.getValue().matches(chkMap.get(e2.getKey()))){
                    ++b;
//                    System.out.printf("%s\t%s\n",e2.getValue(),chkMap.get(e2.getKey()));
//                    System.out.println(b);
                }else{
                    if(!e2.getKey().contains(MAPKEY_SEARCH_KEY_WORD)){
                        List<String> startEndChkMap = Arrays.asList(chkMap.get(e2.getKey()).split(ARGS_SEPARATOR));
                        if(IntStream.rangeClosed(Integer.parseInt(startEndChkMap.get(0)),Integer.parseInt(startEndChkMap.get(1))).boxed()
                                .noneMatch(i->i==Integer.parseInt(e2.getValue()))){
                            ++b;
//                            System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\n",chkMap.size(),e1.getKey(),e1.getValue(),e2.getKey(),e2.getValue(),Integer.parseInt(startEndChkMap.get(0)),Integer.parseInt(startEndChkMap.get(1)));
//                            System.out.println(b);
                        }
                    }
                }
            }
        }
        return b==0?true:false;
    }

    private static Map<String,Map<String,String>> restyleArgs(Map<String, List<String>> mainProcessArgs){
        Map<String,Map<String,String>> rt = new LinkedHashMap<>();
//        mainProcessArgs.entrySet().forEach(e-> System.out.println(e));
        for(Map.Entry<String, List<String>> entry : mainProcessArgs.entrySet()){
//            System.out.println(entry.getKey());
            if(Stream.of(OPTION_HELP,OPTION_USAGE,OPTION_VERSION).anyMatch(e->e.contains(entry.getKey()))){
                continue;
            }
            if(Stream.of(OPTION_HELP,OPTION_USAGE,OPTION_VERSION).noneMatch(e->e.contains(entry.getKey())) && entry.getValue().size()==1){
                continue;
            }
            //ガード以外、コマンドライン引数の指定がある場合
            entry.getValue().remove(0);
            entry.getValue().remove(0);
            int mx = entry.getValue().size();
            List<String> keyName = prepareParseOptPtnName.get(entry.getKey());
            Map<String,String> mm = new LinkedHashMap<>();
            for(int i=0;i<mx;i++){
                mm.put(keyName.get(i),entry.getValue().get(i));
            }
            rt.put(entry.getKey(),mm);
        }
        return rt;
    }

    private static Map<String, String> prepareParseOpts(Map<String, List<String>> prepareParseOptPtn){
        Map<String, String> rt = new LinkedHashMap<>();
        for(Map.Entry<String,List<String>> entry : prepareParseOptPtn.entrySet()){
            if(Boolean.parseBoolean(entry.getValue().get(0))){
                //コマンドライン引数値を伴わない場合
                Pattern ptn = Pattern.compile("((?!.)." + entry.getValue().subList(1,entry.getValue().size()).stream().map(Pattern::quote).map("|"::concat).collect(Collectors.joining()) + ")");
                rt.put(entry.getKey(),ptn.toString());
            }else{
                //コマンドライン引数値を伴う場合
                Pattern ptn = Pattern.compile("((?!.)." + entry.getValue().subList(2,entry.getValue().size()).stream().map("|"::concat).collect(Collectors.joining()) + ")");
                rt.put(entry.getKey(),ptn.toString());
            }
        }
        return rt;
    }

    @SafeVarargs
    private static <E> List<E> flattenList(Collection<E>... liz){
        return Arrays.stream(liz).flatMap(e -> e.stream()).collect(Collectors.toList());
    }

    private static Map<String, List<String>> execParseOpts (List<String> cmdLineArgs,Map<String, String> prepareParseOpts){
        Map<String, List<String>> rt = new LinkedHashMap<>();

        //引数処理
        for (int i=0;i<cmdLineArgs.size();i++){
            if(cmdLineArgs.get(i).matches(prepareParseOpts.get(OPTION_HELP))){
                rt.put(OPTION_HELP, Arrays.asList(OPTION_ON));
            }else if(cmdLineArgs.get(i).matches(prepareParseOpts.get(OPTION_VERSION))){
                rt.put(OPTION_VERSION, Arrays.asList(OPTION_ON));
            }else if(cmdLineArgs.get(i).matches(prepareParseOpts.get(OPTION_NGRAM_SEARCH))){
                List<String> l = Arrays.asList(cmdLineArgs.get(i).split(ARGS_SEPARATOR));
                if(Integer.parseInt(prepareParseOptPtn.get(OPTION_NGRAM_SEARCH).get(1))!=l.size()-1){
                    //引数個数チェック
                    optionUsage(OPTION_NGRAM_SEARCH);
                    System.exit(SUCCESS_STATUS);
                }else{
                    rt.put(OPTION_NGRAM_SEARCH, flattenList(Arrays.asList(l.get(0),prepareParseOpts.get(OPTION_NGRAM_SEARCH)),l.subList(1,Integer.parseInt(prepareParseOptPtn.get(OPTION_NGRAM_SEARCH).get(1))+1)));
                }
            }else if(cmdLineArgs.get(i).matches(prepareParseOpts.get(OPTION_WORD_SEARCH))){
                List<String> l = Arrays.asList(cmdLineArgs.get(i).split(ARGS_SEPARATOR));
                if(Integer.parseInt(prepareParseOptPtn.get(OPTION_WORD_SEARCH).get(1))!=l.size()-1){
                    //引数個数チェック
                    optionUsage(OPTION_WORD_SEARCH);
                    System.exit(SUCCESS_STATUS);
                }else{
                    rt.put(OPTION_WORD_SEARCH, flattenList(Arrays.asList(l.get(0),prepareParseOpts.get(OPTION_WORD_SEARCH)),l.subList(1,Integer.parseInt(prepareParseOptPtn.get(OPTION_WORD_SEARCH).get(1))+1)));
                }
            }else if(cmdLineArgs.get(i).matches(prepareParseOpts.get(OPTION_HASH_KEY_SEARCH))){
                List<String> l = Arrays.asList(cmdLineArgs.get(i).split(ARGS_SEPARATOR));
                if(Integer.parseInt(prepareParseOptPtn.get(OPTION_HASH_KEY_SEARCH).get(1))!=l.size()-1){
                    //引数個数チェック
                    optionUsage(OPTION_HASH_KEY_SEARCH);
                    System.exit(SUCCESS_STATUS);
                }else{
                    rt.put(OPTION_HASH_KEY_SEARCH, flattenList(Arrays.asList(l.get(0),prepareParseOpts.get(OPTION_HASH_KEY_SEARCH)),l.subList(1,Integer.parseInt(prepareParseOptPtn.get(OPTION_HASH_KEY_SEARCH).get(1))+1)));
                }
            }else{
                optionUsage(OPTION_HELP);
                System.exit(FAILURE_STATUS);
            }
        }

        //デフォルト値の設定
        if(!rt.containsKey(OPTION_HELP)){
            rt.put(OPTION_HELP,Arrays.asList(OPTION_OFF));
        }
        if(!rt.containsKey(OPTION_USAGE)){
            rt.put(OPTION_USAGE,Arrays.asList(OPTION_OFF));
        }
        if(!rt.containsKey(OPTION_VERSION)){
            rt.put(OPTION_VERSION,Arrays.asList(OPTION_OFF));
        }
        if(!rt.containsKey(OPTION_WORD_SEARCH)){
            rt.put(OPTION_WORD_SEARCH,Arrays.asList(OPTION_OFF));
        }
        if(!rt.containsKey(OPTION_NGRAM_SEARCH)){
            rt.put(OPTION_NGRAM_SEARCH,Arrays.asList(OPTION_OFF));
        }
        if(!rt.containsKey(OPTION_HASH_KEY_SEARCH)){
            rt.put(OPTION_HASH_KEY_SEARCH,Arrays.asList(OPTION_OFF));
        }

        return rt;
    }

    private static boolean showCmdInfo(Map<String, List<String>> mainProcessArgs,String... s){
        return 0!=mainProcessArgs.keySet().stream()
                .filter(key->Stream.of(s).anyMatch(ss->ss.contains(key)))
                .filter(key->mainProcessArgs.get(key).contains(OPTION_ON)).count();
    }

    private static Integer mainProcess (Map<String, List<String>> mainProcessArgs,Map<String,Map<String,String>> mainReStyleProcessArgs) {
        int ret = SUCCESS_STATUS;
        finish : {
            if(showCmdInfo(mainProcessArgs,OPTION_HELP,OPTION_USAGE)){
                optionUsage(OPTION_USAGE);
                break finish;
            }
            if(showCmdInfo(mainProcessArgs,OPTION_VERSION)){
                optionUsage(OPTION_VERSION);
                break finish;
            }
            Set<Integer> rt;
            for(Map.Entry<String,Map<String,String>> entry : mainReStyleProcessArgs.entrySet()){
                rt = searchCodePointStartEnd(entry.getValue());
                ret += printOut(grpStartEndRn(rt.stream().sorted(Comparator.naturalOrder()).collect(Collectors.toList())));
            }
        }
        return ret;
    }

    private static Integer ptnCheck(Map<String,Map<String,String>> mainReStyleProcessArgs){
        int w = 0;
        int n = 0;
        int h = 0;
        for(String option_search_mode : mainReStyleProcessArgs.keySet()){
//            System.out.printf("%s\t%s\t%s\t%s\t%s\n",SEARCH_MODE_WORD,SEARCH_MODE_NGRAM,SEARCH_MODE_HASH_KEY,option_search_mode,mainReStyleProcessArgs.get(option_search_mode).get(MAPKEY_SEARCH_MODE));
            switch (option_search_mode){
                case OPTION_WORD_SEARCH:
                    if(Integer.parseInt(SEARCH_MODE_WORD)!=Integer.parseInt(mainReStyleProcessArgs.get(option_search_mode).get(MAPKEY_SEARCH_MODE))){
                        //数値比較にした
                        w=w+4;
                        System.out.printf("%s\t%s\t%s\n",w,n,h);
                    }
                    break;
                case OPTION_NGRAM_SEARCH:
                    if(Integer.parseInt(SEARCH_MODE_NGRAM)!=Integer.parseInt(mainReStyleProcessArgs.get(option_search_mode).get(MAPKEY_SEARCH_MODE))){
                        //数値比較にした
                        n=n+2;
                        System.out.printf("%s\t%s\t%s\n",w,n,h);
                    }
                    break;
                case OPTION_HASH_KEY_SEARCH:
                    if(Integer.parseInt(SEARCH_MODE_HASH_KEY)!=Integer.parseInt(mainReStyleProcessArgs.get(option_search_mode).get(MAPKEY_SEARCH_MODE))){
                        //数値比較にした
                        h=h+1;
                        System.out.printf("%s\t%s\t%s\n",w,n,h);
                    }
                    break;
                default:
                    break;
            }
        }
        return w+n+h;
    }

    private static void canYouHelpMe(Map<String, List<String>> mainProcessArgs){
        for(Map.Entry<String, List<String>> entry : mainProcessArgs.entrySet()){
            if(Stream.of(OPTION_HELP).anyMatch(e->e.contains(entry.getKey())) && entry.getValue().get(0).contains(OPTION_ON)){
                optionUsage(OPTION_HELP);
                System.exit(SUCCESS_STATUS);
            }
            if(Stream.of(OPTION_USAGE).anyMatch(e->e.contains(entry.getKey())) && entry.getValue().get(0).contains(OPTION_ON)){
                optionUsage(OPTION_USAGE);
                System.exit(SUCCESS_STATUS);
            }
            if(Stream.of(OPTION_VERSION).anyMatch(e->e.contains(entry.getKey())) && entry.getValue().get(0).contains(OPTION_ON)){
                optionUsage(OPTION_VERSION);
                System.exit(SUCCESS_STATUS);
            }
        }
    }

    public static void main(String... args) {
        int ret;

        Map<String, List<String>> mainProcessArgs = execParseOpts(Arrays.asList(args),prepareParseOpts(prepareParseOptPtn));

        canYouHelpMe(mainProcessArgs);

        Map<String,Map<String,String>> mainReStyleProcessArgs = restyleArgs(mainProcessArgs);

        if(argsRangeChk(mainReStyleProcessArgs)){
//            mainProcessArgs.entrySet().forEach(e-> System.out.println(e));
//            mainReStyleProcessArgs.entrySet().forEach(e-> System.out.println(e));
            ret = ptnCheck(mainReStyleProcessArgs);
//            System.out.println(ret);
            switch (ret){
                case 7:
                    optionUsage(OPTION_WORD_SEARCH,OPTION_NGRAM_SEARCH,OPTION_HASH_KEY_SEARCH);
                    break;
                case 6:
                    optionUsage(OPTION_WORD_SEARCH,OPTION_NGRAM_SEARCH);
                    break;
                case 5:
                    optionUsage(OPTION_WORD_SEARCH,OPTION_HASH_KEY_SEARCH);
                    break;
                case 3:
                    optionUsage(OPTION_NGRAM_SEARCH,OPTION_HASH_KEY_SEARCH);
                    break;
                case 1:
                    optionUsage(OPTION_HASH_KEY_SEARCH);
                    break;
                case 0:
                    ret = mainProcess(mainProcessArgs,mainReStyleProcessArgs);
                    System.exit(ret);
                default:
            }
        }else{
            ret = FAILURE_STATUS;
            optionUsage(OPTION_USAGE);
            System.exit(ret);
        }
    }
}