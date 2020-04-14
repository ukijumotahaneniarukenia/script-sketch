package app;


import java.util.stream.IntStream;

public class App {
    public static void main( String[] args ) {
        System.out.println( "Hello World!" );
        IntStream.iterate(0,x->x%3+1).boxed().limit(10).forEach(e-> System.out.print(e));
        System.out.println();
        IntStream.iterate(0,x->(x/3)+1).boxed().limit(10).forEach(e-> System.out.print(e));
        System.out.println();
        IntStream.iterate(0,x->jjj(x)).boxed().limit(10).forEach(e-> System.out.print(e));

        IntStream.rangeClosed('!','~').boxed().map(e->Character.toChars(e)).forEach(e-> System.out.print(e));
    }

    private static Integer jjj(Integer n){
        return n%3+1;
    }
}