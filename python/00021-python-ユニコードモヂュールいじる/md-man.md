- https://docs.python.org/ja/3/library/unicodedata.html
```

文字列からユニコード名を取得

echo 12353 12360 | opy 'B:{import unicodedata;};{[print(i,chr(i),unicodedata.name(chr(i)),sep="\t") for i in range(F1,F2)]}'
12353	ぁ	HIRAGANA LETTER SMALL A
12354	あ	HIRAGANA LETTER A
12355	ぃ	HIRAGANA LETTER SMALL I
12356	い	HIRAGANA LETTER I
12357	ぅ	HIRAGANA LETTER SMALL U
12358	う	HIRAGANA LETTER U
12359	ぇ	HIRAGANA LETTER SMALL E

文字列から汎用カテゴリ名を取得

echo 12353 12360 | opy 'B:{import unicodedata;};{[print(i,chr(i),unicodedata.category(chr(i)),sep="\t") for i in range(F1,F2)]}'
12353	ぁ	Lo
12354	あ	Lo
12355	ぃ	Lo
12356	い	Lo
12357	ぅ	Lo
12358	う	Lo
12359	ぇ	Lo


文字列から双方向クラス名を取得

echo 12353 12360 | opy 'B:{import unicodedata;};{[print(i,chr(i),unicodedata.bidirectional(chr(i)),sep="\t") for i in range(F1,F2)]}'
12353	ぁ	L
12354	あ	L
12355	ぃ	L
12356	い	L
12357	ぅ	L
12358	う	L
12359	ぇ	L

文字列から正規結合クラス名を取得。未定義時は0を返却。

echo 12353 12360 | opy 'B:{import unicodedata;};{[print(i,chr(i),unicodedata.combining(chr(i)),sep="\t") for i in range(F1,F2)]}'
12353	ぁ	0
12354	あ	0
12355	ぃ	0
12356	い	0
12357	ぅ	0
12358	う	0
12359	ぇ	0



echo 12353 12360 | opy 'B:{import unicodedata;};{[print(i,chr(i),unicodedata.east_asian_width(chr(i)),sep="\t") for i in range(F1,F2)]}'
12353	ぁ	W
12354	あ	W
12355	ぃ	W
12356	い	W
12357	ぅ	W
12358	う	W
12359	ぇ	W


echo 12353 12360 | opy 'B:{import unicodedata;};{[print(i,chr(i),unicodedata.mirrored(chr(i)),sep="\t") for i in range(F1,F2)]}'
12353	ぁ	0
12354	あ	0
12355	ぃ	0
12356	い	0
12357	ぅ	0
12358	う	0
12359	ぇ	0


echo 12353 12360 | opy 'B:{import unicodedata;};{[print(i,chr(i),unicodedata.decomposition(chr(i)),sep="\t") for i in range(F1,F2)]}'
12353	ぁ	
12354	あ	
12355	ぃ	
12356	い	
12357	ぅ	
12358	う	
12359	ぇ


echo 12353 12360 | opy 'B:{import unicodedata;};{[print(i,chr(i),unicodedata.normalize("NFKC",chr(i)),sep="\t") for i in range(F1,F2)]}'
12353	ぁ	ぁ
12354	あ	あ
12355	ぃ	ぃ
12356	い	い
12357	ぅ	ぅ
12358	う	う
12359	ぇ	ぇ

echo 12393 12400 | opy 'B:{import unicodedata;};{print(unicodedata.unidata_version)}'
11.0.0


echo 0x3041 0x3047 | opy 'B:{import unicodedata;};{[print(i,hex(i),chr(i),unicodedata.name(chr(i)),sep="\t") for i in range(F1,F2)]}'
12353	0x3041	ぁ	HIRAGANA LETTER SMALL A
12354	0x3042	あ	HIRAGANA LETTER A
12355	0x3043	ぃ	HIRAGANA LETTER SMALL I
12356	0x3044	い	HIRAGANA LETTER I
12357	0x3045	ぅ	HIRAGANA LETTER SMALL U
12358	0x3046	う	HIRAGANA LETTER U


echo 0x3041 0x3047 | opy 'B:{import unicodedata;};{[print(i,hex(i),chr(i),unicodedata.name(chr(i)),sep="\t") for i in range(F1,F2) if 0x3043<=i<=0x3045]}'
12355	0x3043	ぃ	HIRAGANA LETTER SMALL I
12356	0x3044	い	HIRAGANA LETTER I
12357	0x3045	ぅ	HIRAGANA LETTER SMALL U


echo 0x3041 0x3047 | opy 'B:{import unicodedata;};{[print(i,hex(i),chr(i),unicodedata.name(chr(i)),sep="\t") for i in range(F1,F2) if not 0x3043<=i<=0x3045]}'
12353	0x3041	ぁ	HIRAGANA LETTER SMALL A
12354	0x3042	あ	HIRAGANA LETTER A
12358	0x3046	う	HIRAGANA LETTER U


echo 0 0x10FFFF | opy 'B:{import unicodedata;};{[print(i,hex(i),chr(i),sep="\t") for i in range(F1,F2) if (not 0x0<=i<=0x20) and (not 0x7f<=i<=0x9f) and (not 0xd800<=i<=0xdfff) ]}'


echo 0 0x10FFFF | opy 'B:{import unicodedata;};{[print(i,hex(i),chr(i),unicodedata.name(chr(i)),sep="\t") for i in range(F1,F2) if (not 0x0<=i<=0x20) and (not 0x7f<=i<=0x9f) and (not 0xd800<=i<=0xdfff) ]}'
```
