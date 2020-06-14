- PRE


```
apt install -y tidy

tidy --help
```


- IN

```
$ cat test-big.html | pup '.cpd-l' | pup 'html'

<html>
 <head>
 </head>
 <body>
  <li class="cpd-l">
   <span id="cpd_number_getreadsall" class="cpd-r">
    8725
   </span>
   総閲覧数:
  </li>
  <li class="cpd-l">
   <span id="cpd_number_getreadstoday" class="cpd-r">
    21
   </span>
   今日の閲覧数:
  </li>
  <li class="cpd-l">
   <span id="cpd_number_getreadsyesterday" class="cpd-r">
    307
   </span>
   昨日の閲覧数:
  </li>
  <li class="cpd-l">
   <span id="cpd_number_getuserall" class="cpd-r">
    7145
   </span>
   総訪問者数:
  </li>
  <li class="cpd-l">
   <span id="cpd_number_getuseronline" class="cpd-r">
    1
   </span>
   現在オンライン中の人数:
  </li>
  <li class="cpd-l">
   <span id="cpd_number_getfirstcount" class="cpd-r">
    2018年12月23日
   </span>
   カウント開始日:
  </li>
 </body>
</html>
```


- CMD
  - indentつけるとリンタ走っていいかんじ

```
cat test-big.html | pup '.cpd-l' | pup 'html' | tidy -indent 2>/dev/null
```


- OUT


```
<!DOCTYPE html>
<html>
<head>
  <meta name="generator" content=
  "HTML Tidy for HTML5 for Linux version 5.2.0">
  <title></title>
</head>
<body>
  <ul>
    <li class="cpd-l"><span id="cpd_number_getreadsall" class=
    "cpd-r">8725</span> 総閲覧数:</li>
    <li class="cpd-l"><span id="cpd_number_getreadstoday" class=
    "cpd-r">21</span> 今日の閲覧数:</li>
    <li class="cpd-l"><span id="cpd_number_getreadsyesterday"
    class="cpd-r">307</span> 昨日の閲覧数:</li>
    <li class="cpd-l"><span id="cpd_number_getuserall" class=
    "cpd-r">7145</span> 総訪問者数:</li>
    <li class="cpd-l"><span id="cpd_number_getuseronline" class=
    "cpd-r">1</span> 現在オンライン中の人数:</li>
    <li class="cpd-l"><span id="cpd_number_getfirstcount" class=
    "cpd-r">2018年12月23日</span> カウント開始日:</li>
  </ul>
</body>
</html>
```




- CMD


```
cat test-big.html | pup '.cpd-l' | pup 'html' | tidy -indent 2>/dev/null | tidy -i
```


- OUT

```
Info: Document content looks like HTML5
No warnings or errors were found.

<!DOCTYPE html>
<html>
<head>
  <meta name="generator" content=
  "HTML Tidy for HTML5 for Linux version 5.2.0">
  <title></title>
</head>
<body>
  <ul>
    <li class="cpd-l"><span id="cpd_number_getreadsall" class=
    "cpd-r">8725</span> 総閲覧数:</li>
    <li class="cpd-l"><span id="cpd_number_getreadstoday" class=
    "cpd-r">21</span> 今日の閲覧数:</li>
    <li class="cpd-l"><span id="cpd_number_getreadsyesterday"
    class="cpd-r">307</span> 昨日の閲覧数:</li>
    <li class="cpd-l"><span id="cpd_number_getuserall" class=
    "cpd-r">7145</span> 総訪問者数:</li>
    <li class="cpd-l"><span id="cpd_number_getuseronline" class=
    "cpd-r">1</span> 現在オンライン中の人数:</li>
    <li class="cpd-l"><span id="cpd_number_getfirstcount" class=
    "cpd-r">2018年12月23日</span> カウント開始日:</li>
  </ul>
</body>
</html>

About HTML Tidy: https://github.com/htacg/tidy-html5
Bug reports and comments: https://github.com/htacg/tidy-html5/issues
Official mailing list: https://lists.w3.org/Archives/Public/public-htacg/
Latest HTML specification: http://dev.w3.org/html5/spec-author-view/
Validate your HTML documents: http://validator.w3.org/nu/
Lobby your company to join the W3C: http://www.w3.org/Consortium

Do you speak a language other than English, or a different variant of 
English? Consider helping us to localize HTML Tidy. For details please see 
https://github.com/htacg/tidy-html5/blob/master/README/LOCALIZE.md
```
