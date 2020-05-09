package app;

import edu.uci.ics.crawler4j.crawler.CrawlConfig;
import edu.uci.ics.crawler4j.crawler.CrawlController;
import edu.uci.ics.crawler4j.fetcher.PageFetcher;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtConfig;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtServer;

public class App{

    private static final Integer REQUEST_TIME_INTERVAL=10000;  // 10秒ごとにリクエスト

    private static final Integer THREAD_CNT = 1;

    private static final String DEFAULT_CACHE_DIR = "/home/kuraine/cache";

    private static final String DEFAULT_IGNORE_SUFFIX_REGEXP_PATTERN = ".*(\\.(css|js|gif|jpg|png|mp3|mp3|zip|gz))$";

    //単一設定のみハンドリングできる模様 呼出側のシェルで複数件対応する
    public static final AppConfig APP_CONFIG = new AppConfig(
            "https://ukijumotahaneniarukenia.site/"
            ,DEFAULT_IGNORE_SUFFIX_REGEXP_PATTERN
            ,DEFAULT_CACHE_DIR
    );

    public static void main(String[] args) throws Exception {
        CrawlController controller = setCrawlConfig(APP_CONFIG);
        System.out.println("Start Crawler");
        controller.start(MyCrawler.class, THREAD_CNT);
    }

    private static CrawlController setCrawlConfig(AppConfig appConfig) throws Exception {
        CrawlConfig config = new CrawlConfig();
        config.setCrawlStorageFolder(appConfig.getCacheDirMap()); //クロール結果を格納するディレクトリ
        config.setPolitenessDelay(REQUEST_TIME_INTERVAL);

        PageFetcher pageFetcher = new PageFetcher(config);
        RobotstxtConfig robotstxtConfig = new RobotstxtConfig();
        RobotstxtServer robotstxtServer = new RobotstxtServer(robotstxtConfig, pageFetcher);
        CrawlController controller = new CrawlController(config, pageFetcher, robotstxtServer);
        controller.addSeed(appConfig.getBaseUrl()); //クロール対象のURLを設定
        return controller;
    }
}