https://www.tldp.org/LDP/abs/html/io-redirection.html

ttyに関して
https://teratail.com/questions/165417


httpプロトコルに関して
https://www.kagoya.jp/howto/webhomepage/http-2/

lsofコマンド便利

https://oishi-kenko.hatenablog.com/entry/2017/11/17/162708

標準入力と標準出力
https://qiita.com/angel_p_57/items/03582181e9f7a69f8168#tty%E3%81%A8pty

ttyやptsについて
https://qiita.com/toshihirock/items/22de12f99b5c40365369

ttyコマンドは現在ログインしているユーザーが使用しているpts仮想ファイルを出力。
ttyもファイルで、実端末単位に管理しているファイルのこと。

https://takuya-1st.hatenablog.jp/entry/20101024/1287947368

実端末--->仮想端末1,2,3,4,....

https://qiita.com/toshihirock/items/78286fccf07dbe6df38f

標準入力と標準出力と標準エラー出力をターミナル単位に管理するために
ptsファイルが作成されている。

ファイルディスクリプタはプロセスがファイルを扱う際に、使用しているファイルを一意に識別するための番号。

デフォでファイルデスクリプタには以下の割当がされている

0:標準入力
1:標準出力
2:標準エラー出力

2番以降はプロセスがファイルを扱うごとに割当がされていく


Ctrl+AltF7,6,5,4,3,2,1あたりおすと楽しい。

制御端末とか
http://archive.linux.or.jp/JF/JFdocs/Text-Terminal-HOWTO-6.html


http://m-hiyama.hatenablog.com/entry/20071221/1198221671


パイプからの入力なのか判定
https://rcmdnk.com/blog/2014/01/15/coputer-bash-zsh/


- 名前付きパイプに関して

  - http://cympfh.cc/taglibro/2019/12/07

- 標準出力と標準エラー出力とファイルディスクリプタ

  - http://www.usinezumi.com/blog/2016/11/02/329/

- ファイルディスクリプタ

  - https://github.com/ueokande/tegrep/blob/master/tegrep

  - testコマンドの-tオプション
  - -t FD  ファイル記述子 FD がターミナル上で開いている
