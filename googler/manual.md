# 参考文献

https://linuxfan.info/googler

https://github.com/jarun/googler/releases/tag/v4.0


# 使い方

```
$googler うんこ

 1.  株式会社うんこ【公式ショップ】
     https://unco.shop/
     株式会社うんこ【公式ショップ】では、Tシャツ、ポロシャツ、パーカー、リストバンドなどなど、たくさんの【うんこ】グッズを取り揃えております。 新製品も続々生産中！
     今後も楽しい商品をご提案し、多くの笑顔をお届けします。

 2.  株式会社うんこ
     https://unco.co.jp/
     うんこで皆を笑顔にする会社。笑う＝楽しい＝喜び、元気になる「少しでも多くの人に微笑んでもらいたい」そんな気持ちから会社を設立しました。「少しでも多くの人に微笑んでもらいたい」そんな気持ちから会社を設立しま
     した。うんこで世界を楽しくしよう！うんこで ...

 3.  うんこミュージアム【公式】
     https://unkomuseum.com/
     うんこ”をテーマにしたミュージアムが爆誕。うんこを見て、触って、撮って、遊んで、究極の“ウンターテイメント”をお楽しみください。

 4.  糞 - Wikipedia
     https://ja.wikipedia.org/wiki/%E7%B3%9E
     糞（くそ、ふん。※「くそ」の別表記：屎）とは、動物の消化管から排出される固体状の排泄物（屎尿）。糞便（ふんべん）、大便（だいべん）、便（べん）、俗にうんこ、うんち、ばばや、大便から転じ大などとも呼ばれる。し
     かし、硬さや大きさ、成分などの違いで呼び名を ...

 5.  うんこ！｜絵本ナビ : サトシン,西村 敏雄 みんなの声・通販
     https://www.ehonnavi.net/ehon00.asp?no=34494
     うんこ！、サトシン,西村 敏雄：1000万人が利用するNo.1絵本情報サイト、みんなの声161件、なんとまあ、このいさぎよい表紙！ 中を開けばその大胆さは多く...、ためしよみ、投稿できます。

 6.  うんこ! | サトシン, 西村 敏雄 |本 | 通販 | Amazon
     https://www.amazon.co.jp/%E3%81%86%E3%82%93%E3%81%93-%E3%82%B5%E3%83%88%E3%82%B7%E3%83%B3/dp/4894236699
     Amazonでサトシン, 西村 敏雄のうんこ!。アマゾンならポイント還元本が多数。サトシン, 西村 敏雄作品ほか、お急ぎ便対象商品は当日お届けも可能。またうんこ!もアマゾン配送商品なら通常配送無料。

 7.  “MAXうんこカワイイ”東京の新名所「うんこミュージアム TOKYO ...
     https://asobuild.com/news/4953/
     2019/08/09,
     うんこミュージアムYOKOHAMA」の第二弾として、ダイバーシティ東京 プラザ 2階にオープンした「うんこミュージアム TOKYO」。 今度のコンセプトは “MAXうんこカワイイ”。
     カラフルでおしゃれなうんこを見て、触って、撮って、遊んで


$googler --help
usage: googler [-h] [-s N] [-n N] [-N] [-c TLD] [-l LANG] [-x]
               [--colorize [{auto,always,never}]] [-C] [--colors COLORS] [-j]
               [-t dN] [-w SITE] [--unfilter] [-p PROXY] [--noua] [--notweak]
               [--json] [--url-handler UTIL] [--show-browser-logs] [--np] [-u]
               [--include-git] [-v] [-d]
               [KEYWORD [KEYWORD ...]]

Google from the command-line.

positional arguments:
  KEYWORD               search keywords

optional arguments:
  -h, --help            show this help message and exit
  -s N, --start N       start at the Nth result
  -n N, --count N       show N results (default 10)
  -N, --news            show results from news section
  -c TLD, --tld TLD     country-specific search with top-level domain .TLD,
                        e.g., 'in' for India
  -l LANG, --lang LANG  display in language LANG
  -x, --exact           disable automatic spelling correction
  --colorize [{auto,always,never}]
                        whether to colorize output; defaults to 'auto', which
                        enables color when stdout is a tty device; using
                        --colorize without an argument is equivalent to
                        --colorize=always
  -C, --nocolor         equivalent to --colorize=never
  --colors COLORS       set output colors (see man page for details)
  -j, --first, --lucky  open the first result in web browser and exit
  -t dN, --time dN      time limit search [h5 (5 hrs), d5 (5 days), w5 (5
                        weeks), m5 (5 months), y5 (5 years)]
  -w SITE, --site SITE  search a site using Google
  --unfilter            do not omit similar results
  -p PROXY, --proxy PROXY
                        tunnel traffic through an HTTP proxy; PROXY is of the
                        form [http://][user:password@]proxyhost[:port]
  --noua                legacy option (no effect)
  --notweak             disable TCP optimizations and forced TLS 1.2
  --json                output in JSON format; implies --noprompt
  --url-handler UTIL    custom script or cli utility to open results
  --show-browser-logs   do not suppress browser output (stdout and stderr)
  --np, --noprompt      search and exit, do not prompt
  -u, --upgrade         perform in-place self-upgrade
  --include-git         when used with --upgrade, get latest git master
  -v, --version         show program's version number and exit
  -d, --debug           enable debugging

omniprompt keys:
  n, p                  fetch the next or previous set of search results
  index                 open the result corresponding to index in browser
  f                     jump to the first page
  o [index|range|a ...] open space-separated result indices, numeric ranges
                        (sitelinks unsupported in ranges), or all, in browser
                        open the current search in browser, if no arguments
  O [index|range|a ...] like key 'o', but try to open in a GUI browser
  g keywords            new Google search for 'keywords' with original options
                        should be used to search omniprompt keys and indices
  c index               copy url to clipboard
  u                     toggle url expansion
  q, ^D, double Enter   exit googler
  ?                     show omniprompt help
  *                     other inputs issue a new search with original options

Version 4.0
Copyright © 2008 Henri Hakkinen
Copyright © 2015-2019 Arun Prakash Jana <engineerarun@gmail.com>
Zhiming Wang <zmwangx@gmail.com>
License: GPLv3
Webpage: https://github.com/jarun/googler
```
