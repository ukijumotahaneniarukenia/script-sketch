# ファイル名はbuild.gradleファイル固定でルートディレクトリ直下に単一配備

build.gradle

```
task pre_proc { doLast { println("pre_proc has done") } }
task pre_sub_proc { doLast { println("pre_sub_proc has done") } }
task main_proc { doLast { println("main_proc has done") } }
task post_sub_proc { doLast { println("post_sub_proc has done") } }
task post_proc { doLast { println("post_proc has done") } }

post_proc.dependsOn post_sub_proc
post_sub_proc.dependsOn main_proc
main_proc.dependsOn pre_sub_proc
pre_sub_proc.dependsOn pre_proc
```

呼び出し側は実行してほしいフェーズタスクを指定する

```
$gradle -q -b build.gradle main_proc
pre_proc has done
pre_sub_proc has done
main_proc has done
```
