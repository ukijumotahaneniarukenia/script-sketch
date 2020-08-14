- IN

```
$ xjc test.xsd
スキーマの解析中...
スキーマのコンパイル中...
generated/Item.java
generated/Items.java
generated/ObjectFactory.java

$ tree generated/
generated/
├── Item.java
├── Items.java
└── ObjectFactory.java

0 directories, 3 files

```


- CMD

べんり

```
$ schemagen generated/*
注意:Writing /home/aine/script-sketch/xjc/00002-xjc-JAVAファイルからXMLスキーマファイルの生成/schema1.xsd
```



- OUT

```
$ cat schema1.xsd
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xs:schema version="1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xs:element name="age" type="xs:integer"/>

  <xs:element name="item">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="name" type="xs:NCName"/>
        <xs:element name="age" type="xs:integer"/>
      </xs:sequence>
      <xs:attribute name="id" type="xs:integer" use="required"/>
    </xs:complexType>
  </xs:element>

  <xs:element name="items">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="item" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>

  <xs:element name="name" type="xs:string"/>
</xs:schema>
```

ソースファイルはコンパイルされている

```
$ tree generated/
generated/
├── Item.class
├── Item.java
├── Items.class
├── Items.java
├── ObjectFactory.class
└── ObjectFactory.java

0 directories, 6 files
```

以下のコマンドの出力と異なる

```
$ xml2xsd-java test.xml test.xsd
```

データファイルをjavaで扱えるないしはjavaで扱ったデータをファイルに吐き出すことができるPOJOファイルの生成過程なので、できる方を選択する

- REF


```
$ schemagen
使用方法: schemagen [-options ...] <java files> 
オプション: 
    -d <path>             : プロセッサおよびjavacが生成したクラス・ファイルを置く位置を指定します
    -cp <path>            : ユーザーが指定したファイルを検索する位置を指定します
    -classpath <path>     : ユーザーが指定したファイルを検索する位置を指定します
    -encoding <encoding>  : 注釈処理/javac呼出しに使用するエンコーディングを指定します
    -episode <file>       : コンパイルごとにエピソード・ファイルを生成します
    -version              : バージョン情報を表示します
    -fullversion          : フル・バージョン情報を表示します
    -help                 : この使用例メッセージを表示します
```
