import java.util.regex.Matcher;
import java.util.regex.Pattern;

//$echo '<meta charset="utf-8" />' | perl -nlE 's;(\<meta)(.+)(/>);<meta \2></meta>;g and say'
//<meta  charset="utf-8" ></meta>

//Output
//(?<startTag><meta)(?<text>.+)(?<endTag>/>)
//true
//<meta charset="utf-8" />
//<meta  charset="utf-8" ></meta>

public class App {
    public static void main(String[] args) {
        Pattern p = Pattern.compile("(?<startTag><meta)(?<text>.+)(?<endTag>/>)");
        String s = "<meta charset=\"utf-8\" />";
        Matcher mc = p.matcher(s);

        System.out.println(p);

        System.out.println(mc.find());

        System.out.println(mc.group());

        String done = mc.replaceAll("${startTag} ${text}></meta>");

        System.out.println(done);

    }
}
