- PRE

rootユーザーで実行

```

cpan List::MoreUtils

```



- CMD

```
echo {1..10} | perl -C -MList::MoreUtils -anlE '@a=@F[0..4],@b=@F[5..$#F];@z=List::MoreUtils::mesh @a, @b;say join "-",@z'
```


- OUT

```
1-6-2-7-3-8-4-9-5-10
```
