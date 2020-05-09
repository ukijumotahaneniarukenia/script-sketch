package app;

import edu.uci.ics.crawler4j.crawler.Page;
import edu.uci.ics.crawler4j.crawler.WebCrawler;
import edu.uci.ics.crawler4j.parser.HtmlParseData;
import edu.uci.ics.crawler4j.url.WebURL;
import org.dom4j.Document;
import org.dom4j.dom.DOMDocument;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static app.App.APP_CONFIG;

//個人的に単一ファイルですべて終わらせたくてAppクラスにstaticクラスとして置いておきたかったけど、呼出側の引数エラーになったので、分けた。無念。

public class MyCrawler extends WebCrawler {
    private AppConfig appConfig = APP_CONFIG;

    private static Document strToDom(String html) throws ParserConfigurationException, SAXException, IOException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        return (Document) builder.parse(new ByteArrayInputStream(html.getBytes("UTF-8")));
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
        String html = htmlParseData.getHtml();

        System.out.println(html);

//        strToDom()を呼ぶ前に前処理が必要そう
        //$echo '<meta charset="utf-8" />' | perl -nlE 's;(\<meta)(.+)(/>);<meta \2></meta>;g and say'

//[Fatal Error] :88:11: The element type "meta" must be terminated by the matching end-tag "</meta>".
//                org.xml.sax.SAXParseException; lineNumber: 88; columnNumber: 11; The element type "meta" must be terminated by the matching end-tag "</meta>".
//                at org.apache.xerces.parsers.DOMParser.parse(Unknown Source)
//        at org.apache.xerces.jaxp.DocumentBuilderImpl.parse(Unknown Source)
//        at java.xml/javax.xml.parsers.DocumentBuilder.parse(DocumentBuilder.java:122)
//        at app.MyCrawler.strToDom(MyCrawler.java:30)
//        at app.MyCrawler.visit(MyCrawler.java:49)
//        at edu.uci.ics.crawler4j.crawler.WebCrawler.processPage(WebCrawler.java:403)
//        at edu.uci.ics.crawler4j.crawler.WebCrawler.run(WebCrawler.java:261)
//        at java.base/java.lang.Thread.run(Thread.java:834)


//        try {
//            Document doc = strToDom(html);
//
//            System.out.println(doc);
//
//
//
//        } catch (ParserConfigurationException e) {
//            e.printStackTrace();
//        } catch (SAXException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
}