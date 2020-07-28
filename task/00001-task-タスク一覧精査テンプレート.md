- 『XXX』画面で『YYY』チェックボックスにCFG列記載の内容を選択し、『OK』ボタンを押下する。

- SRC列記載の内容をDEST列記載の内容にコピーする。

- SRC列記載の内容をDEST列記載の内容に置換する。

- SRC列記載の内容をDEST列記載の内容に移動する。


- タスクの分類に使用するテーブルヘッダ

|GRP|GRP-NAME|SUB-GRP|SUB-GRP-NAME|ACTION-SEQ|ACTION-SEQ-NAME|ACTION-DETIAL-SRC|ACTION-DETAIL-DEST|ACTION-DETAIL-CFG-KEY|ACTION-DETAIL-CFG-VALUE|MEMO|Q|
|--:|:-:|--:|:-:|--:|:-:|--:|:-:|--:|:-:|--:|--:|

- 名寄せに使用するテーブルヘッダ

|SEQ|RAW|MASK-DONE|WIDGT-KEY-DONE|WIDGT-VALUE-DONE|LAST-VERB-DONE|ACTION-DETAIL-DONE|NON-ACTION-DETAIL-DONE|NORMALIZE-DONE|RAW-DONE|
|--:|:--|:--|:--|:--|:--|:--|:--|:--|:--|

  - 上記テーブルの各列毎に以下のテーブルを用意
    - TGT列に上記対象テーブルのデータ列を指定
    - 置換前と置換後の正規表現
    - 特記事項あれば
    - 何をするためのクレンジングなのか

|SEQ|TGT|PRE-REPLACE|POST-REPLACE|MEMO|PURPOSE|
|--:|:--|:--|:--|:--|:--|

