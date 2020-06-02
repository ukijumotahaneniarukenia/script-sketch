package app;

import org.apache.lucene.search.spell.JaroWinklerDistance;
import org.apache.lucene.search.spell.LevensteinDistance;
import sun.misc.Signal;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.lang.Math.ceil;

public class App {

    private static final String DEFAULT_SEPARATOR = " ";
    private static final String SIGNAL_HANDLE_INT = "INT";

    public static void main( String... cmdLineArgs ) {
        trap(new ArrayList<>(Arrays.asList(SIGNAL_HANDLE_INT)));

        if(cmdLineArgs.length > 0){
            usage();
        }else{
            Map<Integer, List<String>> m = sub_process(pre_process(new Scanner(System.in)));

            Map<Double, List<List<String>>> hashMap = m.entrySet().stream().collect(Collectors.groupingBy(e->ceil((double)(e.getKey()/2))
                    ,Collectors.mapping(e->e.getValue(),Collectors.toList())));

            Map<Double, List<List<String>>> treeMap = new TreeMap<>(hashMap);//ソート処理 keyの昇順で並び替え

            for(Map.Entry<Double, List<List<String>>> entry : treeMap.entrySet()){
                List<String> l = entry.getValue().stream().flatMap(e->e.stream()).collect(Collectors.toList());
                if(l.size()!=2){
                    System.out.printf("%s\t%s\n",Math.round(entry.getKey()),l.stream().collect(Collectors.joining(",")));
                    continue;
                }else{
                    System.out.printf("%s\t%s\t%s\t%s\n",Math.round(entry.getKey()),l.get(0),l.get(1),wrapperSimilarCalcFunction(l.get(0),l.get(1)));
                }
            }
        }
    }

    private static String wrapperSimilarCalcFunction(String self, String other){
        return Stream.of("レーベンシュタイン距離",String.valueOf(getSimilarScoreByLevenshteinDistance(self,other))
                ,"ジャロ・ウィンクラー距離",String.valueOf(getSimilarScoreByJaroWinklerDistance(self,other))
        ).collect(Collectors.joining("\t"));
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
    private static Map<Integer, List<String>> sub_process(List<String> liz){
        Map<Integer, List<String>> rt= new LinkedHashMap<>();
        for (int i=0;i<liz.size();i++){
            List<String> l = new ArrayList<>(Arrays.asList(liz.get(i).split(DEFAULT_SEPARATOR)));
            rt.put(i,l);
        }
        return rt;
    }
}