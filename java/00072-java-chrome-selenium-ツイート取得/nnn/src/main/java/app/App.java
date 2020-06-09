package app;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.File;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class App {

    private static final String SHELL_GEI_BOT_URL = "https://twitter.com/minyoruminyon";
    private static final String SHELL_GEI_BOT_SCRIPT_WHO_XPATH_PATTERN_VALUE = "//body/div/div/div/div/main/div/div/div/div/div/div/div/div/div/section/div/div/div/div/div/div/div/div/article/div/div/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div/div/div[1]/span";
    private static final String SHELL_GEI_BOT_SCRIPT_XPATH_PATTERN_VALUE = "//body/div/div/div/div/main/div/div/div/div/div/div/div/div/div/section/div/div/div/div/div/div/div/div/article/div/div/div/div/div/div/div/div/div/div/div/div";

    private static Integer DEFAULT_MAX_SCRAPING_CNT = 10;
    private static final Integer DEFAULT_WAIT_TIME_SECONDS = 1000;
    private static Integer DEFAULT_TIMEOUT_SECONDS = DEFAULT_WAIT_TIME_SECONDS * DEFAULT_MAX_SCRAPING_CNT;

    private static void usage(){
        System.out.println("Usage: sg 10");
        System.exit(0);
    }

    public static void main( String... args ) throws InterruptedException {

//        List<String> cmdLineArgs = Arrays.asList("10"); //モック用
        List<String> cmdLineArgs = Arrays.asList(args);

        if (cmdLineArgs.size() != 1){
            usage();
        }else{
            DEFAULT_TIMEOUT_SECONDS = DEFAULT_WAIT_TIME_SECONDS * Integer.parseInt(cmdLineArgs.get(0));
        }

        System.setProperty("webdriver.chrome.driver", "/usr/local/src/chromedriver_linux64/chromedriver");

        ChromeOptions options = new ChromeOptions();
        options.setBinary("/usr/local/src/chrome-linux/chrome");//chrome binaryまでのファイルパスを指定

        //https://stackoverflow.com/questions/50642308/webdriverexception-unknown-error-devtoolsactiveport-file-doesnt-exist-while-t
        options.addArguments("--no-sandbox"); // Bypass OS security model これだけで一応立つ

        WebDriver driver = new ChromeDriver(options);// Chromeドライバーインスタンスを作成する

        driver.get(SHELL_GEI_BOT_URL);//引数に指定したURLにアクセス

        driver.manage().window().fullscreen(); //フルスクリーン

        BigDecimal scrollYAfter = BigDecimal.valueOf(-1);

        // スクロールできなくなる(スクリーン位置が同じになる)まで繰り返す
        int cnt=0;
        for (BigDecimal scrollYBefore = getScrollY(driver);
             (scrollYBefore != null && !scrollYBefore.equals(scrollYAfter));
             scrollYBefore = moveScrollY(driver)) {

            Thread.sleep(DEFAULT_WAIT_TIME_SECONDS); //1秒ぐらいがちょうどよい

            //対象要素のテキストを標準出力に垂れ流す
            System.out.println(driver.findElement(By.xpath(SHELL_GEI_BOT_SCRIPT_WHO_XPATH_PATTERN_VALUE)).getText());

            //対象要素のテキストを標準出力に垂れ流す（）
            int n = driver.findElements(By.xpath(SHELL_GEI_BOT_SCRIPT_XPATH_PATTERN_VALUE)).size();

            for(int i=0;i<n;i++){
                try{
                    System.out.println(driver.findElements(By.xpath(SHELL_GEI_BOT_SCRIPT_XPATH_PATTERN_VALUE)).get(i).getText());
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