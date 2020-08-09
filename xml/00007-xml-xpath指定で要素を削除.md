- IN

```
$ cat table.xml
<?xml version="1.0"?>
<xml>
  <table>
    <rec id="1">
      <numField>123</numField>
      <stringField>String Value</stringField>
    </rec>
    <rec id="2">
      <numField>346</numField>
      <stringField>Text Value</stringField>
    </rec>
    <rec id="3">
      <numField>-23</numField>
      <stringField>stringValue</stringField>
    </rec>
  </table>
</xml>
```

- CMD

```
$ xml ed -d /xml/table/rec[@id='2'] table.xml
```

- OUT

```
<?xml version="1.0"?>
<xml>
  <table>
    <rec id="1">
      <numField>123</numField>
      <stringField>String Value</stringField>
    </rec>
    <rec id="3">
      <numField>-23</numField>
      <stringField>stringValue</stringField>
    </rec>
  </table>
</xml>
```

元ファイルは上書きされないので、上書きするなら、moreutilsのsponge

```
$ xml ed -d /xml/table/rec[@id='2'] table.xml | sponge table.xml
```
