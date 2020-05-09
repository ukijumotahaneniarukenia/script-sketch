package app;

import edu.uci.ics.crawler4j.crawler.Page;
import edu.uci.ics.crawler4j.crawler.WebCrawler;
import edu.uci.ics.crawler4j.parser.HtmlParseData;
import edu.uci.ics.crawler4j.url.WebURL;
import org.dom4j.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.ByteArrayInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static app.App.APP_CONFIG;

public class MyCrawler extends WebCrawler {
    private AppConfig appConfig = APP_CONFIG;

    private static final String SUFFIX = ".xml";

    private static final String GITHUB_COM = "github.com";
    private static final String DEV_TO = "dev.to";

//    private static final List<String> noneCloseTagList = Arrays.asList("meta","link","img"); //dev.toはいける
    private static final List<String> noneCloseTagList = Arrays.asList("meta","link","img","div");
//    private static final List<String> noneCloseTagList = Arrays.asList("meta","link","img","div","header");

    private static Document strToDom(String html) throws ParserConfigurationException, SAXException, IOException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        return (Document) builder.parse(new ByteArrayInputStream(html.getBytes(StandardCharsets.UTF_8)));
    }

    @Override
    public boolean shouldVisit(Page page, WebURL url) {
        String hrefUrl = url.getURL().toLowerCase();//拡張子マッチさせるため小文字に変換
        //無視するURLではなく、かつベースURLを含む場合を取得条件とする
        return !Pattern.compile(appConfig.getIgnoreSuffixMap()).matcher(hrefUrl).matches() && hrefUrl.contains(appConfig.getBaseUrl());
    }

    //https://coderanch.com/t/435548/java/entity-nbsp-referenced-declared
    //スペース以外は宣言しない

    //ここに一覧乗ってた
    //http://help.dottoro.com/lausooxp.php
    //ここにも
    //https://qiita.com/inabe49/items/303afa114b0204da8a24
    //http://www.htmq.com/text/
    //https://stackoverflow.com/questions/13012327/error-parsing-page-xhtml-error-tracedline-42-the-entity-nbsp-was-referenc
    //http://blog.tojiru.net/article/247824770.html
    private static final String XML_HEADER = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
            "<!DOCTYPE html " +
                "[" +
                    "<!ENTITY AElig \"&#198;\" >" +
                    "<!ENTITY Aacute \"&#193;\" >" +
                    "<!ENTITY Acirc \"&#194;\" >" +
                    "<!ENTITY Agrave \"&#192;\" >" +
                    "<!ENTITY Alpha \"&#913;\" >" +
                    "<!ENTITY Aring \"&#197;\" >" +
                    "<!ENTITY Atilde \"&#195;\" >" +
                    "<!ENTITY Auml \"&#196;\" >" +
                    "<!ENTITY Beta \"&#914;\" >" +
                    "<!ENTITY Ccedil \"&#199;\" >" +
                    "<!ENTITY Chi \"&#935;\" >" +
                    "<!ENTITY Dagger \"&#8225;\" >" +
                    "<!ENTITY Delta \"&#916;\" >" +
                    "<!ENTITY ETH \"&#208;\" >" +
                    "<!ENTITY Eacute \"&#201;\" >" +
                    "<!ENTITY Ecirc \"&#202;\" >" +
                    "<!ENTITY Egrave \"&#200;\" >" +
                    "<!ENTITY Epsilon \"&#917;\" >" +
                    "<!ENTITY Eta \"&#919;\" >" +
                    "<!ENTITY Euml \"&#203;\" >" +
                    "<!ENTITY Gamma \"&#915;\" >" +
                    "<!ENTITY Iacute \"&#205;\" >" +
                    "<!ENTITY Icirc \"&#206;\" >" +
                    "<!ENTITY Igrave \"&#204;\" >" +
                    "<!ENTITY Iota \"&#921;\" >" +
                    "<!ENTITY Iuml \"&#207;\" >" +
                    "<!ENTITY Kappa \"&#922;\" >" +
                    "<!ENTITY Lambda \"&#923;\" >" +
                    "<!ENTITY Mu \"&#924;\" >" +
                    "<!ENTITY Ntilde \"&#209;\" >" +
                    "<!ENTITY Nu \"&#925;\" >" +
                    "<!ENTITY OElig \"&#338;\" >" +
                    "<!ENTITY Oacute \"&#211;\" >" +
                    "<!ENTITY Ocirc \"&#212;\" >" +
                    "<!ENTITY Ograve \"&#210;\" >" +
                    "<!ENTITY Omega \"&#937;\" >" +
                    "<!ENTITY Omicron \"&#927;\" >" +
                    "<!ENTITY Oslash \"&#216;\" >" +
                    "<!ENTITY Otilde \"&#213;\" >" +
                    "<!ENTITY Ouml \"&#214;\" >" +
                    "<!ENTITY Phi \"&#934;\" >" +
                    "<!ENTITY Pi \"&#928;\" >" +
                    "<!ENTITY Prime \"&#8243;\" >" +
                    "<!ENTITY Psi \"&#936;\" >" +
                    "<!ENTITY Rho \"&#929;\" >" +
                    "<!ENTITY Scaron \"&#352;\" >" +
                    "<!ENTITY Sigma \"&#931;\" >" +
                    "<!ENTITY THORN \"&#222;\" >" +
                    "<!ENTITY Tau \"&#932;\" >" +
                    "<!ENTITY Theta \"&#920;\" >" +
                    "<!ENTITY Uacute \"&#218;\" >" +
                    "<!ENTITY Ucirc \"&#219;\" >" +
                    "<!ENTITY Ugrave \"&#217;\" >" +
                    "<!ENTITY Upsilon \"&#933;\" >" +
                    "<!ENTITY Uuml \"&#220;\" >" +
                    "<!ENTITY Xi \"&#926;\" >" +
                    "<!ENTITY Yacute \"&#221;\" >" +
                    "<!ENTITY Yuml \"&#376;\" >" +
                    "<!ENTITY Zeta \"&#918;\" >" +
                    "<!ENTITY aacute \"&#225;\" >" +
                    "<!ENTITY acirc \"&#226;\" >" +
                    "<!ENTITY acute \"&#180;\" >" +
                    "<!ENTITY aelig \"&#230;\" >" +
                    "<!ENTITY agrave \"&#224;\" >" +
                    "<!ENTITY alefsym \"&#8501;\" >" +
                    "<!ENTITY alpha \"&#945;\" >" +
                    "<!ENTITY amp \"&#38;\" >" +
                    "<!ENTITY and \"&#8743;\" >" +
                    "<!ENTITY ang \"&#8736;\" >" +
                    "<!ENTITY aring \"&#229;\" >" +
                    "<!ENTITY asymp \"&#8776;\" >" +
                    "<!ENTITY atilde \"&#227;\" >" +
                    "<!ENTITY auml \"&#228;\" >" +
                    "<!ENTITY bdquo \"&#8222;\" >" +
                    "<!ENTITY beta \"&#946;\" >" +
                    "<!ENTITY brvbar \"&#166;\" >" +
                    "<!ENTITY bull \"&#8226;\" >" +
                    "<!ENTITY cap \"&#8745;\" >" +
                    "<!ENTITY ccedil \"&#231;\" >" +
                    "<!ENTITY cedil \"&#184;\" >" +
                    "<!ENTITY cent \"&#162;\" >" +
                    "<!ENTITY chi \"&#967;\" >" +
                    "<!ENTITY circ \"&#710;\" >" +
                    "<!ENTITY clubs \"&#9827;\" >" +
                    "<!ENTITY cong \"&#8773;\" >" +
                    "<!ENTITY copy \"&#169;\" >" +
                    "<!ENTITY crarr \"&#8629;\" >" +
                    "<!ENTITY cup \"&#8746;\" >" +
                    "<!ENTITY curren \"&#164;\" >" +
                    "<!ENTITY dArr \"&#8659;\" >" +
                    "<!ENTITY dagger \"&#8224;\" >" +
                    "<!ENTITY darr \"&#8595;\" >" +
                    "<!ENTITY deg \"&#176;\" >" +
                    "<!ENTITY delta \"&#948;\" >" +
                    "<!ENTITY diams \"&#9830;\" >" +
                    "<!ENTITY divide \"&#247;\" >" +
                    "<!ENTITY eacute \"&#233;\" >" +
                    "<!ENTITY ecirc \"&#234;\" >" +
                    "<!ENTITY egrave \"&#232;\" >" +
                    "<!ENTITY empty \"&#8709;\" >" +
                    "<!ENTITY emsp \"&#8195;\" >" +
                    "<!ENTITY ensp \"&#8194;\" >" +
                    "<!ENTITY epsilon \"&#949;\" >" +
                    "<!ENTITY equiv \"&#8801;\" >" +
                    "<!ENTITY eta \"&#951;\" >" +
                    "<!ENTITY eth \"&#240;\" >" +
                    "<!ENTITY euml \"&#235;\" >" +
                    "<!ENTITY euro \"&#8364;\" >" +
                    "<!ENTITY exist \"&#8707;\" >" +
                    "<!ENTITY fnof \"&#402;\" >" +
                    "<!ENTITY forall \"&#8704;\" >" +
                    "<!ENTITY frac12 \"&#189;\" >" +
                    "<!ENTITY frac14 \"&#188;\" >" +
                    "<!ENTITY frac34 \"&#190;\" >" +
                    "<!ENTITY frasl \"&#8260;\" >" +
                    "<!ENTITY gamma \"&#947;\" >" +
                    "<!ENTITY ge \"&#8805;\" >" +
                    "<!ENTITY gt \"&#62;\" >" +
                    "<!ENTITY hArr \"&#8660;\" >" +
                    "<!ENTITY harr \"&#8596;\" >" +
                    "<!ENTITY hearts \"&#9829;\" >" +
                    "<!ENTITY hellip \"&#8230;\" >" +
                    "<!ENTITY iacute \"&#237;\" >" +
                    "<!ENTITY icirc \"&#238;\" >" +
                    "<!ENTITY iexcl \"&#161;\" >" +
                    "<!ENTITY igrave \"&#236;\" >" +
                    "<!ENTITY image \"&#8465;\" >" +
                    "<!ENTITY infin \"&#8734;\" >" +
                    "<!ENTITY int \"&#8747;\" >" +
                    "<!ENTITY iota \"&#953;\" >" +
                    "<!ENTITY iquest \"&#191;\" >" +
                    "<!ENTITY isin \"&#8712;\" >" +
                    "<!ENTITY iuml \"&#239;\" >" +
                    "<!ENTITY kappa \"&#954;\" >" +
                    "<!ENTITY lArr \"&#8656;\" >" +
                    "<!ENTITY lambda \"&#955;\" >" +
                    "<!ENTITY lang \"&#9001;\" >" +
                    "<!ENTITY laquo \"&#171;\" >" +
                    "<!ENTITY larr \"&#8592;\" >" +
                    "<!ENTITY lceil \"&#8968;\" >" +
                    "<!ENTITY ldquo \"&#8220;\" >" +
                    "<!ENTITY le \"&#8804;\" >" +
                    "<!ENTITY lfloor \"&#8970;\" >" +
                    "<!ENTITY lowast \"&#8727;\" >" +
                    "<!ENTITY loz \"&#9674;\" >" +
                    "<!ENTITY lrm \"&#8206;\" >" +
                    "<!ENTITY lsaquo \"&#8249;\" >" +
                    "<!ENTITY lsquo \"&#8216;\" >" +
                    "<!ENTITY lt \"&#60;\" >" +
                    "<!ENTITY macr \"&#175;\" >" +
                    "<!ENTITY mdash \"&#8212;\" >" +
                    "<!ENTITY micro \"&#181;\" >" +
                    "<!ENTITY middot \"&#183;\" >" +
                    "<!ENTITY minus \"&#8722;\" >" +
                    "<!ENTITY mu \"&#956;\" >" +
                    "<!ENTITY nabla \"&#8711;\" >" +
                    "<!ENTITY nbsp \"&#160;\" >" +
                    "<!ENTITY ndash \"&#8211;\" >" +
                    "<!ENTITY ne \"&#8800;\" >" +
                    "<!ENTITY ni \"&#8715;\" >" +
                    "<!ENTITY not \"&#172;\" >" +
                    "<!ENTITY notin \"&#8713;\" >" +
                    "<!ENTITY nsub \"&#8836;\" >" +
                    "<!ENTITY ntilde \"&#241;\" >" +
                    "<!ENTITY nu \"&#957;\" >" +
                    "<!ENTITY oacute \"&#243;\" >" +
                    "<!ENTITY ocirc \"&#244;\" >" +
                    "<!ENTITY oelig \"&#339;\" >" +
                    "<!ENTITY ograve \"&#242;\" >" +
                    "<!ENTITY oline \"&#8254;\" >" +
                    "<!ENTITY omega \"&#969;\" >" +
                    "<!ENTITY omicron \"&#959;\" >" +
                    "<!ENTITY oplus \"&#8853;\" >" +
                    "<!ENTITY or \"&#8744;\" >" +
                    "<!ENTITY ordf \"&#170;\" >" +
                    "<!ENTITY ordm \"&#186;\" >" +
                    "<!ENTITY oslash \"&#248;\" >" +
                    "<!ENTITY otilde \"&#245;\" >" +
                    "<!ENTITY otimes \"&#8855;\" >" +
                    "<!ENTITY ouml \"&#246;\" >" +
                    "<!ENTITY para \"&#182;\" >" +
                    "<!ENTITY part \"&#8706;\" >" +
                    "<!ENTITY permil \"&#8240;\" >" +
                    "<!ENTITY perp \"&#8869;\" >" +
                    "<!ENTITY phi \"&#966;\" >" +
                    "<!ENTITY pi \"&#960;\" >" +
                    "<!ENTITY piv \"&#982;\" >" +
                    "<!ENTITY plusmn \"&#177;\" >" +
                    "<!ENTITY pound \"&#163;\" >" +
                    "<!ENTITY prime \"&#8242;\" >" +
                    "<!ENTITY prod \"&#8719;\" >" +
                    "<!ENTITY prop \"&#8733;\" >" +
                    "<!ENTITY psi \"&#968;\" >" +
                    "<!ENTITY quot \"&#34;\" >" +
                    "<!ENTITY rArr \"&#8658;\" >" +
                    "<!ENTITY radic \"&#8730;\" >" +
                    "<!ENTITY rang \"&#9002;\" >" +
                    "<!ENTITY raquo \"&#187;\" >" +
                    "<!ENTITY rarr \"&#8594;\" >" +
                    "<!ENTITY rceil \"&#8969;\" >" +
                "]" +
            ">\n";

    private static final Map<String,Map<Pattern,String>> irregularCloseTagRegexpPattern = new LinkedHashMap<>(){{
        put(GITHUB_COM,new HashMap<>(){{
            put(Pattern.compile("data-pjax-transient(?!=\"true\")"),"data-pjax-transient=\"true\"");
        }});
        put(DEV_TO,new HashMap<>(){{
            put(Pattern.compile("data-no-instant(?!=\"true\")"),"data-no-instant=\"true\"");
            put(Pattern.compile("data-reaction-count(?!=\"0\")"),"data-reaction-count=\"0\"");
        }});
    }};

    @Override
    public void visit(Page page) {
        String url = page.getWebURL().getURL();
        System.out.println(url);
        System.out.println(Stream.generate(()->"＠").limit(100).collect(Collectors.joining()));
        HtmlParseData htmlParseData = (HtmlParseData) page.getParseData();
        String html = htmlParseData.getHtml()
                .replace("\n","")
                .replace("\r","")
                .replace("\r\n","")
                .replaceAll("<script.*?/script>","") //scriptタグの除去 cat test-done.html | grep -o '.' | nl | grep -C10 41285
                .replace("&raquo;","") //対象外
                .replace("&hellip;","") //対象外
                .replace("<!DOCTYPE html>",XML_HEADER) //空白の参照定義
                ;

        try {
            FileWriter fw = new FileWriter("test"+SUFFIX);
            fw.write(html);
            fw.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        //閉じタグの補完
        for(String tag:noneCloseTagList){
            String detectNoneCloseTagRegexpPattern = "(?<startTag>(?<=<)"+tag+")(?<text>.*?)(?<endTag>/?>)";
            String completeNoneCloseTagRegexpPattern = "${startTag} ${text}></${startTag}>";
            Pattern p = Pattern.compile(detectNoneCloseTagRegexpPattern);
            Matcher mc = p.matcher(html);
            html = mc.replaceAll(completeNoneCloseTagRegexpPattern);
        }

        try {
            FileWriter fw = new FileWriter("test-done"+SUFFIX);
            fw.write(html);
            fw.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        Path file = Paths.get("test-done"+SUFFIX);
        try {
            //属性名単一を属性名=属性値の形式に正規化
            String doneHtml = Files.readString(file)
//                    .replace("data-no-instant","data-no-instant=\"true\"")//dev.to個別対応
//                    .replace("data-reaction-count","data-reaction-count=\"0\"") //dev.to個別対応
//                    .replace("data-pjax-transient","data-pjax-transient=\"true\"") //github個別対応
            ;

            for(Map.Entry<String,Map<Pattern,String>> entry : irregularCloseTagRegexpPattern.entrySet()){
                if(url.contains(entry.getKey())){
                    for(Map.Entry<Pattern,String> pre2post : entry.getValue().entrySet()){
                        Matcher mc = pre2post.getKey().matcher(doneHtml);
                        doneHtml = mc.replaceAll(pre2post.getValue());
                    }
                }else{
                    //URLに置換条件キーが含まれていない場合は置換しない

                }
            }



            FileWriter fw = new FileWriter("test-done-done"+SUFFIX);
            fw.write(doneHtml);
            fw.close();

            Document doc = strToDom(doneHtml); //Xpath式で攻めたいからここまでがんばっている フォーマットエラー検出できる

        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}