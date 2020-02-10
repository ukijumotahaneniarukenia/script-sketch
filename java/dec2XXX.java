import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class dec2XXX {
    public static void main(String[] rsv_args) {
        List<Integer> rsv_args_done= Arrays.stream(rsv_args).map(Integer::valueOf).collect(Collectors.toList());
        System.out.println(dec2bin(rsv_args_done));
        System.out.println(dec2oct(rsv_args_done));
        System.out.println(dec2hex(rsv_args_done));
    }
    private static List<String> dec2bin(List<Integer> rsv_args) {
        List<String> rt=new ArrayList<>();
        for (Integer ele:rsv_args) {
            rt.add(Integer.toBinaryString(ele));
        }
        return rt;
    }
    private static List<String> dec2oct(List<Integer> rsv_args) {
        List<String> rt=new ArrayList<>();
        for (Integer ele:rsv_args) {
            rt.add(Integer.toOctalString(ele));
        }
        return rt;
    }
    private static List<String> dec2hex(List<Integer> rsv_args) {
        List<String> rt=new ArrayList<>();
        for (Integer ele:rsv_args) {
            rt.add(Integer.toHexString(ele));
        }
        return rt;
    }
}