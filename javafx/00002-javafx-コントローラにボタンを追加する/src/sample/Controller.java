package sample;

import javafx.event.ActionEvent;
import javafx.scene.control.Label;

//https://pleiades.io/help/idea/developing-a-javafx-application-examples.html#rename-refactoring

public class Controller {

    public Label helloWorld; //ラベル設定項目名

    public void sayHelloWorld(ActionEvent actionEvent) {
        helloWorld.setText("ハローワールド"); //ラベル設定項目値
    }
}
