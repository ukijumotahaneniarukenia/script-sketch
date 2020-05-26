package app;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.*;
import java.math.BigDecimal;

public class App {

    private static final String OUTPUT_DIR = new File(".").getAbsoluteFile().getParent() + "/pic/";
    private static final Integer OUTPUT_FILE_NAME_NUM_DIGIT = 3;

    public static void main( String[] args ) throws IOException, InterruptedException {

        File dir = new File(OUTPUT_DIR);

        dir.mkdir();

        System.setProperty("webdriver.chrome.driver", "/usr/local/src/chromedriver_linux64/chromedriver");

        ChromeOptions options = new ChromeOptions();
        options.setBinary("/usr/local/src/chrome-linux/chrome");//chrome binaryまでのファイルパスを指定

        //https://stackoverflow.com/questions/50642308/webdriverexception-unknown-error-devtoolsactiveport-file-doesnt-exist-while-t
        options.addArguments("--no-sandbox"); // Bypass OS security model これだけで一応立つ

        WebDriver driver = new ChromeDriver(options);// Chromeドライバーインスタンスを作成する

        driver.get("https://dev.to/t/python");//引数に指定したURLにアクセス

        driver.manage().window().fullscreen(); //フルスクリーン

        BigDecimal scrollYAfter = BigDecimal.valueOf(-1);

        int cnt = 1;
        // スクロールできなくなる(スクリーン位置が同じになる)まで繰り返す
        for (BigDecimal scrollYBefore = getScrollY(driver);
             (scrollYBefore != null && !scrollYBefore.equals(scrollYAfter));
             scrollYBefore = moveScrollY(driver)) {

            File screenFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);

            Thread.sleep(1000); //1秒ぐらいがちょうどよい

            copy(screenFile, new File(OUTPUT_DIR + "T" + ("0".repeat(OUTPUT_FILE_NAME_NUM_DIGIT)+String.valueOf(cnt)).substring(("0".repeat(OUTPUT_FILE_NAME_NUM_DIGIT)+String.valueOf(cnt)).length()-OUTPUT_FILE_NAME_NUM_DIGIT) + ".png"));
            cnt++;
            scrollYAfter = scrollYBefore;
        }

        driver.quit(); // ブラウザーを閉じる

        System.out.println( "Hello World!" );
    }

    private static void copy(File fromFile, File toFile) throws IOException {
        System.out.println(toFile);
        if(toFile.exists()){
            toFile.delete();
        }else{
            toFile.createNewFile();
        }
        try (BufferedInputStream in = new BufferedInputStream(new FileInputStream(fromFile))) {
            try (BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(toFile))) {
                byte[] buf = new byte[1024];
                for (int size = in.read(buf); size >= 0; size = in.read(buf)) {
                    out.write(buf, 0, size);
                }
            }
        }
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