package app;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    private static String hex2bin(String s){
        return Integer.toBinaryString(Integer.parseInt(s,16));
    }
    private static String bin2hex(String s){
        return Integer.toHexString(Integer.parseInt(s,2));
    }
    private static String cp2str(Integer n) {
        return new String(Character.toChars(n));
    }
    private static String cp2uniscript(Integer n){
        return Character.UnicodeScript.of(n).name();
    }
    private static String cp2uniname(Integer n){
        return Character.getName(n);
    }
    private static String str2uni(String s){
        return IntStream.range(0,s.length()).boxed().map(e->String.format("U+%X",(int)s.charAt(e))).collect(Collectors.joining("-"));
    }
    private static String str2utf8(String s) {
        byte[] b = s.getBytes(StandardCharsets.UTF_8);
        Pattern p = Pattern.compile("^1*0");
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<b.length;i++){
            String bin = hex2bin(String.format("%02X",b[i]));
            Matcher mc = p.matcher(bin);
            if(mc.find()){
                if(2!=mc.group().length()){
                    sb.append("\n"+bin2hex(bin));
                }else{
                    sb.append(bin2hex(bin));
                }
            }
        }
        return Stream.of(sb.toString()).flatMap(e-> Arrays.stream(e.split("\n"))).filter(ee->0!=ee.length()).collect(Collectors.joining("-"));
    }
    private static String str2utf16(String s) {
        byte[] b = s.getBytes(StandardCharsets.UTF_16);
        return IntStream.rangeClosed(0,b.length-1).boxed().map(e->String.format("%02X",b[e])).collect(Collectors.joining("-"));
    }
    private static String str2utf32(String s) {
        byte[] b = s.getBytes(Charset.forName("UTF-32"));
        return IntStream.rangeClosed(0,b.length-1).boxed().map(e->String.format("%02X",b[e])).collect(Collectors.joining("-"));
    }
    private static String str2norm(String s, Normalizer.Form typ) {
        return Normalizer.normalize(s,typ);
    }
    public static void main( String[] args ) {
//        int s=0;
//        int e=0x10FFFF;
        int s=0x3040;
        int e=0x30FF;
//        int s=0x1F400;
//        int e=0x1F4FF;
        Map<Integer, List<String>> m = new HashMap<>();
        for(int i=s;i<=e;i++){
            m.put(i, Arrays.asList(
                    String.valueOf(i)
                    ,cp2uniname(i)
                    ,cp2str(i)
                    ,cp2uniscript(i)
                    ,str2utf8(cp2str(i))
                    ,str2utf16(cp2str(i))
                    ,str2utf32(cp2str(i))
                    ,str2uni(cp2str(i))
                    ,str2norm(cp2str(i), Normalizer.Form.NFC)
                    ,str2utf8(str2norm(cp2str(i), Normalizer.Form.NFC))
                    ,str2norm(cp2str(i), Normalizer.Form.NFD)
                    ,str2utf8(str2norm(cp2str(i), Normalizer.Form.NFD))
                    ,str2norm(cp2str(i), Normalizer.Form.NFKC)
                    ,str2utf8(str2norm(cp2str(i), Normalizer.Form.NFKC))
                    ,str2norm(cp2str(i), Normalizer.Form.NFKD)
                    ,str2utf8(str2norm(cp2str(i), Normalizer.Form.NFKD))
                    ,str2utf16(str2norm(cp2str(i), Normalizer.Form.NFKD))
                    ,str2utf32(str2norm(cp2str(i), Normalizer.Form.NFKD))
            ));
        }
        for(Map.Entry<Integer, List<String>> entry : m.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey(),entry.getValue());
        }
    }
}