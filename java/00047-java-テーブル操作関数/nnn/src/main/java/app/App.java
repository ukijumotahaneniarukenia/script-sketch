package app;

import tech.tablesaw.api.Table;

import java.io.File;
import java.io.IOException;

public class App {
    public static void main( String[] args ) throws IOException {
        File f = new File("test3.csv");//javaファイルが存在しているフォルダに対象データファイルを配備する以外はエラー
        Table table = Table.read().csv(f);

//        table.columns().stream().collect(Collectors.toList()).forEach(e-> System.out.println(e));//すげぇー型推論している。

        Table xtable = table.xTabCounts("ID","LABEL");

        System.out.println(xtable);
    }
}
