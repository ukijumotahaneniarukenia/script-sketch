import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class App {
    public static void main(String[] args) {

        List<String> noneCloseTagList = Arrays.asList("meta","div","link");

        List<String> noneStartTagList = Arrays.asList("option");

        List<String> incorrectPairTagList = Arrays.asList("option","div");

        String html = "<div class=\"position-relative\">    </option><option class=\"position-relative\">    </option><option class=\"position-relative\">    </div>"; //開始タグの開始忘れ

//        String html = "<div class=\"position-relative\">    </option>"; //タグの不一致 -->"<div class=\"position-relative\">    </div>"
//        String html = "<div  class=\"position-relative\"></div>    </option>"; //開始タグの開始忘れ -->"<div  class=\"position-relative\"></div><option>    </option>"
//        String html = "<div id=\"body-styles\"></div>";// 変化しないことを確認
//        String html = "<meta charset=\"utf-8\" />"; //閉じタグの忘れ
//        String html = "<meta  charset=\"utf-8\" /><title>ukijumotahaneniarukenia - Qiita</title><meta content=\"width=device-width,initial-scale=1,shrink-to-fit=no\" name=\"viewport\" />"; //閉じタグの忘れ
//        String html = "<link  href=\"/manifest.json\" rel=\"manifest\" />"; //閉じタグの忘れ

        System.out.println(html);
//
//        //開始タグの補完
        for(String tag:noneStartTagList){
            String detectNoneStartTagRegexpPattern = "(?<preCloseTag></.*?>)(?<text>.*?)(?<closeTag>(?<=</)"+tag+"(?=>))";
            String completeNoneStartTagRegexpPattern = "${preCloseTag}<${closeTag}>${text}${closeTag}";
            Pattern p = Pattern.compile(detectNoneStartTagRegexpPattern);
            Matcher mc = p.matcher(html);
            while (mc.find()){
                if(mc.group("text").matches("[^<>]*</$")){
                    //以下を区別している

//                    text	    </
//                    text	<option class="position-relative">    </

                    html = mc.replaceAll(completeNoneStartTagRegexpPattern);
                }else{

                }
            }
        }

        System.out.println(html);

        //閉じタグの補完
        for(String tag:noneCloseTagList){
            String detectNoneCloseTagRegexpPattern = "(?<startTag>(?<=<)"+tag+")(?<text>.*?)(?<endTag>/?>)";
            String completeNoneCloseTagRegexpPattern = "${startTag} ${text}></${startTag}>";
            Pattern p = Pattern.compile(detectNoneCloseTagRegexpPattern);
            Matcher mc = p.matcher(html);
            while(mc.find()){
                if(mc.group("endTag").equals("/>")){
                    html = mc.replaceAll(completeNoneCloseTagRegexpPattern);
                }else{
                    //閉じ忘れていないので、なにもしない
                }
            }
        }

        System.out.println(html);
        //タグの不一致
        for(String tag : incorrectPairTagList){
            String detectIncorrectPairTagRegexpPattern = "(?<startTag>(?<=<)"+tag+")(?<text>.*?)(?<closeTag>(?<=</).*?(?=>))";
            Pattern p = Pattern.compile(detectIncorrectPairTagRegexpPattern);
            Matcher mc = p.matcher(html);
            String completeIncorrectPairTagRegexpPattern = "${startTag}${text}${startTag}";
            while(mc.find()){
                if(mc.group("startTag").equals(mc.group("closeTag"))){

                }else{
                    html = mc.replaceAll(completeIncorrectPairTagRegexpPattern);
                }
            }
        }
        System.out.println(html);

    }
}