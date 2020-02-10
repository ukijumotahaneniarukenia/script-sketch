# shinyアプリ構築手順書

## サンプルアプリコピー

```
$sudo cp -R /opt/shiny-server/samples/sample-apps/hello ~/script_scratch/shiny
$ll
total 4
drwxr-xr-x. 2 root root 4096  1月  5 17:56 hello
```

## 権限調整

```
$sudo chown -R shiny:shiny ~/script_scratch/shiny
$ll
total 4
drwxr-xr-x. 2 shiny shiny 4096  1月  5 17:56 hello
[shiny❤e5ec1bade2af (日  1月 05 17:56:29) ~/script_scratch/shiny]$tree
.
`-- hello
    |-- server.R
    `-- ui.R

1 directory, 2 files
```

## 公開ディレクトリにリンクはる

```
$cd /srv/shiny-server
$ll
total 0
lrwxrwxrwx. 1 root root 38  1月  5 15:47 index.html -> /opt/shiny-server/samples/welcome.html
lrwxrwxrwx. 1 root root 37  1月  5 15:47 sample-apps -> /opt/shiny-server/samples/sample-apps
$sudo ln -fns /home/shiny/script_scratch/shiny /srv/shiny-server/shiny
$cd /srv/shiny-server
$ll
total 0
lrwxrwxrwx. 1 root root 38  1月  5 15:47 index.html -> /opt/shiny-server/samples/welcome.html
lrwxrwxrwx. 1 root root 37  1月  5 15:47 sample-apps -> /opt/shiny-server/samples/sample-apps
lrwxrwxrwx. 1 root root 32  1月  5 18:00 shiny -> /home/shiny/script_scratch/shiny
```

## このURLでアクセスできる

サンプルアプリと同じレンダリング結果が表示されるはず。

```
http://192.168.1.109:3838/shiny/hello
```


## R ライブラリのいんすこ場所をrstudioユーザーとshinyユーザーで共有する

2番目のディレクトリにいんすこする。

```
$Rscript -e '.libPaths();'
[1] "/home/rstudio/R/x86_64-redhat-linux-gnu-library/3.6"
[2] "/usr/lib64/R/library"                               
[3] "/usr/share/R/library"                               
```

## ライブラリの大移動

いろいろ考えたけど、ホームディレクトリからシステム共通ディレクトリに移動させることにした。

デフォルトは**rstudio**ユーザーのホームデイレクトリの方にいんすこされるので。
そこから、システム共通ディレクトリのほうにいんすこ。

```
$cd ~/R/x86_64-redhat-linux-gnu-library/3.6
$ls
DT  crosstalk  rmarkdown
$ls | awk '{print "sudo mv "$0" /usr/lib64/R/library/"$0}'
sudo mv DT /usr/lib64/R/library/DT
sudo mv crosstalk /usr/lib64/R/library/crosstalk
sudo mv rmarkdown /usr/lib64/R/library/rmarkdown
```


移動できたか確認

```
$cd /usr/lib64/R/library/
```


資産のリンクは貼っているので、server.Rとui.Rファイルで参照しているライブラリが移動できていれば、
ホットデプロイで、URLいくとレンダラされる。


# server.Rファイルでの外部ファイルのよみこみ

https://www.ok-data.com/entry/import-external-data/

https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Complete_list_of_MIME_types

```

```
