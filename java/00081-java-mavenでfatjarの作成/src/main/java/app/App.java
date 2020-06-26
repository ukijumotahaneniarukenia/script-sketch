package app;

import com.ibm.icu.text.Transliterator;

//https://mkyong.com/maven/create-a-fat-jar-file-maven-shade-plugin/
public class App {
    public static void main( String[] args ) {

        Transliterator halfToFull = Transliterator.getInstance("Halfwidth-Fullwidth");

        System.out.println( halfToFull.transliterate("Hello World!") );
    }
}
