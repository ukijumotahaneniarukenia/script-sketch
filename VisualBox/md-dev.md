- https://qiita.com/tukiyo3/items/5ecea7f95cb961f07194

仮想マシンリスト一覧表示

```
$ VBoxManage list vms
"win10" {7ae94a16-58d3-4076-a513-ead73956a52c}
```

起動中仮想マシンリスト一覧表示

```
$ VBoxManage list runningvms
"win10" {7ae94a16-58d3-4076-a513-ead73956a52c}
```


起動中仮想マシンのシャットダウン

```
$ VBoxManage controlvm win10 acpipowerbutton
```

以下の結果が表示されなくなる

```
$ VBoxManage list runningvms
```

停止中仮想マシンの起動

GUIなし

```
$ VBoxManage startvm win10 --type headless
Waiting for VM "win10" to power on...
VM "win10" has been successfully started.

$ VBoxManage list runningvms
"win10" {7ae94a16-58d3-4076-a513-ead73956a52c}
```

GUIあり

```
$ VBoxManage startvm win10
Waiting for VM "win10" to power on...
VM "win10" has been successfully started.

$ VBoxManage list runningvms
"win10" {7ae94a16-58d3-4076-a513-ead73956a52c}
```


スナップショットの一覧取得

```
$ VBoxManage snapshot win10 list
This machine does not have any snapshots

```


スナップショットの作成

```
$ VBoxManage snapshot win10 take win10-csharp-$(date "+%Y-%m-%dT%H-%M-%S")

$ ls -lh /home/aine/VirtualBox\ VMs/win10/Snapshots/
合計 1.1G
-rw-------. 1 aine aine 941M  5月 26 08:52 2020-05-25T23-52-44-944753000Z.sav
-rw-------. 1 aine aine 153M  5月 26 08:55 {629366fa-b89a-40b0-a632-557b0dbe3b8e}.vhd

$ VBoxManage snapshot win10 list

   Name: win10-csharp-2020-05-26T08-52-44 (UUID: e85d8f45-656b-4868-8f9c-c09829495d6f) *

```

仮想マシン自体の削除


```
$ VBoxManage unregistervm win10
$ VBoxManage list vms
```


スナップショットからのリストア

仮想マシン自体の削除をするとリストアできない。

同一仮想マシン上で環境をスウィッチするときに使う想定ぽい


事前準備

20分ほど見積もる

```
$ mv win10/Win10_1909_Japanese_x64.iso .

$ ls
Win10_1909_Japanese_x64.iso  win10

$rm -rf win10

管理GUIで作成後

$ mv Win10_1909_Japanese_x64.iso win10/

などし、

一度シャットダウン後、

管理GUIからisoイメージファイルをマウントして

再起動
```
