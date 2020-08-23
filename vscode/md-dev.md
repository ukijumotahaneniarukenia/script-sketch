設定ファイル

- https://code.visualstudio.com/docs/editor/codebasics

エクスポート

```
$ cp /home/aine/.config/Code/User/settings.json /home/aine/script-sketch/vscode/settings.json
```

インポート

```
$ mkdir -p /home/aine/.config/Code/User
$ cp /home/aine/script-sketch/vscode/settings.json /home/aine/.config/Code/User/settings.json
```


拡張機能


エクスポート
```
$ code --list-extensions | sort
```


インストール
  - 単一引数指定のみOK
```
$ cat extension-list.txt | sort | xargs -I@ echo code --install-extension @
$ code --install-extension  mosapride.zenkaku
```


アンインストール
  - 単一引数指定のみOK

```
$ code --uninstall-extension  mosapride.zenkaku
```

```
$ code --list-extensions | sort | xargs -I@ echo code --uninstall-extension @
```

```
$ code --list-extensions | sort | xargs -I@ echo code --install-extension @
```
