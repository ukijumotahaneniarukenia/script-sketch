```
$cd ~/script-sketch/java-webflex
$cd 00001-java-webflex-テスト/nnn/
$mvn clean package
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------< app:nnn >-------------------------------
[INFO] Building nnn 0.1.0
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] --- maven-clean-plugin:3.1.0:clean (default-clean) @ nnn ---
[INFO] Deleting /home/kuraine/script-sketch/java-webflex/00001-java-webflex-テスト/nnn/target
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ nnn ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /home/kuraine/script-sketch/java-webflex/00001-java-webflex-テスト/nnn/src/main/resources
[INFO] skip non existing resourceDirectory /home/kuraine/script-sketch/java-webflex/00001-java-webflex-テスト/nnn/src/main/resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ nnn ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 4 source files to /home/kuraine/script-sketch/java-webflex/00001-java-webflex-テスト/nnn/target/classes
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:testResources (default-testResources) @ nnn ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /home/kuraine/script-sketch/java-webflex/00001-java-webflex-テスト/nnn/src/test/resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ nnn ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /home/kuraine/script-sketch/java-webflex/00001-java-webflex-テスト/nnn/target/test-classes
[INFO]
[INFO] --- maven-surefire-plugin:2.22.2:test (default-test) @ nnn ---
[INFO]
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running app.AppTest
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.002 s - in app.AppTest
[INFO]
[INFO] Results:
[INFO]
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
[INFO]
[INFO]
[INFO] --- maven-jar-plugin:3.1.2:jar (default-jar) @ nnn ---
[INFO] Building jar: /home/kuraine/script-sketch/java-webflex/00001-java-webflex-テスト/nnn/target/nnn-0.1.0.jar
[INFO]
[INFO] --- spring-boot-maven-plugin:2.2.4.RELEASE:repackage (repackage) @ nnn ---
[INFO] Replacing main artifact with repackaged archive
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  2.370 s
[INFO] Finished at: 2020-04-26T23:45:34+09:00
[INFO] ------------------------------------------------------------------------
```

```
$cd ~/script-sketch/java-webflex
$cd 00001-java-webflex-テスト/nnn/
$java -jar target/nnn-0.1.0.jar

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.2.4.RELEASE)

2020-04-26 23:46:02.561  INFO 21365 --- [           main] app.Application                          : Starting Application v0.1.0 on centos-7-6-18-10-java-maven-idea with PID 21365 (/home/kuraine/script-sketch/java-webflex/00001-java-webflex-テスト/nnn/target/nnn-0.1.0.jar started by kuraine in /home/kuraine/script-sketch/java-webflex/00001-java-webflex-テスト/nnn)
2020-04-26 23:46:02.564  INFO 21365 --- [           main] app.Application                          : No active profile set, falling back to default profiles: default
2020-04-26 23:46:03.542  INFO 21365 --- [           main] o.s.b.web.embedded.netty.NettyWebServer  : Netty started on port(s): 8080
2020-04-26 23:46:03.544  INFO 21365 --- [           main] app.Application                          : Started Application in 1.236 seconds (JVM running for 1.506)
```

ポータブル化チェック

```
$cd ~/script-sketch/java-webflex
$cd 00001-java-webflex-テスト/nnn/
$cp target/nnn-0.1.0.jar ../../
$cd ../../
$java -jar nnn-0.1.0.jar

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.2.4.RELEASE)

2020-04-26 23:47:57.945  INFO 21416 --- [           main] app.Application                          : Starting Application v0.1.0 on centos-7-6-18-10-java-maven-idea with PID 21416 (/home/kuraine/script-sketch/java-webflex/nnn-0.1.0.jar started by kuraine in /home/kuraine/script-sketch/java-webflex)
2020-04-26 23:47:57.947  INFO 21416 --- [           main] app.Application                          : No active profile set, falling back to default profiles: default
2020-04-26 23:47:58.722  INFO 21416 --- [           main] o.s.b.web.embedded.netty.NettyWebServer  : Netty started on port(s): 8080
2020-04-26 23:47:58.725  INFO 21416 --- [           main] app.Application                          : Started Application in 1.032 seconds (JVM running for 1.298)
^Ckuraine centos-7-6-18-10-java-maven-idea ~/script-sketch/java-webflex$
```
