package app;

import edu.uci.ics.crawler4j.crawler.Page;
import edu.uci.ics.crawler4j.crawler.WebCrawler;
import edu.uci.ics.crawler4j.parser.HtmlParseData;
import edu.uci.ics.crawler4j.url.WebURL;

import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static app.App.APP_CONFIG;

//個人的に単一ファイルですべて終わらせたくてAppクラスにstaticクラスとして置いておきたかったけど、呼出側の引数エラーになったので、分けた。無念。

public class MyCrawler extends WebCrawler {
    private AppConfig appConfig = APP_CONFIG;

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
        System.out.println(url);
        HtmlParseData htmlParseData = (HtmlParseData) page.getParseData();
        System.out.println(htmlParseData.getMetaTags()); //{viewport=width=device-width, initial-scale=1, dc:title=ukijumotahaneniarukenia – Just another WordPress site, content-encoding=UTF-8, generator=WordPress 5.0.9, content-type=text/html; charset=UTF-8}

        System.out.println(htmlParseData.getOutgoingUrls()); //[https://ukijumotahaneniarukenia.site/page/2/, https://github.com/ukijumotahaneniarukenia, https://ukijumotahaneniarukenia.site/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fukijumotahaneniarukenia.site%2F, https://ukijumotahaneniarukenia.site/2019/07/05/sed-%e8%a4%87%e6%95%b0%e8%a1%8c%e3%82%921%e8%a1%8c%e3%81%ab%e7%bd%ae%e6%8f%9b%e3%81%99%e3%82%8b%e8%a9%b1/, https://ukijumotahaneniarukenia.site/feed/, https://qiita.com/ukijumotahaneniarukenia, https://ukijumotahaneniarukenia.site/xmlrpc.php, https://ukijumotahaneniarukenia.site/author/ukijumotahaneniarukenia/, https://ukijumotahaneniarukenia.site/page/12/, https://ukijumotahaneniarukenia.site/page/6/, https://ukijumotahaneniarukenia.site/category/%e6%9c%aa%e5%88%86%e9%a1%9e/, https://ukijumotahaneniarukenia.site/2019/07/14/generate-script-awk%e3%81%aa%e3%82%8b%e3%82%82%e3%81%ae%e3%82%92%e8%aa%ad%e3%82%93%e3%81%a7%e6%80%9d%e3%81%a3%e3%81%9f%e6%89%80%e6%84%9f/, https://ukijumotahaneniarukenia.site/page/16/, https://ukijumotahaneniarukenia.site/sample-page/feed/, https://ukijumotahaneniarukenia.site/page/3/, https://ukijumotahaneniarukenia.site/category/bash/, https://ukijumotahaneniarukenia.site/wp-content/plugins/easy-fancybox/css/jquery.fancybox.min.css?ver=1.3.24, https://ukijumotahaneniarukenia.site/wp-content/plugins/ank-prism-for-wp/out/prism-css.min.css?ver=1549083539, https://ukijumotahaneniarukenia.site/wp-content/uploads/2019/02/profile.png, https://ukijumotahaneniarukenia.site/xmlrpc.php?rsd, https://ukijumotahaneniarukenia.site/page/11/, https://ukijumotahaneniarukenia.site/wp-content/themes/twentysixteen/css/blocks.css?ver=20181018, https://ukijumotahaneniarukenia.site/wp-content/themes/twentysixteen/style.css?ver=5.0.9, https://use.fontawesome.com/releases/v5.7.1/css/all.css, https://fonts.googleapis.com/, https://ukijumotahaneniarukenia.site/wp-includes/css/dist/block-library/style.min.css?ver=5.0.9, https://ukijumotahaneniarukenia.site/wp-includes/wlwmanifest.xml, https://ukijumotahaneniarukenia.site/wp-content/uploads/2018/12/cropped-malibu-nights-michael-frey-e1549636691863.jpg, https://ukijumotahaneniarukenia.site/page/15/, https://ukijumotahaneniarukenia.site/page/7/, https://ukijumotahaneniarukenia.site/wp-content/plugins/the-post-grid/assets/css/thepostgrid.css?ver=2.2.72, https://ukijumotahaneniarukenia.site/category/r/, https://ukijumotahaneniarukenia.site/page/4/, https://ukijumotahaneniarukenia.site/wp-content/plugins/add-to-any/addtoany.min.css?ver=1.15, https://ukijumotahaneniarukenia.site/2019/07/15/qiita%e3%81%ae%e3%82%b9%e3%83%88%e3%83%83%e3%82%af%e8%a8%98%e4%ba%8b%e3%81%8c500%e4%bb%b6%e3%81%a0%e3%81%a3%e3%81%9f/, https://fonts.googleapis.com/css?family=Merriweather%3A400%2C700%2C900%2C400italic%2C700italic%2C900italic%7CMontserrat%3A400%2C700%7CInconsolata%3A400&subset=latin%2Clatin-ext, https://ukijumotahaneniarukenia.site/2019/07/05/sed-%e4%b8%80%e6%96%87%e5%ad%97%e3%81%9a%e3%81%a4%e5%88%87%e3%82%8a%e5%8f%96%e3%81%a3%e3%81%a6%e5%be%8c%e3%82%8d%e3%81%ab%e3%81%8f%e3%81%a3%e4%bb%98%e3%81%91%e3%82%8b%e8%a9%b1/, https://ukijumotahaneniarukenia.site/wp-content/plugins/table-of-contents-plus/screen.min.css?ver=1509, https://ukijumotahaneniarukenia.site/2020/04/30/javalang%e3%81%ae%e7%89%b9%e5%ae%9a%e3%81%ae%e3%82%af%e3%83%a9%e3%82%b9%e3%81%8b%e3%82%89%e3%83%a1%e3%82%bf%e6%83%85%e5%a0%b1%e3%82%92%e3%82%af%e3%83%ad%e3%82%b9%e3%83%86%e3%83%bc%e3%83%96%e3%83%ab/, https://ukijumotahaneniarukenia.site/category/python/, https://ukijumotahaneniarukenia.site/page/10/, https://ukijumotahaneniarukenia.site/page/18/, https://ukijumotahaneniarukenia.site/page/14/, http://gmpg.org/xfn/11, https://ukijumotahaneniarukenia.site/2019/07/05/sed-%e3%83%87%e3%82%bf%e3%83%a9%e3%83%a1%e3%81%aa%e8%a4%87%e6%95%b0%e8%a1%8c%e3%82%92%e5%b0%8f%e7%b6%ba%e9%ba%97%e3%81%aa%e4%b8%80%e8%a1%8c%e3%81%ab%e5%a4%89%e6%8f%9b%e3%81%99%e3%82%8b%e8%a9%b1/, https://ukijumotahaneniarukenia.site/category/awk/, https://ukijumotahaneniarukenia.site/page/8/, https://ukijumotahaneniarukenia.site/wp-content/plugins/count-per-day/counter.css, https://ukijumotahaneniarukenia.site/2019/07/23/r%e8%a8%80%e8%aa%9e%e3%82%a4%e3%83%b3%e3%82%b9%e3%83%88%e3%83%bc%e3%83%ab-centos7/, https://ukijumotahaneniarukenia.site/2019/07/11/bash%e3%81%ae%e9%85%8d%e5%88%97%e3%81%a7%e3%81%82%e3%81%9d%e3%82%93%e3%81%a0/, https://ukijumotahaneniarukenia.site/wp-json/, https://ukijumotahaneniarukenia.site/comments/feed/, https://ukijumotahaneniarukenia.site/category/sed/, https://wordpress.org/, https://ukijumotahaneniarukenia.site/wp-content/themes/child-theme/style.css?ver=5.0.9, https://ukijumotahaneniarukenia.site/wp-json/oembed/1.0/embed?format=xml&url=https%3A%2F%2Fukijumotahaneniarukenia.site%2F, https://s.w.org/, https://ukijumotahaneniarukenia.site/page/13/, https://ukijumotahaneniarukenia.site/wp-includes/css/dist/block-library/theme.min.css?ver=5.0.9, https://ukijumotahaneniarukenia.site/page/9/, https://ukijumotahaneniarukenia.site/wp-content/themes/twentysixteen/genericons/genericons.css?ver=3.4.1, https://ukijumotahaneniarukenia.site/2019/07/23/python-install/, https://ukijumotahaneniarukenia.site/, https://ukijumotahaneniarukenia.site/page/5/, https://ukijumotahaneniarukenia.site/page/17/]

//        String html = htmlParseData.getHtml();
//        System.out.println(html);
    }
}