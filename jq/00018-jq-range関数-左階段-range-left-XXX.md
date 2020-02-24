- IN
```
$echo {a..d}
a b c d
```

- CMD
```
echo {a..d} | xargs -I@ jq -c -n '"@"|split(" ")|length as $cnt|. as $ary|[range(1;$cnt+1)]|foreach .[] as $idx([];$ary[$idx:]+$ary[:$idx])'
```

- OUT
```
["b","c","d","a"]
["c","d","a","b"]
["d","a","b","c"]
["a","b","c","d"]
```
