
```
$seq 3 | sed -n 'x;G;1{s;^\n;0\n;;p;};1!{p;}' | xargs -n2
0 1
1 2
2 3
```
