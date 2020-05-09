```

// リンタなどでもチェックしてみると xmllint --format test-done.html
// $xmllint --format test-done.html >test-done-done.html 整形
// $xmllint --xpath /html/head/meta test-done-done.html Xpath式検索

```


```
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
