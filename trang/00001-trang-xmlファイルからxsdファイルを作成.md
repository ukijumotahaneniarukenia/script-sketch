- IN

```
$ cat test.xml
<?xml version="1.0" encoding="UTF-8"?>
<items>
  <item id="123">
    <name>Andy</name>
    <age>21</age>
  </item>
  <item id="234">
    <name>Brian</name>
    <age>23</age>
  </item>
  <item id="345">
    <name>Charles</name>
    <age>19</age>
  </item>
</items>
```


- CMD

```
xml2xsd-java test.xml test.xsd
```

- OUT

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
