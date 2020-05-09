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

        Document doc = new DOMDocument();


//        Elements elements = doc.select(appConfig.getCssSelector());
//
//        for(Element e : elements){
//            System.out.printf("%s\t%s\n",e.attr("href"),e.text());
    }
}