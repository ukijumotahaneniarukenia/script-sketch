# 参考文献
教科書的なリファ。

https://ja.m.wikibooks.org/wiki/C%E8%A8%80%E8%AA%9E

標準入出力
https://yukicoder.me/wiki/stdio

絶対玄人
https://freebsd.sing.ne.jp/lang/c/12/02.html
https://freebsd.sing.ne.jp/lang/c/12/01.html


正規表現使うため
https://stackoverflow.com/questions/38877856/replace-a-part-of-a-string-with-regexp-in-sqlite3

簡単なサンプル多い

http://zetcode.com/db/sqlitec/

sqlite 繋ぐ

https://www.suke-blog.com/how-to-use-sqlite/

https://qiita.com/katsugeneration/items/26a76f66a1c9cb1710f4




コンパクトでいいかも
https://github.com/dbro/csvquote
https://www.sigbus.info/compilerbook


listagg関数をC言語で作成する。
listagg便利。C言語の練習になりそうなので、挑戦。

http://satoru-takeuchi.hatenablog.com/entry/2017/05/20/234948

コンパイル&実行
```
$gcc -std=c11 -o listagg listagg.c && ./listagg
UNKO
```

GCCのコンパイラオプション
https://gcc.gnu.org/onlinedocs/gcc/

coreutilsパッケージからエミュレートしていったほうが早そうなので、
coreutilsのソースパッケージインストールすることにした　。
https://qiita.com/ma2saka/items/4099443efc2b93fe8fcd


https://github.com/coreutils/coreutils


## echo コマンドはここ。

```
$find . -name "*echo*" 2>/dev/null
./coreutils/man/echo.x
./coreutils/tests/misc/echo.sh
./coreutils/src/echo.c
```


# exit関数

stdlib.hファイルをインクルードする必要がある

```c
#include <stdlib.h>

void usage(int status){
  exit(status);
}

int main(int argc,char **argv){
  printf("%s\n","UNKO");
  return 0;
}
```

https://kaworu.jpn.org/c/C%E8%A8%80%E8%AA%9E%E3%81%AEexit%E9%96%A2%E6%95%B0%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9
