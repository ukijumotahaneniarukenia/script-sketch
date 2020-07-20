- アドオン
   - Google Translator for Firefox

- 諸注意

  - dockerホストとdocekrコンテナでfirefoxを同時起動しているとdockerコンテナ側のアドオン使えなくなるので、dockerホスト側のfirefoxを閉じておく

- インストール手順

  - ハンバーガーメニュー-Extensionをクリック

  - 検索欄に「Google Translator for Firefox」を入力し、検索結果から選択

  - いろいろ聞かれるが、とりますべてADDでおｋ


- アドオンは以下にダウンロードされる
```
$ find / -name "*" 2>/dev/null | grep trans | grep moz
/home/kuraine/.mozilla/firefox/1gc8zwxt.default-release/extensions/translator@zoli.bod.xpi
```

- デフォルトでブラウザのスクリーンショットが取れる
   - 右クリック「Take a ScreenShot」を選択

   - $HOME/Downloadsに保存

   - 権限はfirefoxの実行ユーザで保存される
