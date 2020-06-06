初回セットアップ時のideaのログ

gradle-6-1を使用している

```
Download https://services.gradle.org/distributions/gradle-6.1-bin.zip (97.47 MB)
Download https://services.gradle.org/distributions/gradle-6.1-bin.zip finished succeeded, took 2 m 27 s 42 ms
Gradle Daemon started in 565 ms
Download https://github.com/yarnpkg/yarn/releases/download/v1.21.1/yarn-v1.21.1.tar.gz
warning workspace-aggregator-3449ea5f-4c51-484f-aabd-ed93a08417ad > confexplorer > webpack-dev-server > chokidar@2.1.8: Chokidar 2 will break on node v14+. Upgrade to chokidar 3 with 15x less dependencies.
warning workspace-aggregator-3449ea5f-4c51-484f-aabd-ed93a08417ad > confexplorer-test > mocha > mkdirp@0.5.1: Legacy versions of mkdirp are no longer supported. Please update to mkdirp 1.x. (Note that the API surface has changed to use Promises in 1.x.)
warning workspace-aggregator-3449ea5f-4c51-484f-aabd-ed93a08417ad > confexplorer > webpack-dev-server > chokidar > fsevents@1.2.13: fsevents 1 will break on node v14+ and could be using insecure binaries. Upgrade to fsevents 2.
warning workspace-aggregator-3449ea5f-4c51-484f-aabd-ed93a08417ad > confexplorer > webpack > watchpack > watchpack-chokidar2 > chokidar@2.1.8: Chokidar 2 will break on node v14+. Upgrade to chokidar 3 with 15x less dependencies.
warning workspace-aggregator-3449ea5f-4c51-484f-aabd-ed93a08417ad > confexplorer > webpack-dev-server > chokidar > braces > snapdragon > source-map-resolve > resolve-url@0.2.1: https://github.com/lydell/resolve-url#deprecated
warning workspace-aggregator-3449ea5f-4c51-484f-aabd-ed93a08417ad > confexplorer > webpack-dev-server > chokidar > braces > snapdragon > source-map-resolve > urix@0.1.0: Please see https://github.com/lydell/urix#deprecated
warning sha.js@2.4.11: Invalid bin entry for "sha.js" (in "sha.js").
warning "workspace-aggregator-3449ea5f-4c51-484f-aabd-ed93a08417ad > confexplorer > styled-components@5.1.1" has unmet peer dependency "react-is@>= 16.8.0".

CONFIGURE SUCCESSFUL in 4m 21s

```

ブラウザの起動

これを行うときはJAVA_HOME等設定する必要あり

```

ERROR: JAVA_HOME is set to an invalid directory: /usr/local/src/jdk-11

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation.


```

```

フォアグラウンド
$ ./gradlew browserDevelopmentRun --continuous 1>launch-kotlin-js-gradle-web.log 2>&1 </dev/null

バッグブランド
$ ./gradlew browserDevelopmentRun --continuous 1>launch-kotlin-js-gradle-web.log 2>&1 </dev/null &

```

ideaのGUIタスク実行時のログは以下


browserDevelopmentRunタスクが出力されればアクセスしてOK

```
9:04:32: Executing task 'browserDevelopmentRun'...

> Task :packageJson
> Task :kotlinNodeJsSetup SKIPPED
> Task :kotlinNpmInstall
> Task :compileKotlinJs
> Task :processResources
> Task :browserDevelopmentRun

```

ブラウザにアクセス

- http://localhost:8080/


GUIから実行すると停止がうまくできないので、CUIから行ったほうがいいかも


chrome起動

```
chrome --no-sandbox 1>$HOME/launch-chrome.log 2>&1 &
```