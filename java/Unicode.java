import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Unicode {
    public static void main(String[] rsv_args) {
        List<String> liz = new ArrayList<>(Arrays.asList(rsv_args));
//        System.out.println(cvt_str_to_uni(liz));
        System.out.println(cnv_uni_to_str(liz));
    }
    /*
      Usage
        $java Unicode うんこ 💗
      Output
        [\u3046\u3093\u3053, \uD83D\uDC97]
     */
    private static List<String> cvt_str_to_uni(List<String> rsv_args) {
        List<String> rt = new ArrayList<>();
        for (String ele:rsv_args) {
            StringBuilder tmp = new StringBuilder();
            for (int i = 0; i < ele.length(); i++) {
                tmp.append(String.format("\\u%04X", (int)ele.charAt(i)));
            }
            rt.add(tmp.toString());
        }
        return rt;
    }
    /*
      Usage
        $java Unicode \\u3046\\u3093\\u3053 \\uD83D\\uDC97
      Output
        [うんこ, 💗]
     */
    private static List<String> cnv_uni_to_str(List<String> rsv_args) {
        List<String> rt = new ArrayList<>();
        for (String ele:rsv_args) {
            String[] ele_ary = ele.split("\\\\u");
            char[] pool = new char[ele_ary.length - 1];
            for (int i = 0; i < pool.length; i++) {
                pool[i] = (char)Integer.parseInt(ele_ary[i + 1], 16);
            }
            rt.add(new String(pool));
        }
        return rt;
    }
}