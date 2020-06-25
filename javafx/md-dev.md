- https://openjfx.io/
  - JavaFX Linux SDKをダウンロード


解凍

```
unzip openjfx-11.0.2_linux-x64_bin-sdk.zip
```

Project Structure->Librariesに以下を追加


```
/usr/local/src/javafx-sdk-11.0.2/lib
```



VM Options追加前

```
 /usr/local/src/jdk-11/bin/java --add-modules javafx.base,javafx.graphics --add-reads javafx.base=ALL-UNNAMED --add-reads javafx.graphics=ALL-UNNAMED -Djava.library.path=/usr/local/src/javafx-sdk-11.0.2/lib -javaagent:/usr/local/src/idea-IC-201.7846.76/lib/idea_rt.jar=33005:/usr/local/src/idea-IC-201.7846.76/bin -Dfile.encoding=UTF-8 -classpath /home/kuraine/wrksp/out/production/wrksp:/usr/local/src/javafx-sdk-11.0.2/lib/src.zip:/usr/local/src/javafx-sdk-11.0.2/lib/javafx-swt.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.web.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.base.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.fxml.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.media.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.swing.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.controls.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.graphics.jar -p /usr/local/src/javafx-sdk-11.0.2/lib/javafx.base.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.graphics.jar sample.Main

(java:352173): dbind-WARNING **: 07:51:46.552: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-zGLYrJngHS: Connection refused
Gtk-Message: 07:51:46.580: Failed to load module "canberra-gtk-module"
Gtk-Message: 07:51:46.583: Failed to load module "canberra-gtk-module"
Exception in Application start method
java.lang.reflect.InvocationTargetException
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.base/java.lang.reflect.Method.invoke(Method.java:566)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.launchApplicationWithArgs(LauncherImpl.java:464)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.launchApplication(LauncherImpl.java:363)
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.base/java.lang.reflect.Method.invoke(Method.java:566)
	at java.base/sun.launcher.LauncherHelper$FXHelper.main(LauncherHelper.java:1051)
Caused by: java.lang.RuntimeException: Exception in Application start method
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.launchApplication1(LauncherImpl.java:900)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.lambda$launchApplication$2(LauncherImpl.java:195)
	at java.base/java.lang.Thread.run(Thread.java:834)
Caused by: java.lang.IllegalAccessError: class com.sun.javafx.fxml.FXMLLoaderHelper (in unnamed module @0xaa6087c) cannot access class com.sun.javafx.util.Utils (in module javafx.graphics) because module javafx.graphics does not export com.sun.javafx.util to unnamed module @0xaa6087c
	at com.sun.javafx.fxml.FXMLLoaderHelper.<clinit>(FXMLLoaderHelper.java:38)
	at javafx.fxml.FXMLLoader.<clinit>(FXMLLoader.java:2056)
	at sample.Main.start(Main.java:13)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.lambda$launchApplication1$9(LauncherImpl.java:846)
	at javafx.graphics/com.sun.javafx.application.PlatformImpl.lambda$runAndWait$12(PlatformImpl.java:455)
	at javafx.graphics/com.sun.javafx.application.PlatformImpl.lambda$runLater$10(PlatformImpl.java:428)
	at java.base/java.security.AccessController.doPrivileged(Native Method)
	at javafx.graphics/com.sun.javafx.application.PlatformImpl.lambda$runLater$11(PlatformImpl.java:427)
	at javafx.graphics/com.sun.glass.ui.InvokeLaterDispatcher$Future.run(InvokeLaterDispatcher.java:96)
	at javafx.graphics/com.sun.glass.ui.gtk.GtkApplication._runLoop(Native Method)
	at javafx.graphics/com.sun.glass.ui.gtk.GtkApplication.lambda$runLoop$11(GtkApplication.java:277)
	... 1 more
Exception running application sample.Main

Process finished with exit code 1
```

ツールバーのRUN->Edit Configuration->VM Optionsに以下を追加

```
--module-path /usr/local/src/javafx-sdk-11.0.2/lib --add-modules javafx.controls,javafx.fxml
```

VM Options追加後


```
/usr/local/src/jdk-11/bin/java --module-path /usr/local/src/javafx-sdk-11.0.2/lib --add-modules javafx.controls,javafx.fxml --add-modules javafx.base,javafx.graphics --add-reads javafx.base=ALL-UNNAMED --add-reads javafx.graphics=ALL-UNNAMED -Djava.library.path=/usr/local/src/javafx-sdk-11.0.2/lib -javaagent:/usr/local/src/idea-IC-201.7846.76/lib/idea_rt.jar=43697:/usr/local/src/idea-IC-201.7846.76/bin -Dfile.encoding=UTF-8 -classpath /home/kuraine/wrksp/out/production/wrksp:/usr/local/src/javafx-sdk-11.0.2/lib/src.zip:/usr/local/src/javafx-sdk-11.0.2/lib/javafx-swt.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.web.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.base.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.fxml.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.media.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.swing.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.controls.jar:/usr/local/src/javafx-sdk-11.0.2/lib/javafx.graphics.jar sample.Main

(java:352356): dbind-WARNING **: 07:55:09.465: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-zGLYrJngHS: Connection refused
Gtk-Message: 07:55:09.485: Failed to load module "canberra-gtk-module"
Gtk-Message: 07:55:09.486: Failed to load module "canberra-gtk-module"

Process finished with exit code 0
```



関連するjarなど

```
find /usr/local/src/javafx-sdk-11.0.2/lib | grep -P jar$
```

```
/usr/local/src/javafx-sdk-11.0.2/lib/javafx-swt.jar
/usr/local/src/javafx-sdk-11.0.2/lib/javafx.media.jar
/usr/local/src/javafx-sdk-11.0.2/lib/javafx.controls.jar
/usr/local/src/javafx-sdk-11.0.2/lib/javafx.base.jar
/usr/local/src/javafx-sdk-11.0.2/lib/javafx.web.jar
/usr/local/src/javafx-sdk-11.0.2/lib/javafx.fxml.jar
/usr/local/src/javafx-sdk-11.0.2/lib/javafx.swing.jar
/usr/local/src/javafx-sdk-11.0.2/lib/javafx.graphics.jar
```




外部依存なしの最小ポータブルJRE環境の作成

最小構成のJREを作成するため、依存関係を出力

```
$ jdeps --module-path /usr/local/src/javafx-sdk-11.0.2/lib nnn-1.0-SNAPSHOT.jar
app
 [file:///home/kuraine/script-sketch/javafx/wrksp/nnn-1.0-SNAPSHOT.jar]
   requires mandated java.base (@11)
   requires javafx.controls
   requires javafx.fxml
app -> java.base
app -> javafx.fxml
app -> javafx.graphics
   app                                                -> java.io                                            java.base
   app                                                -> java.lang                                          java.base
   app                                                -> java.lang.invoke                                   java.base
   app                                                -> java.net                                           java.base
   app                                                -> javafx.application                                 javafx.graphics
   app                                                -> javafx.fxml                                        javafx.fxml
   app                                                -> javafx.scene                                       javafx.graphics
   app                                                -> javafx.stage                                       javafx.graphics
```

外部ライブラリ依存なしのポータブルJRE

```
$ jlink --compress=2 --module-path /usr/local/src/javafx-jmods-11.0.2 --add-modules java.base,javafx.controls,javafx.fxml,javafx.graphics --output jre-min
```

実行

```
$ jre-min/bin/java -jar nnn-1.0-SNAPSHOT.jar
```
