package app;

import com.ibm.icu.text.Transliterator;

public class App {
    public static void main(String[] args) {
        String s = "うんこ";
        Transliterator hira2kanaTranslator = Transliterator.getInstance("Hiragana-Katakana");


        System.out.println("うんこ");
        System.out.println(hira2kanaTranslator.transliterate(s));
    }
}
