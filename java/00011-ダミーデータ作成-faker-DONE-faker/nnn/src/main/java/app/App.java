package app;

import com.github.javafaker.Faker;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class App
{
    public static void main(String[] args) {
        //echo '--help' | perl -nlE '/(\Q-h\E|\Q--h\E|\Q--help\E|\Q-help\E)/p and say ${^MATCH}'
        List<String> cmdLineArgs = new ArrayList<>(Arrays.asList(args));
        List<String> helpOpts = Arrays.asList("true","-h", "--h", "--help", "-help");
        List<String> versionOpts = Arrays.asList("true","-v", "--v", "-V", "--V", "--version", "-version");
        List<String> randomNumOpts = Arrays.asList("false","-n.*", "--n", "-number", "--number");
        List<List<String>> ll = new ArrayList<>(new ArrayList<>());
        ll.add(helpOpts);
        ll.add(versionOpts);
        ll.add(randomNumOpts);

        List<Pattern> parsePtn = new ArrayList<>();
        parsePtn = prepareParseOpts(ll);

//        Pattern helpOptsListRegexp = Pattern.compile("(" + helpOpts.stream().map(Pattern::quote).map("|"::concat).collect(Collectors.joining()) + ")");//くぉーとで囲んでしっかりマッチ
//        Pattern versionOptsListRegexp = Pattern.compile("(" + versionOpts.stream().map(Pattern::quote).map("|"::concat).collect(Collectors.joining()) + ")");//くぉーとで囲んでしっかりマッチ
//        Pattern randomNumOptsListRegexp = Pattern.compile("((?!.)." + randomNumOpts.stream().map("|"::concat).collect(Collectors.joining()) + ")");//先頭文字列にパタンマッチ入れておく（左側に任意の文字が存在しない任意文字。これは空文字がある文字の両端に存在しないものがないので、ダミーパタン。）
//        for (int i=0;i<cmdLineArgs.size();i++){
//            if(cmdLineArgs.get(i).matches(helpOptsListRegexp.toString())){
//                System.out.println("HELP");
//            }else if(cmdLineArgs.get(i).matches(versionOptsListRegexp.toString())){
//                System.out.println("VERSION");
//            }else if(cmdLineArgs.get(i).matches(randomNumOptsListRegexp.toString())){
//                System.out.println("RANDOM_NUMBER");
//                List<String> random_number = Arrays.asList(cmdLineArgs.get(i).split(":"));
//                if(3 != random_number.size()){
//                    System.exit(0);
//                }else{
//                    System.out.printf("%s:%s:%s\n",random_number.get(0),random_number.get(1),random_number.get(2));
//                }
//            }else{
//                System.out.println("UNKNOWN");
//            }
//        }
//        System.out.println(cmdLineArgs);
    }

    private static List<Pattern> prepareParseOpts(List<List<String>> l){
        List<Pattern> rt = new ArrayList<>();
        for(int i=0;i<l.size();i++){
            if(Boolean.valueOf(l.get(i).get(0))){
                Pattern ptn = Pattern.compile("(" + l.get(i).subList(1,l.get(i).size()).stream().map(Pattern::quote).map("|"::concat).collect(Collectors.joining()) + ")");//くぉーとで囲んでしっかりマッチ
                rt.add(ptn);
            }else{
                Pattern ptn = Pattern.compile("((?!.)." + l.get(i).subList(1,l.get(i).size()).stream().map("|"::concat).collect(Collectors.joining()) + ")");//先頭文字列にパタンマッチ入れておく（左側に任意の文字が存在しない任意文字。これは空文字がある文字の両端に存在しないものがないので、ダミーパタン。）
                rt.add(ptn);
            }
            System.out.println(l.get(i));
        }
        System.out.println(rt);
        return rt;
    }

    private static void genRandomNumber(Integer n,boolean b){
        Faker faker = new Faker();
        System.out.println(faker.number().randomNumber(n, b));
    }
}