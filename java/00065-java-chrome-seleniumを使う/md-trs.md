- 事象

  - chromeのバイナリがみつかんない

```
/usr/local/src/idea-IC-192.7142.36/jbr/bin/java -javaagent:/usr/local/src/idea-IC-192.7142.36/lib/idea_rt.jar=36358:/usr/local/src/idea-IC-192.7142.36/bin -Dfile.encoding=UTF-8 -classpath /home/kuraine/script-sketch/java/00065-java-chrome-seleniumを使う/nnn/target/classes:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-java/3.141.59/selenium-java-3.141.59.jar:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-api/3.141.59/selenium-api-3.141.59.jar:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-chrome-driver/3.141.59/selenium-chrome-driver-3.141.59.jar:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-edge-driver/3.141.59/selenium-edge-driver-3.141.59.jar:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-firefox-driver/3.141.59/selenium-firefox-driver-3.141.59.jar:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-ie-driver/3.141.59/selenium-ie-driver-3.141.59.jar:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-opera-driver/3.141.59/selenium-opera-driver-3.141.59.jar:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-remote-driver/3.141.59/selenium-remote-driver-3.141.59.jar:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-safari-driver/3.141.59/selenium-safari-driver-3.141.59.jar:/home/kuraine/.m2/repository/org/seleniumhq/selenium/selenium-support/3.141.59/selenium-support-3.141.59.jar:/home/kuraine/.m2/repository/net/bytebuddy/byte-buddy/1.8.15/byte-buddy-1.8.15.jar:/home/kuraine/.m2/repository/org/apache/commons/commons-exec/1.3/commons-exec-1.3.jar:/home/kuraine/.m2/repository/com/google/guava/guava/25.0-jre/guava-25.0-jre.jar:/home/kuraine/.m2/repository/com/google/code/findbugs/jsr305/1.3.9/jsr305-1.3.9.jar:/home/kuraine/.m2/repository/org/checkerframework/checker-compat-qual/2.0.0/checker-compat-qual-2.0.0.jar:/home/kuraine/.m2/repository/com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.jar:/home/kuraine/.m2/repository/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar:/home/kuraine/.m2/repository/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14.jar:/home/kuraine/.m2/repository/com/squareup/okhttp3/okhttp/3.11.0/okhttp-3.11.0.jar:/home/kuraine/.m2/repository/com/squareup/okio/okio/1.14.0/okio-1.14.0.jar app.App
[1590503142.463][SEVERE]: bind() failedS:ta rCtainnngo tC harsosmiegDnr irveeqru e8s5t.e0d. 4a1d5d7r.e0s s( c(a9599)5
24a85ef31d74e93ebb0394804fee7322e60-refs/heads/master@{#771782}) on port 18696
Only local connections are allowed.
Please see https://chromedriver.chromium.org/security-considerations for suggestions on keeping ChromeDriver safe.
ChromeDriver was started successfully.
Exception in thread "main" org.openqa.selenium.WebDriverException: unknown error: cannot find Chrome binary
Build info: version: '3.141.59', revision: 'e82be7d358', time: '2018-11-14T08:17:03'
System info: host: 'doc-ubuntu-19-10-vim', ip: '172.17.0.2', os.name: 'Linux', os.arch: 'amd64', os.version: '3.10.0-1062.el7.x86_64', java.version: '11.0.4'
Driver info: driver.version: ChromeDriver
remote stacktrace: #0 0x55d95eb707f9 base::debug::CollectStackTrace()
#1 0x55d95eb0ed93 base::debug::StackTrace::StackTrace()
#2 0x55d95e94cfac Status::Status()
#3 0x55d95e8aaf32 (anonymous namespace)::LaunchDesktopChrome()
#4 0x55d95e8a9124 LaunchChrome()
#5 0x55d95e8da5ce ExecuteInitSession()
#6 0x55d95e8d7573 base::internal::Invoker<>::Run()
#7 0x55d95e8b2426 (anonymous namespace)::ExecuteSessionCommandOnSessionThread()
#8 0x55d95e8b3395 base::internal::Invoker<>::RunOnce()
#9 0x55d95eb342cb base::TaskAnnotator::RunTask()
#10 0x55d95eb41768 base::sequence_manager::internal::ThreadControllerWithMessagePumpImpl::DoWorkImpl()
#11 0x55d95eb41508 base::sequence_manager::internal::ThreadControllerWithMessagePumpImpl::DoWork()
#12 0x55d95eb459aa base::MessagePumpDefault::Run()
#13 0x55d95eb41d15 base::sequence_manager::internal::ThreadControllerWithMessagePumpImpl::Run()
#14 0x55d95eb2aa4e base::RunLoop::Run()
#15 0x55d95eb578f7 base::Thread::ThreadMain()
#16 0x55d95eb7cc8e base::(anonymous namespace)::ThreadFunc()
#17 0x7fa504ea9669 start_thread
#18 0x7fa504804323 clone

	at java.base/jdk.internal.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at java.base/jdk.internal.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at java.base/jdk.internal.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.base/java.lang.reflect.Constructor.newInstance(Constructor.java:490)
	at org.openqa.selenium.remote.W3CHandshakeResponse.lambda$errorHandler$0(W3CHandshakeResponse.java:62)
	at org.openqa.selenium.remote.HandshakeResponse.lambda$getResponseFunction$0(HandshakeResponse.java:30)
	at org.openqa.selenium.remote.ProtocolHandshake.lambda$createSession$0(ProtocolHandshake.java:126)
	at java.base/java.util.stream.ReferencePipeline$3$1.accept(ReferencePipeline.java:195)
	at java.base/java.util.Spliterators$ArraySpliterator.tryAdvance(Spliterators.java:958)
	at java.base/java.util.stream.ReferencePipeline.forEachWithCancel(ReferencePipeline.java:127)
	at java.base/java.util.stream.AbstractPipeline.copyIntoWithCancel(AbstractPipeline.java:502)
	at java.base/java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:488)
	at java.base/java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:474)
	at java.base/java.util.stream.FindOps$FindOp.evaluateSequential(FindOps.java:150)
	at java.base/java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)
	at java.base/java.util.stream.ReferencePipeline.findFirst(ReferencePipeline.java:543)
	at org.openqa.selenium.remote.ProtocolHandshake.createSession(ProtocolHandshake.java:128)
	at org.openqa.selenium.remote.ProtocolHandshake.createSession(ProtocolHandshake.java:74)
	at org.openqa.selenium.remote.HttpCommandExecutor.execute(HttpCommandExecutor.java:136)
	at org.openqa.selenium.remote.service.DriverCommandExecutor.execute(DriverCommandExecutor.java:83)
	at org.openqa.selenium.remote.RemoteWebDriver.execute(RemoteWebDriver.java:552)
	at org.openqa.selenium.remote.RemoteWebDriver.startSession(RemoteWebDriver.java:213)
	at org.openqa.selenium.remote.RemoteWebDriver.<init>(RemoteWebDriver.java:131)
	at org.openqa.selenium.chrome.ChromeDriver.<init>(ChromeDriver.java:181)
	at org.openqa.selenium.chrome.ChromeDriver.<init>(ChromeDriver.java:168)
	at org.openqa.selenium.chrome.ChromeDriver.<init>(ChromeDriver.java:123)
	at app.App.main(App.java:10)

Process finished with exit code 1
```

- 原因

```
Exception in thread "main" org.openqa.selenium.WebDriverException: unknown error: cannot find Chrome binary
```


- 対応


```
ChromeOptions options = new ChromeOptions();
options.setBinary("/usr/local/src/chrome-linux/chrome");//chrome binaryまでのファイルパスを指定

//https://stackoverflow.com/questions/50642308/webdriverexception-unknown-error-devtoolsactiveport-file-doesnt-exist-while-t
options.addArguments("--no-sandbox"); // Bypass OS security model これだけで一応立つ

WebDriver driver = new ChromeDriver(options);// Chromeドライバーインスタンスを作成する
```

- 予防

```

```
