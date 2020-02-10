
//product class file to currnet dir
//$javac -classpath /home/java/IdeaProjects/untitled/script_scratch/java/lib/joox-1.6.1.jar:/home/java/IdeaProjects/untitled/script_scratch/java/lib/jaxb-api-2.3.0.jar:/home/java/IdeaProjects/untitled/script_scratch/java/lib/jsoup-1.12.1.jar DomXML3.java

//$java -classpath /home/java/IdeaProjects/untitled/script_scratch/java:/home/java/IdeaProjects/untitled/script_scratch/java/lib/joox-1.6.1.jar:/home/java/IdeaProjects/untitled/script_scratch/java/lib/jaxb-api-2.3.0.jar:/home/java/IdeaProjects/untitled/script_scratch/java/lib/jsoup-1.12.1.jar DomXML3

import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//https://grantm.github.io/perl-libxml-by-example/_static/xpath-sandbox/xpath-sandbox.html?q=/%2A
public class DomXML3 {
    //https://www.casleyconsulting.co.jp/blog/engineer/204/
    public static void main(String[] rsv_args) throws ParserConfigurationException, IOException, SAXException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        //https://www.atmarkit.co.jp/ait/articles/0102/10/news003_2.html
        Node root = builder.parse(new File("/home/java/IdeaProjects/untitled/script_scratch/java/test.xml"));
        List<Rt_map> rt_liz = new ArrayList<>();
        System.out.println(root.getLastChild());
        rt_liz.add(new Rt_map(1,"/"+root.getLastChild().getNodeName(),root.getLastChild().getNodeValue()));
        System.out.println(rt_liz.size());
        for (Rt_map ele : rt_liz){
            System.out.println(ele.toString());
        }
    }
    private static class Rt_map{

        private Integer grp;
        private String pth;
        private String val;

        public Rt_map(Integer grp, String pth, String val) {
            this.grp = grp;
            this.pth = pth;
            this.val = val;
        }

        public void setGrp(Integer grp) {
            this.grp = grp;
        }

        public void setPth(String pth) {
            this.pth = pth;
        }

        public void setVal(String val) {
            this.val = val;
        }
    }
}