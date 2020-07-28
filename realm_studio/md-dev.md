realm_studioの起動

起動するとエラーでるので

```
/tmp/.mount_Realm_jNqg46/realm-studio: error while loading shared libraries: libasound.so.2: cannot open shared object file: No such file or directory
```


事前にいれておく

```
apt install -y libasound2-dev
```

ダウンロード

- https://docs.realm.io/sync/v/3.x/realm-studio


実行するユーザーの持ち物にしておく

```
mv 'Realm\ Studio-3.11.0.AppImage' Realm_Studio-3.11.0.AppImage

mv Realm_Studio-3.11.0.AppImage /usr/local/src

chmod 755 /usr/local/src/Realm_Studio-3.11.0.AppImage

chown kuraine:kuraine /usr/local/src/Realm_Studio-3.11.0.AppImage

```

一般ユーザーで起動

```
/usr/local/src/Realm_Studio-3.11.0.AppImage --no-sandbox 1>$HOME/launch-realm-studio.log 2>&1 &
```


細かい使い方など


realmファイルはバイナリでrealm_studioはそれを読み込んでレンダリングできる模様

フラットなファイルではcsvファイルを読み込むことができる

csvファイルからrealmファイルを作成することができる

作成したrealmファイルを読み込むことができるので、任意のCSVファイルをrealmデータファイルとしてハンドリング可能

読み込んだrealmデータファイルはアプリ用のプレーンクラスに自動生成できるので、便利

json出力はできなかった

GraphQLなどと連携したらハンディそう

- https://realm.io/blog/realm-scales-to-the-web/


realmデータベース単一での動作検証が必要

- https://docs.realm.io/sync/v/3.x/

- https://docs.realm.io/sync/v/3.x/using-synced-realms/server-side-usage/data-access

