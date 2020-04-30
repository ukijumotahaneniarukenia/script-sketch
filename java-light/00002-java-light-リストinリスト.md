- IN

```
System.out.println(kkk(1,3,4));
System.out.println(kkk(1,4,4));
System.out.println(kkk(1,5,4));
System.out.println(kkk(1,5,7));
System.out.println(kkk(3,5,7));
System.out.println(kkk(2,5,7));
```


- CMD

```
private static List<List<String>> kkk(Integer start,Integer end,Integer range){
     return IntStream.rangeClosed(start,end).boxed()
             .map(e->IntStream.rangeClosed(e,e+range).boxed().limit(range))
             .flatMap(e->Stream.of(e.map(ee -> String.valueOf(ee)).collect(joining(","))))
             .map(e->Arrays.asList(e.split(",")))
             .collect(toList());
}
```


- OUT

```
[[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6]]
[[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6], [4, 5, 6, 7]]
[[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6], [4, 5, 6, 7], [5, 6, 7, 8]]
[[1, 2, 3, 4, 5, 6, 7], [2, 3, 4, 5, 6, 7, 8], [3, 4, 5, 6, 7, 8, 9], [4, 5, 6, 7, 8, 9, 10], [5, 6, 7, 8, 9, 10, 11]]
[[3, 4, 5, 6, 7, 8, 9], [4, 5, 6, 7, 8, 9, 10], [5, 6, 7, 8, 9, 10, 11]]
[[2, 3, 4, 5, 6, 7, 8], [3, 4, 5, 6, 7, 8, 9], [4, 5, 6, 7, 8, 9, 10], [5, 6, 7, 8, 9, 10, 11]]
```
