gitlabの削除

dockerホスト

```

find / -name "*gitlab*" 2>/dev/null | grep -v docker | xargs -I@ rm -rf @


cgroup配下以外は削除できる。

cgroup配下は再起動後削除される。

便利。

```
