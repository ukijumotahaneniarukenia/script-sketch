- IN

```
$cat test.txt
はなじ。
送るれつあく。
ごふくふん金星。
仕方がないかい疾走がいよう。
〜亭さいぼうちかくはなはだけいむしょ。
入江境窓廉価あびるへいがい。
乗せるつくみなと泳ぐ斬殺形ざぜん。
割り箸たれるとくにいく希望する殻たくすせいかん。
弱虫巡回こわすちょさくけん江戸不思議すんか漠然げいひんかん。
しゅしょうぶそう重いちがいひんきゃく斬殺うえるかっこうかくじっけん汚す。
```

- CMD

```
$cat test.txt | python3 -c 'import sys;import MeCab;m=MeCab.Tagger();a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));b=(list(map(lambda x:m.parse(x[0]).split("\n"),a)));print(b)' | sed -r 's;\], \[;\n;g' | sed -r '1s/\[\[//;$s/]]//'>test.txt.done
```

- OUT
```
$cat test.txt.done
'はな\t名詞,固有名詞,人名,名,*,*,はな,ハナ,ハナ', 'じ\t助動詞,*,*,*,不変化型,基本形,じ,ジ,ジ', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
'送る\t動詞,自立,*,*,五段・ラ行,基本形,送る,オクル,オクル', 'れつ\t名詞,一般,*,*,*,*,れつ,レツ,レツ', 'あく\t動詞,自立,*,*,五段・カ行イ音便,基本形,あく,アク,アク', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
'ご\t接頭詞,名詞接続,*,*,*,*,ご,ゴ,ゴ', 'ふく\t名詞,一般,*,*,*,*,ふく,フク,フク', 'ふん\t名詞,一般,*,*,*,*,ふん,フン,フン', '金星\t名詞,一般,*,*,*,*,金星,キンボシ,キンボシ', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
'仕方\t名詞,ナイ形容詞語幹,*,*,*,*,仕方,シカタ,シカタ', 'が\t助詞,格助詞,一般,*,*,*,が,ガ,ガ', 'ない\t形容詞,自立,*,*,形容詞・アウオ段,基本形,ない,ナイ,ナイ', 'かい\t助詞,終助詞,*,*,*,*,かい,カイ,カイ', '疾走\t名詞,サ変接続,*,*,*,*,疾走,シッソウ,シッソー', 'が\t助詞,格助詞,一般,*,*,*,が,ガ,ガ', 'いよ\t動詞,自立,*,*,一段,未然ウ接続,いる,イヨ,イヨ', 'う\t助動詞,*,*,*,不変化型,基本形,う,ウ,ウ', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
'〜\t記号,一般,*,*,*,*,〜,〜,〜', '亭\t名詞,一般,*,*,*,*,亭,チン,チン', 'さい\t名詞,一般,*,*,*,*,さい,サイ,サイ', 'ぼう\t名詞,一般,*,*,*,*,ぼう,ボウ,ボウ', 'ちかく\t形容詞,自立,*,*,形容詞・アウオ段,連用テ接続,ちかい,チカク,チカク', 'はな\t名詞,固有名詞,人名,名,*,*,はな,ハナ,ハナ', 'は\t助詞,係助詞,*,*,*,*,は,ハ,ワ', 'だけ\t助詞,副助詞,*,*,*,*,だけ,ダケ,ダケ', 'いむ\t動詞,自立,*,*,五段・マ行,基本形,いむ,イム,イム', 'しょ\t名詞,一般,*,*,*,*,しょ,ショ,ショ', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
'入江\t名詞,固有名詞,人名,姓,*,*,入江,イリエ,イリエ', '境\t名詞,一般,*,*,*,*,境,サカイ,サカイ', '窓\t名詞,一般,*,*,*,*,窓,マド,マド', '廉価\t名詞,形容動詞語幹,*,*,*,*,廉価,レンカ,レンカ', 'あ\tフィラー,*,*,*,*,*,あ,ア,ア', 'びるへいがい\t名詞,一般,*,*,*,*,*', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
'乗せる\t動詞,自立,*,*,一段,基本形,乗せる,ノセル,ノセル', 'つく\t動詞,自立,*,*,五段・カ行イ音便,基本形,つく,ツク,ツク', 'みな\t名詞,代名詞,一般,*,*,*,みな,ミナ,ミナ', 'と\t助詞,格助詞,一般,*,*,*,と,ト,ト', '泳ぐ\t動詞,自立,*,*,五段・ガ行,基本形,泳ぐ,オヨグ,オヨグ', '斬殺\t名詞,サ変接続,*,*,*,*,斬殺,ザンサツ,ザンサツ', '形\t名詞,接尾,一般,*,*,*,形,ガタ,ガタ', 'ざぜん\t名詞,一般,*,*,*,*,*', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
'割り箸\t名詞,一般,*,*,*,*,割り箸,ワリバシ,ワリバシ', 'たれる\t動詞,自立,*,*,一段,基本形,たれる,タレル,タレル', 'とく\t名詞,一般,*,*,*,*,とく,トク,トク', 'に\t助詞,格助詞,一般,*,*,*,に,ニ,ニ', 'いく\t動詞,自立,*,*,五段・カ行促音便,基本形,いく,イク,イク', '希望\t名詞,サ変接続,*,*,*,*,希望,キボウ,キボー', 'する\t動詞,自立,*,*,サ変・スル,基本形,する,スル,スル', '殻\t名詞,一般,*,*,*,*,殻,カラ,カラ', 'たくす\t動詞,自立,*,*,五段・サ行,基本形,たくす,タクス,タクス', 'せいかん\t名詞,形容動詞語幹,*,*,*,*,せいかん,セイカン,セイカン', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
'弱虫\t名詞,一般,*,*,*,*,弱虫,ヨワムシ,ヨワムシ', '巡回\t名詞,サ変接続,*,*,*,*,巡回,ジュンカイ,ジュンカイ', 'こわす\t動詞,自立,*,*,五段・サ行,基本形,こわす,コワス,コワス', 'ちょ\t名詞,動詞非自立的,*,*,*,*,ちょ,チョ,チョ', 'さ\t名詞,接尾,特殊,*,*,*,さ,サ,サ', 'くけん\t動詞,自立,*,*,一段,体言接続特殊,くける,クケン,クケン', '江戸\t名詞,固有名詞,地域,一般,*,*,江戸,エド,エド', '不思議\t名詞,形容動詞語幹,*,*,*,*,不思議,フシギ,フシギ', 'すん\t動詞,自立,*,*,サ変・スル,体言接続特殊,する,スン,スン', 'か\t助詞,副助詞／並立助詞／終助詞,*,*,*,*,か,カ,カ', '漠然\t名詞,一般,*,*,*,*,漠然,バクゼン,バクゼン', 'げ\t名詞,接尾,一般,*,*,*,げ,ゲ,ゲ', 'い\t動詞,自立,*,*,一段,未然形,いる,イ,イ', 'ひん\t助動詞,*,*,*,不変化型,基本形,ひん,ヒン,ヒン', 'か\t助詞,副助詞／並立助詞／終助詞,*,*,*,*,か,カ,カ', 'ん\t助詞,終助詞,*,*,*,*,ん,ン,ン', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
'しゅしょう\t名詞,サ変接続,*,*,*,*,しゅしょう,シュショウ,シュショー', 'ぶそ\t動詞,自立,*,*,五段・サ行,未然ウ接続,ぶす,ブソ,ブソ', 'う\t助動詞,*,*,*,不変化型,基本形,う,ウ,ウ', '重い\t形容詞,自立,*,*,形容詞・アウオ段,基本形,重い,オモイ,オモイ', 'ちがい\t名詞,ナイ形容詞語幹,*,*,*,*,ちがい,チガイ,チガイ', 'ひん\t助動詞,*,*,*,不変化型,基本形,ひん,ヒン,ヒン', 'きゃく\t名詞,一般,*,*,*,*,きゃく,キャク,キャク', '斬殺\t名詞,サ変接続,*,*,*,*,斬殺,ザンサツ,ザンサツ', 'うえる\t動詞,自立,*,*,一段,基本形,うえる,ウエル,ウエル', 'かっこう\t名詞,一般,*,*,*,*,かっこう,カッコウ,カッコー', 'かく\t名詞,一般,*,*,*,*,かく,カク,カク', 'じっけん\t名詞,サ変接続,*,*,*,*,じっけん,ジッケン,ジッケン', '汚す\t動詞,自立,*,*,五段・サ行,基本形,汚す,ケガス,ケガス', '。\t記号,句点,*,*,*,*,。,。,。', 'EOS', ''
```


- CMD

```
$cat test.txt.done| perl -nle '
  $,=",";@ary=split(/,(?=(?:[^\x27]*\x27[^\x27]*\x27)*[^\x27]*$)/,$_);
  while(my($idx,$ele)=each(@ary)){
    print $.,$idx,$ele;
  }
  '
```


- OUT

```
1,0,'はな\t名詞,固有名詞,人名,名,*,*,はな,ハナ,ハナ'
1,1, 'じ\t助動詞,*,*,*,不変化型,基本形,じ,ジ,ジ'
1,2, '。\t記号,句点,*,*,*,*,。,。,。'
1,3, 'EOS'
1,4, ''
2,0,'送る\t動詞,自立,*,*,五段・ラ行,基本形,送る,オクル,オクル'
2,1, 'れつ\t名詞,一般,*,*,*,*,れつ,レツ,レツ'
2,2, 'あく\t動詞,自立,*,*,五段・カ行イ音便,基本形,あく,アク,アク'
2,3, '。\t記号,句点,*,*,*,*,。,。,。'
2,4, 'EOS'
2,5, ''
3,0,'ご\t接頭詞,名詞接続,*,*,*,*,ご,ゴ,ゴ'
3,1, 'ふく\t名詞,一般,*,*,*,*,ふく,フク,フク'
3,2, 'ふん\t名詞,一般,*,*,*,*,ふん,フン,フン'
3,3, '金星\t名詞,一般,*,*,*,*,金星,キンボシ,キンボシ'
3,4, '。\t記号,句点,*,*,*,*,。,。,。'
3,5, 'EOS'
3,6, ''
4,0,'仕方\t名詞,ナイ形容詞語幹,*,*,*,*,仕方,シカタ,シカタ'
4,1, 'が\t助詞,格助詞,一般,*,*,*,が,ガ,ガ'
4,2, 'ない\t形容詞,自立,*,*,形容詞・アウオ段,基本形,ない,ナイ,ナイ'
4,3, 'かい\t助詞,終助詞,*,*,*,*,かい,カイ,カイ'
4,4, '疾走\t名詞,サ変接続,*,*,*,*,疾走,シッソウ,シッソー'
4,5, 'が\t助詞,格助詞,一般,*,*,*,が,ガ,ガ'
4,6, 'いよ\t動詞,自立,*,*,一段,未然ウ接続,いる,イヨ,イヨ'
4,7, 'う\t助動詞,*,*,*,不変化型,基本形,う,ウ,ウ'
4,8, '。\t記号,句点,*,*,*,*,。,。,。'
4,9, 'EOS'
4,10, ''
5,0,'〜\t記号,一般,*,*,*,*,〜,〜,〜'
5,1, '亭\t名詞,一般,*,*,*,*,亭,チン,チン'
5,2, 'さい\t名詞,一般,*,*,*,*,さい,サイ,サイ'
5,3, 'ぼう\t名詞,一般,*,*,*,*,ぼう,ボウ,ボウ'
5,4, 'ちかく\t形容詞,自立,*,*,形容詞・アウオ段,連用テ接続,ちかい,チカク,チカク'
5,5, 'はな\t名詞,固有名詞,人名,名,*,*,はな,ハナ,ハナ'
5,6, 'は\t助詞,係助詞,*,*,*,*,は,ハ,ワ'
5,7, 'だけ\t助詞,副助詞,*,*,*,*,だけ,ダケ,ダケ'
5,8, 'いむ\t動詞,自立,*,*,五段・マ行,基本形,いむ,イム,イム'
5,9, 'しょ\t名詞,一般,*,*,*,*,しょ,ショ,ショ'
5,10, '。\t記号,句点,*,*,*,*,。,。,。'
5,11, 'EOS'
5,12, ''
6,0,'入江\t名詞,固有名詞,人名,姓,*,*,入江,イリエ,イリエ'
6,1, '境\t名詞,一般,*,*,*,*,境,サカイ,サカイ'
6,2, '窓\t名詞,一般,*,*,*,*,窓,マド,マド'
6,3, '廉価\t名詞,形容動詞語幹,*,*,*,*,廉価,レンカ,レンカ'
6,4, 'あ\tフィラー,*,*,*,*,*,あ,ア,ア'
6,5, 'びるへいがい\t名詞,一般,*,*,*,*,*'
6,6, '。\t記号,句点,*,*,*,*,。,。,。'
6,7, 'EOS'
6,8, ''
7,0,'乗せる\t動詞,自立,*,*,一段,基本形,乗せる,ノセル,ノセル'
7,1, 'つく\t動詞,自立,*,*,五段・カ行イ音便,基本形,つく,ツク,ツク'
7,2, 'みな\t名詞,代名詞,一般,*,*,*,みな,ミナ,ミナ'
7,3, 'と\t助詞,格助詞,一般,*,*,*,と,ト,ト'
7,4, '泳ぐ\t動詞,自立,*,*,五段・ガ行,基本形,泳ぐ,オヨグ,オヨグ'
7,5, '斬殺\t名詞,サ変接続,*,*,*,*,斬殺,ザンサツ,ザンサツ'
7,6, '形\t名詞,接尾,一般,*,*,*,形,ガタ,ガタ'
7,7, 'ざぜん\t名詞,一般,*,*,*,*,*'
7,8, '。\t記号,句点,*,*,*,*,。,。,。'
7,9, 'EOS'
7,10, ''
8,0,'割り箸\t名詞,一般,*,*,*,*,割り箸,ワリバシ,ワリバシ'
8,1, 'たれる\t動詞,自立,*,*,一段,基本形,たれる,タレル,タレル'
8,2, 'とく\t名詞,一般,*,*,*,*,とく,トク,トク'
8,3, 'に\t助詞,格助詞,一般,*,*,*,に,ニ,ニ'
8,4, 'いく\t動詞,自立,*,*,五段・カ行促音便,基本形,いく,イク,イク'
8,5, '希望\t名詞,サ変接続,*,*,*,*,希望,キボウ,キボー'
8,6, 'する\t動詞,自立,*,*,サ変・スル,基本形,する,スル,スル'
8,7, '殻\t名詞,一般,*,*,*,*,殻,カラ,カラ'
8,8, 'たくす\t動詞,自立,*,*,五段・サ行,基本形,たくす,タクス,タクス'
8,9, 'せいかん\t名詞,形容動詞語幹,*,*,*,*,せいかん,セイカン,セイカン'
8,10, '。\t記号,句点,*,*,*,*,。,。,。'
8,11, 'EOS'
8,12, ''
9,0,'弱虫\t名詞,一般,*,*,*,*,弱虫,ヨワムシ,ヨワムシ'
9,1, '巡回\t名詞,サ変接続,*,*,*,*,巡回,ジュンカイ,ジュンカイ'
9,2, 'こわす\t動詞,自立,*,*,五段・サ行,基本形,こわす,コワス,コワス'
9,3, 'ちょ\t名詞,動詞非自立的,*,*,*,*,ちょ,チョ,チョ'
9,4, 'さ\t名詞,接尾,特殊,*,*,*,さ,サ,サ'
9,5, 'くけん\t動詞,自立,*,*,一段,体言接続特殊,くける,クケン,クケン'
9,6, '江戸\t名詞,固有名詞,地域,一般,*,*,江戸,エド,エド'
9,7, '不思議\t名詞,形容動詞語幹,*,*,*,*,不思議,フシギ,フシギ'
9,8, 'すん\t動詞,自立,*,*,サ変・スル,体言接続特殊,する,スン,スン'
9,9, 'か\t助詞,副助詞／並立助詞／終助詞,*,*,*,*,か,カ,カ'
9,10, '漠然\t名詞,一般,*,*,*,*,漠然,バクゼン,バクゼン'
9,11, 'げ\t名詞,接尾,一般,*,*,*,げ,ゲ,ゲ'
9,12, 'い\t動詞,自立,*,*,一段,未然形,いる,イ,イ'
9,13, 'ひん\t助動詞,*,*,*,不変化型,基本形,ひん,ヒン,ヒン'
9,14, 'か\t助詞,副助詞／並立助詞／終助詞,*,*,*,*,か,カ,カ'
9,15, 'ん\t助詞,終助詞,*,*,*,*,ん,ン,ン'
9,16, '。\t記号,句点,*,*,*,*,。,。,。'
9,17, 'EOS'
9,18, ''
10,0,'しゅしょう\t名詞,サ変接続,*,*,*,*,しゅしょう,シュショウ,シュショー'
10,1, 'ぶそ\t動詞,自立,*,*,五段・サ行,未然ウ接続,ぶす,ブソ,ブソ'
10,2, 'う\t助動詞,*,*,*,不変化型,基本形,う,ウ,ウ'
10,3, '重い\t形容詞,自立,*,*,形容詞・アウオ段,基本形,重い,オモイ,オモイ'
10,4, 'ちがい\t名詞,ナイ形容詞語幹,*,*,*,*,ちがい,チガイ,チガイ'
10,5, 'ひん\t助動詞,*,*,*,不変化型,基本形,ひん,ヒン,ヒン'
10,6, 'きゃく\t名詞,一般,*,*,*,*,きゃく,キャク,キャク'
10,7, '斬殺\t名詞,サ変接続,*,*,*,*,斬殺,ザンサツ,ザンサツ'
10,8, 'うえる\t動詞,自立,*,*,一段,基本形,うえる,ウエル,ウエル'
10,9, 'かっこう\t名詞,一般,*,*,*,*,かっこう,カッコウ,カッコー'
10,10, 'かく\t名詞,一般,*,*,*,*,かく,カク,カク'
10,11, 'じっけん\t名詞,サ変接続,*,*,*,*,じっけん,ジッケン,ジッケン'
10,12, '汚す\t動詞,自立,*,*,五段・サ行,基本形,汚す,ケガス,ケガス'
10,13, '。\t記号,句点,*,*,*,*,。,。,。'
10,14, 'EOS'
10,15, ''
```
