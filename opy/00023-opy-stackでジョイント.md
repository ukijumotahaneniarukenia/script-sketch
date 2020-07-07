```
１次元配列

次数があがる

echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104);b=np.arange(200,204);c=np.arange(300,304);};E:{print(a);print(b);print(c);}'
[100 101 102 103]
[200 201 202 203]
[300 301 302 303]

行方向に蓄積
echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104);b=np.arange(200,204);c=np.arange(300,304);};E:{};E:{print(np.stack([a,b],axis=0))}'
[[100 101 102 103]
 [200 201 202 203]]

行方向に蓄積
echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104);b=np.arange(200,204);c=np.arange(300,304);};E:{};E:{print(np.stack([a,b,c],axis=0))}'
[[100 101 102 103]
 [200 201 202 203]
 [300 301 302 303]]


列方向に蓄積

echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104);b=np.arange(200,204);c=np.arange(300,304);};E:{};E:{print(np.stack([a,b],axis=1))}'
[[100 200]
 [101 201]
 [102 202]
 [103 203]]

列方向に蓄積

echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104);b=np.arange(200,204);c=np.arange(300,304);};E:{};E:{print(np.stack([a,b,c],axis=1))}'
[[100 200 300]
 [101 201 301]
 [102 202 302]
 [103 203 303]]

２次元配列

次数があがる

echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104).reshape(2,2);b=np.arange(200,204).reshape(2,2);c=np.arange(300,304).reshape(2,2);};E:{print(a);print(b);print(c);}'
[[100 101]
 [102 103]]
[[200 201]
 [202 203]]
[[300 301]
 [302 303]]

行方向に連結後、深さ方向に蓄積
echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104).reshape(2,2);b=np.arange(200,204).reshape(2,2);c=np.arange(300,304).reshape(2,2);};E:{};E:{print(np.stack([a,b],axis=0))}'
[[[100 101]
  [102 103]]

 [[200 201]
  [202 203]]]

行方向に連結後、深さ方向に蓄積
echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104).reshape(2,2);b=np.arange(200,204).reshape(2,2);c=np.arange(300,304).reshape(2,2);};E:{};E:{print(np.stack([a,b,c],axis=0))}'
[[[100 101]
  [102 103]]

 [[200 201]
  [202 203]]

 [[300 301]
  [302 303]]]

列方向に連結後、深さ方向に蓄積

echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104).reshape(2,2);b=np.arange(200,204).reshape(2,2);c=np.arange(300,304).reshape(2,2);};E:{};E:{print(np.stack([a,b],axis=1))}'
[[[100 101]
  [200 201]]

 [[102 103]
  [202 203]]]

列方向に連結後、深さ方向に蓄積
echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(100,104).reshape(2,2);b=np.arange(200,204).reshape(2,2);c=np.arange(300,304).reshape(2,2);};E:{};E:{print(np.stack([a,b,c],axis=1))}'
[[[100 101]
  [200 201]
  [300 301]]

 [[102 103]
  [202 203]
  [302 303]]]

```
