```
time echo 10000000000 100000 100000 | opy -m numpy "B:{import sys;import numpy as np;np.set_printoptions(threshold=sys.maxsize);};{a=np.arange(F1);b=a.reshape(F2, F3);c=[ b[i][::-1] if i==0 else b[i][::-1]-(b[i-1][::-1][i:][0]+1) for i in range(0,len(b))];d=np.array(c);print(np.shape(d))}"
Traceback (most recent call last):
  File "/usr/local/bin/opy", line 450, in <module>
    exec(__r.action)
  File "<string>", line 1, in <module>
MemoryError: Unable to allocate 74.5 GiB for an array with shape (10000000000,) and data type int64
```
