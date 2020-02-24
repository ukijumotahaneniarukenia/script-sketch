- IN
```
$echo {a..d}
a b c d
```

- CMD
```
echo {a..d} | xargs -I@ jq -c -n '"@"|split(" ")|length as $cnt|. as $ary|[range(1;$cnt+1)]|foreach .[] as $idx([];$ary[-$idx:]+$ary[:-$idx])'
```

- OUT
```
["d","a","b","c"]
["c","d","a","b"]
["b","c","d","a"]
["a","b","c","d"]
```
