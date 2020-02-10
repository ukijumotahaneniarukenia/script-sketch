# 参考文献

sedでif文
http://www.pement.org/sed/ifelse.txt

シェルでの順列列挙
https://qiita.com/gin_135/items/0bdaae5b88fe64936c7f



-rオプションで拡張正規表現使える。
エスケープ必要なくなる。可読性あぷ

Left right parenthesis 
left right curry bracket は
エスケープする必要がある。

Sedで中央ぞろえ
Xコマンドでパタンスペースに取り込まれた標準入力行を
ホルスペースに退避。
行頭と行末に置換文言パタンスペースに仕込む。
Xコマンドで退避しておいた標準入力行を
パタンスペースに後ろから改行区切りで結合

Sedでhttp

http://www.oocities.org/mettw/personal/software/src/sedhttpd.txt

Sed数値計算　sedのeオプション。バッシュの機能を再評価。
https://orebibou.com/2017/03/sedやawkで置換前の値を元に計算した値で置換を行う/

sedのノートブック発見
http://sed.sourceforge.net/#books
https://linuxjm.osdn.jp/html/GNU_sed/man1/sed.1.html

tコマンド使ってみる
https://linuxcommand.net/sed/#_x

sedのexprコマンドとeコマンドで、
数値計算できる

https://www.gnu.org/software/sed/manual/sed.html#uniq
https://ukijumotahaneniarukenia.site/2019/07/05/sed-%e3%83%87%e3%82%bf%e3%83%a9%e3%83%a1%e3%81%aa%e8%a4%87%e6%95%b0%e8%a1%8c%e3%82%92%e5%b0%8f%e7%b6%ba%e9%ba%97%e3%81%aa%e4%b8%80%e8%a1%8c%e3%81%ab%e5%a4%89%e6%8f%9b%e3%81%99%e3%82%8b%e8%a9%b1/

https://www.gnu.org/software/sed/


# gnu sed install

http://ftp.gnu.org/gnu/sed/


```
curl -LO http://ftp.gnu.org/gnu/sed/sed-4.7.tar.xz
tar xvf sed-4.7.tar.xz
cd sed-4.7
./configure --prefix=/usr/local | tee log
make -j12 | tee logg
sudo make -j12 install | tee loggg
echo "alias sed=/usr/local/bin/sed" >> ~/.bashrc
source ~/.bashrc
```

```
[sqlite💞ceacf3fb0808 (土 10月 26 01:46:56) ~/script_scratch/sed/sed-4.7]$which sed
/usr/local/bin/sed
[sqlite🧡ceacf3fb0808 (土 10月 26 01:48:38) ~/script_scratch/sed/sed-4.7]$sed --version
/usr/local/bin/sed (GNU sed) 4.7
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

作者 Jay Fenlason、 Tom Lord、 Ken Pizzini、
Paolo Bonzini、 Jim Meyering、および Assaf Gordon。
GNU sed home page: <https://www.gnu.org/software/sed/>.
General help using GNU software: <https://www.gnu.org/gethelp/>.
E-mail bug reports to: <bug-sed@gnu.org>.
```
