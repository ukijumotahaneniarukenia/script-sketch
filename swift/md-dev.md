- パッケージマネージャの使い方

https://qiita.com/_tid_/items/c26fcd1b95eaed2dedb2

- lsp環境の構築

https://qiita.com/AK-10/items/975b2b2d036ef9126e9b#language-server-protocol%E3%81%AE%E5%B0%8E%E5%85%A5


事前にswiftコマンドいんすこ

```

mv /home/aine/media/swift-5.2.4-RELEASE-ubuntu18.04.tar.gz /usr/local/src/
cd  /usr/local/src/
tar xvf swift-5.2.4-RELEASE-ubuntu18.04.tar.gz

$ find / | grep -P  "sourcekit-lsp$" | grep bin
/usr/local/src/swift-5.2.4-RELEASE-ubuntu18.04/usr/bin/sourcekit-lsp


echo 'export SWIFT_HOME=/usr/local/src/swift-5.2.4-RELEASE-ubuntu18.04/usr' >>$HOME/.bashrc
echo 'export PATH=$SWIFT_HOME/bin:$PATH' >>$HOME/.bashrc

#ダイナミックリンクファイルのありかをリンカに伝える
$ find / -name "libswiftCore.so"
/usr/local/src/swift-5.2.4-RELEASE-ubuntu18.04/usr/lib/swift/linux/libswiftCore.so
export LD_LIBRARY_PATH=/usr/local/src/swift-5.2.4-RELEASE-ubuntu18.04/usr/lib/swift/linux:$LD_LIBRARY_PATH

cp /usr/local/src/swift-5.2.4-RELEASE-ubuntu18.04/usr/bin/sourcekit-lsp /usr/local/bin/sourcekit-lsp

$ swift --version
Swift version 5.2.4 (swift-5.2.4-RELEASE)
Target: x86_64-unknown-linux-gnu

$ which sourcekit-lsp
/usr/local/src/swift-5.2.4-RELEASE-ubuntu18.04/usr/bin/sourcekit-lsp

$ sourcekit-lsp --help
OVERVIEW: Language Server Protocol implementation for Swift and C-based languages

USAGE: sourcekit-lsp [options]

OPTIONS:
  --build-path          Specify build/cache directory
  --configuration, -c   Build with configuration (debug|release) [default: debug]
  --log-level           Set the logging level (debug|info|warning|error) [default: info]
  -Xcc                  Pass flag through to all C compiler invocations
  -Xclangd              Pass options to clangd command-line
  -Xcxx                 Pass flag through to all C++ compiler invocations
  -Xlinker              Pass flag through to all linker invocations
  -Xswiftc              Pass flag through to all Swift compiler invocations
  -index-db-path        Override index-database-path from the build system
  -index-store-path     Override index-store-path from the build system
  --help                Display available options

```


cocの設定

vimをひらき:CocConfigを実行



```
$ cat ~/.vim/coc-settings.json
{
  "suggest.enablePreselect": true,
  "languageserver": {
    "swift": {
      "command": "/usr/local/bin/sourcekit-lsp",
      "filetypes": ["swift"]
    }
  }
}

```



動作確認

- https://qiita.com/naokits/items/8f09ffc8bbc78ade366c


```
cat <<EOS > main.swift
#!/usr/bin/evn swift


let s = "こんにちは森鴎外さん"

print(s)
EOS


chmod 755 main.swift


./main.swift
```
