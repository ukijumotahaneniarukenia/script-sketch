- chromdriverとchromeを落としてパス通す

  - https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64/771782/

```
$ ls -lh
-rw-rw-r--.  1 root root 126M  5月 26 23:04 Linux_x64_771782_chrome-linux.zip
-rw-rw-r--.  1 root root 6.7M  5月 26 23:01 Linux_x64_771782_chromedriver_linux64.zip
```


```
$ unzip Linux_x64_771782_chrome-linux.zip
$ unzip Linux_x64_771782_chromedriver_linux64.zip
```

- pythonからseleniumを使う際のドライバライブラリインストール

```
echo 'export CHROME_LINUX_HOME=/usr/local/src/chrome-linux' >>$HOME/.bashrc
echo 'export PATH=$CHROME_LINUX_HOME:$PATH' >>$HOME/.bashrc
echo 'export CHROME_DRIVER_HOME=/usr/local/src/chromedriver_linux64' >>$HOME/.bashrc
echo 'export PATH=$CHROME_DRIVER_HOME:$PATH' >>$HOME/.bashrc

source $HOME/.bashrc
```


- 実行

```
python3 a.py
```


バージョン確認

```
$chrome --version
Chromium 85.0.4157.0

$chromedriver --version
ChromeDriver 85.0.4157.0 (ca59524a85ef31d74e93ebb0394804fee7322e60-refs/heads/master@{#771782})
```

アプリ単一起動

一般ユーザーで

```
$ chrome --no-sandbox 1>$HOME/launch-chrome.log 2>&1 &
[1] 5564
```
