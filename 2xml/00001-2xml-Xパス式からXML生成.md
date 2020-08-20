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


$ cat test.xml | xml2
/items/item/@id=123
/items/item/name=Andy
/items/item/age=21
/items/item
/items/item/@id=234
/items/item/name=Brian
/items/item/age=23
/items/item
/items/item/@id=345
/items/item/name=Charles
/items/item/age=19

$ cat test.xml | xml2 >xpath.txt


$ cat xpath.txt 
/items/item/@id=123
/items/item/name=Andy
/items/item/age=21
/items/item
/items/item/@id=234
/items/item/name=Brian
/items/item/age=23
/items/item
/items/item/@id=345
/items/item/name=Charles
/items/item/age=19


$ cat xpath.txt | 2xml
<items><item id="123"><name>Andy</name><age>21</age></item><item id="234"><name>Brian</name><age>23</age></item><item id="345"><name>Charles</name><age>19</age></item></items>


$ cat xpath.txt | 2xml | xmllint --format -
<?xml version="1.0"?>
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
