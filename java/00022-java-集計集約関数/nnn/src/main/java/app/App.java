package app;

import javaslang.control.Either;
import javassist.*;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

public class App {
    public static final String className = new Object(){}.getClass().getEnclosingClass().getName();
    public static final String cmdInput="cat test.tsv |";

    public static void main(String[] cmdline_args) throws CannotCompileException, InvocationTargetException, NoSuchMethodException, InstantiationException, IllegalAccessException, NoSuchFieldException, NotFoundException, ClassNotFoundException {
        XXX xxx = new XXX();
        HashMap<Integer, List<String>> maz;
        maz=xxx.KKK(className,cmdInput,cmdline_args,new Scanner(System.in), Arrays.asList("INT"),"\t");
        List <String> filedList = maz.get(0).stream().map(e->e.toLowerCase()).collect(toList()); //header
        List<List<String>> datList = maz.entrySet().stream().skip(1).map(e->e.getValue()).collect(toList());

        List<Map<String,String>> mkDatListMap = mkDatListMap(filedList,datList);

        int mx = mkDatListMap.size();

        CtClass cc = mkClass(filedList);
        Map<String,Map<String,List<String>>> fetchSetter = fetchSetter(Arrays.asList(cc.getMethods()));

        Class<?> clazz = cc.toClass(); //実行は１回のみ Caused by: java.lang.LinkageError: loader 'app' (instance of jdk.internal.loader.ClassLoaders$AppClassLoader) attempted duplicate class definition for Item. 一度生成したら使い回すこと
        Constructor<?> ct = clazz.getConstructor();

        List<Object> rr = new ArrayList<>();
        for(int i=0;i<mx;i++){
            Object obj = ct.newInstance();
            for(Map.Entry<String,String> e : mkDatListMap.get(i).entrySet()){
                if(fetchSetter.containsKey(e.getKey())){
                    for(Map.Entry<String,List<String>> ee : fetchSetter.get(e.getKey()).entrySet()){
                        Method method = clazz.getMethod(ee.getKey(),ee.getValue().stream().map(eee->eee.getClass()).toArray(Class[]::new));
                        method.invoke(obj,e.getValue());
                    }
                }
            }
            rr.add(obj);
        }

        rr.stream().map(e->aliasGetter(clazz,e,"getName")).forEach(strings -> System.out.println(strings));

        rr.stream().map(e->aliasGetter(clazz,e,"getName").get()).forEach(strings -> System.out.println(strings));

        rr.stream().map(e->aliasGetter(clazz,e,"getName").get()+"-----").forEach(strings -> System.out.println(strings));

        rr.stream().map(e->Integer.valueOf(aliasGetter(clazz,e,"getQty").get())+100).forEach(strings -> System.out.println(strings));

    }

    private static Either<Object,String> aliasGetter(Class<?> clazz,Object obj,String getterName){
        try {
            return Either.right((String) clazz.getMethod(getterName).invoke(obj));
        }
        catch (Exception e) {
            return Either.left(e);
        }
    }

    private static List<Map<String,String>> mkDatListMap(List <String> filedList,List<List<String>> datList){
        List<Map<String,String>> rt = new ArrayList<>();
        int row = datList.size();
        int col = datList.get(0).size();
        List<Map<String,String>> l = new ArrayList<>();
        for(int i = 0;i<row;i++){
            Map<String,String> m = new HashMap<>();
            for(int j=0;j<col;j++){
                m.put(filedList.get(j),datList.get(i).get(j));
            }
            rt.add(m);
        }
        return rt;
    }

    private static Map<String,Map<String,List<String>>> fetchSetter(List<CtMethod> l){
        Map<String,Map<String,List<String>>> rt = new HashMap<>();
        int mx = l.size();
        String defaultTypePara = "String";
        List<String> ll = new ArrayList<>();
        ll.add(defaultTypePara);
        Pattern p = Pattern.compile("^set.*$");
        for(int i=0;i<mx;i++){
            Matcher m = p.matcher(l.get(i).getName());
            Map<String,List<String>> mm = new HashMap<>();
            while(m.find()){
                mm.put(m.group(),ll);
                rt.put(String.valueOf(m.group().substring(3).charAt(0)).toLowerCase()+m.group().substring(4),mm);
            }
        }
        return rt;
    }

    private static CtClass mkClass(List<String> filedList) throws CannotCompileException, IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException, NoSuchFieldException {
        List <String> filed = filedList.stream().map(e->e.toLowerCase()).map(e->"private String "+e+";").collect(toList());
        List <String> getterList = filedList.stream().map(e->"public String get"+String.valueOf(e.charAt(0)).toUpperCase()+e.substring(1)+"(){return "+e+";}").collect(toList());
        List <String> setterList = filedList.stream().map(e->"public void set"+String.valueOf(e.charAt(0)).toUpperCase()+e.substring(1)+"(String "+e+"){this."+e+"="+e+";}").collect(toList());
        String toStringMethod = filedList.stream().map(e->"this."+e).map(e->e+"+\",\"").collect(joining("+","public String toString() { return \"[\"+","+\"]\";}"));
        String constHeader = filedList.stream().map(e->"String "+e).collect(joining(",","(",")"));
        List<String> constBody = filedList.stream().map(e->"this."+e+"="+e+";").collect(toList());
        String constructor = constBody.stream().collect(joining("","public Item"+constHeader+"{","}"));

        CtClass c = ClassPool.getDefault().makeClass("Item");
        int mxFieldCnt = filed.size();
        for (int i=0;i<mxFieldCnt;i++){
            c.addField(CtField.make(filed.get(i),c));
        }

        c.addMethod(CtNewMethod.make(toStringMethod,c));

        int mxGetterListCnt = getterList.size();
        for (int i=0;i<mxGetterListCnt;i++){
            c.addMethod(CtNewMethod.make(getterList.get(i),c));
        }

        int mxSetterListCnt = setterList.size();
        for (int i=0;i<mxSetterListCnt;i++){
            c.addMethod(CtNewMethod.make(setterList.get(i),c));
        }

        c.addConstructor(CtNewConstructor.defaultConstructor(c));
        c.addConstructor(CtNewConstructor.make(constructor,c));

       return c;
    }
}