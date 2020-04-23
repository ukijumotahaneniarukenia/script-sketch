package app;

import java.lang.reflect.Field;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class App {
    private static final ClassLoader classLoader = Thread.currentThread().getContextClassLoader();

    private static List<String> includeDirectionality(List<String> l){
        return l.stream().filter(e->e.contains("DIRECTIONALITY")).collect(Collectors.toList());
    }

    private static List<String> excludeDirectionality(List<String> l){
        return l.stream().filter(e->!e.contains("DIRECTIONALITY")).collect(Collectors.toList());
    }

    private static List<String> excludeBasicWord(List<String> l){
        return l.stream().filter(e->Stream.of("CODE_POINT","SURROGATE","VALUE","SIZE","RADIX","BYTES").noneMatch(ee->e.contains(ee))).collect(Collectors.toList());
    }

    public static Map<String,String> genUniCtgMst(Map<Class<?>,String> m) throws NoSuchFieldException, IllegalAccessException {
        Map<String,String> rt = new LinkedHashMap<>();
        Class c = Character.class;
        for(Map.Entry<Class<?>,String> o : m.entrySet()){
            for(Map.Entry<Field,Class<?>> i : findFields(o.getKey()).entrySet()){
                if(Stream.of("byte","int","char").anyMatch(e->uncheckCall(()->e.equals(c.getField(i.getKey().getName()).getGenericType().getTypeName())))){
                    if("byte".equals(c.getField(i.getKey().getName()).getGenericType().getTypeName())){
                        //http://blog.livedoor.jp/leopardhead/archives/484735.html
                        byte[] bytes = new byte[]{(byte)c.getField(i.getKey().getName()).get(Character.TYPE)};
                        rt.put(i.getKey().getName(),c.getField(i.getKey().getName()).getGenericType().getTypeName()+":"+Arrays.toString(bytes).replace("[","").replace("]",""));
                    }
                    if("int".equals(c.getField(i.getKey().getName()).getGenericType().getTypeName())){
                        rt.put(i.getKey().getName(),c.getField(i.getKey().getName()).getGenericType().getTypeName()+":"+c.getField(i.getKey().getName()).get(Character.TYPE));
                    }
                    if("char".equals(c.getField(i.getKey().getName()).getGenericType().getTypeName())){
                        rt.put(i.getKey().getName(),c.getField(i.getKey().getName()).getGenericType().getTypeName()+":"+c.getField(i.getKey().getName()).get(Character.TYPE));
                    }
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

    public static void main( String[] args ) throws NoSuchFieldException, IllegalAccessException {
        Map<Class<?>,String> m = Arrays.asList("java.lang.Character").stream()
                .map(e->uncheckCall(()->classLoader.loadClass(e))).collect(Collectors.toMap(ee->ee,ee->ee.getName()));

        //InputData
        List<String> l = genAllStr().stream().limit(100).collect(Collectors.toList());

        //PrepareData
        Map<String,List<String>> allCharConstMap = genUniCtgMst(m).entrySet().stream().collect(Collectors.groupingBy(e->e.getValue().split(":")[1],Collectors.mapping(e->e.getKey(),Collectors.toList())));
        Map<String,List<String>> directionalityMap = allCharConstMap.entrySet().stream().collect(Collectors.toMap(e->e.getKey(),e->includeDirectionality(e.getValue())));
        Map<String,List<String>> nonDirectionalityMap = allCharConstMap.entrySet().stream().collect(Collectors.toMap(e->e.getKey(),e->excludeBasicWord(excludeDirectionality(e.getValue()))));

        //MakeTable
        Map<Integer,Map<String,String>> unicodeDirectionalityMap = IntStream.range(0,l.size())
                .boxed()
                .collect(Collectors.groupingBy(i->i,Collectors.toMap(e->l.get(e),e->directionalityMap.get(String.valueOf(Character.getType(l.get(e).toCharArray()[0]))).stream().collect(Collectors.joining()))));

        Map<Integer,Map<String,String>> unicodeNonDirectionalityMap = IntStream.range(0,l.size())
                .boxed()
                .collect(Collectors.groupingBy(i->i,Collectors.toMap(e->l.get(e),e->nonDirectionalityMap.get(String.valueOf(Character.getType(l.get(e).toCharArray()[0]))).stream().collect(Collectors.joining()))));

        Map<Integer,String> unicodeCtgTbl =  unicodeDirectionalityMap.keySet().stream().collect(Collectors.toMap(i->i
                ,i->unicodeDirectionalityMap.get(i).keySet().stream().limit(i).collect(Collectors.joining())
                        +"\t"
                        +unicodeDirectionalityMap.get(i).values().stream().limit(i).collect(Collectors.joining())
                        +"\t"
                        +unicodeNonDirectionalityMap.get(i).values().stream().limit(i).collect(Collectors.joining())
        ));

        //OutputData
        unicodeCtgTbl.entrySet().stream().forEach(e-> System.out.printf("%s\t%s\n",e.getKey(),e.getValue()));
    }
}