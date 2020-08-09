pcre正規表現を有効に

```
$ ag -Go うんち script-sketch
script-sketch/firefox/00001-firefox-searchオプションで指定文言に紐づく検索結果をブラウザで開く.md
10:firefox --search "うんち うんこ"
14:firefox --search 'うんち うんこ'

script-sketch/googler/manual.md
29:     糞（くそ、ふん。※「くそ」の別表記：屎）とは、動物の消化管から排出される固体状の排泄物（屎尿）。糞便（ふんべん）、大便（だいべん）、便（べん）、俗にうんこ、うんち、ばばや、大便から転じ大などとも呼ばれる。し
```

検出カラム位置を出力

```
$ ag --column -Go うんち script-sketch
script-sketch/firefox/00001-firefox-searchオプションで指定文言に紐づく検索結果をブラウザで開く.md
10:19:firefox --search "うんち うんこ"
14:19:firefox --search 'うんち うんこ'

script-sketch/googler/manual.md
29:240:     糞（くそ、ふん。※「くそ」の別表記：屎）とは、動物の消化管から排出される固体状の排泄物（屎尿）。糞便（ふんべん）、大便（だいべん）、便（べん）、俗にうんこ、うんち、ばばや、大便から転じ大などとも呼ばれる。し
```


検索ワードがマッチしたファイル名のみ出力

```
$ ag -l -Go うんち script-sketch
script-sketch/firefox/00001-firefox-searchオプションで指定文言に紐づく検索結果をブラウザで開く.md
script-sketch/googler/manual.md
```



検索ワードがヒットしたファイル名に対して置換処理を実施

```
$ ag -l -Go うんち script-sketch | xargs -I@ perl -pi -e 's/うんち/うんぽ/g' @
```


置換結果の確認

```
$ ag --column -Go うんち script-sketch
```

```
$ ag --column -Go うんぽ script-sketch
script-sketch/firefox/00001-firefox-searchオプションで指定文言に紐づく検索結果をブラウザで開く.md
10:19:firefox --search "うんぽ うんこ"
14:19:firefox --search 'うんぽ うんこ'

script-sketch/googler/manual.md
29:240:     糞（くそ、ふん。※「くそ」の別表記：屎）とは、動物の消化管から排出される固体状の排泄物（屎尿）。糞便（ふんべん）、大便（だいべん）、便（べん）、俗にうんこ、うんぽ、ばばや、大便から転じ大などとも呼ばれる。し
```

指定した文言を含むファイル名を出力

```
$ ag -g 検索 script-sketch
script-sketch/React/00008-React-映画検索アプリ/my-app/tsconfig.json
script-sketch/React/00008-React-映画検索アプリ/my-app/src/components/Search.tsx
script-sketch/React/00008-React-映画検索アプリ/my-app/src/components/Movie.tsx
script-sketch/React/00008-React-映画検索アプリ/my-app/src/components/Header.tsx
script-sketch/React/00008-React-映画検索アプリ/my-app/src/App.test.tsx
script-sketch/React/00008-React-映画検索アプリ/my-app/src/index.css
script-sketch/React/00008-React-映画検索アプリ/my-app/src/index.tsx
script-sketch/React/00008-React-映画検索アプリ/my-app/src/logo.svg
script-sketch/React/00008-React-映画検索アプリ/my-app/src/App.tsx
script-sketch/React/00008-React-映画検索アプリ/my-app/src/serviceWorker.ts
script-sketch/React/00008-React-映画検索アプリ/my-app/src/react-app-env.d.ts
script-sketch/React/00008-React-映画検索アプリ/my-app/src/App.css
script-sketch/React/00008-React-映画検索アプリ/my-app/src/setupTests.ts
script-sketch/React/00008-React-映画検索アプリ/my-app/public/logo512.png
script-sketch/React/00008-React-映画検索アプリ/my-app/public/favicon.ico
script-sketch/React/00008-React-映画検索アプリ/my-app/public/logo192.png
script-sketch/React/00008-React-映画検索アプリ/my-app/public/index.html
script-sketch/React/00008-React-映画検索アプリ/my-app/public/manifest.json
script-sketch/React/00008-React-映画検索アプリ/my-app/public/robots.txt
script-sketch/React/00008-React-映画検索アプリ/my-app/README.md
script-sketch/React/00008-React-映画検索アプリ/my-app/package.json
script-sketch/React/00008-React-映画検索アプリ/my-app/package-lock.json
script-sketch/React/00008-React-映画検索アプリ/md-dev.md
script-sketch/firefox/00003-firefox-アドオンで複数個の検索エンジンを横断して画像検索する.md
script-sketch/firefox/00001-firefox-searchオプションで指定文言に紐づく検索結果をブラウザで開く.md
script-sketch/search_engine/Z00-全文検索インデックス作成.sh
script-sketch/perl/00027-perl-配列はgrepでハッシュはexistsで検索.md
script-sketch/java/00075-java-類似画像検索ライブラリの使用LIRE-Solr/src/main/java/app/App.java
script-sketch/java/00075-java-類似画像検索ライブラリの使用LIRE-Solr/src/test/java/app/AppTest.java
script-sketch/java/00075-java-類似画像検索ライブラリの使用LIRE-Solr/nnn.iml
script-sketch/java/00075-java-類似画像検索ライブラリの使用LIRE-Solr/pom.xml
script-sketch/googler/00002-googler-ドメイン複数指定で検索結果を取得.md
```

指定した正規表現にマッチするファイル名を出力

```
$ ag -g '(?<=映画)検索' script-sketch
```

指定したキーワードを含む件数を出力

grepだと

.git無視しない

```
$ grep -c 全文検索 -r script-sketch | awk -F: '$2!=0'
script-sketch/pocket/pocket.tsv:6
script-sketch/jq/00046-jq-行単位で連続するキーバリューをグルーピング.md:2
script-sketch/search_engine/README.md:1
script-sketch/python/00026-python-seleniumでクロール/lgtms-00009.tsv:1
script-sketch/python/00026-python-seleniumでクロール/lgtms-00003.tsv:1
script-sketch/.git/index:1
```

agだと

無視する

```
$ ag -c 全文検索 script-sketch
script-sketch/pocket/pocket.tsv:6
script-sketch/jq/00046-jq-行単位で連続するキーバリューをグルーピング.md:2
script-sketch/search_engine/README.md:1
script-sketch/python/00026-python-seleniumでクロール/lgtms-00009.tsv:1
script-sketch/python/00026-python-seleniumでクロール/lgtms-00003.tsv:1
```

一行あたりの列方向にも検出操作する

```
$ ag -c 検索 script-sketch/pocket/pocket.tsv
35

$ grep -c 検索 script-sketch/pocket/pocket.tsv
33
```
