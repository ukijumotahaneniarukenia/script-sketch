- IN

```
$ cat test.xsd
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  <xs:element name="items">
    <xs:complexType>
      <xs:sequence>
        <xs:element maxOccurs="unbounded" ref="item"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="item">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="name"/>
        <xs:element ref="age"/>
      </xs:sequence>
      <xs:attribute name="id" use="required" type="xs:integer"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="name" type="xs:NCName"/>
  <xs:element name="age" type="xs:integer"/>
</xs:schema>
```


- CMD

べんり

```
$ xjc test.xsd
スキーマの解析中...
スキーマのコンパイル中...
generated/Item.java
generated/Items.java
generated/ObjectFactory.java
```

- OUT

```
$ tree
.
├── generated
│   ├── Item.java
│   ├── Items.java
│   └── ObjectFactory.java
├── md-cmd.md
├── test.xml
└── test.xsd

1 directory, 6 files
```


- REF


```
$ xjc -help
使用方法: xjc [-options ...] <schema file/URL/dir/jar> ... [-b <bindinfo>] ...
dirが指定されている場合は、dir内のすべてのスキーマ・ファイルがコンパイルされます。
jarが指定されている場合は、/META-INF/sun-jaxb.episodeバインディング・ファイルがコンパイルされます。
オプション:
  -nv                : 入力スキーマの厳密な検証を実行しません
  -extension         : ベンダーの拡張機能を許可します - JAXB仕様の互換性ルールおよびApp E.2には
                        厳密に従いません
  -b <file/dir>      : 外部バインディング・ファイルを指定します(各<file>に独自の-bが必要です)
                        ディレクトリが指定されている場合、**/*.xjbが検索されます
  -d <dir>           : 生成されたファイルはこのディレクトリに遷移します
  -p <pkg>           : ターゲット・パッケージを指定します
  -httpproxy <proxy> : HTTP/HTTPSプロキシを設定します。形式は[user[:password]@]proxyHost:proxyPortです
  -httpproxyfile <f> : -httpproxyのように機能しますが、パスワードを保護するためにファイル内の引数を取ります
  -classpath <arg>   : ユーザー・クラス・ファイルを検索する位置を指定します
  -catalog <file>    : 外部エンティティ参照を解決するために、カタログ・ファイルを指定します
                        TR9401、XCatalogおよびOASIS XML Catalog形式をサポートします。
  -readOnly          : 生成されたファイルは読取り専用モードになります
  -npa               : パッケージ・レベル注釈(**/package-info.java)の生成を抑制します
  -no-header         : タイムスタンプ付きのファイル・ヘッダーの生成を抑制します
  -target (2.0|2.1)  : XJC 2.0または2.1のように動作し、2.2の機能を使用しないコードを生成します。
  -encoding <encoding> : 生成されたソース・ファイルの文字エンコーディングを指定します
  -enableIntrospection : Boolean getters/settersを正しく生成できるようにして、Bean Introspection apisを有効にします 
  -contentForWildcard  : 複数のxs:any導出要素を持つタイプのコンテンツ・プロパティを生成します
  -xmlschema         : 入力をW3C XMLスキーマとして処理します(デフォルト)
  -dtd               : 入力をXML DTDとして処理します(試験的、サポートなし)
  -wsdl              : 入力をWSDLとして処理し、その内部のスキーマをコンパイルします(試験的、サポートなし)
  -verbose           : 冗長になります
  -quiet             : コンパイラ出力を非表示にします
  -help              : このヘルプ・メッセージを表示します
  -version           : バージョン情報を表示します
  -fullversion       : フル・バージョン情報を表示します

```
