package app;

import edu.uci.ics.crawler4j.crawler.Page;
import edu.uci.ics.crawler4j.crawler.WebCrawler;
import edu.uci.ics.crawler4j.parser.HtmlParseData;
import edu.uci.ics.crawler4j.url.WebURL;
import org.dom4j.Document;
import org.jsoup.Jsoup;
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
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static app.App.APP_CONFIG;

// リンタなどでもチェックしてみると xmllint --format test-done.html
// $xmllint --format test-done.html >test-done-done.html 整形
// $xmllint --xpath /html/head/meta test-done-done.html Xpath式検索
//[Fatal Error] :88:11: The element type "meta" must be terminated by the matching end-tag "</meta>".
//[Fatal Error] :5:346: The element type "link" must be terminated by the matching end-tag "</link>".
//[Fatal Error] :1:530: The element type "head" must be terminated by the matching end-tag "</head>".
//[Fatal Error] :1:31: The markup in the document following the root element must be well-formed.

public class MyCrawler extends WebCrawler {
    private AppConfig appConfig = APP_CONFIG;

    private static final List<String> noneCloseTagList = Arrays.asList("meta","link");

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
                .replace("<!DOCTYPE html>","<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
                ;

        try {
            FileWriter fw = new FileWriter("test.html");
            fw.write(html);
            fw.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        for(String tag:noneCloseTagList){
            String detectNoneCloseTagRegexpPattern = "(?<startTag>(?<=<)"+tag+")(?<text>.*?)(?<endTag>/?>)";
            String completeNoneCloseTagRegexpPattern = "${startTag} ${text}></${startTag}>";
            Pattern p = Pattern.compile(detectNoneCloseTagRegexpPattern);
            Matcher mc = p.matcher(html);
            html = mc.replaceAll(completeNoneCloseTagRegexpPattern);
        }

        try {
            FileWriter fw = new FileWriter("test-done.html");
            fw.write(html);
            fw.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        Path file = Paths.get("test-done.html");
        try {
            String doneHtml = Files.readString(file);
            Document doc = strToDom(doneHtml);

        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}