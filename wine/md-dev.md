- https://mongonta.com/f273-howto-install-wine-to-ubuntu/

20200523時点ですんなりはいった

```
apt install -y winetricks
```

プルしてくれるアプリ調査

```
winetricks list-all | grep fonts

```

ふぉんとなどをいんすこ

１５分ぐらいたしか
```
time winetricks allfonts fakejapanese
```

起動

一般ユーザーで起動

```
$wine $HOME/WinMerge/WinMergeU.exe 1>$HOME/launch-winmerge.log 2>&1 &
```

動作確認

```
$mkdir wrksp
$cd wrksp/
$touch a b
$ls -l
total 16
drwxr-xr-x. 2 kuraine kuraine 4096  5月 23 22:17 ./
drwxr-xr-x. 1 kuraine kuraine 4096  5月 23 22:16 ../
-rw-r--r--. 1 kuraine kuraine    0  5月 23 22:17 a
-rw-r--r--. 1 kuraine kuraine    0  5月 23 22:17 b

$echo ウンコもりもり森鴎外>a
$echo うんこモリモリ森鴎外>b

$ls -l
total 24
drwxr-xr-x. 2 kuraine kuraine 4096  5月 23 22:17 ./
drwxr-xr-x. 1 kuraine kuraine 4096  5月 23 22:16 ../
-rw-r--r--. 1 kuraine kuraine   31  5月 23 22:17 a
-rw-r--r--. 1 kuraine kuraine   31  5月 23 22:17 b
```
