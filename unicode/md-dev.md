- この配下がいい感じのテキストファイルがたくさんある

- https://www.unicode.org/Public/12.1.0/ucd/

```
curl -fsSLO https://www.unicode.org/Public/12.1.0/ucd/NormalizationTest.txt

ls -lh
total 2.5M
-rw-r--r-- 1 kuraine kuraine 2.5M  7月  8 10:37 NormalizationTest.txt
-rw-r--r-- 1 kuraine kuraine  124  7月  8 10:36 md-dev.md


grep ㈱ NormalizationTest.txt
3231;3231;3231;0028 682A 0029;0028 682A 0029; # (㈱; ㈱; ㈱; (株); (株); ) PARENTHESIZED IDEOGRAPH STOCK

grep 株式会社 NormalizationTest.txt
337F;337F;337F;682A 5F0F 4F1A 793E;682A 5F0F 4F1A 793E; # (㍿; ㍿; ㍿; 株式会社; 株式会社; ) SQUARE CORPORATION

echo -e "\U3231"
㈱

grep 株 NormalizationTest.txt
3231;3231;3231;0028 682A 0029;0028 682A 0029; # (㈱; ㈱; ㈱; (株); (株); ) PARENTHESIZED IDEOGRAPH STOCK
3291;3291;3291;682A;682A; # (㊑; ㊑; ㊑; 株; 株; ) CIRCLED IDEOGRAPH STOCK
337F;337F;337F;682A 5F0F 4F1A 793E;682A 5F0F 4F1A 793E; # (㍿; ㍿; ㍿; 株式会社; 株式会社; ) SQUARE CORPORATION
```


```
grep -Po "(?<=\) )[A-Z]+" NormalizationTest.txt | sort | uniq -c
      1 ACCOUNT
      1 ACUTE
      1 ADDRESSED
      1 ALEF
      1 ANGSTROM
    883 ARABIC
      6 ARMENIAN
     22 BALINESE
      7 BENGALI
      1 BET
      5 BLACK
      1 BREVE
      1 CADA
      1 CARE
      1 CEDILLA
      2 CENTRELINE
      4 CHAKMA
    241 CIRCLED
   1004 CJK
      4 COMBINING
     52 CYRILLIC
      1 DALET
      2 DASHED
      2 DEGREE
     11 DEVANAGARI
      1 DIAERESIS
     20 DIGIT
     10 DOES
      1 DOT
     25 DOUBLE
      2 EM
      2 EN
      1 EULER
      1 EXCLAMATION
      1 FACSIMILE
      1 FEMININE
      1 FIGURE
      1 FORKING
      1 FOUR
      1 FRACTION
    103 FULLWIDTH
      1 GIMEL
      4 GRANTHA
    277 GREEK
      6 GURMUKHI
      1 HAIR
    122 HALFWIDTH
  11391 HANGUL
      3 HANGZHOU
     47 HEBREW
     28 HIRAGANA
      1 HORIZONTAL
     83 IDEOGRAPHIC
      1 INFORMATION
      3 KAITHI
    214 KANGXI
     10 KANNADA
     34 KATAKANA
      1 KELVIN
      3 LAO
   2286 LATIN
      3 LEFT
      2 LEFTWARDS
      1 LIMITED
      1 MACRON
      6 MALAYALAM
      1 MASCULINE
    996 MATHEMATICAL
      1 MEDIUM
      1 MICRO
    114 MODIFIER
     13 MUSICAL
      2 MYANMAR
      1 NARROW
      1 NEGATED
      9 NEITHER
      1 NO
      1 NON
     17 NOT
     11 NUMBER
      1 NUMERO
      1 OGONEK
      1 OHM
      1 ONE
      8 ORIYA
      1 OVERLINE
    139 PARENTHESIZED
      1 PARTNERSHIP
      2 PLANCK
     33 PRESENTATION
      1 PUNCTUATION
      2 QUADRUPLE
      1 QUESTION
      3 RAISED
      2 REVERSED
      1 RIAL
      1 RIGHT
      2 RIGHTWARDS
      1 RING
     16 ROMAN
      1 RUPEE
     12 SCRIPT
      1 SERVICE
      4 SIDDHAM
      6 SINHALA
      1 SIX
     43 SMALL
    206 SQUARE
     78 SQUARED
     15 SUBSCRIPT
     17 SUPERSCRIPT
      1 SURFACE
      8 TAMIL
      1 TELEPHONE
      1 TELUGU
      1 THAI
      1 THERE
      1 THIN
      2 THREE
     32 TIBETAN
      1 TIFINAGH
      6 TIRHUTA
     10 TORTOISE
      1 TRADE
      2 TRIPLE
      2 TWO
      1 VOLUME
     19 VULGAR
      2 WAVY
```
