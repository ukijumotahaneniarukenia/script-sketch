- http://www.mwsoft.jp/programming/nlp/mecab_cpp.html

```
$mecab-config --cflags
-I/usr/local/include
$mecab-config --libs
-L/usr/local/lib -lmecab -lstdc++
$find /usr/local/include -name "*mecab*" 2>/dev/null
/usr/local/include/mecab.h
$g++ -std=c++11 $(mecab-config --cflags) $(mecab-config --libs) -o main main.cpp
$./main
波乗り	名詞,一般,*,*,*,*,波乗り,ナミノリ,ナミノリ
ジョニー	名詞,固有名詞,人名,名,*,*,ジョニー,ジョニー,ジョニー
EOS

```
