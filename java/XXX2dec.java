import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class XXX2dec {
    public static void main(String[] rsv_args) {
        List<String> liz = new ArrayList<>(Arrays.asList(rsv_args));
        System.out.println(bin2XXX(liz));
        System.out.println(oct2XXX(liz));
        System.out.println(hex2XXX(liz));
    }
    private static List<Integer> bin2XXX(List<String> rsv_args) {
        List<Integer> rt=new ArrayList<>();
        for (String ele:rsv_args) {
            rt.add(Integer.parseInt(ele,2));
        }
        return rt;
    }
    private static List<Integer> oct2XXX(List<String> rsv_args) {
        List<Integer> rt=new ArrayList<>();
        for (String ele:rsv_args) {
            rt.add(Integer.parseInt(ele,8));
        }
        return rt;
    }
    private static List<Integer> hex2XXX(List<String> rsv_args) {
        List<Integer> rt=new ArrayList<>();
        for (String ele:rsv_args) {
            rt.add(Integer.parseInt(ele,16));
        }
        return rt;
    }
}
