package app;

import com.github.javafaker.Faker;

import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {

    private final static String HELP = "HELP";
    private final static String VERSION = "VERSION";
    private final static String RANDOM_NUMBER = "RANDOM_NUMBER";
    private final static String USAGE = "USAGE";
    private final static String HUMAN_NAME = "HUMAN_NAME";
    private final static String ARTIFACT_ID = "1-0-0";
    private final static String ARGS_SEPARATOR = ":";
    private final static String OPTION_ON = "1";
    private final static String OPTION_OFF = "-999999999999";
    private final static Integer SUCCESS_STATUS = 0;
    private final static Integer FAILURE_STATUS = 1;

    private static void usage(String usagePtn){
        switch (usagePtn){
            case HELP:
            case USAGE:
                help();
                break;
            case VERSION:
                version();
                break;
            case RANDOM_NUMBER:
                usageRandomNumber();
                break;
            case HUMAN_NAME:
                usageHumanName();
                break;
            default:
                break;
        }
    }

    private final static Map<String, List<String>> prepareParseOptPtn = new LinkedHashMap<>(){{
        put(HELP, Arrays.asList("true", "-h", "--h", "--help", "-help"));
        put(VERSION, Arrays.asList("true", "-v", "--v", "-V", "--V", "-version", "--version"));
        put(RANDOM_NUMBER, Arrays.asList("false","2", "-n.*", "--n.*", "-number.*", "--number.*"));
        put(HUMAN_NAME, Arrays.asList("false","1", "-hu.*", "--hu.*", "-human_name.*", "--human_name.*"));
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
            if(cmdLineArgs.get(i).matches(prepareParseOpts.get(HELP))){
                rt.put(HELP, Arrays.asList(OPTION_ON));
            }else if(cmdLineArgs.get(i).matches(prepareParseOpts.get(VERSION))){
                rt.put(VERSION, Arrays.asList(OPTION_ON));
            }else if(cmdLineArgs.get(i).matches(prepareParseOpts.get(RANDOM_NUMBER))){
                List<String> l = Arrays.asList(cmdLineArgs.get(i).split(ARGS_SEPARATOR));
                if(Integer.parseInt(prepareParseOptPtn.get(RANDOM_NUMBER).get(1))!=l.size()-1){
                    //引数個数チェック
                    usage(RANDOM_NUMBER);
                    System.exit(SUCCESS_STATUS);
                }else{
                    rt.put(RANDOM_NUMBER, flattenList(Arrays.asList(l.get(0),prepareParseOpts.get(RANDOM_NUMBER)),l.subList(1,Integer.parseInt(prepareParseOptPtn.get(RANDOM_NUMBER).get(1))+1)));
                }
            }else if(cmdLineArgs.get(i).matches(prepareParseOpts.get(HUMAN_NAME))){
                List<String> l = Arrays.asList(cmdLineArgs.get(i).split(ARGS_SEPARATOR));
                if(Integer.parseInt(prepareParseOptPtn.get(HUMAN_NAME).get(1))!=l.size()-1){
                    //引数個数チェック
                    usage(HUMAN_NAME);
                    System.exit(SUCCESS_STATUS);
                }else{
                    rt.put(HUMAN_NAME, flattenList(Arrays.asList(l.get(0),prepareParseOpts.get(HUMAN_NAME)),l.subList(1,Integer.parseInt(prepareParseOptPtn.get(HUMAN_NAME).get(1))+1)));
                }
            }else{
                usage(HELP);
                System.exit(FAILURE_STATUS);
            }
        }

        //デフォルト値の設定
        if(!rt.containsKey(HELP)){
            rt.put(HELP,Arrays.asList(OPTION_OFF));
        }
        if(!rt.containsKey(USAGE)){
            rt.put(USAGE,Arrays.asList(OPTION_OFF));
        }
        if(!rt.containsKey(VERSION)){
            rt.put(VERSION,Arrays.asList(OPTION_OFF));
        }
        if(!rt.containsKey(RANDOM_NUMBER)){
            rt.put(RANDOM_NUMBER,Arrays.asList(OPTION_OFF));
        }
        if(!rt.containsKey(HUMAN_NAME)){
            rt.put(HUMAN_NAME,Arrays.asList(OPTION_OFF));
        }

        return rt;
    }

    private static boolean showCmdInfo(Map<String, List<String>> mainProcessArgs,String... s){
        return 0!=mainProcessArgs.keySet().stream()
                .filter(key->Stream.of(s).anyMatch(ss->ss.contains(key)))
                .filter(key->mainProcessArgs.get(key).contains(OPTION_ON)).count();
    }

    private static void mainProcess (Map<String, List<String>> mainProcessArgs) {
//        System.out.println(Stream.generate(()->"=").limit(100).collect(Collectors.joining()));
//        mainProcessArgs.entrySet().stream().forEach(e-> System.out.println(e));
        finish : {
            if(showCmdInfo(mainProcessArgs,HELP,USAGE)){
                usage(USAGE);
                break finish;
            }
            if(showCmdInfo(mainProcessArgs,VERSION)){
                usage(VERSION);
                break finish;
            }
            for(Map.Entry<String,List<String>> entry : mainProcessArgs.entrySet()){
                switch (entry.getKey()){
                    case RANDOM_NUMBER:
                        if(entry.getValue().contains(OPTION_OFF)){
                            break;
                        }else{
                            if(entry.getValue().get(1).contains(entry.getValue().get(0))){
                                genRandomNumber(entry.getValue().subList(2,entry.getValue().size()));
                                break;
                            }
                        }
                    case HUMAN_NAME:
                        if(entry.getValue().contains(OPTION_OFF)){
                            break;
                        }else{
                            if(entry.getValue().get(1).contains(entry.getValue().get(0))){
                                genHumanName(entry.getValue().subList(2,entry.getValue().size()));
                                break;
                            }
                        }
                    default:
                        break finish;
                }
            }
        }
    }
    private static void help(){
        System.out.println("Help");
    }
    private static void version(){
        System.out.println(ARTIFACT_ID);
    }
    private static void usageRandomNumber(){
        //TODO ヒアドキュメント対応する
        System.out.println("usageRandomNumber");
    }
    private static void usageHumanName(){
        //TODO ヒアドキュメント対応する
        System.out.println("usageHumanName");
    }
    private static void genRandomNumber_mock(List<String> l){
        Integer n = Integer.parseInt(l.get(0));
        Boolean b = Boolean.parseBoolean(l.get(1));
        IntStream.range(0,n).boxed().parallel().forEach(e-> System.out.println(new Faker().number().randomNumber(n, b)));
    }
    private static void genRandomNumber(List<String> l){
        //fakerがおそい
        Integer n = Integer.parseInt(l.get(0));
        IntStream.range(0,n).boxed().forEach(e-> System.out.println(e));
    }
    private static void genHumanName(List<String> l){
        Integer n = Integer.parseInt(l.get(0));
        IntStream.range(0,n).boxed().parallel().forEach(e-> System.out.println(new Faker(new Locale("ja_JP")).name().fullName()));
    }
    public static void main(String[] args) {
        List<String> cmdLineArgs = new ArrayList<>(Arrays.asList(args));
        Map<String, List<String>> mainProcessArgs = execParseOpts(cmdLineArgs,prepareParseOpts(prepareParseOptPtn));
//        mainProcessArgs.entrySet().stream().forEach(e-> System.out.println(e));
        mainProcess(mainProcessArgs);
    }
}