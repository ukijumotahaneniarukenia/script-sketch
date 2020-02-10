import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.File;
import java.io.IOException;

//product class file to currnet dir
//$javac -classpath /home/java/IdeaProjects/untitled/script_scratch/java/lib/joox-1.6.1.jar:/home/java/IdeaProjects/untitled/script_scratch/java/lib/jaxb-api-2.3.0.jar:/home/java/IdeaProjects/untitled/script_scratch/java/lib/jsoup-1.12.1.jar DomXML2.java

//$java -classpath /home/java/IdeaProjects/untitled/script_scratch/java:/home/java/IdeaProjects/untitled/lib/icu4j-65.1.jar:/home/java/IdeaProjects/untitled/script_scratch/java/lib/joox-1.6.1.jar:/home/java/IdeaProjects/untitled/script_scratch/java/lib/jaxb-api-2.3.0.jar:/home/java/IdeaProjects/untitled/script_scratch/java/lib/jsoup-1.12.1.jar DomXML2

public class DomXML2 {
    //https://jsoup.org/download
    //https://github.com/jOOQ/jOOX
    //https://jsoup.org/cookbook/extracting-data/dom-navigation
    public static void main(String[] rsv_args) {
        try {
            File input = new File("/home/java/IdeaProjects/untitled/script_scratch/java/test.xml");
            Document doc = Jsoup.parse(input, "UTF-8");
            System.out.println(doc);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}