package app;

import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class App {
    public static void main( String[] args ) {
//        String s = "\uD83D\uDC68\u200D\uD83D\uDC69\u200D\uD83D\uDC67\u200D\uD83D\uDC66";
//        List<String> rt = Pattern.compile("\\B").splitAsStream(s).collect(Collectors.toList());
//        System.out.printf("%s:%s:%s:%s",s,rt,rt.size(),s.codePoints().boxed().map(e->Integer.toHexString(e)).collect(Collectors.joining(",")));

//        String s = "\uD83D\uDC68\u200D\uD83D\uDC69\u200D\uD83D\uDC67\u200D\uD83D\uDC66";
//        List<String> rt = Pattern.compile("\\w").splitAsStream(s).collect(Collectors.toList());
//        System.out.printf("%s:%s:%s:%s",s,rt,rt.size(),s.codePoints().boxed().map(e->Integer.toHexString(e)).collect(Collectors.joining(",")));

//        String s = "うんこ";
//        List<String> rt = Pattern.compile("(?<=\\p{InHIRAGANA})").splitAsStream(s).collect(Collectors.toList());
//        System.out.printf("%s:%s:%s:%s",s,rt,rt.size(),s.codePoints().boxed().map(e->Integer.toHexString(e)).collect(Collectors.joining(",")));
//
//        String s = "\u30D8\u309A\u30BD";
//        String s = "㌷㌷㌷㌷㌷㌷㌷㌷㌷㌷";
//        List<String> rt = Pattern.compile("(?=\\N{SQUARE PESO})").splitAsStream(s).collect(Collectors.toList());
//        System.out.printf("%s:%s:%s:%s",s,rt,rt.size(),s.codePoints().boxed().map(e->Integer.toHexString(e)).collect(Collectors.joining(",")));

//        String s = "㋐㋑㋒㋓㋔㋕㋖㋗㋘㋙㋚㋛㋜㋝㋞㋟㋠㋡㋢㋣㋤㋥㋦㋧㋨㋩㋪㋫㋬㋭㋮㋯㋰㋱㋲㋳㋴㋵㋶㋷㋸㋹㋺㋻㋼㋽㋾";
////        String s = "㋐㋑㋒㋓㋔㋕㋖㋗㋘㋙㋚㋛㋜㋝㋞㋟㋠㋡㋢㋣㋤㋥㋦㋧㋨㋩㋪㋫㋬㋭㋮㋯㋰㋱㋲㋳㋴㋵㋶㋷㋸㋹㋺㋻㋼㋽㋾";
//        List<String> rt = Pattern.compile("\\B").splitAsStream(s).collect(Collectors.toList());
//        System.out.printf("%s:%s:%s:%s",s,rt,rt.size(),s.codePoints().boxed().map(e->Integer.toHexString(e)).collect(Collectors.joining(",")));

        String s = "\uD83C\uDFFB\u200D\uD83E\uDDDD";
        List<String> rt = Pattern.compile("\\W").splitAsStream(s).collect(Collectors.toList());
        System.out.printf("%s:%s:%s:%s",s,rt,rt.size(),s.codePoints().boxed().map(e->Integer.toHexString(e)).collect(Collectors.joining(",")));

//        String s = "\uD83D\uDC68\u200D\uD83D\uDC69\u200D\uD83D\uDC67\u200D\uD83D\uDC66";
//        List<String> rt = Pattern.compile("\u200D").splitAsStream(s).collect(Collectors.toList());
//        System.out.printf("%s:%s:%s:%s",s,rt,rt.size(),s.codePoints().boxed().map(e->Integer.toHexString(e)).collect(Collectors.joining(",")));

//        String s = "\uD83D\uDC68\u200D\uD83D\uDC69\u200D\uD83D\uDC67\u200D\uD83D\uDC66";
//        List<String> rt = Pattern.compile("\uD83D").splitAsStream(s).collect(Collectors.toList());
//        System.out.printf("%s:%s:%s:%s",s,rt,rt.size(),s.codePoints().boxed().map(e->Integer.toHexString(e)).collect(Collectors.joining(",")));
    }
}