- https://git-scm.com/book/ja/v2/Git-%E3%81%AE%E5%9F%BA%E6%9C%AC-%E3%82%B3%E3%83%9F%E3%83%83%E3%83%88%E5%B1%A5%E6%AD%B4%E3%81%AE%E9%96%B2%E8%A6%A7

以下の作業は全てdockerコンテナ内で完結

herokuの認証でブラウザが必要なので、firefoxなどをインストールしておく

```

$ apt install -y firefox

```

環境など

```

$ cat /etc/os-release
NAME="Ubuntu"
VERSION="18.04.4 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.4 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic


$ uname -r
3.10.0-1062.el7.x86_64

```

デプロイ用のビルドを実行

```
$ cd kotlin-react-web


$ ./gradlew build

BUILD SUCCESSFUL in 10s
11 actionable tasks: 11 executed
```


静的資産が生成される

```
$ find | grep distributions
./build/distributions
./build/distributions/12.js.map
./build/distributions/12.js
./build/distributions/8.js.map
./build/distributions/7.js
./build/distributions/9.js.map
./build/distributions/11.js.map
./build/distributions/4.js.map
./build/distributions/6.js.map
./build/distributions/2.js.map
./build/distributions/5.js.map
./build/distributions/11.js
./build/distributions/2.js
./build/distributions/5.js
./build/distributions/1.js.map
./build/distributions/8.js
./build/distributions/confexplorer.js
./build/distributions/7.js.map
./build/distributions/confexplorer.js.map
./build/distributions/4.js
./build/distributions/3.js.map
./build/distributions/10.js.map
./build/distributions/index.html
./build/distributions/3.js
./build/distributions/10.js
./build/distributions/6.js
./build/distributions/9.js
./build/distributions/1.js
```

git管理にする


```

$ cd kotlin-react-web

$ ls
01.png  02.png  03.png  04.png  build  build.gradle.kts  gradle  gradle.properties  gradlew  gradlew.bat  launch-kotlin-js-gradle-web.log  md-dev.md  settings.gradle.kts  src


$ git init
Initialized empty Git repository in /home/kuraine/kotlin-react-web/.git/


ログイン画面でherokuのユーザー名とパスワードを入力する

うまくいくと標準出力に以下のように出力される

$ heroku create
Creating app... !
 ▸    Invalid credentials provided.
heroku: Press any key to open up the browser to login or q to exit:
Opening browser to https://cli-auth.heroku.com/auth/cli/browser/60f71a49-b3b5-4c0d-b1af-d3db5733ce85
Logging in... done
Logged in as mrchildrenkh1008@gmail.com
Creating app... done, ⬢ thawing-ocean-64707
https://thawing-ocean-64707.herokuapp.com/ | https://git.heroku.com/thawing-ocean-64707.git

```

webが以下のURLで

- https://thawing-ocean-64707.herokuapp.com/


webの資産は以下のURLで

- https://git.heroku.com/thawing-ocean-64707.git


以下のURLにアクセスしてページでればおｋ

まだ資産をコミットしていないので、テストページが表示されている

- https://thawing-ocean-64707.herokuapp.com/


いろいろまじっているが、これでやってみる

```
$ git add .
$ git commit -m "initial commit"
[master (root-commit) 852fde4] initial commit
 21 files changed, 776 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 01.png
 create mode 100644 02.png
 create mode 100644 03.png
 create mode 100644 04.png
 create mode 100644 build.gradle.kts
 create mode 100644 gradle.properties
 create mode 100644 gradle/wrapper/gradle-wrapper.jar
 create mode 100644 gradle/wrapper/gradle-wrapper.properties
 create mode 100755 gradlew
 create mode 100644 gradlew.bat
 create mode 100644 launch-kotlin-js-gradle-web.log
 create mode 100644 md-dev.md
 create mode 100644 settings.gradle.kts
 create mode 100644 src/main/kotlin/App.kt
 create mode 100644 src/main/kotlin/Main.kt
 create mode 100644 src/main/kotlin/ReactPlayer.kt
 create mode 100644 src/main/kotlin/ReactShare.kt
 create mode 100644 src/main/kotlin/VideoList.kt
 create mode 100644 src/main/kotlin/VideoPlayer.kt
 create mode 100644 src/main/resources/index.html

```

デプロイ時、資産がgradleプロジェクトであることをherokuサーバに伝えるため、以下のコマンドを実行

```

$ heroku buildpacks:set heroku/gradle
Buildpack set. Next release on thawing-ocean-64707 will use heroku/gradle.
Run git push heroku master to create a new release using this buildpack.



$ heroku buildpacks:add https://github.com/heroku/heroku-buildpack-static.git
Buildpack added. Next release on thawing-ocean-64707 will use:
  1. heroku/gradle
  2. https://github.com/heroku/heroku-buildpack-static.git
Run git push heroku master to create a new release using these buildpacks.

```

静的資産をwebサーバが認識できるように**static.json**ファイルを以下のように作成

```
$ ls ./build/distributions
1.js      10.js      11.js      12.js      2.js      3.js      4.js      5.js      6.js      7.js      8.js      9.js      confexplorer.js      index.html
1.js.map  10.js.map  11.js.map  12.js.map  2.js.map  3.js.map  4.js.map  5.js.map  6.js.map  7.js.map  8.js.map  9.js.map  confexplorer.js.map


build/distributions配下の資産を上げる

$ cat <<EOS > static.json
{
  "root": "build/distributions"
}
EOS
```

.gitignoreには以下を記載（これ大事だと思う）

```
$ cd kotlin-react-web
$ cat .gitignore
/.gradle/*
/.idea/*
/build/libs/*
/build/tmp/*
/build/processedResources/*
/build/reports/*
/build/kotlin/*
/build/js/*
```

デプロイタスクを追加してもういちどビルド

```
// Heroku Deployment (chapter 9)
tasks.register("stage") {
    dependsOn("build")
}
```

```
$ ./gradlew build

BUILD SUCCESSFUL in 7s
11 actionable tasks: 3 executed, 8 up-to-date

```

コミット資産を確認

- https://git-scm.com/book/ja/v2/Git-%E3%81%AE%E5%9F%BA%E6%9C%AC-%E3%82%B3%E3%83%9F%E3%83%83%E3%83%88%E5%B1%A5%E6%AD%B4%E3%81%AE%E9%96%B2%E8%A6%A7

```
$ cd kotlin-react-web

$ git log
commit 2519793b4c8d5dd9fe437f02771681185fbb6b50 (HEAD -> master)
Author: ukijumotahaneniarukenia <mrchildrenkh1008@gmail.com>
Date:   Sun May 31 15:45:01 2020 +0900

    add stage task and static content root configuration

commit 852fde4545139da551de89fe6b84fa1c957dcad9
Author: ukijumotahaneniarukenia <mrchildrenkh1008@gmail.com>
Date:   Sun May 31 15:29:52 2020 +0900

    initial commit
```

資産ファイル名の確認

```
$ git log --name-status >/tmp/git-commit-asset-list.txt


$ cat /tmp/git-commit-asset-list.txt
commit 2519793b4c8d5dd9fe437f02771681185fbb6b50
Author: ukijumotahaneniarukenia <mrchildrenkh1008@gmail.com>
Date:   Sun May 31 15:45:01 2020 +0900

    add stage task and static content root configuration

M	.gitignore
M	build.gradle.kts
A	build/distributions/1.js
A	build/distributions/1.js.map
A	build/distributions/10.js
A	build/distributions/10.js.map
A	build/distributions/11.js
A	build/distributions/11.js.map
A	build/distributions/12.js
A	build/distributions/12.js.map
A	build/distributions/2.js
A	build/distributions/2.js.map
A	build/distributions/3.js
A	build/distributions/3.js.map
A	build/distributions/4.js
A	build/distributions/4.js.map
A	build/distributions/5.js
A	build/distributions/5.js.map
A	build/distributions/6.js
A	build/distributions/6.js.map
A	build/distributions/7.js
A	build/distributions/7.js.map
A	build/distributions/8.js
A	build/distributions/8.js.map
A	build/distributions/9.js
A	build/distributions/9.js.map
A	build/distributions/confexplorer.js
A	build/distributions/confexplorer.js.map
A	build/distributions/index.html
A	static.json

commit 852fde4545139da551de89fe6b84fa1c957dcad9
Author: ukijumotahaneniarukenia <mrchildrenkh1008@gmail.com>
Date:   Sun May 31 15:29:52 2020 +0900

    initial commit

A	.gitignore
A	01.png
A	02.png
A	03.png
A	04.png
A	build.gradle.kts
A	gradle.properties
A	gradle/wrapper/gradle-wrapper.jar
A	gradle/wrapper/gradle-wrapper.properties
A	gradlew
A	gradlew.bat
A	launch-kotlin-js-gradle-web.log
A	md-dev.md
A	settings.gradle.kts
A	src/main/kotlin/App.kt
A	src/main/kotlin/Main.kt
A	src/main/kotlin/ReactPlayer.kt
A	src/main/kotlin/ReactShare.kt
A	src/main/kotlin/VideoList.kt
A	src/main/kotlin/VideoPlayer.kt
A	src/main/resources/index.html

```






デプロイプッシュログ

- https://play.kotlinlang.org/hands-on/Building%20Web%20Applications%20with%20React%20and%20Kotlin%20JS/09_Deploying_to_Production



```
$ cd kotlin-react-web
$ git push heroku master
Enumerating objects: 62, done.
Counting objects: 100% (62/62), done.
Delta compression using up to 12 threads
Compressing objects: 100% (32/32), done.
Writing objects: 100% (62/62), 1.12 MiB | 759.00 KiB/s, done.
Total 62 (delta 23), reused 62 (delta 23)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Gradle app detected
remote: -----> Installing JDK 1.8... done
remote: -----> Building Gradle app...
remote: -----> executing ./gradlew stage
remote:        Downloading https://services.gradle.org/distributions/gradle-6.1-bin.zip
remote:        .........10%.........20%.........30%..........40%.........50%.........60%..........70%.........80%.........90%.........100%
remote:        To honour the JVM settings for this build a new JVM will be forked. Please consider using the daemon: https://docs.gradle.org/6.1/userguide/gradle_daemon.html.
remote:        Daemon will be stopped at the end of the build stopping after processing
remote:        > Task :packageJson
remote:        > Task :testPackageJson
remote:        > Task :kotlinNodeJsSetup
remote:
remote:        > Task :kotlinNpmInstall
remote:        Download https://github.com/yarnpkg/yarn/releases/download/v1.21.1/yarn-v1.21.1.tar.gz
remote:        warning workspace-aggregator-d9d2efde-c2de-4fd6-ae4d-862eccdae80e > confexplorer-test > mocha > mkdirp@0.5.1: Legacy versions of mkdirp are no longer supported. Please update to mkdirp 1.x. (Note that the API surface has changed to use Promises in 1.x.)
remote:        warning workspace-aggregator-d9d2efde-c2de-4fd6-ae4d-862eccdae80e > confexplorer > webpack-dev-server > chokidar@2.1.8: Chokidar 2 will break on node v14+. Upgrade to chokidar 3 with 15x less dependencies.
remote:        warning workspace-aggregator-d9d2efde-c2de-4fd6-ae4d-862eccdae80e > confexplorer > webpack > watchpack > watchpack-chokidar2 > chokidar@2.1.8: Chokidar 2 will break on node v14+. Upgrade to chokidar 3 with 15x less dependencies.
remote:        warning workspace-aggregator-d9d2efde-c2de-4fd6-ae4d-862eccdae80e > confexplorer > webpack-dev-server > chokidar > fsevents@1.2.13: fsevents 1 will break on node v14+ and could be using insecure binaries. Upgrade to fsevents 2.
remote:        warning workspace-aggregator-d9d2efde-c2de-4fd6-ae4d-862eccdae80e > confexplorer > webpack > micromatch > snapdragon > source-map-resolve > resolve-url@0.2.1: https://github.com/lydell/resolve-url#deprecated
remote:        warning workspace-aggregator-d9d2efde-c2de-4fd6-ae4d-862eccdae80e > confexplorer > webpack > micromatch > snapdragon > source-map-resolve > urix@0.1.0: Please see https://github.com/lydell/urix#deprecated
remote:        warning sha.js@2.4.11: Invalid bin entry for "sha.js" (in "sha.js").
remote:        warning "workspace-aggregator-d9d2efde-c2de-4fd6-ae4d-862eccdae80e > confexplorer > styled-components@5.1.1" has unmet peer dependency "react-is@>= 16.8.0".
remote:
remote:        > Task :compileKotlinJs
remote:        > Task :processResources
remote:        > Task :mainClasses
remote:        > Task :JsJar
remote:        > Task :browserDistribution
remote:        > Task :processDceKotlinJs
remote:        > Task :browserProductionWebpack
remote:        > Task :kotlinSourcesJar
remote:        > Task :assemble
remote:        > Task :compileTestKotlinJs NO-SOURCE
remote:        > Task :testProcessResources NO-SOURCE
remote:        > Task :testClasses UP-TO-DATE
remote:        > Task :browserTest SKIPPED
remote:        > Task :test
remote:        > Task :check
remote:        > Task :build
remote:        > Task :stage
remote:
remote:        BUILD SUCCESSFUL in 2m 20s
remote:        12 actionable tasks: 12 executed
remote: -----> Static HTML app detected
remote:   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
remote:                                  Dload  Upload   Total   Spent    Left  Speed
remote: 100  838k  100  838k    0     0  12.4M      0 --:--:-- --:--:-- --:--:-- 12.4M
remote: -----> Installed directory to /app/bin
remote: -----> Discovering process types
remote:        Procfile declares types     -> (none)
remote:        Default types for buildpack -> web
remote:
remote: -----> Compressing...
remote:        Done: 77M
remote: -----> Launching...
remote:        Released v3
remote:        https://thawing-ocean-64707.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/thawing-ocean-64707.git
 * [new branch]      master -> master

```


以下のURLにアクセスして開発環境と同じような操作感ができればOK


- https://thawing-ocean-64707.herokuapp.com


配備アプリの資産は以下

以下のコマンドを実行してgit操作できる

```
$ git clone https://git.heroku.com/thawing-ocean-64707.git
```
