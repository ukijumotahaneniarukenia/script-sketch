module app {
    requires javafx.controls;
    requires javafx.fxml;

    opens app to javafx.fxml;


    //外部ライブラリとして参照しているjarファイルのパッケージ名を記載する
//    requires com.ibm.icu;

    exports app;
}