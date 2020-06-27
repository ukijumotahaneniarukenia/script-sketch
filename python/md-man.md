ファイル名管理からディレクトリ名管理に変更する際

ディレクトリ名のマスタ作成してから、各ファイルの接頭辞とディレクトリ名の接頭辞があっていれば、そこに投入

```
$ ls
00000-python-用途名-non-alias名-alias名.拡張子  00011-python-行列変換.md
00001-python-パイプ経由からの標準入力読込.md    00011-python-行列変換.py
00002-python-forループ.md                       00012-python-型チェック.md
00003-python-リストグルーピング.md              00013-python-リストinリストをタプルinリストに変換.md
00004-python-zipリストグルーピング.md           00014-python-タプルinリストをdictのコンストラクタに渡すとdictになる.md
00005-python-リストごとのソート.md              00015-python-ファイル読み込み.md
00006-python-zipリスト引数複数.md               00016-python-対象ファイルリストを読み込んで接尾時にdoneつけてファイル出力よくつかう.py
00007-python-zip_longestリスト引数複数.md       20001-sqlite3とpython3を使って辞書構築.py
00008-python-標準入力のNグラム.md               20001-sqlite3とpython3を使って辞書構築.sql
00008-python-標準入力のNグラム.py               20001.md
00009-python-マトリックス作成.md                md-ref.md
00010-python-プログレスバー.md                  標準入力.py
00010-python-プログレスバー.py


$ ls | awk -F. '{print $1}' | sort -u | grep -P '^[0-9]{5}-' | xargs -I@ echo mkdir @ | bash


$ ls
00000-python-用途名-non-alias名-alias名         00007-python-zip_longestリスト引数複数.md          00013-python-リストinリストをタプルinリストに変換.md
00000-python-用途名-non-alias名-alias名.拡張子  00008-python-標準入力のNグラム                     00014-python-タプルinリストをdictのコンストラクタに渡すとdictになる
00001-python-パイプ経由からの標準入力読込       00008-python-標準入力のNグラム.md                  00014-python-タプルinリストをdictのコンストラクタに渡すとdictになる.md
00001-python-パイプ経由からの標準入力読込.md    00008-python-標準入力のNグラム.py                  00015-python-ファイル読み込み
00002-python-forループ                          00009-python-マトリックス作成                      00015-python-ファイル読み込み.md
00002-python-forループ.md                       00009-python-マトリックス作成.md                   00016-python-対象ファイルリストを読み込んで接尾時にdoneつけてファイル出力よくつかう
00003-python-リストグルーピング                 00010-python-プログレスバー                        00016-python-対象ファイルリストを読み込んで接尾時にdoneつけてファイル出力よくつかう.py
00003-python-リストグルーピング.md              00010-python-プログレスバー.md                     20001-sqlite3とpython3を使って辞書構築
00004-python-zipリストグルーピング              00010-python-プログレスバー.py                     20001-sqlite3とpython3を使って辞書構築.py
00004-python-zipリストグルーピング.md           00011-python-行列変換                              20001-sqlite3とpython3を使って辞書構築.sql
00005-python-リストごとのソート                 00011-python-行列変換.md                           20001.md
00005-python-リストごとのソート.md              00011-python-行列変換.py                           md-ref.md
00006-python-zipリスト引数複数                  00012-python-型チェック                            標準入力.py
00006-python-zipリスト引数複数.md               00012-python-型チェック.md
00007-python-zip_longestリスト引数複数          00013-python-リストinリストをタプルinリストに変換



$ ls | awk -F. '{print $1}' | sort -u | grep -P '^[0-9]{5}-' >bunrui

$ cat bunrui
00000-python-用途名-non-alias名-alias名
00001-python-パイプ経由からの標準入力読込
00002-python-forループ
00003-python-リストグルーピング
00004-python-zipリストグルーピング
00005-python-リストごとのソート
00006-python-zipリスト引数複数
00007-python-zip_longestリスト引数複数
00008-python-標準入力のNグラム
00009-python-マトリックス作成
00010-python-プログレスバー
00011-python-行列変換
00012-python-型チェック
00013-python-リストinリストをタプルinリストに変換
00014-python-タプルinリストをdictのコンストラクタに渡すとdictになる
00015-python-ファイル読み込み
00016-python-対象ファイルリストを読み込んで接尾時にdoneつけてファイル出力よくつかう
20001-sqlite3とpython3を使って辞書構築

$ ls -l | grep -vP '^d' | awk '{print $9}' | grep -P '^[0-9]{5}-'
00000-python-用途名-non-alias名-alias名.拡張子
00001-python-パイプ経由からの標準入力読込.md
00002-python-forループ.md
00003-python-リストグルーピング.md
00004-python-zipリストグルーピング.md
00005-python-リストごとのソート.md
00006-python-zipリスト引数複数.md
00007-python-zip_longestリスト引数複数.md
00008-python-標準入力のNグラム.md
00008-python-標準入力のNグラム.py
00009-python-マトリックス作成.md
00010-python-プログレスバー.md
00010-python-プログレスバー.py
00011-python-行列変換.md
00011-python-行列変換.py
00012-python-型チェック.md
00013-python-リストinリストをタプルinリストに変換.md
00014-python-タプルinリストをdictのコンストラクタに渡すとdictになる.md
00015-python-ファイル読み込み.md
00016-python-対象ファイルリストを読み込んで接尾時にdoneつけてファイル出力よくつかう.py
20001-sqlite3とpython3を使って辞書構築.py
20001-sqlite3とpython3を使って辞書構築.sql
```
