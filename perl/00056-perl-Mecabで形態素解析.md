- REF

  - https://metacpan.org/pod/Text::MeCab
  - http://teahut.sakura.ne.jp/b/2007-07-05-1.html

- LIB

```
$cpanm install Text::MeCab
```

- IN

```

```


- CMD

```
$perl -MText::MeCab -e 'my $m=Text::MeCab->new();my $s="日本語の形態素解析のテストをしてみます。";for(my $n=$m->parse($s);$n;$n=$n->next){print $n->surface,"\n"}'
```




- OUT

```
日本語
の
形態素
解析
の
テスト
を
し
て
み
ます
。

```


- CMD

```
#!/usr/bin/env perl

use strict;
use Text::MeCab;

my $mecab = Text::MeCab->new();
my $text = "日本語の形態素解析のテストを行ってみます";

for (my $node = $mecab->parse($text); $node; $node = $node->next) {
   print $node->surface, "\n";
   print $node->feature, "\n";
}
```


- OUT

```
日本語
名詞,一般,*,*,*,*,日本語,ニホンゴ,ニホンゴ
の
助詞,連体化,*,*,*,*,の,ノ,ノ
形態素
名詞,一般,*,*,*,*,形態素,ケイタイソ,ケイタイソ
解析
名詞,サ変接続,*,*,*,*,解析,カイセキ,カイセキ
の
助詞,連体化,*,*,*,*,の,ノ,ノ
テスト
名詞,サ変接続,*,*,*,*,テスト,テスト,テスト
を
助詞,格助詞,一般,*,*,*,を,ヲ,ヲ
行っ
動詞,自立,*,*,五段・ワ行促音便,連用タ接続,行う,オコナッ,オコナッ
て
助詞,接続助詞,*,*,*,*,て,テ,テ
み
動詞,非自立,*,*,一段,連用形,みる,ミ,ミ
ます
助動詞,*,*,*,特殊・マス,基本形,ます,マス,マス

BOS/EOS,*,*,*,*,*,*,*,*
```
