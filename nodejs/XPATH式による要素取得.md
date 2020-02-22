- IN

```
$cat test.xml
<?xml version="1.0"?>
<agents>
  <agent id="007">
    <name type="first">James</name>
    <name type="last">Bond</name>
    <age>Still attractive</age>
    <sex>Male</sex>
  </agent>
  <agent id="013">
    <name type="first">Austin</name>
    <name type="last">Powers</name>
    <age>Depends on your timeline</age>
    <sex>Yes, please</sex>
  </agent>
</agents>
```

- CMD

```
$xmllint --xpath '/agents/agent["0"][@id="007"]/name["1"][@type="last"]/text()' test.xml
```


- OUT

```
Bond
```
