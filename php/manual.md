# 参考文献

標準入力から読み込み

https://qiita.com/dev100kg/items/d49c855b1400e35164ec

https://qiita.com/yuhei_umeda/items/552c3f2f19e55f80fdfb

https://qiita.com/kiimiiis/items/89ac68e5f7451bf64d1a

型変換
https://www.php.net/manual/ja/language.types.type-juggling.php

文字列型
https://www.php.net/manual/ja/language.types.string.php


配列にいろいろ概念が盛り込まれている

https://www.php.net/manual/ja/language.types.array.php

php型確認

https://www.php.net/manual/ja/function.gettype.php


https://qiita.com/mpyw/items/2967ea1e36a144f76587

https://www.softel.co.jp/blogs/tech/archives/2077


https://qiita.com/sola-msr/items/0814c4470dcbbd1f5ec3

# 実行方法

```
[sqlite❣29231fdc7920 (月 10月 28 15:07:46) ~/script_scratch/php]$php hello.php
//シバンはいらない
//Usage:
//  php 実行ファイルパス
Hello World!
[sqlite❣29231fdc7920 (月 10月 28 15:08:30) ~/script_scratch/php]$php hello.php | sed 's;^//.*;;'



Hello World!
[sqlite❣29231fdc7920 (月 10月 28 15:08:40) ~/script_scratch/php]$php hello.php | sed 's;^//.*;;' | sed '/^$/d'
Hello World!
```
