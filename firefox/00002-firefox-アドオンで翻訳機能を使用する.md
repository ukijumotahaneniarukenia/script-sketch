- アドオン
   - Google Translator for Firefox

- 諸注意

  - dockerホストとdocekrコンテナでfirefoxを同時起動しているとdockerコンテナ側のアドオン使えなくなるので、dockerホスト側のfirefoxを閉じておく

- インストール手順

  - ハンバーガーメニュー-Extensionをクリック

  - 検索欄に「Google Translator for Firefox」を入力し、検索結果から選択

  - いろいろ聞かれるが、とりますべてADDでおｋ

  - ハンバーガーメニュー-Manage Extensionから翻訳先の言語を**日本語**に設定

- 使い方

  - Webページを選択し、右クリックで「Google Translator for Firefox」を選択、別タブで翻訳後のページが開かれる

  - 翻訳後の日本語を選択すると、ツールチップで翻訳元の言語が表示される。

  - 翻訳前の日本語を部分選択しても、別タブで翻訳先のページが開かれた。コードが入っているページなどは全ページ翻訳しづらいので、便利。

- アドオンは以下にダウンロードされる
```
$ find / -name "*" 2>/dev/null | grep trans | grep moz
/home/kuraine/.mozilla/firefox/1gc8zwxt.default-release/extensions/translator@zoli.bod.xpi
```

- デフォルトでブラウザのスクリーンショットが取れる
   - 右クリック「Take a ScreenShot」を選択

   - $HOME/Downloadsに保存

   - 権限はfirefoxの実行ユーザで保存される
