import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Cons {
    public static void main(String[] args) {
        List<String> liz = new ArrayList<>(Arrays.asList("A","B","C","D"));
        for (int ind=0;ind<liz.size();ind++){

            String ele = liz.remove(0);
            System.out.println(ele);
//            List<String> list_done = cons(ele,liz);
//            System.out.println(list_done);
        }
    }
    private static <T> List<T> cons(T head, List<T> tail) {
        List<T> list = new ArrayList<>();
        list.add(head);
        list.addAll(tail);
        return list;
    }
}