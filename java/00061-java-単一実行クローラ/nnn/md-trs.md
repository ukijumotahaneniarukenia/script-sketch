

```

[Fatal Error] :3:233474: The element type "h4" must be terminated by the matching end-tag "</h4>".
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 233474; The element type "h4" must be terminated by the matching end-tag "</h4>".


[Fatal Error] :3:232578: The element type "img" must be terminated by the matching end-tag "</img>".
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 232578; The element type "img" must be terminated by the matching end-tag "</img>".


[Fatal Error] :3:228316: The element type "form" must be terminated by the matching end-tag "</form>".
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 228316; The element type "form" must be terminated by the matching end-tag "</form>".


[Fatal Error] :3:7292: The element type "a" must be terminated by the matching end-tag "</a>".
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 7292; The element type "a" must be terminated by the matching end-tag "</a>".


```


以下のエラーでるがふぉー待ったにはうまくとおる

```
17:11:16 ERROR [Crawler 1] - [WebCrawler]- class org.apache.xerces.dom.DeferredDocumentImpl cannot be cast to class org.dom4j.Document (org.apache.xerces.dom.DeferredDocumentImpl and org.dom4j.Document are in unnamed module of loader 'app'), while processing: https://dev.to/t/python
17:11:16 DEBUG [Crawler 1] - [WebCrawler]- Stacktrace
java.lang.ClassCastException: class org.apache.xerces.dom.DeferredDocumentImpl cannot be cast to class org.dom4j.Document (org.apache.xerces.dom.DeferredDocumentImpl and org.dom4j.Document are in unnamed module of loader 'app')
  at app.MyCrawler.strToDom(MyCrawler.java:52)
    at app.MyCrawler.visit(MyCrawler.java:404)
      at edu.uci.ics.crawler4j.crawler.WebCrawler.processPage(WebCrawler.java:403)
        at edu.uci.ics.crawler4j.crawler.WebCrawler.run(WebCrawler.java:261)
          at java.base/java.lang.Thread.run(Thread.java:834)



```








```

// リンタなどでもチェックしてみると xmllint --format test-done.html
// $xmllint --format test-done.html >test-done-done.html 整形
// $xmllint --xpath /html/head/meta test-done-done.html Xpath式検索

```


```
kuraine docker-container-centos-7-6-18-10-java-gradle-idea ~/script-sketch/java/00061-java-単一実行クローラ/nnn$cat test-done-done.xml | xmllint --format -
-:3: parser error : Opening and ending tag mismatch: body line 3 and div
s-truncate css-truncate-target width-fit p-2"></div>                      </div>
                                                                               ^
                                                                               -:3: parser error : Opening and ending tag mismatch: html line 3 and div
                                                                               13 0 12.59 0 12c0-.59 0-1 .59-1z"></path></svg>          </button>        </div>
                                                                                                                                                              ^
                                                                                                                                                              -:3: parser error : Extra content at the end of the document
                                                                                                                                                               12.59 0 12c0-.59 0-1 .59-1z"></path></svg>          </button>        </div>    
                                                                                                                                                                                                                                              ^

```



```





[Fatal Error] :3:5041: Attribute name "data-pjax-transient" associated with an element type "meta" must be followed by the ' = ' character.
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 5041; Attribute name "data-pjax-transient" associated with an element type "meta" must be followed by the ' = ' character.


[Fatal Error] :3:4332: Element type "meta" must be followed by either attribute specifications, ">" or "/>".
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 4332; Element type "meta" must be followed by either attribute specifications, ">" or "/>".


[Fatal Error] :3:12313: The entity "rarr" was referenced, but not declared.
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 12313; The entity "rarr" was referenced, but not declared.



[Fatal Error] :2:37: The character reference must end with the ';' delimiter.
org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 37; The character reference must end with the ';' delimiter.



[Fatal Error] :3:22400: The element type "div" must be terminated by the matching end-tag "</div>".
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 22400; The element type "div" must be terminated by the matching end-tag "</div>".


[Fatal Error] :3:8795: The element type "header" must be terminated by the matching end-tag "</header>".
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 8795; The element type "header" must be terminated by the matching end-tag "</header>".


あやしすぎる

[Fatal Error] :3:8813: The element type "html" must be terminated by the matching end-tag "</html>".
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 8813; The element type "html" must be terminated by the matching end-tag "</html>".


あやしすぎる
[Fatal Error] :3:8805: The element type "body" must be terminated by the matching end-tag "</body>".
org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 8805; The element type "body" must be terminated by the matching end-tag "</body>".





//[Fatal Error] :88:11: The element type "meta" must be terminated by the matching end-tag "</meta>". -->close tag
//[Fatal Error] :5:346: The element type "link" must be terminated by the matching end-tag "</link>". -->close tag
//[Fatal Error] :1:530: The element type "head" must be terminated by the matching end-tag "</head>". -->close tag
//[Fatal Error] :2:18935: The element type "img" must be terminated by the matching end-tag "</img>". -->close tag
//[Fatal Error] :1:31: The markup in the document following the root element must be well-formed. -->script tag
//[Fatal Error] :2:35497: The entity "hellip" was referenced, but not declared.
//[Fatal Error] :2:232875: Character reference "&#20" is an invalid XML character.
//org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 232875; Character reference "&#20" is an invalid XML character.
//[Fatal Error] :2:232876: The entity "nbsp" was referenced, but not declared.
//org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 232876; The entity "nbsp" was referenced, but not declared.
//[Fatal Error] :3:240637: Attribute name "data-reaction-count" associated with an element type "div" must be followed by the ' = ' character.
//        org.xml.sax.SAXParseException; lineNumber: 3; columnNumber: 240637; Attribute name "data-reaction-count" associated with an element type "div" must be followed by the ' = ' character.

//[Fatal Error] :2:43: The declaration for the entity "apos" must end with '>'.
//        org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 43; The declaration for the entity "apos" must end with '>'.
//[Fatal Error] :2:43: The declaration for the entity "quot" must end with '>'.
//        org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 43; The declaration for the entity "quot" must end with '>'.

//[Fatal Error] :2:42: Character reference "&#20" is an invalid XML character.
//        org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 42; Character reference "&#20" is an invalid XML character.
//test.html:2: parser error : Entity 'raquo' not defined -->数値実体参照に置換しないといけない？？？ 文字参照 (character reference) https://so-zou.jp/web-app/tech/html/specification/character-reference.htm
//el="alternate" type="application/rss+xml" title="ukijumotahaneniarukenia &raquo;
//^
//test.html:2: parser error : Entity 'raquo' not defined
//el="alternate" type="application/rss+xml" title="ukijumotahaneniarukenia &raquo;
//^
//test.html:2: parser error : Entity 'raquo' not defined
//el="alternate" type="application/rss+xml" title="ukijumotahaneniarukenia &raquo;
//^

//https://dev.to/nickytonline/dev-to-s-frontend-a-brain-dump-in-one-act-7mg
//[Fatal Error] :2:231068: Attribute name "data-no-instant" associated with an element type "a" must be followed by the ' = ' character. これたいへんそう

//https://www.storange.jp/2017/02/instantclick.html おもしろい

//cat test-done.html | cut -c-231068 | grep data-no-instant --> aタグ始まりなのにaタグ以外で閉じようとしている -->属性名=属性値の形式に置換しなおす

//        org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 231068; Attribute name "data-no-instant" associated with an element type "a" must be followed by the ' = ' character.
```
