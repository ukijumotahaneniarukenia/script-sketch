import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class App {
    public static void main(String[] args) {

        List<String> noneCloseTagList = Arrays.asList("meta","div","link");

        List<String> noneStartTagList = Arrays.asList("option");

        String html = "<div  class=\"position-relative\"></div>    </option>"; //開始タグの開始忘れ

//        String html = "<div id=\"body-styles\"></div>";//このパターンをうまく
//        String html = "<meta charset=\"utf-8\" />";
//        String html = "<meta  charset=\"utf-8\" /><title>ukijumotahaneniarukenia - Qiita</title><meta content=\"width=device-width,initial-scale=1,shrink-to-fit=no\" name=\"viewport\" />";
//        String html = "<link  href=\"/manifest.json\" rel=\"manifest\" />";
//        String html = "<html><head ><meta  charset=\"utf-8\" /><title>ukijumotahaneniarukenia - Qiita</title><meta content=\"width=device-width,initial-scale=1,shrink-to-fit=no\" name=\"viewport\" />" +
//                "<meta content=\"#55c500\" name=\"theme-color\" />" +
//                "<meta content=\"XWpkTG32-_C4joZoJ_UsmDUi-zaH-hcrjF6ZC_FoFbk\" name=\"google-site-verification\" />" +
//                "<link  href=\"/manifest.json\" rel=\"manifest\" />" +
//                "<link href=\"/opensearch.xml\" rel=\"search\" title=\"Qiita\" type=\"application/opensearchdescription+xml\" />]" +
//                "<meta name=\"csrf-param\" content=\"authenticity_token\" /></meta></link></head>" +
//                "<meta  name=\"csrf-token\" content=\"0Lc1YtC0JUoWUpbQ+yb/MU4WGhq3J3dbjOdrJ2cfq9jB/aSZhYbrbSyz01HJukTxviTVTDdw1er36M+rhKyw8Q==\" />" +
//                "<link  rel=\"shortcut icon\" type=\"image/x-icon\" href=\"https://cdn.qiita.com/assets/favicons/public/production-c620d3e403342b1022967ba5e3db1aaa.ico\" />" +
//                "<link rel=\"apple-touch-icon\" type=\"image/png\" href=\"https://cdn.qiita.com/assets/favicons/public/apple-touch-icon-ec5ba42a24ae923f16825592efdc356f.png\" />" +
//                "<link rel=\"stylesheet\" media=\"all\" href=\"https://cdn.qiita.com/assets/public/style-1766f40d5cba9699a6953f3bf6d6336d.min.css\" />";
        System.out.println(html);
        for(String tag:noneStartTagList){
            String detectNoneStartTagRegexpPattern = "(?<preCloseTag></.*?>)(?<text>.*?)(?<closeTag>(?<=</)"+tag+"(?=>))";
            System.out.println(detectNoneStartTagRegexpPattern);
            String completeNoneStartTagRegexpPattern = "${preCloseTag}<${closeTag}>${text}${closeTag}";
            Pattern p = Pattern.compile(detectNoneStartTagRegexpPattern);
            Matcher mc = p.matcher(html);
            System.out.println(completeNoneStartTagRegexpPattern);
            System.out.println("＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠");
            html = mc.replaceAll(completeNoneStartTagRegexpPattern);
            System.out.println(html);
        }
//        for(String tag:noneCloseTagList){
////            String detectNoneCloseTagRegexpPattern = "(?<startTag>(?<=<)"+tag+")(?<text>.*?)(?<endTag>/?>)";
//            String detectNoneCloseTagRegexpPattern = "(?<startTag>(?<=<)"+tag+")(?<text>.*?)(?<endTag>/?>)";
//            System.out.println(detectNoneCloseTagRegexpPattern);
//            String completeNoneCloseTagRegexpPattern = "${startTag} ${text}></${startTag}>";
//            Pattern p = Pattern.compile(detectNoneCloseTagRegexpPattern);
//            Matcher mc = p.matcher(html);
//            System.out.println(mc.matches());
//            System.out.println("＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠");
//            html = mc.replaceAll(completeNoneCloseTagRegexpPattern);
//            System.out.println(html);
////            System.out.println(detectNoneCloseTagRegexpPattern);
////            System.out.println(completeNoneCloseTagRegexpPattern);
//        }
    }
}