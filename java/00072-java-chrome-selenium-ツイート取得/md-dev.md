- 実行方法
```

$ java -cp "nnn-1.0-SNAPSHOT/*:nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar" app.App 10 2>/dev/null | tee shellgei-twitter.log &

```


- chrominumのインストール

  - https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64/

- chorminum driverのインストール

  - https://sites.google.com/a/chromium.org/chromedriver/downloads

- selenium便利

  - https://chivsp.hatenablog.com/entry/2019/11/25/090000




graalvmで単一実行バイナリの生成はかなりバギー（今回のケースだと）

こういうのはpythonのほうがよさげか


```


$ mkdir $HOME/wrksp

$ cd  $HOME/wrksp

$ cp /home/kuraine/script-sketch/java/00072-java-chrome-selenium-ツイート取得/nnn/target/nnn-1.0-SNAPSHOT-bin.tar.bz2 .

$ tar xvf nnn-1.0-SNAPSHOT-bin.tar.bz2

$ native-image --allow-incomplete-classpath --enable-https --enable-http --no-fallback -cp "nnn-1.0-SNAPSHOT/*" -jar nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar testcmd
Build on Server(pid: 7531, port: 40197)
[testcmd:7531]    classlist:     964.06 ms,  5.01 GB
[testcmd:7531]        (cap):     248.48 ms,  5.01 GB
[testcmd:7531]        setup:     412.72 ms,  5.01 GB
WARNING GR-10238: VarHandle for static field is currently not fully supported. Static field private static volatile java.lang.System$Logger jdk.internal.event.EventHelper.securityLogger is not properly marked for Unsafe access!
[testcmd:7531]     (clinit):     250.15 ms,  5.00 GB
[testcmd:7531]   (typeflow):   8,213.03 ms,  5.00 GB
[testcmd:7531]    (objects):  14,147.44 ms,  5.00 GB
[testcmd:7531]   (features):     287.27 ms,  5.00 GB
[testcmd:7531]     analysis:  23,389.77 ms,  5.00 GB
[testcmd:7531]     universe:     357.88 ms,  5.00 GB
[testcmd:7531]      (parse):     852.61 ms,  4.61 GB
[testcmd:7531]     (inline):     688.60 ms,  4.61 GB
[testcmd:7531]    (compile):   4,845.03 ms,  4.55 GB
[testcmd:7531]      compile:   7,175.78 ms,  4.55 GB
[testcmd:7531]        image:   1,409.62 ms,  4.55 GB
[testcmd:7531]        write:     261.11 ms,  4.55 GB
[testcmd:7531]      [total]:  34,016.32 ms,  4.55 GB

激重バイナリ爆誕

$ ls -lh
total 35M
drwxr-xr-x 2 kuraine kuraine 4.0K  6月  9 02:06 nnn-1.0-SNAPSHOT
-rw-r--r-- 1 kuraine kuraine 6.8M  6月  9 02:06 nnn-1.0-SNAPSHOT-bin.tar.bz2
drwxr-xr-x 2 kuraine kuraine 4.0K  6月  9 02:11 pic
-rwxr-xr-x 1 kuraine kuraine  28M  6月  9 02:19 testcmd


java -jarで実行したほうがよさげ

$ ./testcmd
Exception in thread "main" java.lang.ExceptionInInitializerError
	at com.oracle.svm.core.hub.ClassInitializationInfo.initialize(ClassInitializationInfo.java:290)
	at java.lang.Class.ensureInitialized(DynamicHub.java:499)
	at okhttp3.ConnectionPool.<clinit>(ConnectionPool.java:52)
	at com.oracle.svm.core.hub.ClassInitializationInfo.invokeClassInitializer(ClassInitializationInfo.java:350)
	at com.oracle.svm.core.hub.ClassInitializationInfo.initialize(ClassInitializationInfo.java:270)
	at java.lang.Class.ensureInitialized(DynamicHub.java:499)
	at org.openqa.selenium.remote.internal.OkHttpClient$Factory.<init>(OkHttpClient.java:116)
	at org.openqa.selenium.remote.http.HttpClient$Factory.createDefault(HttpClient.java:66)
	at org.openqa.selenium.remote.HttpCommandExecutor.<clinit>(HttpCommandExecutor.java:47)
	at com.oracle.svm.core.hub.ClassInitializationInfo.invokeClassInitializer(ClassInitializationInfo.java:350)
	at com.oracle.svm.core.hub.ClassInitializationInfo.initialize(ClassInitializationInfo.java:270)
	at java.lang.Class.ensureInitialized(DynamicHub.java:499)
	at com.oracle.svm.core.hub.ClassInitializationInfo.initialize(ClassInitializationInfo.java:235)
	at java.lang.Class.ensureInitialized(DynamicHub.java:499)
	at com.oracle.svm.core.hub.ClassInitializationInfo.initialize(ClassInitializationInfo.java:235)
	at java.lang.Class.ensureInitialized(DynamicHub.java:499)
	at org.openqa.selenium.chrome.ChromeDriver.<init>(ChromeDriver.java:181)
	at org.openqa.selenium.chrome.ChromeDriver.<init>(ChromeDriver.java:168)
	at org.openqa.selenium.chrome.ChromeDriver.<init>(ChromeDriver.java:157)
	at app.App.main(App.java:49)
Caused by: java.nio.charset.UnsupportedCharsetException: UTF-32BE
	at java.nio.charset.Charset.forName(Charset.java:529)
	at okhttp3.internal.Util.<clinit>(Util.java:73)
	at com.oracle.svm.core.hub.ClassInitializationInfo.invokeClassInitializer(ClassInitializationInfo.java:350)
	at com.oracle.svm.core.hub.ClassInitializationInfo.initialize(ClassInitializationInfo.java:270)
	... 19 more


```
