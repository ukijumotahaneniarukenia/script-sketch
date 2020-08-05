- https://qiita.com/uzresk/items/bc7c4a9dc764390cd5ce

- プロキシの設定単位
  - プログラム単位
  - コマンドライン引数
  - ユーザー環境変数
  - システム環境変数

- 一般ユーザーでのsudo実行時の環境変数の引き継ぎ
  - ハマりポイントそう
  - https://qiita.com/chroju/items/375582799acd3c5137c7

- プログラム単位のrcファイルは探す


# curlコマンドがうごくことを確認

一般ユーザで実行。標準出力になにか垂れ流されているならOK。

```bash
curl -x http://host:port -L https://www.google.com
```

# パッケージアップデート

```bash
sudo apt-get -o Acquire::https::Proxy="http://host:port" update
```

```bash
sudo -E apt-get update
```

```bash
sudo apt-get update
```

# パッケージアップグレード

```bash
sudo apt-get -o Acquire::https::Proxy="http://host:port" -y upgrade
```

```bash
sudo apt-get -y upgrade
```

# パッケージインストール

```bash
sudo apt-get -o Acquire::https::Proxy="http://host:port" install -y zlib1g-dev
sudo apt-get -o Acquire::https::Proxy="http://host:port" install -y libffi-dev
sudo apt-get -o Acquire::https::Proxy="http://host:port" install -y libssl-dev
sudo apt-get -o Acquire::https::Proxy="http://host:port" install -y gcc make
```
