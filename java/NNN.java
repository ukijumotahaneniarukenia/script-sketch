import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

//https://docs.oracle.com/javase/jp/8/docs/technotes/guides/intl/encoding.doc.html
//https://cero-t.hatenadiary.jp/entry/20110621/1308667569

public class NNN {
    public static void main(String[] rsv_args) {
        List<String> liz = new ArrayList<>(Arrays.asList(rsv_args));
        System.out.println(liz);
        System.out.println(cvt_str_to_utf32(liz));
//        System.out.println(cvt_str_to_utf32be(liz));
//        System.out.println(cvt_str_to_utf32le(liz));
//        System.out.println(cvt_str_to_utf16(liz));
//        System.out.println(cvt_str_to_utf16be(liz));
//        System.out.println(cvt_str_to_utf16le(liz));
        System.out.println(cvt_str_to_utf8(liz));
    }
    private static List<String> cvt_str_to_utf32(List<String> rsv_args){
        List<String> rt = new ArrayList<>();
        for (String ele:rsv_args) {
            byte[] bytes = ele.getBytes(Charset.forName("UTF-32"));
            StringBuilder tmp = new StringBuilder();
            for (int i = 0; i < bytes.length; i++){
                tmp.append("0x"+ String.format("%2s",Integer.toHexString(bytes[i] & 0xFF)).replace(" ","0")+",");
            }
            rt.add(new String(tmp).replaceFirst(",$",""));
        }
        return rt;
    }
    private static List<String> cvt_str_to_utf32be(List<String> rsv_args){
        List<String> rt = new ArrayList<>();
        for (String ele:rsv_args) {
            byte[] bytes = ele.getBytes(Charset.forName("UTF-32BE"));
            StringBuilder tmp = new StringBuilder();
            for (int i = 0; i < bytes.length; i++){
                tmp.append("0x"+ String.format("%2s",Integer.toHexString(bytes[i] & 0xFF)).replace(" ","0")+",");
            }
            rt.add(new String(tmp).replaceFirst(",$",""));
        }
        return rt;
    }
    private static List<String> cvt_str_to_utf32le(List<String> rsv_args){
        List<String> rt = new ArrayList<>();
        for (String ele:rsv_args) {
            byte[] bytes = ele.getBytes(Charset.forName("UTF-32LE"));
            StringBuilder tmp = new StringBuilder();
            for (int i = 0; i < bytes.length; i++){
                tmp.append("0x"+ String.format("%2s",Integer.toHexString(bytes[i] & 0xFF)).replace(" ","0")+",");
            }
            rt.add(new String(tmp).replaceFirst(",$",""));
        }
        return rt;
    }
    private static List<String> cvt_str_to_utf16(List<String> rsv_args){
        List<String> rt = new ArrayList<>();
        for (String ele:rsv_args) {
            byte[] bytes = ele.getBytes(Charset.forName("UTF-16"));
            StringBuilder tmp = new StringBuilder();
            for (int i = 0; i < bytes.length; i++){
                //http://bellks-tec.cocolog-nifty.com/blog/2007/04/unicodejava_d79d.html
                //http://www.fileformat.info/info/charset/UTF-16/index.htm
                tmp.append("0x"+ String.format("%2s",Integer.toHexString(bytes[i] & 0xFF)).replace(" ","0")+",");
            }
            rt.add(new String(tmp).replaceFirst(",$",""));
        }
        return rt;
    }
    private static List<String> cvt_str_to_utf16be(List<String> rsv_args){
        List<String> rt = new ArrayList<>();
        for (String ele:rsv_args) {
            byte[] bytes = ele.getBytes(Charset.forName("UTF-16BE"));
            StringBuilder tmp = new StringBuilder();
            for (int i = 0; i < bytes.length; i++){
                tmp.append("0x"+ String.format("%2s",Integer.toHexString(bytes[i] & 0xFF)).replace(" ","0")+",");
            }
            rt.add(new String(tmp).replaceFirst(",$",""));
        }
        return rt;
    }
    private static List<String> cvt_str_to_utf16le(List<String> rsv_args){
        List<String> rt = new ArrayList<>();
        for (String ele:rsv_args) {
            byte[] bytes = ele.getBytes(Charset.forName("UTF-16LE"));
            StringBuilder tmp = new StringBuilder();
            for (int i = 0; i < bytes.length; i++){
                tmp.append("0x"+ String.format("%2s",Integer.toHexString(bytes[i] & 0xFF)).replace(" ","0")+",");
            }
            rt.add(new String(tmp).replaceFirst(",$",""));
        }
        return rt;
    }
    private static List<String> cvt_str_to_utf8(List<String> rsv_args){
        List<String> rt = new ArrayList<>();
        for (String ele:rsv_args) {
            byte[] bytes = ele.getBytes(Charset.forName("UTF-8"));
            StringBuilder tmp = new StringBuilder();
            for (int i = 0; i < bytes.length; i++){
                //https://www.javadrive.jp/start/ope/index8.html
                //https://kazuhira-r.hatenablog.com/entry/20130224/1361700804
                tmp.append("0x"+ String.format("%2s",Integer.toHexString(bytes[i] & 0xFF)).replace(" ","0")+",");
            }
            rt.add(new String(tmp).replaceFirst(",$",""));
        }
        return rt;
    }
}