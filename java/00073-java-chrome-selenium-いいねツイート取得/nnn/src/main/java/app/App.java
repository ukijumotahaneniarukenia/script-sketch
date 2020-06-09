package app;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URL;
import java.util.*;
import java.util.stream.Collectors;

public class App {

    private static final String LOGIN_URL = "https://twitter.com/login";
    private static final String LOGIN_INPUT_USER_NAME_XPATH_PATTERN = "//*[@id=\"react-root\"]/div/div/div[2]/main/div/div/form/div/div[1]/label/div/div[2]/div/input";
    private static String LOGIN_INPUT_USER_NAME_VALUE = "dummy-user";
    private static final String LOGIN_INPUT_PASSWORD_XPATH_PATTERN = "//*[@id=\"react-root\"]/div/div/div[2]/main/div/div/form/div/div[2]/label/div/div[2]/div/input";
    private static String LOGIN_INPUT_PASSWORD_VALUE = "dummy-password";
    private static final String LOGIN_SUBMIT_XPATH_PATTERN = "//*[@id=\"react-root\"]/div/div/div[2]/main/div/div/form/div/div[3]/div/div/span/span";

    private static final String MY_LIKE_TWEET_URL = "https://twitter.com/P5mEm/likes";
    private static final String MY_LIKE_TWEET_CONTENTS_XPATH_PATTERN = "//body/div/div/div/div/main/div/div/div/div/div/div/div/div/div/section/div/div/div/div/div/div/div/div/article/div/div/div/div/div/div";
    private static final String MY_LIKE_TWEET_CONTENTS_LINK_XPATH_PATTERN = "//body/div/div/div/div/main/div/div/div/div/div/div/div/div/div/section/div/div/div/div/div/div/div/div/article/div/div/div/div/div/div/div/div/div/a";
//    private static final String MY_LIKE_TWEET_CONTENTS_LINK_XPATH_PATTERN = "//body/div/div/div/div/main/div/div/div/div/div/div/div/div/div/section/div/div/div/div/div/div/div/div/article/div/div/div/div/div/div/div/div/div/a[starts-with(@href, \"http://\") or starts-with(@href, \"https://\")]/@href";

    private static Integer DEFAULT_MAX_SCRAPING_CNT = 10;
    private static final Integer DEFAULT_WAIT_TIME_SECONDS = 1000;
    private static Integer DEFAULT_TIMEOUT_SECONDS = DEFAULT_WAIT_TIME_SECONDS * DEFAULT_MAX_SCRAPING_CNT;

    private static void usage(){
        System.out.println("Usage: sg 10 user_name user_password");
        System.exit(0);
    }

    public static void main( String... args ) throws InterruptedException {

        List<String> cmdLineArgs = Arrays.asList("10","REPLACE_USER_NAME","REPLACE_USER_PASSWORD"); //モック用
//        List<String> cmdLineArgs = Arrays.asList(args);

        if (cmdLineArgs.size() != 3){
            usage();
        }else{
            DEFAULT_TIMEOUT_SECONDS = DEFAULT_WAIT_TIME_SECONDS * Integer.parseInt(cmdLineArgs.get(0));
            LOGIN_INPUT_USER_NAME_VALUE = cmdLineArgs.get(1);
            LOGIN_INPUT_PASSWORD_VALUE = cmdLineArgs.get(2);
        }

        System.setProperty("webdriver.chrome.driver", "/usr/local/src/chromedriver_linux64/chromedriver");

        ChromeOptions options = new ChromeOptions();
        options.setBinary("/usr/local/src/chrome-linux/chrome");//chrome binaryまでのファイルパスを指定

        //https://stackoverflow.com/questions/50642308/webdriverexception-unknown-error-devtoolsactiveport-file-doesnt-exist-while-t
        options.addArguments("--no-sandbox"); // Bypass OS security model これだけで一応立つ

        WebDriver driver = new ChromeDriver(options);// Chromeドライバーインスタンスを作成する

        driver.get(LOGIN_URL);//引数に指定したURLにアクセス

        driver.manage().window().fullscreen(); //フルスクリーン

        Thread.sleep(5000);

        //ログイン処理
        driver.findElement(By.xpath(LOGIN_INPUT_USER_NAME_XPATH_PATTERN)).sendKeys(LOGIN_INPUT_USER_NAME_VALUE);
        driver.findElement(By.xpath(LOGIN_INPUT_PASSWORD_XPATH_PATTERN)).sendKeys(LOGIN_INPUT_PASSWORD_VALUE);
        driver.findElement(By.xpath(LOGIN_SUBMIT_XPATH_PATTERN)).click();

        driver.get(MY_LIKE_TWEET_URL);//引数に指定したURLにアクセス

        driver.manage().window().fullscreen(); //フルスクリーン

        BigDecimal scrollYAfter = BigDecimal.valueOf(-1);

        // スクロールできなくなる(スクリーン位置が同じになる)まで繰り返す
        int cnt=0;
        Set<String> rt = new LinkedHashSet<>();

        for (BigDecimal scrollYBefore = getScrollY(driver);
             (scrollYBefore != null && !scrollYBefore.equals(scrollYAfter));
             scrollYBefore = moveScrollY(driver)) {

            Thread.sleep(DEFAULT_WAIT_TIME_SECONDS); //1秒ぐらいがちょうどよい

            //対象要素のテキストを標準出力に垂れ流す（）
            int n = driver.findElements(By.xpath(MY_LIKE_TWEET_CONTENTS_XPATH_PATTERN)).size();

            //https://qiita.com/VA_nakatsu/items/0095755dc48ad7e86e2f#9-%E3%83%91%E3%82%B9%E6%8C%87%E5%AE%9A%E3%83%AA%E3%82%B9%E3%83%88%E6%A4%9C%E7%B4%A2
            List<WebElement> listElements = driver.findElements(By.xpath(MY_LIKE_TWEET_CONTENTS_LINK_XPATH_PATTERN));
            for(WebElement element : listElements ) {
                if (element.getAttribute("href").contains("http://") || element.getAttribute("href").contains("https://")) {
                    rt.add(element.getAttribute("href"));
                }
            }
            for(int i=0;i<n;i++){
                //45ピクセル分はだいたいXXXつ 調節むずいからきっかりしなくていいや
                try{
                    System.out.println(driver.findElements(By.xpath(MY_LIKE_TWEET_CONTENTS_XPATH_PATTERN)).get(i).getText());
                }catch(IndexOutOfBoundsException e){
                    //スナップショット取る時間と全エレメントを出力する時間の関係がいい感じにならない。
                    //全要素を取得できるようにするために、ハンドリングしてなくなったところでスキップ
                    break;
                }
            }

            scrollYAfter = scrollYBefore;

            cnt++;

            if(cnt * DEFAULT_WAIT_TIME_SECONDS >= DEFAULT_TIMEOUT_SECONDS){
                break;
            }
        }

        UrlUtility urlUtility = new UrlUtility();

        String urlList = rt.stream().map(shortUrl-> {
            try {
                return urlUtility.expandUrl(new URL(shortUrl)).toExternalForm();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return shortUrl;
        }).collect(Collectors.joining("\n"));

        System.out.println(urlList);

        driver.quit(); // ブラウザーを閉じる
    }

    /**
     * 現在の縦スクロール位置を取得する。
     * @param driver WebDriver
     * @return スクロール位置
     * https://qiita.com/t_watari/items/0f73cbce90bdd74299dc
     */
    private static BigDecimal getScrollY(WebDriver driver) {
        String scrollY = (String) ((JavascriptExecutor) driver).executeScript( "return String(window.pageYOffset);");
        BigDecimal value = null;
        if (scrollY != null && scrollY.matches("^[0-9]+$")) {
            value = new BigDecimal(scrollY);
        }
        return value;
    }

    /**
     * 画面サイズに合わせてスクロールを移動する
     * @param driver WebDriver
     * @return 移動後のスクロール位置
     * https://qiita.com/t_watari/items/0f73cbce90bdd74299dc
     */
    private static BigDecimal moveScrollY(WebDriver driver) {

        // 画面サイズを取得
        int height = driver.manage().window().getSize().height;

        // 見切れて画面確認ができない箇所ができないようにするため、
        // 画面サイズより少し小さい値でスクロールさせる
        String scrollY = (String) ((JavascriptExecutor) driver).executeScript( "scrollBy( 0, " + (height - 45) + " ); return String(window.pageYOffset);");
        BigDecimal value = null;
        if (scrollY != null && scrollY.matches("^[0-9]+$")) {
            value = new BigDecimal(scrollY);
        }

        return value;
    }
}