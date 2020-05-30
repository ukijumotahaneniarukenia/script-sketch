```
注意点としてはkotlin用のbuild.gradleファイルはテンプレートとして使用しないほうがいい

ピュアなbuild.gradleファイルでいい

$ rm -rf 00003-kotlin-外部ライブラリを使用した単一実行可能なjarコマンドラインツール
$ mkdir -p 00003-kotlin-外部ライブラリを使用した単一実行可能なjarコマンドラインツール


$ cd 00003-kotlin-外部ライブラリを使用した単一実行可能なjarコマンドラインツール


$ echo '/.idea/* /.gradle/* /nnn/build/* /gradle/*' | xargs -n1 >.gitignore


$ tree
.
├── gradle
│   └── wrapper
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
├── gradle.properties
├── gradlew
├── gradlew.bat
├── nnn
│   ├── build.gradle
│   └── src
│       ├── main
│       │   ├── java
│       │   ├── kotlin
│       │   │   └── App.kt
│       │   └── resources
│       └── test
│           ├── java
│           ├── kotlin
│           └── resources
└── settings.gradle

12 directories, 8 files



$ ./gradlew build

BUILD SUCCESSFUL in 1s
3 actionable tasks: 3 executed


jarができた

$ find | grep jar$ | grep SNAPSHOT
./nnn/build/libs/nnn-1.0-SNAPSHOT.jar


$ jar tvf ./nnn/build/libs/nnn-1.0-SNAPSHOT.jar | head -n30
     0 Sat May 30 07:09:14 UTC 2020 META-INF/
    44 Sat May 30 07:09:14 UTC 2020 META-INF/MANIFEST.MF
    27 Sat May 30 07:09:14 UTC 2020 META-INF/nnn.kotlin_module
  1848 Sat May 30 07:09:14 UTC 2020 AppKt.class
     0 Fri Oct 04 11:54:58 UTC 2019 META-INF/maven/
     0 Fri Oct 04 11:54:58 UTC 2019 META-INF/maven/com.google.code.gson/
     0 Fri Oct 04 11:54:58 UTC 2019 META-INF/maven/com.google.code.gson/gson/
   109 Fri Oct 04 11:54:58 UTC 2019 META-INF/maven/com.google.code.gson/gson/pom.properties
  2527 Fri Oct 04 11:54:30 UTC 2019 META-INF/maven/com.google.code.gson/gson/pom.xml
     0 Fri Oct 04 11:54:54 UTC 2019 com/
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/
  6536 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/DefaultDateTypeAdapter.class
   291 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/ExclusionStrategy.class
  2185 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldAttributes.class
   711 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$1.class
   837 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$2.class
   938 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$3.class
  1017 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$4.class
  1017 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$5.class
  1017 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$6.class
  3203 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy.class
   207 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingStrategy.class
  2020 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$1.class
  2023 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$2.class
  1928 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$3.class
  1746 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$4.class
  2584 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$5.class
  1719 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$FutureTypeAdapter.class
 22352 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson.class

$ jar tvf ./nnn/build/libs/nnn-1.0-SNAPSHOT.jar | tail -n30
   283 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$CalendarMonth.class
   277 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$CursorType.class
   295 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$FlowLayoutAlignment.class
   275 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$FontStyle.class
   295 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$HorizontalAlignment.class
   285 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$InputEventMask.class
   291 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$ListSelectionMode.class
   281 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$PatternFlags.class
   287 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$TabLayoutPolicy.class
   281 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$TabPlacement.class
   307 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$TitledBorderJustification.class
   307 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$TitledBorderTitlePosition.class
   291 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants$TreeSelectionMode.class
  1730 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/JdkConstants.class
   681 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/Language.class
   715 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/MagicConstant.class
   600 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/Pattern.class
   356 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/PrintFormat.class
   964 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/PrintFormatPattern.class
   665 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/RegExp.class
   199 Tue Dec 17 16:10:34 UTC 2013 org/intellij/lang/annotations/Subst.class
     0 Tue Dec 17 16:10:34 UTC 2013 org/jetbrains/
     0 Tue Dec 17 16:10:34 UTC 2013 org/jetbrains/annotations/
   531 Tue Dec 17 16:10:34 UTC 2013 org/jetbrains/annotations/Contract.class
   502 Tue Dec 17 16:10:34 UTC 2013 org/jetbrains/annotations/Nls.class
   508 Tue Dec 17 16:10:34 UTC 2013 org/jetbrains/annotations/NonNls.class
   546 Tue Dec 17 16:10:34 UTC 2013 org/jetbrains/annotations/NotNull.class
   548 Tue Dec 17 16:10:34 UTC 2013 org/jetbrains/annotations/Nullable.class
   525 Tue Dec 17 16:10:34 UTC 2013 org/jetbrains/annotations/PropertyKey.class
   453 Tue Dec 17 16:10:34 UTC 2013 org/jetbrains/annotations/TestOnly.class


$ java -jar ./nnn/build/libs/nnn-1.0-SNAPSHOT.jar
うんこ
{"name":"Abcd","greeting":"Hello"}
Abcd
Hello


ポータブルか

$ cp ./nnn/build/libs/nnn-1.0-SNAPSHOT.jar $HOME/testcmd.jar


$ cd $HOME



ポータブル

$ java -jar testcmd.jar 
うんこ
{"name":"Abcd","greeting":"Hello"}
Abcd
Hello
```
