package app;

import sun.net.util.URLUtil;

import java.io.File;
import java.net.JarURLConnection;
import java.net.URL;

public class ClassPathLocator {
    /**
     * 実行中のjarファイルを返す。jarでない場合（開発環境の場合）はクラスパスを返す。
     * @return jarファイル、あるいはクラスパス
     */
    public static File getLocation() {
        // このクラスのリソースURLを求める
        URL classUrl = ClassPathLocator.class.getResource(ClassPathLocator.class.getSimpleName()  + ".class");

        // ドットの数を数えて、このクラスのパッケージ階層数を取得する。
        int pkgHier =  (int)ClassPathLocator.class.getName().chars().filter(c->c == '.').count();

        // このクラスの格納されているjarファイルを取得する。jarでない場合（開発環境の場合）はフォルダを返す。
        return getLocationFromClassUrl(classUrl, pkgHier);
    }

    /**
     * .classのリソースURLからjarファイルを取得する。
     * jarでの実行でない場合（開発環境の場合）はクラスパスを返す。
     * @param url .classのリソースURL
     * @param pkgHier このクラスのパッケージ階層数
     * @return .classがjar内にある場合、そのjarファイル。jarではない場合はそのクラスパス
     */
    static File getLocationFromClassUrl(URL url, int pkgHier) {
        // jar:の場合
        if (url.getProtocol().equals("jar")) {
            try {
                JarURLConnection conn = (JarURLConnection)url.openConnection();
//修正した return new File(conn.getJarFileURL().getFile());
                return URLUtils.getFile(conn.getJarFileURL());
            } catch (Exception ex) {
                return null;
            }
        }

        // file:の場合
        if (url.getProtocol().equals("file")) {
            File file = new File(url.getFile()).getParentFile();
            for (int i = 0; i < pkgHier; i++) file = file.getParentFile();
            return file;
        }

        // ありえない
        throw new RuntimeException("Could not determine jar or file");
    }
}
