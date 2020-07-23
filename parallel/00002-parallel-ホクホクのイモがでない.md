- VER

```
$ parallel --version
GNU parallel 20161222
Copyright (C) 2007,2008,2009,2010,2011,2012,2013,2014,2015,2016
Ole Tange and Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
GNU parallel comes with no warranty.

Web site: http://www.gnu.org/software/parallel

When using programs that use GNU Parallel to process data for publication
please cite as described in 'parallel --citation'.
```

- CMD

```
$ time for(( i=1;i<=1000;i++));do printf $i回目で[;parallel --shuf echo ::: $(echo ホクホクのイモ| grep -Po .)|tr -d \\\n;printf "]がでました";echo;done|grep ホクホクのイモ
```

- OUT
  - でない
```

real	1m23.900s
user	1m15.061s
sys	0m19.098s
```
