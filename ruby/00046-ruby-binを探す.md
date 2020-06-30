- CMD

```
find / |& grep bin 2>/dev/null | ruby -F/ -anle 'puts $F.grep(/^.?bin$/)' | sort -u
```

- OUT

```
.bin
bin
sbin
```


- CMD

```
find {/bin,/usr/bin,/sbin,/usr/sbin} | grep echo
```

- OUT

```
/bin/echo
/bin/lessecho
/usr/bin/lessecho
```
