```
jshell> var s="\\uD867\\uDE3D";
s ==> "\\uD867\\uDE3D"

jshell> var a=s.split("\\\\u");
a ==> String[3] { "", "D867", "DE3D" }

jshell> var rt = new char[a.length-1]
rt ==> char[2] { '\000', '\000' }

jshell> rt[0]=(char)Integer.parseInt(a[1],16)
$24 ==> '?'

jshell> rt[1]=(char)Integer.parseInt(a[2],16)
$25 ==> '?'

jshell> new String(rt)
$26 ==> "𩸽"

jshell> var s="\\uD867"+"\\uDE3D";
s ==> "\\uD867\\uDE3D"

jshell> var a=s.split("\\\\u");
a ==> String[3] { "", "D867", "DE3D" }

jshell> var rt = new char[a.length-1]
rt ==> char[2] { '\000', '\000' }

jshell> rt[0]=(char)Integer.parseInt(a[1],16)
$30 ==> '?'

jshell> rt[1]=(char)Integer.parseInt(a[2],16)
$31 ==> '?'

jshell> new String(rt)
$32 ==> "𩸽"

```
