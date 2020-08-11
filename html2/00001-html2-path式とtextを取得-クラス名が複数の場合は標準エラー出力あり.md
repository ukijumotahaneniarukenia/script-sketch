- IN

```
$ cat test.html
<section id="search-2" class="widget widget_search">
 <form role="search" method="get" class="search-form" action="https://ukijumotahaneniarukenia.site/">
  <label>
   <span class="screen-reader-text">
    Search for:
   </span>
   <input type="search" class="search-field" placeholder="Search …" value="" name="s">
  </label>
  <button type="submit" class="search-submit">
   <span class="screen-reader-text">
    Search
   </span>
  </button>
 </form>
</section>
```

- CMD

htmlタグとbodyタグはデフォルトで補ってくれるらしい

```
$ cat test.html | html2 2>/dev/null
```

- OUT

```
/html/body/section/@id=search-2
/html/body/section/@class=widget widget_search
/html/body/section= 
/html/body/section/form/@role=search
/html/body/section/form/@method=get
/html/body/section/form/@class=search-form
/html/body/section/form/@action=https://ukijumotahaneniarukenia.site/
/html/body/section/form= 
/html/body/section/form/label= 
/html/body/section/form/label/span/@class=screen-reader-text
/html/body/section/form/label/span= Search for: 
/html/body/section/form/label= 
/html/body/section/form/label/input/@type=search
/html/body/section/form/label/input/@class=search-field
/html/body/section/form/label/input/@placeholder=Search â¦
/html/body/section/form/label/input/@value
/html/body/section/form/label/input/@name=s
/html/body/section/form/label= 
/html/body/section/form= 
/html/body/section/form/button/@type=submit
/html/body/section/form/button/@class=search-submit
/html/body/section/form/button= 
/html/body/section/form/button/span/@class=screen-reader-text
/html/body/section/form/button/span= Search 
/html/body/section/form/button= 
/html/body/section/form= 
/html/body/section= 
```


元ファイル

```
$ cat test2.html|grep Search | grep input | uconv -x any-name | grep -Po '\\N{.*?}'|awk '{a[$0]++}END{for (e in a)print e,a[e]}'
\N{QUOTATION MARK} 10
\N{GREATER-THAN SIGN} 1
\N{HORIZONTAL ELLIPSIS} 1
\N{LATIN SMALL LETTER Y} 1
\N{LATIN SMALL LETTER V} 1
\N{LATIN SMALL LETTER U} 2
\N{LATIN CAPITAL LETTER S} 1
\N{LATIN SMALL LETTER T} 2
\N{LATIN SMALL LETTER S} 5
\N{LATIN SMALL LETTER R} 4
\N{LATIN SMALL LETTER P} 3
\N{LATIN SMALL LETTER O} 1
\N{LATIN SMALL LETTER N} 2
\N{LATIN SMALL LETTER M} 1
\N{LATIN SMALL LETTER L} 5
\N{LATIN SMALL LETTER I} 2
\N{LATIN SMALL LETTER H} 4
\N{<control-000A>} 1
\N{LATIN SMALL LETTER F} 1
\N{LATIN SMALL LETTER E} 9
\N{LATIN SMALL LETTER D} 2
\N{LATIN SMALL LETTER C} 5
\N{LATIN SMALL LETTER A} 7
\N{SPACE} 9
\N{EQUALS SIGN} 5
\N{LESS-THAN SIGN} 1
\N{HYPHEN-MINUS} 1
```


変換後

```
$ cat test2.html|grep Search | grep input|html2|grep -Po '(?<=Search).*' | uconv -x any-name | grep -Po '\\N{.*?}'
\N{SPACE}
\N{LATIN SMALL LETTER A WITH CIRCUMFLEX}
\N{<control-0080>}
\N{BROKEN BAR}
\N{<control-000A>}
```

```
\N{HORIZONTAL ELLIPSIS} 1

\N{LATIN SMALL LETTER A WITH CIRCUMFLEX}
```


```
$ unidat-perl 'HORIZONTAL ELLIPSIS'
8230	0x2026	…	name	name	HORIZONTAL ELLIPSIS
8943	0x22EF	⋯	name	name	MIDLINE HORIZONTAL ELLIPSIS
65049	0xFE19	︙	name	name	PRESENTATION FORM FOR VERTICAL HORIZONTAL ELLIPSIS

real	1m45.885s
user	1m45.892s
sys	0m0.775s
```


```
$ unidat-perl 'LATIN SMALL LETTER A WITH CIRCUMFLEX'
226	0xE2	â	name	name	LATIN SMALL LETTER A WITH CIRCUMFLEX
7845	0x1EA5	ấ	name	name	LATIN SMALL LETTER A WITH CIRCUMFLEX AND ACUTE
7847	0x1EA7	ầ	name	name	LATIN SMALL LETTER A WITH CIRCUMFLEX AND GRAVE
7849	0x1EA9	ẩ	name	name	LATIN SMALL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE
7851	0x1EAB	ẫ	name	name	LATIN SMALL LETTER A WITH CIRCUMFLEX AND TILDE
7853	0x1EAD	ậ	name	name	LATIN SMALL LETTER A WITH CIRCUMFLEX AND DOT BELOW

real	1m45.734s
user	1m45.904s
sys	0m0.619s
```


これで対応

ラテンに変換

```
$ cat test2.html|grep Search | grep input | html2|iconv -f UTF-8 -t iso-8859-1
/html/body/input/@type=search
/html/body/input/@class=search-field
/html/body/input/@placeholder=Search …
/html/body/input/@value
/html/body/input/@name=s
```
