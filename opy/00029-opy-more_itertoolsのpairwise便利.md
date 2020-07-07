- CMD

```
echo -10 10 | opy -m numpy 'B:{from more_itertools import *;import numpy as np;};{a=[*range(F1,F2+1)];b=[[*i] for i in list(pairwise(a))]};E:{print(b)}'
```

- OUT

```
[[-10, -9], [-9, -8], [-8, -7], [-7, -6], [-6, -5], [-5, -4], [-4, -3], [-3, -2], [-2, -1], [-1, 0], [0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7], [7, 8], [8, 9], [9, 10]]
```
