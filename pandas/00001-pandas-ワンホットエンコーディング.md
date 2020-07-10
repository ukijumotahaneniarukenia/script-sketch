- CMD

```
echo こううんのおまもり | opy 'B:{import pandas as pd;};{s=pd.Series(list(F1));r=pd.get_dummies(s);};E:{print(r)}'
```

- OUT

```
   う  お  こ  の  ま  も  り  ん
0  0  0  1  0  0  0  0  0
1  1  0  0  0  0  0  0  0
2  1  0  0  0  0  0  0  0
3  0  0  0  0  0  0  0  1
4  0  0  0  1  0  0  0  0
5  0  1  0  0  0  0  0  0
6  0  0  0  0  1  0  0  0
7  0  0  0  0  0  1  0  0
8  0  0  0  0  0  0  1  0
```

- CMD

```
echo 妻夫木夫妻 | opy 'B:{import pandas as pd;};{s=pd.Series(list(F1));r=pd.get_dummies(s);};E:{print(r)}'
```

```
   夫  妻  木
0  0  1  0
1  1  0  0
2  0  0  1
3  1  0  0
4  0  1  0
```
