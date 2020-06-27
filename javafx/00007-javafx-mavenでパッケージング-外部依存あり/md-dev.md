外部依存ありの場合は、fatjarを作成してから最小jreを作成する

jre作成後、zipで梱包し、配布

```
mkdir wrksp

cd wrksp

cp /home/kuraine/script-sketch/javafx/00007-javafx-mavenでパッケージング-外部依存あり/target/nnn-1.0-SNAPSHOT-jar-with-dependencies.jar .

jdeps --module-path /usr/local/src/javafx-sdk-11.0.2/lib nnn-1.0-SNAPSHOT-jar-with-dependencies.jar


jlink --compress=2 --module-path /usr/local/src/javafx-jmods-11.0.2 --add-modules java.base,javafx.controls,javafx.fxml,javafx.graphics --output jre-min

du -sh jre-min
62M	jre-min

jre-min/bin/java -jar nnn-1.0-SNAPSHOT-jar-with-dependencies.jar

(java:392608): dbind-WARNING **: 16:11:05.462: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-zGLYrJngHS: Connection refused
Gtk-Message: 16:11:05.481: Failed to load module "canberra-gtk-module"
Gtk-Message: 16:11:05.482: Failed to load module "canberra-gtk-module"
```
