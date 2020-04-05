package app;

import org.htmlcleaner.*;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

public class App {
    public static final String suffix = ".xml";
    public static final String urlListSuffix = ".tsv";
    public static final String className = new Object(){}.getClass().getEnclosingClass().getName();
    public static final String cmdInput="ls *html |";
    public static void main(String[] cmdline_args) {
        XXX xxx = new XXX();
        HashMap<Integer, List<String>> maz;
        maz=xxx.KKK(className,cmdInput,cmdline_args,new Scanner(System.in),Arrays.asList("INT"));
        html2json(maz);
    }
    private static void html2json(HashMap<Integer, List<String>> maz){
        maz.forEach((k,v)->{
            //前回成果物ファイルを削除
            File destFile = new File(v.get(0).replaceAll("\\..*", "")+suffix);
            destFile.delete();
            destFile = new File(v.get(0).replaceAll("\\..*", "")+urlListSuffix);
            destFile.delete();

            File srcFile = new File(v.get(0));
            if(srcFile.exists()){
                //ファイルの場合
                Path path = Paths.get(v.get(0));
                String str = null;
                FileWriter fw = null;
                FileWriter urlListFw = null;
                try {
                    fw = new FileWriter(v.get(0).replaceAll("\\..*", "")+suffix, true);
                    urlListFw = new FileWriter(v.get(0).replaceAll("\\..*", "")+urlListSuffix, true);
                    str = Files.readString(path);
                    HtmlCleaner cleaner = new HtmlCleaner();
                    TagNode node = cleaner.clean(str);
                    List<? extends TagNode> tagNodeList = node.getAllElementsList(true);
                    HashMap<Integer, List<String>> rt=new HashMap<>();
                    for(int i=0;i<tagNodeList.size();i++){
                        List<String> l = new ArrayList<>();
                        if("a".equalsIgnoreCase(tagNodeList.get(i).getName())){
                            //アンカータグのみ抽出
                            Map<String, String> attr = tagNodeList.get(i).getAttributes();
                            l.add(tagNodeList.get(i).getText().toString().replaceAll("^\\s+", "").replaceAll("\\s+$", ""));
                            for(Map.Entry<String,String> entry:attr.entrySet()){
                                if("href".equalsIgnoreCase(entry.getKey())){
                                    l.add(entry.getValue());
                                }
                            }
                        }
                        rt.put(i,l);
                    }
                    urlListFw.write("rn"+"\t"+"title"+"\t"+"url"+"\n");//ヘッダ行の書き込み
                    for(Map.Entry<Integer,List<String>> entry:rt.entrySet()){
                        if(entry.getValue().size()==2){
                            //値リストがテキストとURLの2つの場合
                            urlListFw.write(entry.getKey().toString()+"\t"+entry.getValue().get(0)+"\t"+entry.getValue().get(1)+"\n");//明細行の書き込み
                        }
                    }
                    urlListFw.close();
                    CleanerProperties props = cleaner.getProperties();
                    XmlSerializer serializer = new PrettyXmlSerializer(props);
                    StringWriter writer = new StringWriter();
                    serializer.write(node, writer, "utf-8");
                    fw.write(writer.getBuffer().toString());
                    writer.close();
                    fw.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else{
                //ファイルでない場合
                System.out.println("#1. java "+className+"\n"
                        + "#2. Enter" + "\n"
                        + "#3. Ctrl+C" + "\n"
                );
                System.exit(1);
            }
            v.add(v.get(0).replaceAll("\\..*", "")+suffix);
            v.add(v.get(0).replaceAll("\\..*", "")+urlListSuffix);
            System.out.printf("%s:%s\n",k,v);
        });
    }
}