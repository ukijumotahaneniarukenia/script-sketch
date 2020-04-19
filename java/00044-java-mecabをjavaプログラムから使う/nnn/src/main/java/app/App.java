package app;

import org.chasen.mecab.MeCab;
import org.chasen.mecab.Tagger;

public class App {
    public static void main( String[] args ) {
        try{
//            System.load("/usr/local/src/mecab-java-0.996/libMeCab.so");
            System.loadLibrary("MeCab");
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println(MeCab.VERSION);
//        Tagger tagger = new Tagger();
        System.out.println("MeCab.VERSION");
    }
}