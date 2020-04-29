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

// TODO https://ja.wikipedia.org/wiki/Unicode

//TODO
//1. 全件取得機能 DONE
//2. 取得列のサプレス機能 DONE
//3. レンジ指定の全件取得機能 DONE
//4. 新規検索方法の追加随時
//5. インデックスデータのユーザー指定機能
//6. 5.のデータに対するUnicodeテーブルへの突合せ結果の一覧表示
//7. ヘルプのリッチ化 DONE
//8. 検索結果件数の表示
//9. 正規表現の変数化 グラム化インデックス粒度を可変にする
//10. 出現位置を切り捨てないパタンもオプションだす
//11. 正規化オプション4パタン DONE
//12. Web化する https://qiita.com/ota-meshi/items/2c01b118d9d1890cc97b
//13. 同じオプションの引数違いを後勝ちではなく与えた分だけ処理する -ngram:2:1:4:HIRA -ngram:2:2:4:HIRA
//14. 入力で与えた引数がユニコードの第何群第何面に属しているかチェックし、サマリ情報を出力
//15. 指定した文字数までのランダムな文字列生成。日本語。タミル語。ハングル文字。
//16. 引数の名寄せ処理集計処理があれば与えられた引数の先頭何文字かでグルーピンぐできそう。range以外とrangeで分ける -ngram -uniscript HIRA -ngram -uniscript HIRA -ngram -uniname HIRA -hash -uniscript HIRA -hash -uniscript HIRA
//17. 引数で与えられた文字列の長さからNGRM数をだす
//18. mk***Split 系の関数は適用順序をもったストリームないしはコレクションを引数に受け取り、順次適用していく形で汎用化できる

//echo -{word,ngram}-{nonsplit,split,hyphen-split,underscore-split,all-split} | xargs -n1

//echo -input-unicode-{name,script-name,block-name} | xargs -n1

//echo "HAN","HIRAGANA","GANA","UNKO","GRAM","POPO","POI","WAN","LUIS","BUTTA","AKASATANA","UBUNTU","QUALITY","RUBY","ZANBIA" | tr  ',' ' ' | xargs -n1

//too-many
//parallel echo ::: -{word,ngram}-{nonsplit,split,hyphen-split,underscore-split,all-split} ::: -input-unicode-{name,script-name,block-name} ::: $(echo "HAN","HIRAGANA","GANA","UNKO","GRAM","POPO","POI","WAN","LUIS","BUTTA","AKASATANA","UBUNTU","QUALITY","RUBY","ZANBIA" | tr  ',' ' ')

//soso-many
//parallel echo ::: -{word,ngram}-{nonsplit,split,hyphen-split,underscore-split,all-split} ::: -input-unicode-{name,script-name,block-name} ::: $(echo "HAN","HIRAGANA" | tr  ',' ' ')

//-word-nonsplit -input-unicode-name HAN
//-word-nonsplit -input-unicode-name HIRAGANA
//-word-nonsplit -input-unicode-script-name HAN
//-word-nonsplit -input-unicode-script-name HIRAGANA
//-word-nonsplit -input-unicode-block-name HAN
//-word-nonsplit -input-unicode-block-name HIRAGANA
//-word-split -input-unicode-name HAN
//-word-split -input-unicode-name HIRAGANA
//-word-split -input-unicode-script-name HAN
//-word-split -input-unicode-script-name HIRAGANA
//-word-split -input-unicode-block-name HAN
//-word-split -input-unicode-block-name HIRAGANA
//-word-hyphen-split -input-unicode-name HAN
//-word-hyphen-split -input-unicode-name HIRAGANA
//-word-hyphen-split -input-unicode-script-name HAN
//-word-hyphen-split -input-unicode-script-name HIRAGANA
//-word-hyphen-split -input-unicode-block-name HAN
//-word-hyphen-split -input-unicode-block-name HIRAGANA
//-word-underscore-split -input-unicode-name HAN
//-word-underscore-split -input-unicode-name HIRAGANA
//-word-underscore-split -input-unicode-script-name HAN
//-word-underscore-split -input-unicode-script-name HIRAGANA
//-word-underscore-split -input-unicode-block-name HAN
//-word-underscore-split -input-unicode-block-name HIRAGANA
//-word-all-split -input-unicode-name HAN
//-word-all-split -input-unicode-name HIRAGANA
//-word-all-split -input-unicode-script-name HAN
//-word-all-split -input-unicode-script-name HIRAGANA
//-word-all-split -input-unicode-block-name HAN
//-word-all-split -input-unicode-block-name HIRAGANA
//-ngram-nonsplit -input-unicode-name HAN
//-ngram-nonsplit -input-unicode-name HIRAGANA
//-ngram-nonsplit -input-unicode-script-name HAN
//-ngram-nonsplit -input-unicode-script-name HIRAGANA
//-ngram-nonsplit -input-unicode-block-name HAN
//-ngram-nonsplit -input-unicode-block-name HIRAGANA
//-ngram-split -input-unicode-name HAN
//-ngram-split -input-unicode-name HIRAGANA
//-ngram-split -input-unicode-script-name HAN
//-ngram-split -input-unicode-script-name HIRAGANA
//-ngram-split -input-unicode-block-name HAN
//-ngram-split -input-unicode-block-name HIRAGANA
//-ngram-hyphen-split -input-unicode-name HAN
//-ngram-hyphen-split -input-unicode-name HIRAGANA
//-ngram-hyphen-split -input-unicode-script-name HAN
//-ngram-hyphen-split -input-unicode-script-name HIRAGANA
//-ngram-hyphen-split -input-unicode-block-name HAN
//-ngram-hyphen-split -input-unicode-block-name HIRAGANA
//-ngram-underscore-split -input-unicode-name HAN
//-ngram-underscore-split -input-unicode-name HIRAGANA
//-ngram-underscore-split -input-unicode-script-name HAN
//-ngram-underscore-split -input-unicode-script-name HIRAGANA
//-ngram-underscore-split -input-unicode-block-name HAN
//-ngram-underscore-split -input-unicode-block-name HIRAGANA
//-ngram-all-split -input-unicode-name HAN
//-ngram-all-split -input-unicode-name HIRAGANA
//-ngram-all-split -input-unicode-script-name HAN
//-ngram-all-split -input-unicode-script-name HIRAGANA
//-ngram-all-split -input-unicode-block-name HAN
//-ngram-all-split -input-unicode-block-name HIRAGANA

public class App {

    private static final String PROGRAM_NAME = "unidat";

    private static Integer SUCCESS_STATUS=0;
    private static Integer FAILURE_STATUS=1;

    private static Integer SEQ_CNT=0;
    private static Integer GRP_CNT=0;
    private static final String ON = "1";
    private static final String OFF = "-9999";
    private static final String ARTIFACT_ID = "1-0-0";
    private static final String ARGS_SEPARATOR = ":";

    private static final String OPTION_IDX_INPUT_PTN="IDX_INPUT_PTN";
    private static final String OPTION_SEARCH_KEYWORD="SEARCH_KEYWORD";

    private static String DEFAULT_SEARCH_KEYWORD="KATAKANA";
    private static Integer DEFAULT_START_RN=Character.MIN_CODE_POINT;
    private static Integer DEFAULT_END_RN=Character.MAX_CODE_POINT;
    private static String DEFAULT_NONE_KEYWORD="ウンコもりもり森鴎外";

    private static final String OPTION_RANGE = "OPTION_RANGE";
    private static final String OPTION_HELP = "OPTION_HELP";
    private static final String OPTION_VERSION = "OPTION_VERSION";
    private static final String OPTION_USAGE = "OPTION_USAGE";

    //grouping key
    private static final String OPTION_WORD_SEARCH = "WORD_SEARCH";
    private static final String OPTION_NGRAM_SEARCH = "NGRAM_SEARCH";
    private static final String OPTION_HASH_KEY_SEARCH = "HASH_KEY_SEARCH";

    private static final String OPTION_IDX_INPUT_UNICODE_NAME = "IDX_INPUT_UNICODE_NAME";
    private static final String OPTION_IDX_INPUT_UNICODE_SCRIPT_NAME = "IDX_INPUT_UNICODE_SCRIPT_NAME";
    private static final String OPTION_IDX_INPUT_UNICODE_BLOCK_NAME = "IDX_INPUT_UNICODE_BLOCK_NAME";

    private static final String OPTION_NORM_GRP_NFC="NORM_GRP_NFC";
    private static final String OPTION_NORM_GRP_NFD="NORM_GRP_NFD";
    private static final String OPTION_NORM_GRP_NFKC="NORM_GRP_NFKC";
    private static final String OPTION_NORM_GRP_NFKD="NORM_GRP_NFKD";

    private static final String OPTION_NUM_TO_STR="NUM_TO_STR";
    private static final String OPTION_CP_TO_STR="CP_TO_STR";
    private static final String OPTION_CP_TO_UNICODE_NAME="CP_TO_UNICODE_NAME";
    private static final String OPTION_CP_TO_UNICODE_SCRIPT_NAME="CP_TO_UNICODE_SCRIPT_NAME";
    private static final String OPTION_CP_TO_UNICODE_BLOCK_NAME="CP_TO_UNICODE_BLOCK_NAME";
    private static final String OPTION_STR_TO_UTF8="STR_TO_UTF8";
    private static final String OPTION_STR_TO_UTF16="STR_TO_UTF16";
    private static final String OPTION_STR_TO_UTF32="STR_TO_UTF32";
    private static final String OPTION_STR_TO_UNICODE="STR_TO_UNICODE";

    private static final String MK_IDX = ON;
    private static final String NON_MK_IDX = OFF;
    private static final String OPTION_MK_WORD_IDX_NON_SPLIT="MK_WORD_IDX_NON_SPLIT";
    private static final String OPTION_MK_WORD_IDX_NON_WORD_SPLIT="MK_WORD_IDX_NON_WORD_SPLIT";
    private static final String OPTION_MK_WORD_IDX_NON_WORD_HYPHEN_SPLIT="MK_WORD_IDX_NON_WORD_HYPHEN_SPLIT";
    private static final String OPTION_MK_WORD_IDX_NON_WORD_UNDERSCORE_SPLIT="MK_WORD_IDX_NON_WORD_UNDERSCORE_SPLIT";
    private static final String OPTION_MK_WORD_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT="MK_WORD_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT";
    private static final String OPTION_MK_NGRAM_IDX_NON_SPLIT="MK_NGRAM_IDX_NON_SPLIT";
    private static final String OPTION_MK_NGRAM_IDX_NON_WORD_SPLIT="MK_NGRAM_IDX_NON_WORD_SPLIT";
    private static final String OPTION_MK_NGRAM_IDX_NON_WORD_HYPHEN_SPLIT="MK_NGRAM_IDX_NON_WORD_HYPHEN_SPLIT";
    private static final String OPTION_MK_NGRAM_IDX_NON_WORD_UNDERSCORE_SPLIT="MK_NGRAM_IDX_NON_WORD_UNDERSCORE_SPLIT";
    private static final String OPTION_MK_NGRAM_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT="MK_NGRAM_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT";

    private static final String OPTION_SEARCH_KEYWORD_PTN="[A-Z]+";

    //helpで使用予定
    private static final List<String> OPTION_IDX_INPUT_LIST = Arrays.asList(OPTION_IDX_INPUT_UNICODE_NAME,OPTION_IDX_INPUT_UNICODE_SCRIPT_NAME,OPTION_IDX_INPUT_UNICODE_BLOCK_NAME);
    private static final List<String> OPTION_SAMPLE_KEYWORD_LIST = Arrays.asList("HAN","HIRAGANA","GANA","UNKO","GRAM","POPO","POI","WAN","LUIS","BUTTA","AKASATANA","UBUNTU","QUALITY","RUBY","ZANBIA");

    private static final Map<String, List<String>> argsOptPtn = new LinkedHashMap<>(){{
        put(OPTION_NUM_TO_STR, Arrays.asList("true", "-cp", "--cp", "--codepoint"));
        put(OPTION_CP_TO_STR, Arrays.asList("true", "-s", "-str", "--str"));
        put(OPTION_CP_TO_UNICODE_NAME, Arrays.asList("true", "-unm", "--unm"));
        put(OPTION_CP_TO_UNICODE_SCRIPT_NAME, Arrays.asList("true", "-usc", "--usc"));
        put(OPTION_CP_TO_UNICODE_BLOCK_NAME, Arrays.asList("true", "-ubl", "--ubl"));
        put(OPTION_STR_TO_UTF8, Arrays.asList("true", "-u8", "--u8"));
        put(OPTION_STR_TO_UTF16, Arrays.asList("true", "-u16", "--u16"));
        put(OPTION_STR_TO_UTF32, Arrays.asList("true", "-u32","--u32"));
        put(OPTION_STR_TO_UNICODE, Arrays.asList("true", "-unicode", "--unicode"));
        put(OPTION_NORM_GRP_NFC, Arrays.asList("true", "-nfc", "--nfc"));
        put(OPTION_NORM_GRP_NFD, Arrays.asList("true", "-nfd","--nfd"));
        put(OPTION_NORM_GRP_NFKC, Arrays.asList("true", "-nfkc", "--nfkc"));
        put(OPTION_NORM_GRP_NFKD, Arrays.asList("true", "-nfkd", "--nfkd"));

        put(OPTION_MK_WORD_IDX_NON_SPLIT, Arrays.asList("true", "-word-nonsplit", "--word-nonsplit"));
        put(OPTION_MK_WORD_IDX_NON_WORD_SPLIT, Arrays.asList("true", "-word-split", "--word-split"));
        put(OPTION_MK_WORD_IDX_NON_WORD_HYPHEN_SPLIT, Arrays.asList("true", "-word-hyphen-split","--word-hyphen-split"));
        put(OPTION_MK_WORD_IDX_NON_WORD_UNDERSCORE_SPLIT, Arrays.asList("true", "-word-underscore-split", "--word-underscore-split"));
        put(OPTION_MK_WORD_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT, Arrays.asList("true", "-word-all-split", "--word-all-split"));
        put(OPTION_MK_NGRAM_IDX_NON_SPLIT, Arrays.asList("true", "-ngram-nonsplit", "--ngram-nonsplit"));
        put(OPTION_MK_NGRAM_IDX_NON_WORD_SPLIT, Arrays.asList("true", "-ngram-split", "--ngram-split"));
        put(OPTION_MK_NGRAM_IDX_NON_WORD_HYPHEN_SPLIT, Arrays.asList("true", "-ngram-hyphen-split","--ngram-hyphen-split"));
        put(OPTION_MK_NGRAM_IDX_NON_WORD_UNDERSCORE_SPLIT, Arrays.asList("true", "-ngram-underscore-split", "--ngram-underscore-split"));
        put(OPTION_MK_NGRAM_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT, Arrays.asList("true", "-ngram-all-split", "--ngram-all-split"));
        put(OPTION_HASH_KEY_SEARCH, Arrays.asList("false","3", "-hh.*", "-hash.*", "--hash.*", "-hash-?key.*", "-hash-?Key.*", "-Hash-?Key.*", "-Hash-?key.*", "--hash-?key.*", "--hash-?Key.*", "--Hash-?Key.*", "--Hash-?key.*"));

        put(OPTION_IDX_INPUT_UNICODE_NAME, Arrays.asList("true", "-input-unicode-name", "--input-unicode-name"));
        put(OPTION_IDX_INPUT_UNICODE_SCRIPT_NAME, Arrays.asList("true", "-input-unicode-script-name", "--input-unicode-script-name"));
        put(OPTION_IDX_INPUT_UNICODE_BLOCK_NAME, Arrays.asList("true", "-input-unicode-block-name","--input-unicode-block-name"));

        put(OPTION_RANGE, Arrays.asList("false","2","-r.*", "--r.*", "--range.*", "-range.*"));
        put(OPTION_HELP, Arrays.asList("true", "-h", "--h", "--help", "-help"));
        put(OPTION_VERSION, Arrays.asList("true", "-v", "--v", "-V", "--V", "-version", "--version"));
        put(OPTION_USAGE, Arrays.asList("true", "-usage", "--usage", "-Usage", "--Usage"));

    }};

    private static final Map<String, Normalizer.Form> normMap = new HashMap<>(){{
        put(OPTION_NORM_GRP_NFC, Normalizer.Form.NFC);
        put(OPTION_NORM_GRP_NFD, Normalizer.Form.NFD);
        put(OPTION_NORM_GRP_NFKC, Normalizer.Form.NFKC);
        put(OPTION_NORM_GRP_NFKD, Normalizer.Form.NFKD);
    }};

    //引数に指定されたら設定するマップ
    private static final Map<String, Map<String,List<String>>> optionFlgPtn = new HashMap<>(){{
        //ONするマップ
        put(ON, new LinkedHashMap<>(){{
            put(OPTION_HELP,Arrays.asList(ON));
            put(OPTION_VERSION,Arrays.asList(ON));
            put(OPTION_USAGE,Arrays.asList(ON));
            put(OPTION_RANGE,Arrays.asList(ON));
            put(OPTION_MK_WORD_IDX_NON_SPLIT,Arrays.asList(ON));
            put(OPTION_MK_WORD_IDX_NON_WORD_SPLIT,Arrays.asList(ON));
            put(OPTION_MK_WORD_IDX_NON_WORD_HYPHEN_SPLIT,Arrays.asList(ON));
            put(OPTION_MK_WORD_IDX_NON_WORD_UNDERSCORE_SPLIT,Arrays.asList(ON));
            put(OPTION_MK_WORD_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT,Arrays.asList(ON));
            put(OPTION_MK_NGRAM_IDX_NON_SPLIT,Arrays.asList(ON));
            put(OPTION_MK_NGRAM_IDX_NON_WORD_SPLIT,Arrays.asList(ON));
            put(OPTION_MK_NGRAM_IDX_NON_WORD_HYPHEN_SPLIT,Arrays.asList(ON));
            put(OPTION_MK_NGRAM_IDX_NON_WORD_UNDERSCORE_SPLIT,Arrays.asList(ON));
            put(OPTION_MK_NGRAM_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT,Arrays.asList(ON));
            put(OPTION_IDX_INPUT_UNICODE_NAME,Arrays.asList(ON));
            put(OPTION_IDX_INPUT_UNICODE_SCRIPT_NAME,Arrays.asList(ON));
            put(OPTION_IDX_INPUT_UNICODE_BLOCK_NAME,Arrays.asList(ON));
            put(OPTION_SEARCH_KEYWORD, Arrays.asList(OPTION_SEARCH_KEYWORD_PTN));
        }});
        //OFFするマップ
        put(OFF, new LinkedHashMap<>(){{
            put(OPTION_NUM_TO_STR,Arrays.asList(OFF));
            put(OPTION_CP_TO_STR,Arrays.asList(OFF));
            put(OPTION_CP_TO_UNICODE_NAME,Arrays.asList(OFF));
            put(OPTION_CP_TO_UNICODE_SCRIPT_NAME,Arrays.asList(OFF));
            put(OPTION_CP_TO_UNICODE_BLOCK_NAME,Arrays.asList(OFF));
            put(OPTION_STR_TO_UTF8,Arrays.asList(OFF));
            put(OPTION_STR_TO_UTF16,Arrays.asList(OFF));
            put(OPTION_STR_TO_UTF32,Arrays.asList(OFF));
            put(OPTION_STR_TO_UNICODE,Arrays.asList(OFF));
            put(OPTION_NORM_GRP_NFC,Arrays.asList(OFF));
            put(OPTION_NORM_GRP_NFD,Arrays.asList(OFF));
            put(OPTION_NORM_GRP_NFKC,Arrays.asList(OFF));
            put(OPTION_NORM_GRP_NFKD,Arrays.asList(OFF));
        }});
    }};

    //引数に指定されなかったら設定するマップ
    private static final Map<String, Map<String,List<String>>> defaultOptionFlgPtn = new HashMap<>(){{
        //ONするマップ
        put(ON, new LinkedHashMap<>(){{
            put(OPTION_NUM_TO_STR,Arrays.asList(ON));
            put(OPTION_CP_TO_STR,Arrays.asList(ON));
            put(OPTION_CP_TO_UNICODE_NAME,Arrays.asList(ON));
            put(OPTION_CP_TO_UNICODE_SCRIPT_NAME,Arrays.asList(ON));
            put(OPTION_CP_TO_UNICODE_BLOCK_NAME,Arrays.asList(ON));
            put(OPTION_STR_TO_UTF8,Arrays.asList(ON));
            put(OPTION_STR_TO_UTF16,Arrays.asList(ON));
            put(OPTION_STR_TO_UTF32,Arrays.asList(ON));
            put(OPTION_STR_TO_UNICODE,Arrays.asList(ON));
            put(OPTION_NORM_GRP_NFC,Arrays.asList(ON));
            put(OPTION_NORM_GRP_NFD,Arrays.asList(ON));
            put(OPTION_NORM_GRP_NFKC,Arrays.asList(ON));
            put(OPTION_NORM_GRP_NFKD,Arrays.asList(ON));
        }});
        //OFFするマップ
        put(OFF, new LinkedHashMap<>(){{
            put(OPTION_HELP,Arrays.asList(OFF));
            put(OPTION_VERSION,Arrays.asList(OFF));
            put(OPTION_USAGE,Arrays.asList(OFF));
        }});
    }};

    //executeNgramSearch,executeWordNgramSearch,executeHashKeySearch 3つの関数を単一のインターフェース関数にマージする際の参照用マップ
    //switch文消すに伴っていらなくなる START
    private static final Map<String, String> searchPtnMap = new LinkedHashMap<>(){{
        put(OPTION_WORD_SEARCH, MK_IDX);
        put(OPTION_NGRAM_SEARCH, MK_IDX);
        put(OPTION_HASH_KEY_SEARCH, NON_MK_IDX);
    }};
    //switch文消すに伴っていらなくなる END

    private static void optionUsage(Integer status,String... optionPtn){
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
                case OPTION_IDX_INPUT_PTN:
                    optionHelp();
                    break;
                default:
                    break;
            }
        }
        System.exit(status);
    }
    private static void optionHelp(){
        System.out.println("unidat -nfc --range:10:19 -word-split -input-unicode-name HIRA -word-hyphen-split -input-unicode-script-name KANA -word-split -input-unicode-name CJK");
        System.out.println("unidat --range:1:30"); //レンジを絞って出力
        System.out.println("unidat --range:50:80 -nfc -nfd"); //レンジ絞ってサプレスして出力
        System.out.println("unidat --range:12354:12390 -nfc -nfd -nfkc"); //レンジ絞ってサプレスして出力
        System.out.println("unidat --range:12354:12390 -cp -usc -ubl -u8 -u32 --unicode"); //レンジ絞ってサプレスして出力
    }
    private static void optionVersion(){
        System.out.println(ARTIFACT_ID);
    }
    private static void usageWordSearch(){
        final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
        System.out.println(methodName);
    }
    private static void usageNgramSearch(){
        final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
        System.out.println(methodName);
    }
    private static void usageHashKeySearch(){
        final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
        System.out.println(methodName);
    }
    @SafeVarargs
    private static <E> List<E> flattenList(Collection<E>... liz){
        return Arrays.stream(liz).flatMap(e -> e.stream()).collect(Collectors.toList());
    }
    private static String hexToBin(String s){
        return Integer.toBinaryString(Integer.parseInt(s,16));
    }
    private static String binToHex(String s){
        return Integer.toHexString(Integer.parseInt(s,2));
    }
    private static String cpToUnicodeName(Integer n){
        return Character.getName(n);
    }
    private static String cpToUnicodeScriptName(Integer n){
        return Character.UnicodeScript.of(n).name();
    }
    private static String cpToUnicodeBlockName(Integer n){
        return String.valueOf(Character.UnicodeBlock.of(n));
    }
    static Function<Integer, String> cpToStr = (n)-> {
        return new String(Character.toChars(n));
    };
    static Function<Integer, String> numToStr = (n)-> {
        return String.valueOf(n);
    };
    static BiFunction<String, Normalizer.Form, String> strToNorm = (s,typ)-> {
        return Normalizer.normalize(s,typ);
    };
    static Function<Integer, String> cpToUnicodeScriptName = (n)-> {
        return Character.UnicodeScript.of(n).name();
    };
    static Function<Integer, String> cpToUnicodeBlockName = (n)-> {
        return String.valueOf(Character.UnicodeBlock.of(n));
    };
    static Function<Integer, String> cpToUnicodeName = (n)-> {
        return Character.getName(n);
    };
    static Function<String, String> strToUtf8 = (s)-> {
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
    };
    static Function<String, String> strToUtf16 = (s)-> {
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
    };
    static Function<String, String> strToUtf32 = (s)-> {
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
    };
    static Function<String, String> strToUnicode = (s)-> {
        return IntStream.range(0,s.length()).boxed().map(e->String.format("U+%05X",(int)s.charAt(e))).collect(Collectors.joining("-"));
    };
    private static <N,S> Map<N, List<S>> executeMkTbl(
            N seq
            ,N grp
            ,N grpSeq
            ,N i
            ,Map<S,Function<N,S>> singleArgFunctionInNumOutStrMap
            ,Map<S,Function<S,S>> singleArgFunctionInStrOutStrMap
            ,BiFunction<S,Normalizer.Form,S> multipleArgFunction
            ,Map<S,List<S>> suppressColumnsMap
    ){

        Map<N, List<S>> rt = new LinkedHashMap<>();

        Function<N,S> numToStr = singleArgFunctionInNumOutStrMap.get(OPTION_NUM_TO_STR); //numToStr(i)
        Function<N,S> cpToStr = singleArgFunctionInNumOutStrMap.get(OPTION_CP_TO_STR); //cpToStr(i)

        // Must Item
        //grp.grpseq
        List<S> l = new ArrayList<>();
        l.add(numToStr.apply(grp));
        l.add(numToStr.apply(grpSeq));

        //cpToUnicodeName,cpToUnicodeScriptName,cpToUnicodeBlockName
        for(Map.Entry<S,Function<N,S>> singleArgFunctionInNumOutStrMapEntry : singleArgFunctionInNumOutStrMap.entrySet()){
            if(1L==suppressColumnsMap.get(singleArgFunctionInNumOutStrMapEntry.getKey()).stream().filter(e->e.equals(OFF)).count()){

            }else{
                l.add(singleArgFunctionInNumOutStrMapEntry.getValue().apply(i));
            }
        }
        rt.put(seq,l);

        S dest = null;
        for(Map.Entry<S,List<S>> suppressColumnsMapEntry: suppressColumnsMap.entrySet()){
            if(normMap.keySet().stream().anyMatch(e->e.equals(suppressColumnsMapEntry.getKey()))){
                if(1L==suppressColumnsMapEntry.getValue().stream().filter(e->e.equals(OFF)).count()){

                }else{
                    dest = multipleArgFunction.apply(cpToStr.apply(i),normMap.get(suppressColumnsMapEntry.getKey()));//strToNorm(cpToStr(i), Normalizer.Form.NFD)
                    l.add(dest);
                    rt.put(seq,l);
                    //strToUtf8,strToUtf16,strToUtf32,strToUnicode
                    for(Map.Entry<S,Function<S,S>> singleArgFunctionInStrOutStrMapEntry : singleArgFunctionInStrOutStrMap.entrySet()){
                        //デフォルト値の設定
                        if(rt.containsKey(seq)){
                            //紐づくキーがあれば、リスト追加
                            if(dest==null){
                                //正規化無しの場合
                                if(1L==suppressColumnsMap.get(singleArgFunctionInStrOutStrMapEntry.getKey()).stream().filter(e->e.equals(OFF)).count()){

                                }else{
                                    rt.get(seq).addAll(new ArrayList<>(Arrays.asList(singleArgFunctionInStrOutStrMapEntry.getValue().apply(cpToStr.apply(i)))));
                                }
                            }else{
                                //正規化有りの場合
                                if(1L==suppressColumnsMap.get(singleArgFunctionInStrOutStrMapEntry.getKey()).stream().filter(e->e.equals(OFF)).count()){

                                }else{
                                    rt.get(seq).addAll(new ArrayList<>(Arrays.asList(singleArgFunctionInStrOutStrMapEntry.getValue().apply(dest))));
                                }
                            }
                        }else{
                            //紐づくキーは直前のループで追加済み
                        }
                    }
                }
            }else{

            }
        }
        return rt;
    }
    private static Map<Integer, List<String>> wrapperExecuteMkTbl(Integer s,Integer e,Map<String, List<String>> suppressColumnsMap) {
        Map<Integer, List<String>> rt = new LinkedHashMap<>();
        Map<String,Function<Integer,String>> singleArgFunctionInNumOutStrMap = new LinkedHashMap<>(){{
            put(OPTION_NUM_TO_STR, numToStr);
            put(OPTION_CP_TO_STR, cpToStr);
            put(OPTION_CP_TO_UNICODE_NAME, cpToUnicodeName);
            put(OPTION_CP_TO_UNICODE_SCRIPT_NAME, cpToUnicodeScriptName);
            put(OPTION_CP_TO_UNICODE_BLOCK_NAME, cpToUnicodeBlockName);
        }};
        Map<String,Function<String,String>> singleArgFunctionInStrOutStrMap = new LinkedHashMap<>(){{
            put(OPTION_STR_TO_UTF8, strToUtf8);
            put(OPTION_STR_TO_UTF16, strToUtf16);
            put(OPTION_STR_TO_UTF32, strToUtf32);
            put(OPTION_STR_TO_UNICODE, strToUnicode);
        }};
        BiFunction<String, Normalizer.Form, String> multipleArgFunction = strToNorm;
        ++GRP_CNT;
        for(int i=s;i<=e;i++){
            rt.putAll(executeMkTbl(++SEQ_CNT,GRP_CNT,(i-s+1),i,singleArgFunctionInNumOutStrMap,singleArgFunctionInStrOutStrMap,multipleArgFunction,suppressColumnsMap));
        }
        return rt;
    }
    private static Map<Integer, String> mkInputUnicodeName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUnicodeName(i)).orElse(DEFAULT_NONE_KEYWORD))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Map<Integer, String> mkInputUnicodeScriptName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUnicodeScriptName(i)).orElse(DEFAULT_NONE_KEYWORD))).entrySet().stream()
                .collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Map<Integer, String> mkInputUnicodeBlockName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUnicodeBlockName(i)).orElse(DEFAULT_NONE_KEYWORD))).entrySet().stream()
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
    private static Map<String, List<String>> mkWordIdxNonWordSplit(Map<Integer, String> m){
        Map<String, String> tmp = new HashMap<>();
        for(Map.Entry<Integer, String> entry : m.entrySet()){
            List<String> l = Arrays.asList(entry.getValue().split("\\W")).stream().collect(Collectors.toList());
            int mx = l.size();
            for(int i=0;i<mx;i++){
                tmp.put(entry.getKey() +"-"+ i,l.get(i));
            }
        }
        return tmp.entrySet().stream().collect(Collectors.groupingBy(e->e.getValue(),Collectors.mapping(e->e.getKey(),Collectors.toList())));
    }
    private static Map<String, List<String>> mkWordIdxNonWordHyphenSplit(Map<Integer, String> m){
        Map<String, String> tmp = new HashMap<>();
        for(Map.Entry<Integer, String> entry : m.entrySet()){
            List<String> l = Arrays.asList(entry.getValue().split("\\W")).stream().flatMap(e->Arrays.asList(e.split("-")).stream()).collect(Collectors.toList());
            int mx = l.size();
            for(int i=0;i<mx;i++){
                tmp.put(entry.getKey() +"-"+ i,l.get(i));
            }
        }
        return tmp.entrySet().stream().collect(Collectors.groupingBy(e->e.getValue(),Collectors.mapping(e->e.getKey(),Collectors.toList())));
    }
    private static Map<String, List<String>> mkWordIdxNonWordUnderScoreSplit(Map<Integer, String> m){
        Map<String, String> tmp = new HashMap<>();
        for(Map.Entry<Integer, String> entry : m.entrySet()){
            List<String> l = Arrays.asList(entry.getValue().split("\\W")).stream().flatMap(e->Arrays.asList(e.split("_")).stream()).collect(Collectors.toList());
            int mx = l.size();
            for(int i=0;i<mx;i++){
                tmp.put(entry.getKey() +"-"+ i,l.get(i));
            }
        }
        return tmp.entrySet().stream().collect(Collectors.groupingBy(e->e.getValue(),Collectors.mapping(e->e.getKey(),Collectors.toList())));
    }
    private static Map<String, List<String>> mkWordIdxNonWordUnderScoreHyphenSplit(Map<Integer, String> m){
        Map<String, String> tmp = new HashMap<>();
        for(Map.Entry<Integer, String> entry : m.entrySet()){
            List<String> l = Arrays.asList(entry.getValue().split("\\W")).stream().flatMap(e->Arrays.asList(e.split("_")).stream()).flatMap(e->Arrays.asList(e.split("-")).stream()).collect(Collectors.toList());
            int mx = l.size();
            for(int i=0;i<mx;i++){
                tmp.put(entry.getKey() +"-"+ i,l.get(i));
            }
        }
        return tmp.entrySet().stream().collect(Collectors.groupingBy(e->e.getValue(),Collectors.mapping(e->e.getKey(),Collectors.toList())));
    }
    private static Map<String, List<String>> mkNgramIdxNonWordSplit(Map<Integer, String> m,Integer n){
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
    private static Map<String, List<String>> mkNgramIdxNonWordHyphenSplit(Map<Integer, String> m,Integer n){
        Map<String, String> tmp = new HashMap<>();
        for(Map.Entry<Integer, String> entry : m.entrySet()){
            List<String> l = Arrays.asList(entry.getValue().split("\\W")).stream().flatMap(e->Arrays.asList(e.split("-")).stream()).collect(Collectors.toList());
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
    private static Map<String, List<String>> mkNgramIdxNonWordUnderScoreSplit(Map<Integer, String> m,Integer n){
        Map<String, String> tmp = new HashMap<>();
        for(Map.Entry<Integer, String> entry : m.entrySet()){
            List<String> l = Arrays.asList(entry.getValue().split("\\W")).stream().flatMap(e->Arrays.asList(e.split("_")).stream()).collect(Collectors.toList());
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
    private static Map<String, List<String>> mkNgramIdxNonWordUnderScoreHyphenSplit(Map<Integer, String> m,Integer n){
        Map<String, String> tmp = new HashMap<>();
        for(Map.Entry<Integer, String> entry : m.entrySet()){
            List<String> l = Arrays.asList(entry.getValue().split("\\W")).stream().flatMap(e->Arrays.asList(e.split("_")).stream()).flatMap(e->Arrays.asList(e.split("-")).stream()).collect(Collectors.toList());
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
        //mkIdxShape
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
        Map<R,List<R>> midput = mkIdxFunction.apply(input);
        List<R> output = Optional.ofNullable(midput.get(search_key_word)).orElse(noneKeyWord);
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
    private static Map<Integer, List<String>> searchTbl(Integer startRn,Integer endRn,Map<String, List<String>> suppressColumnsMap){
        Map<Integer, List<String>> rt = null;
        rt= wrapperExecuteMkTbl(startRn,endRn,suppressColumnsMap);
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
    private static Integer printOut(Map<Integer,List<Integer>> rr,Map<String, List<String>> suppressColumnsMap){
        int ret = SUCCESS_STATUS;
        int cnt = 0;
        for(int i=0;i<rr.size();i++){
            cnt+=(rr.get(i).get(1)-rr.get(i).get(0)+1);
            debug(searchTbl(rr.get(i).get(0),rr.get(i).get(1),suppressColumnsMap));
        }
        return ret+cnt;
    }
    private static void subMain(){
        //https://qiita.com/kiida/items/9d26b850194fa1a02e67
        System.exit(0);
    }
    private static Set<Integer> searchCodePointStartEnd(List<Map<String,List<String>>> searchArgsMapList){

        Set<Integer> rt = null;

        searchArgsMapList.stream().forEach(e-> System.out.println(e));
        //ここはオプション方式にするかも。記述量が少なくてすむ。
        //関数リストを用意 インプットリストとスプリットリスト
        //ラッパーえぐぜを用意
//        rt = executeWordNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(searchCondition.get(OPTION_SEARCH_KEYWORD)).orElse(DEFAULT_SEARCH_KEYWORD),Arrays.asList(DEFAULT_NONE_KEYWORD),App::mkInputUnicodeName,App::mkWordIdxNonWordSplit,App::mkIdxShape);
//        rt = executeNgramSearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(Integer.parseInt(searchCondition.get(OPTION_NGRAM_CNT))).orElse(DEFAULT_NGRAM_CNT),Optional.ofNullable(searchCondition.get(OPTION_SEARCH_KEYWORD)).orElse(DEFAULT_SEARCH_KEYWORD),Arrays.asList(DEFAULT_NONE_KEYWORD),App::mkInputUnicodeName,App::mkNgramIdxNonWordSplit,App::mkIdxShape);
//        rt = executeHashKeySearch(DEFAULT_START_RN,DEFAULT_END_RN,Optional.ofNullable(searchCondition.get(OPTION_SEARCH_KEYWORD)).orElse(DEFAULT_SEARCH_KEYWORD),App::mkInputUnicodeName,App::mkIdxFilter);

        return rt;
    }

    private static Map<String, String> prepareRegexpForParseOption(Map<String, List<String>> argsOptPtn){
//        文字列クラスに備わっているmatchesとパタンクラスに備わっているmatcherの振る舞いはことなる。
//        ここでは文字列に変換して文字列クラスのmatchesを使うような実装にしている。
//        正規表現のコンパイル時間がネックそう
        Map<String, String> rt = new LinkedHashMap<>();
        for(Map.Entry<String,List<String>> entry : argsOptPtn.entrySet()){
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

    private static void setRange(String s,Map<String, String> prepareRegexpForParseOption){
        List<String> l = Arrays.asList(s.split(ARGS_SEPARATOR));
        if(s.matches(prepareRegexpForParseOption.get(OPTION_RANGE))){
            if(l.size()>3){
                optionUsage(FAILURE_STATUS,OPTION_HELP);
            }
            if(2==l.size()){
                if(l.get(1).length()>String.valueOf(DEFAULT_END_RN).length()){
                    optionUsage(FAILURE_STATUS,OPTION_HELP);
                }
                if(Integer.parseInt(l.get(1))>DEFAULT_END_RN){
                    optionUsage(FAILURE_STATUS,OPTION_HELP);
                }
                if(Integer.parseInt(l.get(1))<DEFAULT_END_RN){
                    DEFAULT_END_RN=Integer.parseInt(l.get(1));
                }
            }else if(3==l.size()){
                if(l.get(1).length()>String.valueOf(DEFAULT_END_RN).length()||l.get(2).length()>String.valueOf(DEFAULT_END_RN).length()){
                    optionUsage(FAILURE_STATUS,OPTION_HELP);
                }
                if(Integer.parseInt(l.get(2))<DEFAULT_START_RN){
                    optionUsage(FAILURE_STATUS,OPTION_HELP);
                }
                DEFAULT_START_RN=Integer.parseInt(l.get(1));
                DEFAULT_END_RN=Integer.parseInt(l.get(2));
            }else{
                optionUsage(FAILURE_STATUS,OPTION_HELP);
            }
        }
    }

    private static boolean isSearchKeyword (String s,List<String> ptnList) {
        return ptnList.stream().anyMatch(ptn -> s.matches(ptn));
    }

    private static List<Map<String, List<String>>> execParseOption (List<String> cmdLineArgs,Map<String, String> prepareRegexpForParseOption){
        List<Map<String, List<String>>> rt = new ArrayList<>();
        if(cmdLineArgs.size()<=0){
            optionUsage(FAILURE_STATUS,OPTION_HELP);
        }

        int mx = cmdLineArgs.size();

        //システム全体で参照するコードポイント範囲を設定
        IntStream.range(0,mx).boxed().forEach(i->setRange(cmdLineArgs.get(i),prepareRegexpForParseOption));

        Map<String, List<String>> optionFlgPtnOnMap = new HashMap<>();
        Map<String, List<String>> optionFlgPtnOffMap = new HashMap<>();
        for(int i=0;i<mx;i++){
            //オプション引数が与えた際のフラグ設定 ON 与えられた分だけ設定
            for(Map.Entry<String,List<String>> entry : optionFlgPtn.get(ON).entrySet()){
                if(entry.getKey().equals(OPTION_SEARCH_KEYWORD)){
                    //コマンドライン引数が検索キーワードの場合
                    if(isSearchKeyword(cmdLineArgs.get(i),optionFlgPtn.get(ON).get(OPTION_SEARCH_KEYWORD))){
                        optionFlgPtnOnMap.put(OPTION_SEARCH_KEYWORD,Arrays.asList(cmdLineArgs.get(i)));
                    }else{

                    }
                }else{
                    //コマンドライン引数が検索キーワードでない場合
                    if(cmdLineArgs.get(i).matches(prepareRegexpForParseOption.get(entry.getKey()))){
                        optionFlgPtnOnMap.put(entry.getKey(),entry.getValue());
                    }
                }
            }
            //オプション引数が与えた際のフラグ設定 OFF 与えられた分だけ設定
            for(Map.Entry<String,List<String>> entry : optionFlgPtn.get(OFF).entrySet()){
                if(cmdLineArgs.get(i).matches(prepareRegexpForParseOption.get(entry.getKey()))){
                    optionFlgPtnOffMap.put(entry.getKey(),entry.getValue());
                }
            }
            rt.addAll(optionFlgPtnOnMap.entrySet().stream().parallel().map(e->Map.of(e.getKey(),e.getValue())).collect(Collectors.toList()));
            rt.addAll(optionFlgPtnOffMap.entrySet().stream().parallel().map(e->Map.of(e.getKey(),e.getValue())).collect(Collectors.toList()));
            optionFlgPtnOnMap = new HashMap<>();
            optionFlgPtnOffMap = new HashMap<>();
        }

        //オプション引数が与えられなかった際のデフォルトフラグ設定 ON
        Map<String, List<String>> defaultOptionFlgPtnOnMap = new HashMap<>();
        for(Map.Entry<String,List<String>> entry : defaultOptionFlgPtn.get(ON).entrySet()){
            if(rt.stream().flatMap(map->map.keySet().stream()).noneMatch(key->key.contains(entry.getKey()))){
                //未登録エントリのみ設定
                defaultOptionFlgPtnOnMap.put(entry.getKey(),entry.getValue());
            }
        }
        //Map<String, List<String>> --> List<Map<String, List<String>>>
        rt.addAll(defaultOptionFlgPtnOnMap.entrySet().stream().parallel().map(e->Map.of(e.getKey(),e.getValue())).collect(Collectors.toList()));

        //オプション引数が与えられなかった際のデフォルトフラグ設定 OFF
        Map<String, List<String>> defaultOptionFlgPtnOffMap = new HashMap<>();
        for(Map.Entry<String,List<String>> entry : defaultOptionFlgPtn.get(OFF).entrySet()){
            if(rt.stream().flatMap(map->map.keySet().stream()).noneMatch(key->key.contains(entry.getKey()))){
                //未登録エントリのみ設定
                defaultOptionFlgPtnOffMap.put(entry.getKey(),entry.getValue());
            }
        }
        //Map<String, List<String>> --> List<Map<String, List<String>>>
        rt.addAll(defaultOptionFlgPtnOffMap.entrySet().stream().parallel().map(e->Map.of(e.getKey(),e.getValue())).collect(Collectors.toList()));

        return rt;
    }
    private static boolean showCmdInfo(List<Map<String,List<String>>> mainReStyleProcessArgsList,String option){
        return 0!=mainReStyleProcessArgsList.stream().flatMap(m->m.entrySet().stream())
                    .filter(e->Stream.of(option).anyMatch(s->e.getKey().contains(s)))
                    .filter(e->e.getValue().contains(ON)).count();
    }
    private static Integer mainProcess (List<Map<String,List<String>>> mainReStyleProcessArgsList) {
        int ret = SUCCESS_STATUS;
        List<String> argsKeyList = mainReStyleProcessArgsList.stream().flatMap(e->e.keySet().stream()).collect(Collectors.toList());
        Map<String,List<String>> suppressColMap = mainReStyleProcessArgsList.stream().flatMap(m->m.entrySet().stream()).filter(e->colArgsList.contains(e.getKey()))
                .collect(Collectors.toMap(
                        e->e.getKey()
                        ,e->e.getValue()
                        ,(pre,post)->post
                        ,HashMap::new
                ));
        List<Map<String,List<String>>> searchArgsMapList = mainReStyleProcessArgsList.stream().filter(e-> 3==e.values().size()).collect(Collectors.toList());
        finish : {
            if(showCmdInfo(mainReStyleProcessArgsList,OPTION_HELP)){
                optionUsage(ret,OPTION_HELP);
                break finish ;
            }
            if(showCmdInfo(mainReStyleProcessArgsList,OPTION_USAGE)){
                optionUsage(ret,OPTION_USAGE);
                break finish ;
            }
            if(showCmdInfo(mainReStyleProcessArgsList,OPTION_VERSION)){
                optionUsage(ret,OPTION_VERSION);
                break finish ;
            }
            Set<Integer> rt;
            //ここは実行優先度を管理することになる
            if(grpArgsList.stream().noneMatch(e->argsKeyList.contains(e))){
                //rangeのみ指定
                rt = IntStream.rangeClosed(DEFAULT_START_RN,DEFAULT_END_RN).boxed().parallel().collect(Collectors.toSet());
                ret += printOut(grpStartEndRn(rt.stream().sorted(Comparator.naturalOrder()).collect(Collectors.toList())),suppressColMap);
                break finish ;
            }else{
                //range以外指定（検索）
                rt = searchCodePointStartEnd(searchArgsMapList);
//                ret += printOut(grpStartEndRn(rt.stream().sorted(Comparator.naturalOrder()).collect(Collectors.toList())),suppressColMap);
            }
        }
        return ret;
    }
    private static void canYouHelpMe(List<Map<String, List<String>>> mainProcessArgs){
        for(Map<String, List<String>> map : mainProcessArgs){
            for(Map.Entry<String, List<String>> entry : map.entrySet()){
                if(Stream.of(OPTION_HELP).anyMatch(e->e.contains(entry.getKey())) && entry.getValue().get(0).contains(ON)){
                    optionUsage(SUCCESS_STATUS,OPTION_HELP);
                }
                if(Stream.of(OPTION_USAGE).anyMatch(e->e.contains(entry.getKey())) && entry.getValue().get(0).contains(ON)){
                    optionUsage(SUCCESS_STATUS,OPTION_USAGE);
                }
                if(Stream.of(OPTION_VERSION).anyMatch(e->e.contains(entry.getKey())) && entry.getValue().get(0).contains(ON)){
                    optionUsage(SUCCESS_STATUS,OPTION_VERSION);
                }
            }
        }
    }

    //グループ化対象キーを定義
    private static final List<String> grpArgsList = new ArrayList<>(Arrays.asList(OPTION_MK_WORD_IDX_NON_SPLIT,OPTION_MK_WORD_IDX_NON_WORD_SPLIT,OPTION_MK_WORD_IDX_NON_WORD_HYPHEN_SPLIT,OPTION_MK_WORD_IDX_NON_WORD_UNDERSCORE_SPLIT,OPTION_MK_WORD_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT,OPTION_MK_NGRAM_IDX_NON_SPLIT,OPTION_MK_NGRAM_IDX_NON_WORD_SPLIT,OPTION_MK_NGRAM_IDX_NON_WORD_HYPHEN_SPLIT,OPTION_MK_NGRAM_IDX_NON_WORD_UNDERSCORE_SPLIT,OPTION_MK_NGRAM_IDX_NON_WORD_UNDERSCORE_HYPHEN_SPLIT,OPTION_HASH_KEY_SEARCH,OPTION_IDX_INPUT_UNICODE_NAME,OPTION_IDX_INPUT_UNICODE_SCRIPT_NAME,OPTION_IDX_INPUT_UNICODE_BLOCK_NAME,OPTION_SEARCH_KEYWORD));

    //取得対象列リストを定義
    private static final List<String> colArgsList = new ArrayList<>(Arrays.asList(OPTION_NUM_TO_STR,OPTION_CP_TO_STR,OPTION_CP_TO_UNICODE_NAME,OPTION_CP_TO_UNICODE_SCRIPT_NAME,OPTION_CP_TO_UNICODE_BLOCK_NAME,OPTION_STR_TO_UTF8,OPTION_STR_TO_UTF16,OPTION_STR_TO_UTF32,OPTION_STR_TO_UNICODE,OPTION_NORM_GRP_NFC,OPTION_NORM_GRP_NFD,OPTION_NORM_GRP_NFKC,OPTION_NORM_GRP_NFKD));

    public static void main(String... args) {
        int ret;

        List<Map<String, List<String>>> mainProcessArgs = execParseOption(Arrays.asList(args),prepareRegexpForParseOption(argsOptPtn));

        canYouHelpMe(mainProcessArgs);

        //引数のグルーピング処理
//        0	false	0	false	0	1	NORM_GRP_NFC	[-9999]
//        1	true	1	true	1	2	MK_WORD_IDX_NON_WORD_SPLIT	[1]
//        2	false	0	true	1	2	IDX_INPUT_UNICODE_NAME	[1]
//        3	false	0	true	1	2	SEARCH_KEYWORD	[HIRA]
//        4	false	0	false	0	3	NORM_GRP_NFD	[-9999]
//        5	true	1	true	1	4	MK_WORD_IDX_NON_SPLIT	[1]
//        6	false	0	true	1	4	IDX_INPUT_UNICODE_NAME	[1]
//        7	false	0	true	1	4	SEARCH_KEYWORD	[HAN]
//        8	true	1	true	1	5	MK_WORD_IDX_NON_SPLIT	[1]
//        9	false	0	true	1	5	IDX_INPUT_UNICODE_NAME	[1]
//        10	false	0	true	1	5	SEARCH_KEYWORD	[HAN]
//        11	false	0	false	0	6	STR_TO_UTF8	[1]
//        12	false	0	false	0	7	CP_TO_UNICODE_BLOCK_NAME	[1]
//        13	false	0	false	0	8	CP_TO_UNICODE_NAME	[1]
//        14	false	0	false	0	9	STR_TO_UNICODE	[1]
//        15	false	0	false	0	10	NUM_TO_STR	[1]
//        16	false	0	false	0	11	STR_TO_UTF16	[1]
//        17	false	0	false	0	12	CP_TO_STR	[1]
//        18	false	0	false	0	13	NORM_GRP_NFKC	[1]
//        19	false	0	false	0	14	NORM_GRP_NFKD	[1]
//        20	false	0	false	0	15	CP_TO_UNICODE_SCRIPT_NAME	[1]
//        21	false	0	false	0	16	STR_TO_UTF32	[1]
//        22	false	0	false	0	17	OPTION_VERSION	[-9999]
//        23	false	0	false	0	18	OPTION_HELP	[-9999]
//        24	false	0	false	0	19	OPTION_USAGE	[-9999]
//
        int cnt=0;
        int grp=0;
        Map<Integer,Map<String,List<String>>> mainGroupingProcessArgs = new LinkedHashMap<>();
        for(Map<String, List<String>> map : mainProcessArgs){
            for(Map.Entry<String, List<String>> entry : map.entrySet()){
                if(entry.getKey().contains("SPLIT") ||entry.getKey().contains("INPUT")||entry.getKey().contains("KEYWORD")){
                    //いずれかのグルーピングキーを含んでいる場合
                    if(entry.getKey().contains("SPLIT")){
                        //グルーピングの開始点がある場合
                        grp++;//インクリメントしてから処理
                        if(mainGroupingProcessArgs.containsKey(grp)){
                            //紐づくキーがあれば、リスト追加
                            mainGroupingProcessArgs.get(grp).put(entry.getKey(),entry.getValue());
                        }else{
                            //紐づくキーがなければ、リスト新規追加
                            mainGroupingProcessArgs.put(grp,new LinkedHashMap<>(){{put(entry.getKey(),entry.getValue());}});
                        }
//                        System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n"
//                                , cnt
//                                , entry.getKey().contains("SPLIT")
//                                , entry.getKey().contains("SPLIT") ? 1 : 0
//                                , entry.getKey().contains("SPLIT") || entry.getKey().contains("INPUT") || entry.getKey().contains("KEYWORD")
//                                , entry.getKey().contains("SPLIT") || entry.getKey().contains("INPUT") || entry.getKey().contains("KEYWORD") ? 1 : 0
//                                , grp
//                                , entry.getKey()
//                                , entry.getValue()
//                        );
                    }else {
                        //グルーピングの開始点がない場合
                        if(mainGroupingProcessArgs.containsKey(grp)){
                            //紐づくキーがあれば、リスト追加
                            mainGroupingProcessArgs.get(grp).put(entry.getKey(),entry.getValue());
                        }else{
                            //紐づくキーがなければ、リスト新規追加
                            mainGroupingProcessArgs.put(grp,new LinkedHashMap<>(){{put(entry.getKey(),entry.getValue());}});
                        }
//                        System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n"
//                                , cnt
//                                , entry.getKey().contains("SPLIT")
//                                , entry.getKey().contains("SPLIT") ? 1 : 0
//                                , entry.getKey().contains("SPLIT") || entry.getKey().contains("INPUT") || entry.getKey().contains("KEYWORD")
//                                , entry.getKey().contains("SPLIT") || entry.getKey().contains("INPUT") || entry.getKey().contains("KEYWORD") ? 1 : 0
//                                , grp
//                                , entry.getKey()
//                                , entry.getValue()
//                        );
                    }
                }else{
                    //いずれのグルーピングキーも含んでいない場合
                    grp++;//インクリメントしてから処理

                    if(mainGroupingProcessArgs.containsKey(grp)){
                        //紐づくキーがあれば、リスト追加
                        mainGroupingProcessArgs.get(grp).put(entry.getKey(),entry.getValue());
                    }else{
                        //紐づくキーがなければ、リスト新規追加
                        mainGroupingProcessArgs.put(grp,new LinkedHashMap<>(){{put(entry.getKey(),entry.getValue());}});
                    }

//                    System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n"
//                            ,cnt
//                            ,entry.getKey().contains("SPLIT")
//                            ,entry.getKey().contains("SPLIT") ?1:0
//                            ,entry.getKey().contains("SPLIT")||entry.getKey().contains("INPUT")||entry.getKey().contains("KEYWORD")
//                            ,entry.getKey().contains("SPLIT")||entry.getKey().contains("INPUT")|| entry.getKey().contains("KEYWORD") ?1:0
//                            ,grp
//                            ,entry.getKey()
//                            ,entry.getValue()
//                    );
                }
                cnt++;
            }
        }
//        Map<Integer,Map<String,List<String>>> --> List<Map<String,List<String>>>
        int mx = mainGroupingProcessArgs.size();
        List<Map<String,List<String>>> mainReStyleProcessArgs = IntStream.rangeClosed(1,mx).boxed().map(k->mainGroupingProcessArgs.get(k)).collect(Collectors.toList());
        ret = mainProcess(mainReStyleProcessArgs);
//        System.exit(ret);
    }
}