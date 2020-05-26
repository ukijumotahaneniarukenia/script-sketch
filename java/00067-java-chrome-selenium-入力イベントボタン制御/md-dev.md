- 実行ディレクトリはシェルの方を見ていた

ので、こう

```
$ ls pic/ | xargs -I@  sudo cp  pic/@ /home/aine/media/@
```
