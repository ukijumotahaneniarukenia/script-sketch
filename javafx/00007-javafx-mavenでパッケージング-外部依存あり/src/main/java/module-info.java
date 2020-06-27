module app {
    requires javafx.controls;
    requires javafx.fxml;

    requires com.ibm.icu;

    opens app to javafx.fxml;
    exports app;
}