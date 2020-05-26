package app;

import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.*;
import java.util.*;

public class App {

    private static final String OUTPUT_DIR = new File(".").getAbsoluteFile().getParent() + "/pic/";
    private static final Integer OUTPUT_FILE_NAME_NUM_DIGIT = 3;

    private static final String ON = "1";
    private static final String OFF = "0";

    private static final String FORM_INIT_XPATH_PATTERN_KEY = "";
    private static final String FORM_INIT_XPATH_PATTERN_VALUE = "";
    private static final String FORM_LINK_CLICK_XPATH_PATTERN_KEY = "お問い合わせリンクをクリック";
    private static final String FORM_LINK_CLICK_XPATH_PATTERN_VALUE = "//*[@id='navigation']/ul/li[5]/a";
    private static final String FORM_LINK_BUTTON_CLICK_XPATH_PATTERN_KEY = "お問い合わせボタンをクリック";
    private static final String FORM_LINK_BUTTON_CLICK_XPATH_PATTERN_VALUE = "/html/body/div[1]/div/div[3]/p[2]/a";
    private static final String FORM_INPUT_XPATH_PATTERN_KEY = "入力";
    private static final String FORM_INPUT_XPATH_PATTERN_VALUE = "/html/body/div[1]/div[1]/form/div[1]/div/input";
    private static final String FORM_INPUT_XPATH_PATTERN_ARGS_1 = "会社テスト";
    private static final String FORM_CHECKBOX_CHECK_XPATH_PATTERN_KEY = "チェックボックスにチェックを入れる";
    private static final String FORM_CHECKBOX_CHECK_XPATH_PATTERN_VALUE = "//*[@id=\"check\"]";
    private static final String FORM_SUBMIT_BUTTON_CLICK_XPATH_PATTERN_KEY = "ボタンを押下する";
    private static final String FORM_SUBMIT_BUTTON_CLICK_XPATH_PATTERN_VALUE = "//*[@id=\"submit\"]";

    public static void main( String[] args ) throws IOException, InterruptedException {

        File dir = new File(OUTPUT_DIR);

        dir.mkdir();

        System.setProperty("webdriver.chrome.driver", "/usr/local/src/chromedriver_linux64/chromedriver");

        ChromeOptions options = new ChromeOptions();
        options.setBinary("/usr/local/src/chrome-linux/chrome");//chrome binaryまでのファイルパスを指定

        //https://stackoverflow.com/questions/50642308/webdriverexception-unknown-error-devtoolsactiveport-file-doesnt-exist-while-t
        options.addArguments("--no-sandbox"); // Bypass OS security model これだけで一応立つ

        WebDriver driver = new ChromeDriver(options);// Chromeドライバーインスタンスを作成する

        driver.get("http://www.chivsp.com/");//引数に指定したURLにアクセス

        // 開きたいサイトのURLを引数に指定
        driver.get("http://www.chivsp.com/");

        Map<String, List<String>> testPattern = new LinkedHashMap<>(){{
            put(FORM_INIT_XPATH_PATTERN_KEY,new ArrayList<>(Arrays.asList(FORM_INIT_XPATH_PATTERN_VALUE)));
            put(FORM_LINK_CLICK_XPATH_PATTERN_KEY,new ArrayList<>(Arrays.asList(FORM_LINK_CLICK_XPATH_PATTERN_VALUE)));
            put(FORM_LINK_BUTTON_CLICK_XPATH_PATTERN_KEY,new ArrayList<>(Arrays.asList(FORM_LINK_BUTTON_CLICK_XPATH_PATTERN_VALUE)));
            put(FORM_INPUT_XPATH_PATTERN_KEY,new ArrayList<>(Arrays.asList(FORM_INPUT_XPATH_PATTERN_VALUE,FORM_INPUT_XPATH_PATTERN_ARGS_1)));
            put(FORM_CHECKBOX_CHECK_XPATH_PATTERN_KEY,new ArrayList<>(Arrays.asList(FORM_CHECKBOX_CHECK_XPATH_PATTERN_VALUE)));
            put(FORM_SUBMIT_BUTTON_CLICK_XPATH_PATTERN_KEY,new ArrayList<>(Arrays.asList(FORM_SUBMIT_BUTTON_CLICK_XPATH_PATTERN_VALUE)));
        }};

        Map<String, String> testPatternInUseArgs = new LinkedHashMap<>(){{
            put(FORM_INIT_XPATH_PATTERN_KEY,OFF);
            put(FORM_LINK_CLICK_XPATH_PATTERN_KEY,OFF);
            put(FORM_LINK_BUTTON_CLICK_XPATH_PATTERN_KEY,OFF);
            put(FORM_INPUT_XPATH_PATTERN_KEY,ON);
            put(FORM_CHECKBOX_CHECK_XPATH_PATTERN_KEY,OFF);
            put(FORM_SUBMIT_BUTTON_CLICK_XPATH_PATTERN_KEY,OFF);
        }};

        int cnt = 0;

        for(Map.Entry<String,List<String>> entry : testPattern.entrySet()){
            cnt++;

            String outputFilePathName = OUTPUT_DIR + "T" + ("0".repeat(OUTPUT_FILE_NAME_NUM_DIGIT) + String.valueOf(cnt)).substring(("0".repeat(OUTPUT_FILE_NAME_NUM_DIGIT) + String.valueOf(cnt)).length() - OUTPUT_FILE_NAME_NUM_DIGIT) + ".png";

            if(entry.getKey().isEmpty()){
                driver.manage().window().fullscreen(); //フルスクリーン
                Thread.sleep(1000); //1秒ぐらいがちょうどよい
                File screenFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
                copy(screenFile, new File(outputFilePathName));
                //写真だけ撮って初期表示はスキップ
                continue;
            }

            if(testPatternInUseArgs.get(entry.getKey()).equals(ON)){
                //入力アクションが必要な場合
                driver.findElement(By.xpath(entry.getValue().get(0))).sendKeys(entry.getValue().subList(1,entry.getValue().size()).toArray(new String[entry.getValue().size()-1]));
            }else{
                //クリックアクションのみが必要な場合
                driver.findElement(By.xpath(entry.getValue().get(0))).click();
            }
            driver.manage().window().fullscreen(); //フルスクリーン
            Thread.sleep(1000); //1秒ぐらいがちょうどよい
            File screenFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
            copy(screenFile, new File(outputFilePathName));
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
}