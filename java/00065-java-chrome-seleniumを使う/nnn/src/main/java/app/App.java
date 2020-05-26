package app;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.*;

public class App {

    private static final String OUTPUT_DIR = "pic/";

    public static void main( String[] args ) throws IOException, InterruptedException {

        System.setProperty("webdriver.chrome.driver", "/usr/local/src/chromedriver_linux64/chromedriver");

        ChromeOptions options = new ChromeOptions();
        options.setBinary("/usr/local/src/chrome-linux/chrome");//chrome binaryまでのファイルパスを指定

        //https://stackoverflow.com/questions/50642308/webdriverexception-unknown-error-devtoolsactiveport-file-doesnt-exist-while-t
        options.addArguments("--no-sandbox"); // Bypass OS security model これだけで一応立つ

        WebDriver driver = new ChromeDriver(options);// Chromeドライバーインスタンスを作成する

        driver.get("https://www.google.com");//引数に指定したURLにアクセス

        driver.manage().window().fullscreen(); //フルスクリーン

        Thread.sleep(1000);

        File screenFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);

        copy(screenFile, new File(OUTPUT_DIR + "T" + "001" + ".png"));

        driver.quit(); // ブラウザーを閉じる

        System.out.println( "Hello World!" );
    }

    private static void copy(File fromFile, File toFile) throws IOException {
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
