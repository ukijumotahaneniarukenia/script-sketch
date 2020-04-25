- REF

  - https://yutarine.blogspot.com/2017/04/uniutils-unicode.html

  - http://rpm.pbone.net/index.php3/stat/4/idpl/55500312/dir/centos_6/com/uniutils-2.27-6.6.x86_64.rpm.html

- IN

```

```

- CMD
```
$( export LINES=10000000;unifuzz | grep -o . | head -n10 | uniname -lr) | sort -k4
```



- OUT

```
Generating 1000000 random characters.
character  byte       line      UTF-32   encoded as     glyph   range                                   name
        1          1         2  00000A   0A                     Basic Latin                             LINE FEED (LF)
        3          4         3  00000A   0A                     Basic Latin                             LINE FEED (LF)
        5          6         4  00000A   0A                     Basic Latin                             LINE FEED (LF)
        7          9         5  00000A   0A                     Basic Latin                             LINE FEED (LF)
        9         11         6  00000A   0A                     Basic Latin                             LINE FEED (LF)
       11         13         7  00000A   0A                     Basic Latin                             LINE FEED (LF)
       13         17         8  00000A   0A                     Basic Latin                             LINE FEED (LF)
       15         19         9  00000A   0A                     Basic Latin                             LINE FEED (LF)
       17         24        10  00000A   0A                     Basic Latin                             LINE FEED (LF)
       19         29        11  00000A   0A                     Basic Latin                             LINE FEED (LF)
        4          5         3  000020   20                     Basic Latin                             SPACE
        8         10         5  000020   20                     Basic Latin                             SPACE
       14         18         8  000020   20                     Basic Latin                             SPACE
        0          0         1  000041   41             A      Basic Latin                             LATIN CAPITAL LETTER A
       10         12         6  000062   62             b      Basic Latin                             LATIN SMALL LETTER B
        2          2         2  000301   CC 81          ́      Combining Diacritical Marks             COMBINING ACUTE ACCENT
        6          7         4  000301   CC 81          ́      Combining Diacritical Marks             COMBINING ACUTE ACCENT
       12         14         7  000941   E0 A5 81       ु      Devanagari                              DEVANAGARI VOWEL SIGN U
       16         20         9  01FFFE   F0 9F BF BE    🿾      Undefined                               Undefined
       18         25        10  01FFFF   F0 9F BF BF    🿿      Undefined                               Undefined
```
