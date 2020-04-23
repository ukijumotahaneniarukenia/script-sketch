package app;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    private static final ClassLoader classLoader = Thread.currentThread().getContextClassLoader();

    public static void main( String[] args ) throws NoSuchFieldException, IllegalAccessException {
        Map<Class<?>,String> m = Arrays.asList("java.lang.Character").stream()
                .map(e->uncheckCall(()->classLoader.loadClass(e))).collect(Collectors.toMap(ee->ee,ee->ee.getName()));

        Map<String,String> uniCtgMst = genUniCtgMst(m);

        System.out.println(uniCtgMst);

//        List<String> l = genAllStr().stream().limit(10000).collect(Collectors.toList());

//        Map<String,String> uniCtgTbl = IntStream.range(0,l.size())
//                                            .boxed()
//                                            .collect(Collectors.toMap(e->l.get(e),e->uniCtgMst.get(String.valueOf(Character.getType(l.get(e).toCharArray()[0])))));
//
//        uniCtgTbl.entrySet().stream().forEach(e-> System.out.printf("%s\t%s\n",e.getKey(),e.getValue()));
//        System.out.println(uniCtgTbl.size());

//        for(int i=0;i<l.size();i++){
//            System.out.printf("%s\t%s\t%s\n"
//                    ,l.get(i)
//                    ,Character.getType(l.get(i).toCharArray()[0])
//                    ,uniCtgMst.get(String.valueOf(Character.getType(l.get(i).toCharArray()[0]))));
//        }
    }
    public static Map<String,String> genUniCtgMst(Map<Class<?>,String> m) throws NoSuchFieldException, IllegalAccessException {
        Map<String,String> rt = new LinkedHashMap<>();
        Class c = Character.class;
        for(Map.Entry<Class<?>,String> o : m.entrySet()){
            for(Map.Entry<Field,Class<?>> i : findFields(o.getKey()).entrySet()){
                if("byte".equals(c.getField(i.getKey().getName()).getGenericType().getTypeName())){
                    //http://blog.livedoor.jp/leopardhead/archives/484735.html
                    byte[] bytes = new byte[]{(byte)c.getField(i.getKey().getName()).get(Character.TYPE)};
                    rt.put(Arrays.toString(bytes).replace("[","").replace("]",""),i.getKey().getName());
                }
            }
        }
        return rt;
    }

    public static <T> T uncheckCall(Callable<T> callable) {
        //パールの暗黙の変数みたいなものだろう。すべてのコンテキストに含まれている隠しオブジェクト。callableはすべての例外をグルーピングしている
        //これがいちばんすごいわ
        //https://blog1.mammb.com/entry/2015/03/31/001620
        try {
            return callable.call();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    private static List<String> genAllStr(){
        return Stream.iterate(Character.MIN_CODE_POINT, n->n-Character.MIN_CODE_POINT<=Character.MAX_CODE_POINT, n->n + 1)
                .parallel()
                .map(e->String.valueOf(Character.toChars(e)))
                .collect(Collectors.toList());
    }
    private static Map<Field,Class<?>> findFields(Class<?> e){
        List<Field> l = Arrays.asList(e.getFields());
        return IntStream.rangeClosed(0,l.size()-1).boxed().parallel().collect(Collectors.toMap(i->l.get(i), i->e));
    }
}