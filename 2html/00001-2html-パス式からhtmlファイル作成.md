```
$ curl -fsSLO https://raw.githubusercontent.com/ukijumotahaneniarukenia/script-dat/master/test-small.html



$ cat test-small.html 
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>サンプルページダヨーン</title>
  </head>
  <body>
    <h1>あああああああああ</h1>

    <div class="wrapper">
      <div>あ</div>
      <div>い</div>
      <div>う</div>
      <div>え</div>
      <div>お</div>
    </div>

  </body>
</html>


$ cat test-small.html | html2
/html/@lang=ja
/html= 
/html/head= 
/html/head/meta/@http-equiv=content-type
/html/head/meta/@content=text/html; charset=utf-8
/html/head= 
/html/head/title=サンプルページダヨーン
/html/head= 
/html= 
/html/body= 
/html/body/h1=あああああああああ
/html/body= 
/html/body/div/@class=wrapper
/html/body/div= 
/html/body/div/div=あ
/html/body/div= 
/html/body/div/div=い
/html/body/div= 
/html/body/div/div=う
/html/body/div= 
/html/body/div/div=え
/html/body/div= 
/html/body/div/div=お
/html/body/div= 
/html/body= 
/html= 


$ cat test-small.html | html2 >htmlpath.txt


$ cat htmlpath.txt | 2html 
<html lang="ja"> <head> <meta http-equiv="content-type" content="text/html; charset=utf-8"> <title>サンプルページダヨーン</title>  <body> <h1>あああああああああ</h1> <div class="wrapper"> <div>あ</div> <div>い</div> <div>う</div> <div>え</div> <div>お</div> </div>  



$ cat htmlpath.txt | 2html | tidy -indent - 2>/dev/null | grep -vP 'Tidy|generator'|html2 >htmlpath2.txt 
aine ukijumotahaneniarukenia aine-MS-7B98 01:05:20 ~/script-sketch/2html$


$ cat htmlpath2.txt | 2html 
<html lang="ja"> <head> <meta http-equiv="content-type" content="text/html; charset=utf-8"> <title>サンプルページダヨーン</title>  <body> <h1>あああああああああ</h1> <div class="wrapper"> <div> あ </div> <div> い </div> <div> う </div> <div> え </div> <div> お </div> </div>  
```
