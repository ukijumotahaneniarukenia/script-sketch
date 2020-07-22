- CMD

```
$ parallel --shuf echo ::: $(echo ホクホクのイモ| grep -Po .)|tr -d \\\n
```

- OUT

```
ホクホクのイモ
```
