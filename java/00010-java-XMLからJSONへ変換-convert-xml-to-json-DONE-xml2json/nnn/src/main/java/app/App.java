package app;

import org.json.XML;
import sun.misc.Signal;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

public class App {

    private static final String DEFAULT_SEPARATOR = " ";
    private static final String SIGNAL_HANDLE_INT = "INT";

    private static final String PRE_SUFFIX = ".xml";
    private static final String POST_SUFFIX = ".json";

    public static void main( String... cmdLineArgs ) {
        trap(new ArrayList<>(Arrays.asList(SIGNAL_HANDLE_INT)));

        if(cmdLineArgs.length > 0){
            usage();
        }else{
            Map<Integer, List<String>> m = sub_process(pre_process(new Scanner(System.in)));

            try{
                subMainProcess(m);
            }catch (IOException e){
                e.printStackTrace();
                System.exit(1);
            }
        }
    }

    private static void subMainProcess(Map<Integer, List<String>> m) throws IOException {
        if(m.size()!=1){
            //単一行チェック
            usage();
        }
        if(m.get(0).size()!=1){
            //単一列チェック
            usage();
        }

        String srcFileName = m.get(0).get(0).replaceAll("\\..*", "")+PRE_SUFFIX;
        String dstFileName = m.get(0).get(0).replaceAll("\\..*", "")+POST_SUFFIX;

        File dstFile = new File(dstFileName);

        if(dstFile.exists()){
            dstFile.delete();
        }else{
            FileWriter fw = new FileWriter(dstFileName, true);
            String str = Files.readString(Paths.get(srcFileName));
            fw.write(XML.toJSONObject(str).toString());
            fw.close();
        }
    }

    private static void trap(List<String> liz){
        for (String ele:liz) {
            catch_sig(ele);
        }
    }
    private static void catch_sig(String str) {
        Signal sig = new Signal(str);
        Signal.handle(sig, Signal -> {
            if ("INT".equals(sig.getName())) {
                usage();
            }
        });
    }
    private static void usage() {
        System.out.println("Usageだよーん");
        System.exit(0);
    }
    private static List<String> pre_process(Scanner stdin){
        List<String> rt = new ArrayList<>();
        while (stdin.hasNextLine()) {
            rt.add(stdin.nextLine());
        }
        stdin.close();
        return rt;
    }
    private static Map<Integer, List<String>> sub_process(List<String> liz){
        Map<Integer, List<String>> rt= new LinkedHashMap<>();
        for (int i=0;i<liz.size();i++){
            List<String> l = new ArrayList<>(Arrays.asList(liz.get(i).split(DEFAULT_SEPARATOR)));
            rt.put(i,l);
        }
        return rt;
    }
}