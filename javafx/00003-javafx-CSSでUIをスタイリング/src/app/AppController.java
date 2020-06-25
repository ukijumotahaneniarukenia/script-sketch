package app;

import javafx.event.ActionEvent;
import javafx.scene.control.Label;

public class AppController {
    public Label helloWorld;

    public void sayHelloWorld(ActionEvent actionEvent) {
        helloWorld.setText("Hello World!");
    }
}
