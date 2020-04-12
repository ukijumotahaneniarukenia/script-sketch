package app;

import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class App {
    public static void main( String[] args ) {
        String[][][] a3d =
            {//x
                {//y
                    {}//z
                    ,{"a","b","c","zzz"}//z
                    , {"d","e","f"}//z
                }
                ,{//y
                    {"g"}//z
                    , {"h","i"}//z
                    , {"j","k"}//z
                    , {"l","m","n"}//z
                }
                ,{}//y
            };
        System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\n","seq","emptyCnt","tupleCnt","arrayCnt","eleCnt","ele");
        String[] flat = Arrays.stream(a3d)
                .flatMap(e->flatten((Object[])e))//コンパイル時の警告をミュート
                .toArray(String[]::new);
        System.out.println(Arrays.toString(flat));
    }

    public static int i = 0;
    public static int j = 0;
    public static int k = 0;
    public static int l = 0;

    public static Stream<Object> flatten(Object... o) {
        i++;
        System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\n",i,j,k,l,o.length,Arrays.stream(o).map(Object::toString).collect(Collectors.joining(",")));
        if (o.length == 0){
            j++;
            //残ストリームオブジェクト配列の要素数が0の場合は空ストリームをreturn
            return Stream.empty();
        }else{
            if (!o[0].getClass().isArray()){
                //先頭要素が配列でない場合
                k++;
                return Stream.of(o);//配列でない場合は対象ストリームを詰めて呼び出し元にreturn
            }else{
                //先頭要素が配列である場合
                l++;
                //flatMapでネストレベルを一段下げる
                return Stream.of(o).flatMap(a -> flatten((Object[])a));//配列である場合はネストレベルを一段下げたストリームをオブジェクト配列にキャストして引数に渡し再帰呼び出し
            }
        }
    }
}