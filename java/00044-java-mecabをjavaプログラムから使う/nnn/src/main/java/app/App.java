package app;

import org.chasen.mecab.*;

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
//        jjj();
//        fff("太郎は二郎にこの本を渡した。");
        fff("DEVANAGARI LETTER LLLA DEVANAGARI DEVANAGARI。");
//        jjj("太郎は二郎にこの本を渡した。");
//        jjj("DEVANAGARI LETTER LLLA DEVANAGARI DEVANAGARI。");
//        nnn("太郎は二郎にこの本を渡した。");
//        nnn("DEVANAGARI LETTER LLLA DEVANAGARI DEVANAGARI。");

    }
    private static void ggg(String s){
        String str = s;
        System.out.println(str);
        Stream.generate(()->"=").limit(100).forEach(e-> System.out.print(e));
        System.out.println();
        Model model = new Model();
        Tagger tagger = model.createTagger();
        Node node;
        Lattice lattice = model.createLattice();
        lattice.set_sentence(str);
        if (tagger.parse(lattice)) {
//            System.out.println(lattice.toString());
            for (node = lattice.bos_node(); node != null; node = node.getNext()) {
                System.out.println(node.getSurface() + "\t" + node.getFeature());
//                System.out.println(node.getSurface());
//                System.out.println(node.getFeature());
            }
            System.out.println("EOS\n");
        }
    }

    private static void fff(String s){
        String str = s;
        System.out.println(str);
        Stream.generate(()->"=").limit(100).forEach(e-> System.out.print(e));
        System.out.println();
        Model model = new Model();
        Tagger tagger = model.createTagger();
        Node node;
        Lattice lattice = model.createLattice();
        lattice.set_sentence(str);
        if (tagger.parse(lattice)) {
//            System.out.println(lattice.toString());
            for (node = lattice.bos_node(); node != null; node = node.getNext()) {
                System.out.println(node.getSurface() + "\t" + node.getFeature());
//                System.out.println(node.getSurface());
//                System.out.println(node.getFeature());
            }
            System.out.println("EOS\n");
        }
    }

    private static void nnn(String s){
        Tagger tagger = new Tagger();
        String str = s;
        System.out.println(str);

        Stream.generate(()->"=").limit(100).forEach(e-> System.out.print(e));
        System.out.println();

        Node node = tagger.parseToNode(str);
        for (;node != null; node = node.getNext()) {
            System.out.printf("%s\t%s\n"
                    ,node.getSurface()
                    ,node.getFeature()
//                    ,node.getCost()
            );
        }
        System.out.println ("EOS\n");
    }

    private static void jjj(String s){
        Tagger tagger = new Tagger();
        String str = s;
        System.out.println(str);

        Stream.generate(()->"=").limit(100).forEach(e-> System.out.print(e));
        System.out.println();

        String rt = tagger.parse(str).replace("EOS","");
        Map<String, List<String>> m = Arrays.asList(rt.split("\n")).stream().map(e->Arrays.asList(e.split("\t"))).collect(Collectors.toMap(e->e.get(0), e->Arrays.asList(e.get(1).split(",")),(pre,post)->post, LinkedHashMap::new));
        for(Map.Entry<String, List<String>> entry : m.entrySet()){
            System.out.printf("%s\t%s\n",entry.getKey(),entry.getValue());
        }
    }
}