package app;

import com.ibm.icu.text.CharsetDetector;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

public class DetectEnc {
    //https://www.programcreek.com/java-api-examples/index.php?api=com.ibm.icu.text.CharsetDetector
    public static void main(String[] args){
      System.out.println(getEncoding("うんこ"));
    } 

    private static String getEncoding(String text) {
        InputStream inputStream = new ByteArrayInputStream(text.getBytes());
        CharsetDetector detector = new CharsetDetector();
        try {
            detector.setText(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return detector.detect().getName();
    }
}
