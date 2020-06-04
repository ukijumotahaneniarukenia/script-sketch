package app;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Set;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class LibraryUtil {
    public static Set<File> getJarFileList(File libDir) throws IOException {
        Set<File>files = doGetJars(libDir);
        return files;
    }
    private static Set<File> doGetJars(File dir) throws IOException {
        Path baseDir = Paths.get(dir.getAbsolutePath());
        String targetExtension = "jar";

        String includeExtensionPtn = ("(?i)^.*\\." + Pattern.quote(targetExtension) + "$"); //完全一致パタンを作成している

        return Files.walk(baseDir)
                .parallel()
                .map(e -> e.toFile())
                .filter(e -> e.isFile())
                .filter(e -> e.getAbsolutePath().matches(includeExtensionPtn))
                .collect(Collectors.toSet());
    }
}
