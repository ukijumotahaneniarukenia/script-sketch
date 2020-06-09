package app;


import java.io.IOException;
import java.net.URL;

public class App {
    public static void main( String[] args ) throws IOException {
        UrlUtility urlUtility = new UrlUtility();
        URL expandUrl = urlUtility.expandUrl(new URL("https://t.co/a6NMZTYIKQ?amp=1"));
        System.out.println(expandUrl.toExternalForm());
    }
}