- https://openjfx.io/openjfx-docs/#maven

VM Optionsの引数設定やライブラリの設定等も不要でハンディ。

add archetect type

#1

画面レイアウトがxml管理されていない

```
Group Id:org.openjfx

Artifactid:javafx-archetype-simple

Version:0.0.1
```


#2

画面レイアウトがxml管理されている -->androidチック

```
Group Id:org.openjfx

Artifactid:javafx-archetype-fxml

Version:0.0.1
```


mavenタスクでclean --> javafx:jlinkの順でダブルクリックで実行


```
$ find 00004-javafx-パッケージング-モヂュール管理あり-レイアウトNonXml | grep launcher
00004-javafx-パッケージング-モヂュール管理あり-レイアウトNonXml/target/image/bin/launcher

$ ls -lh 00004-javafx-パッケージング-モヂュール管理あり-レイアウトNonXml/target/image/bin/launcher
-rwxr-xr-x 1 kuraine kuraine 91  6月 25 17:58 00004-javafx-パッケージング-モヂュール管理あり-レイアウトNonXml/target/image/bin/launcher
```


実行

ちなみ実行ディレクトリはポータブルでない

```
$ cd 00004-javafx-パッケージング-モヂュール管理あり-レイアウトNonXml
$ target/image/bin/launcher
```
