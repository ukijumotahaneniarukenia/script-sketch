dockerホストとdocekrコンテナでfirefoxを同時起動しているとdockerコンテナ側のアドオン使えなくなるので、dockerホスト側のfirefoxを閉じておく

-- 翻訳ページをコマンドラインから実行

   -- Google Translator for Firefox

アドオンは以下にダウンロードされる

```
$ find / -name "*" 2>/dev/null | grep trans | grep moz
/home/kuraine/.mozilla/firefox/1gc8zwxt.default-release/extensions/translator@zoli.bod.xpi
```

-- デフォルトでブラウザのスクリーンショットが取れる
   - 右クリック「Take a ScreenShot」を選択

   - $HOME/Downloadsに保存

   - 権限はfirefoxの実行ユーザで保存される

