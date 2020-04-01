- IN

```
$seq -f "eval echo {key,val}%g" 3
eval echo {key,val}1
eval echo {key,val}2
eval echo {key,val}3
$seq -f "eval echo {key,val}%g" 3 | bash
key1 val1
key2 val2
key3 val3
```


- CMD

```
$seq -f "eval echo {key,val}%g" 3 | bash | python3 -c 'import sys;from itertools import zip_longest;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));b=[tuple(e) for e in a];print(b)'
```


- OUT

```
[('key1', 'val1'), ('key2', 'val2'), ('key3', 'val3')]
```

- CMD

```
$seq -f "eval echo {key,val}%g" 3 | bash | python3 -c 'import sys;from itertools import zip_longest;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));b=[tuple(e) for e in a];print(dict(b))'
```

- OUT

```
{'key1': 'val1', 'key2': 'val2', 'key3': 'val3'}
```

- CMD
  - nimのpairs的な
```
$seq -f "eval echo {key,val}%g" 3 | bash | python3 -c 'import sys;from itertools import zip_longest;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));b=[tuple(e) for e in a];c=dict(b);[print(k,v) for k,v in c.items()]'
```

- OUT

```
key1 val1
key2 val2
key3 val3
```
