package app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class App {
    public static void main( String[] args ) {

        List<HashMap<String,Integer>> l = new ArrayList<>();
        l.add(new HashMap<String, Integer>() {{put("a", 1);}});
        l.add(new HashMap<String, Integer>() {{put("a", 2);}});
        l.add(new HashMap<String, Integer>() {{put("b", 3);}});
        l.add(new HashMap<String, Integer>() {{put("b", 6);}});
        l.add(new HashMap<String, Integer>() {{put("b", 2);}});
        l.add(new HashMap<String, Integer>() {{put("c", 7);}});
        l.add(new HashMap<String, Integer>() {{put("c", 4);}});

        System.out.println(l);

        System.out.println(listagg(l));
    }

    private static HashMap<String,List<Integer>> listagg(List<HashMap<String,Integer>> l){
        HashMap<String,List<Integer>> rt = new HashMap<>();
        List<Integer> ll = new ArrayList<>();
        String preKey="";
        for (int i=0;i<l.size();i++){
            for (Map.Entry<String,Integer> entry : l.get(i).entrySet()){
                if(i==0){
                    //先頭要素の追加
                    ll.add(entry.getValue());
                    rt.put(entry.getKey(),ll);
                }else{
                    //先頭要素以外
                    if(preKey == entry.getKey()){
                        //前回グループキーと同じ場合
                        ll.add(entry.getValue());
                    }else{
                        //前回グループキーと異なる場合
                        rt.put(preKey,ll);//前回分追加して初期化して、今回分追加
                        ll = new ArrayList<>();
                        ll.add(entry.getValue());
                    }
                }
                preKey = entry.getKey();
            }
            rt.put(preKey,ll);//最終グループの追加
        }
        return rt;
    }
}