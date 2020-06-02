package app;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;

public class App {
    public static void main(String[] cmdline_args) {
        String url = "https://ukijumotahaneniarukenia.site";
        String selector = "a";
        try {
            Document doc = Jsoup.connect(url).get();
            System.out.printf("%s\n",doc.title());
            Elements newsHeadlines = doc.select(selector);
            for (Element headline : newsHeadlines) {
                System.out.printf("%s\t%s\n",headline.attr("title"), headline.absUrl("href"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}