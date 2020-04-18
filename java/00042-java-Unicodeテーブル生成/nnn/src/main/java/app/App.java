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
        Map<Integer, List<String>> rt = new LinkedHashMap<>();
        for(int i=s;i<=e;i++){
            rt.put(i, Arrays.asList(
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
            ));
        }
        return rt;
    }
    private static Map<Integer, List<String>> mkTblNfd(Integer s,Integer e) {
        Map<Integer, List<String>> rt = new LinkedHashMap<>();
        for(int i=s;i<=e;i++){
            rt.put(i, Arrays.asList(
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
            ));
        }
        return rt;
    }
    private static Map<Integer, List<String>> mkTblNfkc(Integer s,Integer e) {
        Map<Integer, List<String>> rt = new LinkedHashMap<>();
        for(int i=s;i<=e;i++){
            rt.put(i, Arrays.asList(
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
            ));
        }
        return rt;
    }
    private static Map<Integer, List<String>> mkTblNfkd(Integer s,Integer e){
        Map<Integer, List<String>> rt = new LinkedHashMap<>();
        for(int i=s;i<=e;i++){
            rt.put(i, Arrays.asList(
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
            ));
        }
        return rt;
    }
    private static void printOut(Map<Integer, List<String>> m){
        m.entrySet().stream().filter(v->Optional.ofNullable(v.getValue().get(defaultIndexCol)).orElse(defaultNoneKeyWord).contains(defaultKeyWord))
                .forEach(e-> System.out.println(e.getValue().subList(defaultSelectColStartRn,defaultSelectColEndRn)));
    }
    private static Map<Integer, String> mkIdxUniName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniName(i)).orElse(defaultNoneKeyWord))).entrySet().stream()
                .filter(v->v.getValue().contains(defaultKeyWord)).collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Map<Integer, String> mkIdxUniScriptName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniScriptName(i)).orElse(defaultNoneKeyWord))).entrySet().stream()
                .filter(v->v.getValue().contains(defaultKeyWord)).collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static Map<Integer, String> mkIdxUniBlockName(Integer s,Integer e) {
        return IntStream.rangeClosed(s,e).boxed().parallel().collect(Collectors.toMap(i->i,i->Optional.ofNullable(cpToUniBlockName(i)).orElse(defaultNoneKeyWord))).entrySet().stream()
                .filter(v->v.getValue().contains(defaultKeyWord)).collect(Collectors.toMap(ee->ee.getKey(),ee->ee.getValue()));
    }
    private static String defaultKeyWord="KATAKANA";
    private static Integer defaultNormGrp=1;
    private static Integer defaultIndexCol=1;
    private static Integer defaultSelectColStartRn=0;
    private static Integer defaultSelectColEndRn=8;
    private static Integer defaultStartRn=0;
    private static Integer defaultEndRn=0x10FFFF;
    private static String defaultNoneKeyWord="ウンコもりもり森鴎外";

//        int s=0x3040;
//        int e=0x30FF;
//        int s=0x1F400;
//        int e=0x1F4FF;

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
                List<Integer> chkDefaultIndexColRange = IntStream.rangeClosed(1,3).boxed().collect(Collectors.toList());
                if(chkDefaultIndexColRange.stream().noneMatch(e->e.equals(Integer.valueOf(args[1])))){
                    System.exit(1);
                }else{
                    defaultIndexCol=Integer.valueOf(args[1]);
                }

                defaultKeyWord=args[2];

//                defaultStartRn=Integer.valueOf(args[2]);
//                defaultEndRn=Integer.valueOf(args[3]);
//                if(defaultEndRn<defaultStartRn){
//                    System.exit(1);
//                }
            }
        }else{

        }

        Map<Integer, String> m = null;
        switch (defaultIndexCol){
            case 1:
                m = mkIdxUniName(defaultStartRn,defaultEndRn);
                break;
            case 2:
                m = mkIdxUniScriptName(defaultStartRn,defaultEndRn);
                break;
            case 3:
                m = mkIdxUniBlockName(defaultStartRn,defaultEndRn);
                break;
            default:
                System.exit(1);
        }

        Integer mn = m.entrySet().stream().parallel().filter(v->v.getValue().contains(defaultKeyWord)).min(Comparator.comparing(ee->ee.getKey())).get().getKey();
        Integer mx = m.entrySet().stream().parallel().filter(v->v.getValue().contains(defaultKeyWord)).max(Comparator.comparing(ee->ee.getKey())).get().getKey();

        Map<Integer, List<String>> ret = null;
        switch (defaultNormGrp){
            case 0:
                ret= mkTblCore(mn,mx);
                break;
            case 1:
                ret= mkTblNfc(mn,mx);
                break;
            case 2:
                ret= mkTblNfd(mn,mx);
                break;
            case 3:
                ret= mkTblNfkc(mn,mx);
                break;
            case 4:
                ret= mkTblNfkd(mn,mx);
                break;
            default:
                System.exit(1);
        }
        printOut(ret);
    }
}