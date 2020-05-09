package app;

import edu.uci.ics.crawler4j.crawler.CrawlConfig;
import edu.uci.ics.crawler4j.crawler.CrawlController;
import edu.uci.ics.crawler4j.fetcher.PageFetcher;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtConfig;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtServer;

//Usage:
//kuraine docker-container-centos-7-6-18-10-java-gradle-idea ~/script-sketch/java/00061-java-単一実行クローラ/nnn$gradle build
//
//        BUILD SUCCESSFUL in 0s
//        2 actionable tasks: 2 executed
//kuraine docker-container-centos-7-6-18-10-java-gradle-idea ~/script-sketch/java/00061-java-単一実行クローラ/nnn$java -cp "$HOME/script-sketch/java/00061-java-単一実行クローラ/nnn/build/libs/nnn-1.0-SNAPSHOT.jar:$(find $HOME/.gradle/caches/modules-2/files-2.1 -name "*jar"|xargs|tr ' ' ':')" app/App | grep -v DEBUG
//        SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
//        SLF4J: Defaulting to no-operation (NOP) logger implementation
//        SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
//        Start Crawler
//        ＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠
//        ^C
public class App{

    private static final Integer REQUEST_TIME_INTERVAL=10000;  // 10秒ごとにリクエスト

    private static final Integer THREAD_CNT = 1;

    private static final String DEFAULT_CACHE_DIR = "/home/kuraine/cache";

    private static final String DEFAULT_IGNORE_SUFFIX_REGEXP_PATTERN = ".*(\\.(css|js|gif|jpg|png|mp3|mp3|zip|gz))$";

    //単一設定のみハンドリングできる模様 呼出側のシェルで複数件対応する
    public static final AppConfig APP_CONFIG = new AppConfig(
            "https://dev.to/t/python"
            ,DEFAULT_IGNORE_SUFFIX_REGEXP_PATTERN
            ,DEFAULT_CACHE_DIR
    );

//    //単一設定のみハンドリングできる模様 呼出側のシェルで複数件対応する
//    public static final AppConfig APP_CONFIG = new AppConfig(
//            "https://qiita.com/ukijumotahaneniarukenia"
//            ,DEFAULT_IGNORE_SUFFIX_REGEXP_PATTERN
//            ,DEFAULT_CACHE_DIR
//    );

    //単一設定のみハンドリングできる模様 呼出側のシェルで複数件対応する
//    public static final AppConfig APP_CONFIG = new AppConfig(
//            "https://ukijumotahaneniarukenia.site/"
//            ,DEFAULT_IGNORE_SUFFIX_REGEXP_PATTERN
//            ,DEFAULT_CACHE_DIR
//    );

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