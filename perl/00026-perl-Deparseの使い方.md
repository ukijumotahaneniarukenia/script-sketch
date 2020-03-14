- IN

```
```

- CMD

```
$perl -MO=Deparse -E '%b=map{ $_=>1;} (a..z);@a=keys %b;say $#a+1'
```

- OUT

```
use feature 'current_sub', 'bitwise', 'evalbytes', 'fc', 'postderef_qq', 'say', 'state', 'switch', 'unicode_strings', 'unicode_eval';
%b = map({$_, 1;} ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'));
@a = keys %b;
say $#a + 1;
-e syntax OK
```
