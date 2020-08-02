### 設定ファイル

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


### 拡張機能


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
code --uninstall-extension CoenraadS.bracket-pair-colorizer
code --uninstall-extension DataWorks.dataworks-intellisense
code --uninstall-extension IBM.output-colorizer
code --uninstall-extension ICS.japanese-proofreading
code --uninstall-extension Tyriar.sort-lines
code --uninstall-extension bmewburn.vscode-intelephense-client
code --uninstall-extension eamodio.gitlens
code --uninstall-extension esbenp.prettier-vscode
code --uninstall-extension hediet.vscode-drawio
code --uninstall-extension jebbs.plantuml
code --uninstall-extension lihui.vs-color-picker
code --uninstall-extension manasxx.background-cover
code --uninstall-extension marp-team.marp-vscode
code --uninstall-extension mosapride.zenkaku
code --uninstall-extension oderwat.indent-rainbow
code --uninstall-extension oliversturm.fix-json
code --uninstall-extension ryu1kn.partial-diff
code --uninstall-extension saikou9901.evilinspector
code --uninstall-extension shalldie.background
code --uninstall-extension shardulm94.trailing-spaces
code --uninstall-extension vincaslt.highlight-matching-tag
code --uninstall-extension vscode-icons-team.vscode-icons
code --uninstall-extension wayou.vscode-todo-highlight
```

```
$ code --list-extensions | sort | xargs -I@ echo code --install-extension @
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension DataWorks.dataworks-intellisense
code --install-extension IBM.output-colorizer
code --install-extension ICS.japanese-proofreading
code --install-extension Tyriar.sort-lines
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension hediet.vscode-drawio
code --install-extension jebbs.plantuml
code --install-extension lihui.vs-color-picker
code --install-extension manasxx.background-cover
code --install-extension marp-team.marp-vscode
code --install-extension mosapride.zenkaku
code --install-extension oderwat.indent-rainbow
code --install-extension oliversturm.fix-json
code --install-extension ryu1kn.partial-diff
code --install-extension saikou9901.evilinspector
code --install-extension shalldie.background
code --install-extension shardulm94.trailing-spaces
code --install-extension vincaslt.highlight-matching-tag
code --install-extension vscode-icons-team.vscode-icons
code --install-extension wayou.vscode-todo-highlight
```
