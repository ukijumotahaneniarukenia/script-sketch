package app;

import com.github.javafaker.Faker;

import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class App
{
    public static void main(String[] args) {
        List<String> cmdLineArgs = new ArrayList<>(Arrays.asList(args));
        List<Pattern> parsePtn = new ArrayList<>();
        List<Map<String, List<String>>> l = new ArrayList<>();
        l.add(new HashMap<String, List<String>>() {{put("HELP", Arrays.asList("true","-h", "--h", "--help", "-help"));}});
        l.add(new HashMap<String, List<String>>() {{put("RANDOM_NUMBER", Arrays.asList("false","-n.*", "--n.*", "-number.*", "--number.*"));}});
        l.add(new HashMap<String, List<String>>() {{put("VERSION", Arrays.asList("true","-v", "--v", "-V", "--V", "-version", "--version"));}});
        Map<String, List<String>> mainProcessArgs = execParseOpts(cmdLineArgs,prepareParseOpts(l));
        mainProcess(mainProcessArgs);
    }

    private static void mainProcess (Map<String, List<String>> mainProcessArgs) {
        finish : {
            for(Map.Entry<String,List<String>> entry : mainProcessArgs.entrySet()){
                switch (entry.getKey()){
                    case "HELP":
                    case "USAGE":
                        if(entry.getValue().contains("1")){
                            Usage();
                            break finish;
                        }else{
                            break;
                        }
                    case "VERSION":
                        if(entry.getValue().contains("1")){
                            Version();
                            break finish;
                        }else{
                            break;
                        }
                    case "RANDOM_NUMBER":
                        if(entry.getValue().get(1).contains(entry.getValue().get(0))){
                            genRandomNumber(Integer.parseInt(entry.getValue().get(2)),Boolean.valueOf(entry.getValue().get(3)));
                            break;
                        }else{
                            break;
                        }
                    default:
                        break finish;
                }
            }
        }
    }

    private static Map<String, List<String>> execParseOpts (List<String> cmdLineArgs,Map<String, String> ptnMap){
        //デフォルト値の設定
        Map<String, List<String>> rt = new HashMap<>();
        rt.put("HELP", Arrays.asList("0"));
        rt.put("VERSION", Arrays.asList("0"));
        rt.put("RANDOM_NUMBER", Arrays.asList("0"));
        rt.put("USAGE", Arrays.asList("1"));

        //引数処理
        for (int i=0;i<cmdLineArgs.size();i++){
            if(cmdLineArgs.get(i).matches(ptnMap.get("HELP"))){
                rt.put("HELP", Arrays.asList("1"));
                rt.put("USAGE", Arrays.asList("0"));
            }else if(cmdLineArgs.get(i).matches(ptnMap.get("VERSION"))){
                rt.put("VERSION", Arrays.asList("1"));
                rt.put("USAGE", Arrays.asList("0"));
            }else if(cmdLineArgs.get(i).matches(ptnMap.get("RANDOM_NUMBER"))){
                List<String> random_number = Arrays.asList(cmdLineArgs.get(i).split(":"));
                if(3 != random_number.size()){
                    Usage();
                    System.exit(0);
                }else{
                    rt.put("RANDOM_NUMBER", Arrays.asList(random_number.get(0),ptnMap.get("RANDOM_NUMBER"),random_number.get(1),random_number.get(2)));
                    rt.put("USAGE", Arrays.asList("0"));
                }
            }else{
                Usage();
                System.exit(1);
            }
        }
        return rt;
    }

    private static void Usage(){
        System.out.println("Usage");
    }

    private static void Version(){
        System.out.println("1-0-0");
    }

    private static Map<String, String> prepareParseOpts(List<Map<String, List<String>>> l){
        Map<String, String> rt = new HashMap<>();
        for(int i=0;i<l.size();i++){
            for(Map.Entry<String,List<String>> entry : l.get(i).entrySet()){
                if(Boolean.valueOf(entry.getValue().get(0))){
                    Pattern ptn = Pattern.compile("((?!.)." + entry.getValue().subList(1,entry.getValue().size()).stream().map(Pattern::quote).map("|"::concat).collect(Collectors.joining()) + ")");
                    rt.put(entry.getKey(),ptn.toString());
                }else{
                    Pattern ptn = Pattern.compile("((?!.)." + entry.getValue().subList(1,entry.getValue().size()).stream().map("|"::concat).collect(Collectors.joining()) + ")");
                    rt.put(entry.getKey(),ptn.toString());
                }
            }
        }
        return rt;
    }

    private static void genRandomNumber(Integer n,boolean b){
        Faker faker = new Faker();
        for(int i=0;i<n;i++){
            System.out.println(faker.number().randomNumber(n, b));
        }
    }
}