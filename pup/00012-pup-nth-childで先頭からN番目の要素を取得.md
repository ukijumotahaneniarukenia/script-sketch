- IN

```
$ cat test-big.html | pup '.cpd-l'
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
```

- CMD

```
cat test-big.html | pup '.cpd-l'  | pup ':nth-child(0)'
```

- OUT

```
Selector parsing error: Argument to 'nth-child' must be greater than 0
```


- CMD

```
cat test-big.html | pup '.cpd-l'  | pup ':nth-child(1)'
```

- OUT

```
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


```
cat test-big.html | pup '.cpd-l'  | pup ':nth-child(2)'
```

- OUT

```
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
```

- CMD

```
cat test-big.html | pup '.cpd-l'  | pup ':nth-child(3)'
```

- OUT

```
<li class="cpd-l">
 <span id="cpd_number_getreadsyesterday" class="cpd-r">
  307
 </span>
 昨日の閲覧数:
</li>
```

- CMD

```
cat test-big.html | pup '.cpd-l'  | pup ':nth-child(6)'
```

- OUT

```
<li class="cpd-l">
 <span id="cpd_number_getfirstcount" class="cpd-r">
  2018年12月23日
 </span>
 カウント開始日:
</li>
```

- CMD

```
cat test-big.html | pup '.cpd-l'  | pup ':nth-child(7)'
```
