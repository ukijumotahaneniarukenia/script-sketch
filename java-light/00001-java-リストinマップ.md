- IN

```
System.out.println(jjj(1,5,3,97));
System.out.println(jjj(2,5,4,97));
System.out.println(jjj(3,5,5,97));
System.out.println(jjj(4,5,6,97));
System.out.println(jjj(1,5,6,12354));
```

- CMD

```
private static Map<String,List<String>> jjj(Integer start,Integer end,Integer range,Integer grpKeyStartCodePoint){
    return IntStream.range(start,end).boxed().map(e->IntStream.rangeClosed(e,e+range).boxed().limit(e))
            .flatMap(e->Stream.of(e.map(ee -> String.valueOf(ee)).collect(joining(","))))
            .map(e->Arrays.asList(e.split(",")))
            .collect(toMap(e->String.valueOf(Character.toChars(grpKeyStartCodePoint-1+Integer.parseInt(e.stream().findFirst().get().isEmpty()?"0":e.stream().findFirst().get()))),e->e));
}
```

- OUT

```
{a=[1], b=[2, 3], c=[3, 4, 5], d=[4, 5, 6, 7]}
{b=[2, 3], c=[3, 4, 5], d=[4, 5, 6, 7]}
{c=[3, 4, 5], d=[4, 5, 6, 7]}
{d=[4, 5, 6, 7]}
{あ=[1], ぃ=[2, 3], い=[3, 4, 5], ぅ=[4, 5, 6, 7]}
```
