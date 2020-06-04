package app;

import java.io.File;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Set;
import java.util.stream.Collectors;

public class ClassLoaderUtil {
    public static URLClassLoader newClassLoader(Set<File> files) {
        URL[]urls = files.stream().map(file->getURL(file)).collect(Collectors.toList()).toArray(new URL[0]);
        return new URLClassLoader(urls, null); // これについては下記の※を参照のこと
    }
    private static URL getURL(File file) {
        try {
            return file.toURI().toURL();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
