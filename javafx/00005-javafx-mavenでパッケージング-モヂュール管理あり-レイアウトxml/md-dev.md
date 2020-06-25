外部依存なしのJREバンドル済み実行可能ファイルの作成

- https://stackoverflow.com/questions/53453212/how-to-deploy-a-javafx-11-desktop-application-with-a-jre


```
mkdir -p build/modules



外部依存ありの場合は--class-pathの引数に参照するjarを追加するはず
jmod create --class-path target/nnn-1.0-SNAPSHOT.jar --main-class app.App build/modules/myapp.jmod


```



- https://gist.github.com/jiro4989/ce33b26cc6136171ad1e8804dddf2b21


--add-moduleはメインメソッドを持つクラスのパッケージ名

--launcherは最終的な実行バイナリファイル名=メインメソッドを持つクラスのパッケージ名

```
rm -rf build/image


これだめ
jlink --output build/image --module-path build/modules:/usr/local/src/javafx-sdk-11.0.2/lib --add-modules app --launcher MyApp=app


これいけた
--module-pathの引数にjmodsを指定する

jlink --output build/image --module-path build/modules:/usr/local/src/javafx-sdk-11.0.2/lib --module-path build/modules:/usr/local/src/javafx-jmods-11.0.2 --add-modules app --launcher MyApp=app

```


できた成果物
```
$ find build/image
build/image
build/image/include
build/image/include/jni.h
build/image/include/jvmti.h
build/image/include/jawt.h
build/image/include/jvmticmlr.h
build/image/include/linux
build/image/include/linux/jni_md.h
build/image/include/linux/jawt_md.h
build/image/include/classfile_constants.h
build/image/conf
build/image/conf/sound.properties
build/image/conf/security
build/image/conf/security/java.security
build/image/conf/security/policy
build/image/conf/security/policy/limited
build/image/conf/security/policy/limited/exempt_local.policy
build/image/conf/security/policy/limited/default_US_export.policy
build/image/conf/security/policy/limited/default_local.policy
build/image/conf/security/policy/unlimited
build/image/conf/security/policy/unlimited/default_US_export.policy
build/image/conf/security/policy/unlimited/default_local.policy
build/image/conf/security/policy/README.txt
build/image/conf/security/java.policy
build/image/conf/net.properties
build/image/bin
build/image/bin/MyApp
build/image/bin/keytool
build/image/bin/java
build/image/bin/jrunscript
build/image/legal
build/image/legal/java.scripting
build/image/legal/java.scripting/LICENSE
build/image/legal/java.scripting/ADDITIONAL_LICENSE_INFO
build/image/legal/java.scripting/ASSEMBLY_EXCEPTION
build/image/legal/java.desktop
build/image/legal/java.desktop/lcms.md
build/image/legal/java.desktop/libpng.md
build/image/legal/java.desktop/LICENSE
build/image/legal/java.desktop/colorimaging.md
build/image/legal/java.desktop/jpeg.md
build/image/legal/java.desktop/ADDITIONAL_LICENSE_INFO
build/image/legal/java.desktop/mesa3d.md
build/image/legal/java.desktop/opengl.md
build/image/legal/java.desktop/giflib.md
build/image/legal/java.desktop/xwindows.md
build/image/legal/java.desktop/harfbuzz.md
build/image/legal/java.desktop/ASSEMBLY_EXCEPTION
build/image/legal/java.datatransfer
build/image/legal/java.datatransfer/LICENSE
build/image/legal/java.datatransfer/ADDITIONAL_LICENSE_INFO
build/image/legal/java.datatransfer/ASSEMBLY_EXCEPTION
build/image/legal/java.base
build/image/legal/java.base/aes.md
build/image/legal/java.base/asm.md
build/image/legal/java.base/LICENSE
build/image/legal/java.base/ADDITIONAL_LICENSE_INFO
build/image/legal/java.base/icu.md
build/image/legal/java.base/cldr.md
build/image/legal/java.base/c-libutl.md
build/image/legal/java.base/ASSEMBLY_EXCEPTION
build/image/legal/java.base/public_suffix.md
build/image/legal/java.base/unicode.md
build/image/legal/java.xml
build/image/legal/java.xml/xerces.md
build/image/legal/java.xml/dom.md
build/image/legal/java.xml/jcup.md
build/image/legal/java.xml/LICENSE
build/image/legal/java.xml/xalan.md
build/image/legal/java.xml/ADDITIONAL_LICENSE_INFO
build/image/legal/java.xml/ASSEMBLY_EXCEPTION
build/image/legal/java.xml/bcel.md
build/image/legal/jdk.unsupported
build/image/legal/jdk.unsupported/LICENSE
build/image/legal/jdk.unsupported/ADDITIONAL_LICENSE_INFO
build/image/legal/jdk.unsupported/ASSEMBLY_EXCEPTION
build/image/legal/java.prefs
build/image/legal/java.prefs/LICENSE
build/image/legal/java.prefs/ADDITIONAL_LICENSE_INFO
build/image/legal/java.prefs/ASSEMBLY_EXCEPTION
build/image/lib
build/image/lib/modules
build/image/lib/libjavajpeg.so
build/image/lib/libjsound.so
build/image/lib/libjava.so
build/image/lib/liblcms.so
build/image/lib/libjawt.so
build/image/lib/libjimage.so
build/image/lib/jli
build/image/lib/jli/libjli.so
build/image/lib/libverify.so
build/image/lib/libmlib_image.so
build/image/lib/libjsig.so
build/image/lib/security
build/image/lib/security/default.policy
build/image/lib/security/public_suffix_list.dat
build/image/lib/security/blacklisted.certs
build/image/lib/security/cacerts
build/image/lib/libprefs.so
build/image/lib/classlist
build/image/lib/libnet.so
build/image/lib/psfont.properties.ja
build/image/lib/libfontmanager.so
build/image/lib/libnio.so
build/image/lib/psfontj2d.properties
build/image/lib/libawt.so
build/image/lib/libzip.so
build/image/lib/jvm.cfg
build/image/lib/libawt_xawt.so
build/image/lib/libawt_headless.so
build/image/lib/server
build/image/lib/server/libjvm.so
build/image/lib/server/libjsig.so
build/image/lib/server/Xusage.txt
build/image/lib/libsplashscreen.so
build/image/lib/jrt-fs.jar
build/image/lib/jexec
build/image/lib/tzdb.dat
build/image/release
```

以下のエラーが出る際は、--module-pathsにjmodsファイル群を追加していないから

```
$ build/image/bin/MyApp
Graphics Device initialization failed for :  es2, sw
Error initializing QuantumRenderer: no suitable pipeline found
java.lang.RuntimeException: java.lang.RuntimeException: Error initializing QuantumRenderer: no suitable pipeline found
	at javafx.graphics/com.sun.javafx.tk.quantum.QuantumRenderer.getInstance(QuantumRenderer.java:280)
	at javafx.graphics/com.sun.javafx.tk.quantum.QuantumToolkit.init(QuantumToolkit.java:222)
	at javafx.graphics/com.sun.javafx.tk.Toolkit.getToolkit(Toolkit.java:260)
	at javafx.graphics/com.sun.javafx.application.PlatformImpl.startup(PlatformImpl.java:267)
	at javafx.graphics/com.sun.javafx.application.PlatformImpl.startup(PlatformImpl.java:158)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.startToolkit(LauncherImpl.java:658)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.launchApplicationWithArgs(LauncherImpl.java:409)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.launchApplication(LauncherImpl.java:363)
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.base/java.lang.reflect.Method.invoke(Method.java:566)
	at java.base/sun.launcher.LauncherHelper$FXHelper.main(LauncherHelper.java:1051)
Caused by: java.lang.RuntimeException: Error initializing QuantumRenderer: no suitable pipeline found
	at javafx.graphics/com.sun.javafx.tk.quantum.QuantumRenderer$PipelineRunnable.init(QuantumRenderer.java:94)
	at javafx.graphics/com.sun.javafx.tk.quantum.QuantumRenderer$PipelineRunnable.run(QuantumRenderer.java:124)
	at java.base/java.lang.Thread.run(Thread.java:834)
Exception in thread "main" java.lang.reflect.InvocationTargetException
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.base/java.lang.reflect.Method.invoke(Method.java:566)
	at java.base/sun.launcher.LauncherHelper$FXHelper.main(LauncherHelper.java:1051)
Caused by: java.lang.RuntimeException: No toolkit found
	at javafx.graphics/com.sun.javafx.tk.Toolkit.getToolkit(Toolkit.java:272)
	at javafx.graphics/com.sun.javafx.application.PlatformImpl.startup(PlatformImpl.java:267)
	at javafx.graphics/com.sun.javafx.application.PlatformImpl.startup(PlatformImpl.java:158)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.startToolkit(LauncherImpl.java:658)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.launchApplicationWithArgs(LauncherImpl.java:409)
	at javafx.graphics/com.sun.javafx.application.LauncherImpl.launchApplication(LauncherImpl.java:363)
	... 5 more
```


できた実行ファイルがポータブルか

```
cp -r build/image $HOME

cd $HOME

zip -r MyApp.zip image/


ls -lh MyApp.zip
-rw-r--r-- 1 kuraine kuraine 35M  6月 25 22:28 MyApp.zip

mv MyApp.zip /tmp

cd /tmp

unzip MyApp.zip

$ ./image/bin/MyApp

(java:376738): dbind-WARNING **: 22:30:13.329: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-zGLYrJngHS: Connection refused
Gtk-Message: 22:30:13.348: Failed to load module "canberra-gtk-module"
Gtk-Message: 22:30:13.348: Failed to load module "canberra-gtk-module"
```

ポータブル！重いけど
