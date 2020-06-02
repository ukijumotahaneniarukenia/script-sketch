package app;

import org.apache.lucene.search.spell.JaroWinklerDistance;
import org.apache.lucene.search.spell.LevensteinDistance;
import sun.misc.Signal;

import java.util.*;

public class App {

    private static final String DEFAULT_SEPARATOR = " ";
    private static final String SIGNAL_HANDLE_INT = "INT";

    public static void main( String... cmdLineArgs ) {
        trap(new ArrayList<>(Arrays.asList(SIGNAL_HANDLE_INT)));

        if(cmdLineArgs.length > 0){
            usage();
        }else{
            List<String> l = pre_process(new Scanner(System.in));
            if(l.size()!=2){
                usage();
            }
            System.out.printf("%s\t%s\t%s\t%s\n","レーベンシュタイン距離",l.get(0),l.get(1),getSimilarScoreByLevenshteinDistance(l.get(0),l.get(1)));
            System.out.printf("%s\t%s\t%s\t%s\n","ジャロ・ウィンクラー距離",l.get(0),l.get(1),getSimilarScoreByJaroWinklerDistance(l.get(0),l.get(1)));
        }
    }
    //https://qiita.com/hakozaki/items/856230d3f8e29d3302d6
    private static int getSimilarScoreByLevenshteinDistance(String s1, String s2){
        LevensteinDistance dis =  new LevensteinDistance();
        return (int) (dis.getDistance(s1, s2) * 100);
    }
    private static int getSimilarScoreByJaroWinklerDistance(String s1, String s2){
        JaroWinklerDistance dis =  new JaroWinklerDistance();
        return (int) (dis.getDistance(s1, s2) * 100);
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
    private static HashMap<Integer, List<String>> sub_process(List<String> liz){
        HashMap<Integer, List<String>> rt= new HashMap<>();
        for (int i=0;i<liz.size();i++){
            List<String> l = new ArrayList<>(Arrays.asList(liz.get(i).split(DEFAULT_SEPARATOR)));
            rt.put(i,l);
        }
        return rt;
    }
}