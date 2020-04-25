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


    private static Integer DEFAULT_NGRAM_CNT=7;

    private static Integer DEFAULT_START_RN=Character.MIN_CODE_POINT;
    private static Integer DEFAULT_END_RN=Character.MAX_CODE_POINT;

    private static String DEFAULT_NONE_KEY_WORD="ウンコもりもり森鴎外";

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

    private static Map<Integer,String> mkHashTbl(List<Integer> k,List<String> v) {
        return k.size()!=v.size()?new HashMap<>():k.stream().collect(Collectors.toMap(e->e,e->v.get(e)));
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
            ,S DEFAULT_SEARCH_KEY_WORD
            ,List<R> noneKeyWord
            ,BiFunction<K,V,Map<K,R>> mkInputFunction
            ,BiFunction<Map<K,R>,N,Map<R,List<R>>> mkIdxFunction
            ,Function<List<R>,Set<N>> mkIdxShapeFunction
    ){
        Set<N> rt = new HashSet<>();
        Map<K,R> input = mkInputFunction.apply(startRn,endRn);
        Map<R,List<R>> midput = mkIdxFunction.apply(input,ngramCnt);
        List<R> output = Optional.ofNullable(midput.get(DEFAULT_SEARCH_KEY_WORD)).orElse(noneKeyWord);
        if(output.get(0).equals(noneKeyWord.get(0))){
            System.exit(0);
        }else{
            rt = mkIdxShapeFunction.apply(output);
        }
        return rt;
    }
    private static <K,V,N,S,R> Set<N> executeWordNgramSearch(
            K startRn
            ,V endRn
            ,S DEFAULT_SEARCH_KEY_WORD
            ,List<R> noneKeyWord
            ,BiFunction<K,V,Map<K,R>> mkInputFunction
            ,Function<Map<K,R>,Map<R,List<R>>> mkIdxFunction
            ,Function<List<R>,Set<N>> mkIdxShapeFunction
    ){
        Set<N> rt = new HashSet<>();
        Map<K,R> input = mkInputFunction.apply(startRn,endRn);
        Map<R,List<R>> midput = mkIdxFunction.apply(input);
        List<R> output = Optional.ofNullable(midput.get(DEFAULT_SEARCH_KEY_WORD)).orElse(noneKeyWord);
        if(output.get(0).equals(noneKeyWord.get(0))){
            System.exit(0);
        }else{
            rt = mkIdxShapeFunction.apply(output);
        }
        return rt;
    }
    private static <K,V,N,S,R> Set<N> executeHashKeySearch(
            K startRn
            ,V endRn
            ,S DEFAULT_SEARCH_KEY_WORD
            ,BiFunction<K,V,Map<K,R>> mkInputFunction
            ,BiFunction<Map<K,R>,S,Set<N>> mkIdxFilterFunction
    ){
        Map<K,R> input = mkInputFunction.apply(startRn,endRn);
        return mkIdxFilterFunction.apply(input,DEFAULT_SEARCH_KEY_WORD);
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









    private static Set<Integer> searchCodePointStartEnd(String searchModePtn,String idxInputPtn){
        Set<Integer> rt = null;
        switch (searchModePtn){
            case SEARCH_MODE_WORD:
                switch (idxInputPtn){
                    case IDX_INPUT_UNICODE_NAME:
                        rt = executeWordNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,DEFAULT_SEARCH_KEY_WORD,Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeName,App::mkWordIdx,App::mkIdxShape);
                        break;
                    case IDX_INPUT_UNICODE_SCRIPT_NAME:
                        rt = executeWordNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,DEFAULT_SEARCH_KEY_WORD,Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeScriptName,App::mkWordIdx,App::mkIdxShape);
                        break;
                    case IDX_INPUT_UNICODE_BLOCK_NAME:
                        rt = executeWordNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,DEFAULT_SEARCH_KEY_WORD,Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeBlockName,App::mkWordIdx,App::mkIdxShape);
                        break;
                    default:
                        System.exit(FAILURE_STATUS);
                        break;
                }
                break;
            case SEARCH_MODE_NGRAM:
                switch (idxInputPtn){
                    case IDX_INPUT_UNICODE_NAME:
                        rt = executeNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,DEFAULT_NGRAM_CNT,DEFAULT_SEARCH_KEY_WORD,Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeName,App::mkNGramIdx,App::mkIdxShape);
                        break;
                    case IDX_INPUT_UNICODE_SCRIPT_NAME:
                        rt = executeNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,DEFAULT_NGRAM_CNT,DEFAULT_SEARCH_KEY_WORD,Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeScriptName,App::mkNGramIdx,App::mkIdxShape);
                        break;
                    case IDX_INPUT_UNICODE_BLOCK_NAME:
                        rt = executeNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,DEFAULT_NGRAM_CNT,DEFAULT_SEARCH_KEY_WORD,Arrays.asList(DEFAULT_NONE_KEY_WORD),App::mkInputUnicodeBlockName,App::mkNGramIdx,App::mkIdxShape);
                        break;
                    default:
                        System.exit(FAILURE_STATUS);
                        break;
                }
                break;
            case SEARCH_MODE_HASH_KEY:
                switch (idxInputPtn){
                    case IDX_INPUT_UNICODE_NAME:
                        rt = executeHashKeySearch(DEFAULT_START_RN,DEFAULT_END_RN,DEFAULT_SEARCH_KEY_WORD,App::mkInputUnicodeName,App::mkIdxFilter);
                        break;
                    case IDX_INPUT_UNICODE_SCRIPT_NAME:
                        rt = executeHashKeySearch(DEFAULT_START_RN,DEFAULT_END_RN,DEFAULT_SEARCH_KEY_WORD,App::mkInputUnicodeScriptName,App::mkIdxFilter);
                        break;
                    case IDX_INPUT_UNICODE_BLOCK_NAME:
                        rt = executeHashKeySearch(DEFAULT_START_RN,DEFAULT_END_RN,DEFAULT_SEARCH_KEY_WORD,App::mkInputUnicodeBlockName,App::mkIdxFilter);
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







    private final static String OPTION_ON = "1";
    private final static String OPTION_OFF = "-999999999999";
    private final static String OPTION_HELP = "OPTION_HELP";
    private final static String OPTION_VERSION = "OPTION_VERSION";
    private final static String OPTION_USAGE = "OPTION_USAGE";

    private final static String OPTION_WORD_SEARCH = "WORD_SEARCH";
    private final static String OPTION_NGRAM_SEARCH = "NGRAM_SEARCH ";
    private final static String OPTION_HASH_KEY_SEARCH = "HASH_KEY_SEARCH";

    private final static String ARTIFACT_ID = "1-0-0";
    private final static String ARGS_SEPARATOR = ":";

    private static void OPTION_HELP(){
        System.out.println("OPTION_HELP");
    }
    private static void OPTION_VERSION(){
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


    private static void OPTION_USAGE(String optionPtn){
        switch (optionPtn){
            case OPTION_HELP:
            case OPTION_USAGE:
                OPTION_HELP();
                break;
            case OPTION_VERSION:
                OPTION_VERSION();
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

    public static Integer processArgs(final List<String> args ){
        int rt=0;

        DEFAULT_SEARCH_MODE = checkArgs(1,3,0,args);
        DEFAULT_IDX_INPUT_PTN = checkArgs(1,3,1,args);
        DEFAULT_NORM_GRP = checkArgs(0,4,2,args);
        DEFAULT_SEARCH_KEY_WORD = checkArgs(3,3,3,args);

        if(SEARCH_MODE_NGRAM==DEFAULT_SEARCH_MODE){
            List<String> l = Arrays.asList(DEFAULT_SEARCH_KEY_WORD.split(ARGS_SEPARATOR));
            if(2!=l.size()){
                DEFAULT_SEARCH_KEY_WORD = Optional.of(l.get(0)).orElse(DEFAULT_SEARCH_KEY_WORD);
            }else{
                DEFAULT_SEARCH_KEY_WORD = Optional.of(l.get(0)).orElse(DEFAULT_SEARCH_KEY_WORD);
                DEFAULT_NGRAM_CNT = Optional.of(Integer.valueOf(l.get(1))).orElse(-1);
            }
        }

//        if(Stream.of(DEFAULT_SEARCH_MODE,defaultGramIdxInputPtn,defaultNGramIdxInputPtn,defaultHashKeyIdxInputPtn,DEFAULT_NORM_GRP,defaultNGram).anyMatch(e->e==-1)){
//            System.exit(FAILURE_STATUS);
//        }

        return rt;
    }

    private final static Map<String, List<String>> prepareParseOptPtn = new LinkedHashMap<>(){{
        put(OPTION_HELP, Arrays.asList("true", "-h", "--h", "--help", "-help"));
        put(OPTION_VERSION, Arrays.asList("true", "-v", "--v", "-V", "--V", "-version", "--version"));
        put(OPTION_WORD_SEARCH, Arrays.asList("false","4", "-w.*", "--w.*", "-word.*", "--word.*")); //-w
        put(OPTION_NGRAM_SEARCH, Arrays.asList("false","5", "-n.*", "--n.*", "-ngram.*", "--ngram.*"));
        put(OPTION_HASH_KEY_SEARCH, Arrays.asList("false","4", "-h.*", "--h.*", "-{1,}hash-?key.*", "-{1,}hash-?Key.*", "-{1,}Hash-?Key.*", "-{1,}Hash-?key.*"));
    }};

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
                    OPTION_USAGE(OPTION_NGRAM_SEARCH);
                    System.exit(SUCCESS_STATUS);
                }else{
                    rt.put(OPTION_NGRAM_SEARCH, flattenList(Arrays.asList(l.get(0),prepareParseOpts.get(OPTION_NGRAM_SEARCH)),l.subList(1,Integer.parseInt(prepareParseOptPtn.get(OPTION_NGRAM_SEARCH).get(1))+1)));
                }
            }else if(cmdLineArgs.get(i).matches(prepareParseOpts.get(OPTION_WORD_SEARCH))){
                List<String> l = Arrays.asList(cmdLineArgs.get(i).split(ARGS_SEPARATOR));
                if(Integer.parseInt(prepareParseOptPtn.get(OPTION_WORD_SEARCH).get(1))!=l.size()-1){
                    //引数個数チェック
                    OPTION_USAGE(OPTION_WORD_SEARCH);
                    System.exit(SUCCESS_STATUS);
                }else{
                    rt.put(OPTION_WORD_SEARCH, flattenList(Arrays.asList(l.get(0),prepareParseOpts.get(OPTION_WORD_SEARCH)),l.subList(1,Integer.parseInt(prepareParseOptPtn.get(OPTION_WORD_SEARCH).get(1))+1)));
                }
            }else if(cmdLineArgs.get(i).matches(prepareParseOpts.get(OPTION_HASH_KEY_SEARCH))){
                List<String> l = Arrays.asList(cmdLineArgs.get(i).split(ARGS_SEPARATOR));
                if(Integer.parseInt(prepareParseOptPtn.get(OPTION_HASH_KEY_SEARCH).get(1))!=l.size()-1){
                    //引数個数チェック
                    OPTION_USAGE(OPTION_HASH_KEY_SEARCH);
                    System.exit(SUCCESS_STATUS);
                }else{
                    rt.put(OPTION_HASH_KEY_SEARCH, flattenList(Arrays.asList(l.get(0),prepareParseOpts.get(OPTION_HASH_KEY_SEARCH)),l.subList(1,Integer.parseInt(prepareParseOptPtn.get(OPTION_HASH_KEY_SEARCH).get(1))+1)));
                }
            }else{
                OPTION_USAGE(OPTION_HELP);
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

//    private static void mainProcess (Map<String, List<String>> mainProcessArgs) {
////        System.out.println(Stream.generate(()->"=").limit(100).collect(Collectors.joining()));
////        mainProcessArgs.entrySet().stream().forEach(e-> System.out.println(e));
//        finish : {
//            if(showCmdInfo(mainProcessArgs,OPTION_HELP,OPTION_USAGE)){
//                OPTION_USAGE(OPTION_USAGE);
//                break finish;
//            }
//            if(showCmdInfo(mainProcessArgs,OPTION_VERSION)){
//                OPTION_USAGE(OPTION_VERSION);
//                break finish;
//            }
//            for(Map.Entry<String,List<String>> entry : mainProcessArgs.entrySet()){
//                switch (entry.getKey()){
//                    case SEARCH_MODE_WORD:
//                        if(entry.getValue().contains(OPTION_OFF)){
//                            break;
//                        }else{
//                            if(entry.getValue().get(1).contains(entry.getValue().get(0))){
//                                genRandomNumber(entry.getValue().subList(2,entry.getValue().size()));
//                                break;
//                            }
//                        }
//                    case SEARCH_MODE_WORD:
//                        if(entry.getValue().contains(OPTION_OFF)){
//                            break;
//                        }else{
//                            if(entry.getValue().get(1).contains(entry.getValue().get(0))){
//                                genHumanName(entry.getValue().subList(2,entry.getValue().size()));
//                                break;
//                            }
//                        }
//                    default:
//                        break finish;
//                }
//            }
//        }
//    }
    
    private static String checkArgs(Integer s,Integer e,Integer n,final List<String> l){
        Pattern p = Pattern.compile("\\D");
        int mx=l.size();
        if(n>mx){
            return "-1";
        }
        if(-1!=l.get(n).indexOf(ARGS_SEPARATOR)){
            return l.get(n);
        }else if(p.matcher(l.get(n)).find()) {
            return l.get(n);
        }else{
            return IntStream.rangeClosed(s,e).boxed().noneMatch(ee->ee.equals(Optional.ofNullable(Integer.valueOf(l.get(n))).orElse(-1)))?"-1":l.get(n);
        }
    }

    public static void main(String... args) {
        Map<String, List<String>> mainProcessArgs = execParseOpts(Arrays.asList(args),prepareParseOpts(prepareParseOptPtn));
        mainProcessArgs.entrySet().stream().forEach(e-> System.out.println(e));
//        int ret=SUCCESS_STATUS;
//
//        if(args.length!=0){
//            if(args.length%4!=0){
//                System.exit(FAILURE_STATUS);
//            }else{
//                processArgs(Arrays.asList(args));
//            }
//        }else{
//
//        }
//
//        Set<Integer> rt = searchCodePointStartEnd(DEFAULT_SEARCH_MODE,DEFAULT_IDX_INPUT_PTN);
//
//        int cnt = printOut(grpStartEndRn(rt.stream().sorted(Comparator.naturalOrder()).collect(Collectors.toList())));
//        System.out.println(cnt);
//        System.exit(ret);
    }
}