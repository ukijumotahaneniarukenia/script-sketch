codeliteエディタの起動
```
codelite 1>$HOME/launch-codelite.log 2>&1 &
```


コード補完はワークスペース単位に設定できた。

プロジェクト作成後
```
$find wrksp/
wrksp/
wrksp/app
wrksp/app/main.cpp
wrksp/app/app.project
wrksp/wrksp.workspace
wrksp/.codelite
wrksp/.codelite/wrksp.workspace.someone
wrksp/.codelite/tabgroups
wrksp/.codelite/wrksp-someone.tags
wrksp/.codelite/valgrind.memcheck.supp
```

main.cpp

```
#include <iostream>

int main(int argc, char **argv) {
    std::cout << "Hello, world!" << std::endl;
    return 0;
}
```


ビルド後

```
$find wrksp/
wrksp/
wrksp/app
wrksp/app/app.txt
wrksp/app/Debug
wrksp/app/Debug/app
wrksp/app/Debug/.d
wrksp/app/Debug/main.cpp.o.d
wrksp/app/Debug/main.cpp.o
wrksp/app/main.cpp
wrksp/app/app.project
wrksp/app/app.mk
wrksp/app/compile_flags.txt
wrksp/Makefile
wrksp/wrksp.workspace
wrksp/.codelite
wrksp/.codelite/wrksp.workspace.someone
wrksp/.codelite/tabgroups
wrksp/.codelite/wrksp-someone.tags
wrksp/.codelite/valgrind.memcheck.supp
```

これが実行ファイル。プロジェクト名と同じになる模様。

```
$ll wrksp/app/Debug/app
-rwxr-xr-x. 1 kuraine kuraine 10872  5月  5 14:47 wrksp/app/Debug/app*
```

実行

```
$wrksp/app/Debug/app
Hello, world!
```

