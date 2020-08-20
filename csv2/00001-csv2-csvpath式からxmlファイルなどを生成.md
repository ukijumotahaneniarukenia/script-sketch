```
$ cat iris-head3.csv 
"sepal.length","sepal.width","petal.length","petal.width","variety"
5.1,3.5,1.4,.2,"Setosa"
4.9,3,1.4,.2,"Setosa"

$ cat iris-head3.csv | csv2
/file/record
/file/record/@num=0
/file/record/field0="sepal.length"
/file/record/field1="sepal.width"
/file/record/field2="petal.length"
/file/record/field3="petal.width"
/file/record/field4="variety"
/file/record
/file/record/@num=1
/file/record/field0=5.1
/file/record/field1=3.5
/file/record/field2=1.4
/file/record/field3=.2
/file/record/field4="Setosa"
/file/record
/file/record/@num=2
/file/record/field0=4.9
/file/record/field1=3
/file/record/field2=1.4
/file/record/field3=.2
/file/record/field4="Setosa"


$ cat iris-head3.csv | csv2 | 2xml
<file><record num="0"><field0>&quot;sepal.length&quot;</field0><field1>&quot;sepal.width&quot;</field1><field2>&quot;petal.length&quot;</field2><field3>&quot;petal.width&quot;</field3><field4>&quot;variety&quot;</field4></record><record num="1"><field0>5.1</field0><field1>3.5</field1><field2>1.4</field2><field3>.2</field3><field4>&quot;Setosa&quot;</field4></record><record num="2"><field0>4.9</field0><field1>3</field1><field2>1.4</field2><field3>.2</field3><field4>&quot;Setosa&quot;</field4></record></file>

$ cat iris-head3.csv | csv2 | 2xml | xmllint --format -
<?xml version="1.0"?>
<file>
  <record num="0">
    <field0>"sepal.length"</field0>
    <field1>"sepal.width"</field1>
    <field2>"petal.length"</field2>
    <field3>"petal.width"</field3>
    <field4>"variety"</field4>
  </record>
  <record num="1">
    <field0>5.1</field0>
    <field1>3.5</field1>
    <field2>1.4</field2>
    <field3>.2</field3>
    <field4>"Setosa"</field4>
  </record>
  <record num="2">
    <field0>4.9</field0>
    <field1>3</field1>
    <field2>1.4</field2>
    <field3>.2</field3>
    <field4>"Setosa"</field4>
  </record>
</file>
```

