```
time echo 100000000 10000 10000 | opy -m numpy "B:{import sys;import numpy as np;np.set_printoptions(threshold=sys.maxsize);};{a=np.arange(F1);b=a.reshape(F2, F3);c=[ b[i][::-1] if i==0 else b[i][::-1]-(b[i-1][::-1][i:][0]+1) for i in range(0,len(b))];d=np.array(c);print(np.shape(d))}"
(10000, 10000)

real	0m0.681s
user	0m0.750s
sys	0m0.728s
```
