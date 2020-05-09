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

    private static final List<String> noneCloseTagList = Arrays.asList("meta","link","img");

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
    private static final String XML_HEADER = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
            "<!DOCTYPE some_name " +
                "[<!ENTITY " +
                        "nbsp \"&#160;\"" + //https://stackoverflow.com/questions/13012327/error-parsing-page-xhtml-error-tracedline-42-the-entity-nbsp-was-referenc
                ">]" +
            ">\n"
            ;

    @Override
    public void visit(Page page) {
        String url = page.getWebURL().getURL();
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
                    .replace("data-no-instant","data-no-instant=\"true\"")//dev.to個別対応
                    .replace("data-reaction-count","data-reaction-count=\"0\"") //dev.to個別対応
            ;

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