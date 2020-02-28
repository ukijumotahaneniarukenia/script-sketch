# Unicodeオプション

- http://blog.livedoor.jp/dankogai/archives/51026593.html
```
aine@centos ~/script-env-regression-test$echo うんこUNKOウンコunko産んこＵｎｋｏｳﾝｺ | perl -CIO -pe 's/\p{Katakana}/-/g'
うんこUNKO---unko産んこＵｎｋｏ---

```


# プログラム単位のファイル名の切り方参考に

- http://www.kent-web.com/


# 参考文献

https://www.google.com/amp/s/end0tknr.hateblo.jp/entry/20111020/1319119274%3Famp%3D1

階乗の計算
順列と組み合わせで使う
http://www2u.biglobe.ne.jp/~MAS/perl/waza/power.html

http://www.gi.ce.t.kyoto-u.ac.jp/user/susaki/perl/array.html

リストライブラリ！

https://shogo82148.github.io/blog/2017/04/13/perl-int64/

http://sonic64.com/2004-11-14.html

https://perlmaven.com/min-max-sum-using-list-util

https://www.google.com/amp/s/pointoht.ti-da.net/a8175252.html

https://www.google.com/amp/s/pointoht.ti-da.net/a8166100.html

https://qz.tsugumi.org/Perl_List_Util.html

perlによる前処理
http://takenaka-akio.org/doc/perl_kiso/hash2.html

ファイルディスクリタをみる
https://tweeeety.hateblo.jp/entry/20131220/1387532295

perlの真偽値

https://qiita.com/xtetsuji/items/e584b819d3cd1604a91f#%E3%81%BE%E3%81%A8%E3%82%81

デバッガ
https://tutorial.perlzemi.com/blog/20100302126967.html


データ構造操作
サンプル豊富
https://caveofprogramming.com/perl-tutorial/perl-array-quick-guide-to-arrays-in-perl.html


デコードしてエンコード
http://blog.livedoor.jp/dankogai/archives/51031595.html
http://blog.livedoor.jp/xaicron/archives/50575856.html?utm_source=zenback&utm_medium=http%3A//blog.livedoor.jp/dankogai/archives/51031595.html&utm_campaign=zb_related_links

perlでの集合演算
http://blog.livedoor.jp/dankogai/archives/51442760.html

偽で評価されることの説明。貴重。

http://nozawashinichi.sakura.ne.jp/usingmt/2015/05/perl-true-false-annonymous-array.html

配列の配列の作り方
参照を持たせて持ち回る

http://nozawashinichi.sakura.ne.jp/usingmt/2011/01/perl-3.html?utm_source=zenback&utm_medium=http%3A//hachiojipm.github.io/entry/2013-09-09-02.html&utm_campaign=zb_related_links


順列の理解はegisonの理解につながる。
左側から束縛されて、残りの要素の順序を結合して
行ったもの。

https://qiita.com/satzz/items/2fbefff07df3cb052240
　
Perl詳しい方の説明
省略の美学

バッファリングをオフにするのは役に立ちそう
http://hachiojipm.github.io/entry/2013-09-16-perlonechar.html

Perlリファの詳しい説明

https://ja.m.wikibooks.org/wiki/Perl/リファレンス

リストコンテキスト便利そう
配列で、グルーピングしながら持ちまれるか確認
https://rfs.jp/sb/perl/02/09.html


Perlの正規表現実例
肯定先読みとか

https://qiita.com/ryooku/items/cbb00897f9d2b0ac5c80

perlにもakwのBEGIN,END的なやつある
https://pointoht.ti-da.net/e9085003.html

配列にハッシュをいれる！！！！！！！！！
https://fujishinko.exblog.jp/9139163/

配列超絶テクニック集が面白い
https://rfs.jp/sb/perl/02/04.html#%E9%85%8D%E5%88%97%E3%81%AE%E8%B6%85%E7%B5%B6%E3%83%86%E3%82%AF%E3%83%8B%E3%83%83%E3%82%AF%E5%A4%A7%E5%85%A8%E9%9B%86

でりふぁとりふぁ
https://qiita.com/jike37/items/0ca3f517225e3b8fd0f0#%E5%A4%89%E6%95%B0

eval
https://www.ipa.go.jp/security/awareness/vendor/programmingv1/a04_02.html

ターミナル絵ミュ力う
https://www.slideshare.net/icchyr/ss-52341962?next_slideshow=1

haskellとperl比較
https://qiita.com/debug-ito/items/f5b90c6e2c86bf97a66f

リファレンスとかいろいろ整理してからやろうかな。。
https://pointoht.ti-da.net/e8748181.html

qw演算子はリスト
javadrive.jp/perl/array/index6.html


https://gihyo.jp/dev/serial/01/perl-hackers-hub/005503

https://tweeeety.hateblo.jp/entry/2015/02/16/174019

grepがあるじゃん!

https://donow.jp/skillup/?p=1204


文字列操
https://www.ibm.com/developerworks/jp/linux/library/l-optperl/index.html

evalできないkuyashii
https://ameblo.jp/nokamn/entry-11714498866.html
http://perl.no-tubo.net/2010/04/06/perl%E3%81%AE%E5%A4%89%E6%95%B0%E5%90%8D%E3%82%92%E5%A4%89%E6%95%B0%E3%81%AB%E6%A0%BC%E7%B4%8D%E3%81%97%E3%81%A6%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E7%9A%84%E3%81%AB%E4%BD%BF%E3%81%A3%E3%81%A6/


変数名の詳しい説明!!!!!!!!!!!!!</br >
http://www.tech-web.net/perlmania/perldata.html#Variable_names

わりとあたらしいい
https://developer.hatenastaff.com/entry/2016/04/01/104031

配列結合
http://www.koikikukan.com/archives/2012/08/12-005555.php

引数処理
とてもいい
https://gist.github.com/karupanerura/7e866102bb6f9238f103

コマンドラインの引数
http://goldenstate.cocolog-nifty.com/blog/2014/11/perl-737a.html

引数の受け渡し方
https://tutorial.perlzemi.com/blog/20101130129876.html

データ構造
https://perldoc.jp/docs/perl/5.26.1/perldsc.pod

文字列整形
https://perldoc.jp/docs/perl/5.8.8/perlform.pod</br >
https://perldoc.jp/docs/perl/5.26.1/perlfunc.pod#write

ハッシュ配列のソート
https://www.jonki.net/entry/20100725/1280062300
https://blog.emwai.jp/perl/hashsort/
https://www.jonki.net/entry/20100725/1280062300
https://qiita.com/otaka/items/af69693e68052e7ca02c

記号化できる！
https://memo.sugyan.com/entry/20090906/1252176278

ファイルディスクリプタ
配列のevalを使った部分
https://www.slideshare.net/mobile/bsdhack/ss-43064758


perl sort大全

https://qiita.com/otaka/items/af69693e68052e7ca02c

map計算

https://donow.jp/skillup/?p=1212#map-3

Grep map コンボでフィルタリング実現できる。
集合演算できる。

https://hgotoh.jp/wiki/doku.php/documents/perl/perl-014

文字列処理

http://www.tohoho-web.com/wwwperl1.htm

範囲演算子
シフトアンシフト

https://github.com/perl-entrance-org/workshop-2019

Perl lll

https://mattn.kaoriya.net/software/lang/perl/20100901231137.htm

split関数便利

https://tutorial.perlzemi.com/blog/20080301120434.html

join関数便利

https://tutorial.perlzemi.com/blog/20081007122338.html

正規表現

https://perldoc.jp/docs/perl/5.16.1/perlreref.pod

前処理の流れがコンパクト

http://www.gi.ce.t.kyoto-u.ac.jp/user/susaki/perl/lesson_io.html

Perl前処理

https://perl48.hatenablog.com/entry/2018/08/11/010635


スクリプト記号化
https://memo.sugyan.com/entry/20090906/1252176278

パタン生成に使える
https://www.perl.com/article/creating-ip-address-tools-from-scratch/


こういうのいい
https://qiita.com/uniqrow/items/e1fab393113d32e3a7cb
