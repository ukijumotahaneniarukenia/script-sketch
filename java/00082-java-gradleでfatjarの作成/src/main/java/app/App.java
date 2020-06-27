package app;

import com.ibm.icu.text.Transliterator;

public class App {
    public static void main(String[] args) {

        Transliterator half2Full = Transliterator.getInstance("Halfwidth-Fullwidth");

        System.out.println(half2Full.transliterate("ｻﾝﾌﾟﾙ"));
    }
}
