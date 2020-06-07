- https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/7/html/installation_guide/sect-making-usb-media
- https://www.mm2d.net/main/tech/linux/hdd_clear-01.html


rootで作業

```
デバイスファイルがOSから認識されていることを確認
$ dmesg | grep removable
[261965.372422] sd 6:0:0:0: [sda] Attached SCSI removable disk
[262917.523906] sd 7:0:0:0: [sda] Attached SCSI removable disk
[262932.944550] sd 8:0:0:0: [sda] Attached SCSI removable disk


usbメモリの中身を消去


$ fdisk -l

Disk /dev/nvme0n1: 500.1 GB, 500107862016 bytes, 976773168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O サイズ (最小 / 推奨): 512 バイト / 512 バイト
Disk label type: dos
ディスク識別子: 0x000114a2

  デバイス ブート      始点        終点     ブロック   Id  システム
/dev/nvme0n1p1   *        2048     7813119     3905536   83  Linux
/dev/nvme0n1p2         7813120    15624191     3905536   82  Linux swap / Solaris
/dev/nvme0n1p3        15624192   976758783   480567296   83  Linux

Disk /dev/sda: 7759 MB, 7759462400 bytes, 15155200 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O サイズ (最小 / 推奨): 512 バイト / 512 バイト
Disk label type: dos
ディスク識別子: 0x7a3b69f4

デバイス ブート      始点        終点     ブロック   Id  システム
/dev/sda1   *           0     5325535     2662768    0  Empty
/dev/sda2            8156       16091        3968   ef  EFI (FAT-12/16/32)



完全削除

```
time dd if=/dev/zero of=/dev/sda &
```

8gbで19分

```
dd: `/dev/sda' に書き込み中です: デバイスに空き領域がありません
15155201+0 レコード入力
15155200+0 レコード出力
7759462400 バイト (7.8 GB) コピーされました、 1193.47 秒、 6.5 MB/秒

real	19m53.475s
user	0m11.080s
sys	0m29.919s

[1]+  終了 1                time dd if=/dev/zero of=/dev/sda
```

デバイスファイルがアンマウント状態であることを確認

標準出力になにも出力されなけばOK

```
$ findmnt /dev/sda
```

書込元のisoファイルの存在確認

```
$ ls -lh /home/aine/Downloads/ubuntu-ja-20.04-desktop-amd64.iso
-rw-rw-r--. 1 aine aine 2.6G  6月  7 02:17 /home/aine/Downloads/ubuntu-ja-20.04-desktop-amd64.iso



$ time dd if=/home/aine/Downloads/ubuntu-ja-20.04-desktop-amd64.iso of=/dev/sda bs=512k
5200+1 レコード入力
5200+1 レコード出力
2726674432 バイト (2.7 GB) コピーされました、 550.726 秒、 5.0 MB/秒

real	9m10.727s
user	0m0.009s
sys	0m1.776s

```
