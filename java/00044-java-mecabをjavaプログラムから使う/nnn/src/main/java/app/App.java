package app;

import org.chasen.mecab.Tagger;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        try{
//            System.load("/usr/local/src/mecab-java-0.996/libMeCab.so");//ダイナミックリンクファイルをフルパス指定
            System.loadLibrary("MeCab");//接頭辞のlibと接尾辞のsoを除去した名前を指定
        }catch (Exception e){
            e.printStackTrace();
        }
        Tagger tagger = new Tagger();
        String s = "太郎は二郎にこの本を渡した。";
        System.out.println(s);

        Stream.generate(()->"=").limit(100).forEach(e-> System.out.print(e));
        System.out.println();
        
        String rt = tagger.parse(s).replace("EOS","");
        Map<String, List<String>> m = Arrays.asList(rt.split("\n")).stream().map(e->Arrays.asList(e.split("\t"))).collect(Collectors.toMap(e->e.get(0), e->Arrays.asList(e.get(1).split(",")),(pre,post)->post, LinkedHashMap::new));
        for(Map.Entry<String, List<String>> entry : m.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey(),entry.getValue());
        }
    }
}