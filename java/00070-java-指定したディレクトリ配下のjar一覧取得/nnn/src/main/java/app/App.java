package app;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class App {
    public static void main(String[] args) throws IOException {

        Path baseDir = Paths.get("/home/kuraine/.gradle/caches/modules-2/files-2.1");
        String targetExtension  = "jar";

        String includeExtensionPtn = ("(?i)^.*\\." + Pattern.quote(targetExtension) + "$"); //完全一致パタンを作成している

        List<File> filePathList = Files.walk(baseDir)
                .parallel()
                .map(e->e.toFile())
                .filter(e->e.isFile())
                .filter(e->e.getAbsolutePath().matches(includeExtensionPtn))
                .collect(Collectors.toList());

        filePathList.stream().forEach(e-> System.out.println(e));
    }
}