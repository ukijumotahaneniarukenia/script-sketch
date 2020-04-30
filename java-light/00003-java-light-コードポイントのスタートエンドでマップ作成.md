- IN

```
mkCp(12354,12390).forEach((k,v)-> System.out.printf("%s\t%s\n",k,v));
```

- CMD

```
private static Map<Integer,String> mkCp(Integer s,Integer e) {
    return IntStream.rangeClosed(Character.MIN_CODE_POINT,Character.MAX_CODE_POINT).boxed().skip(s).limit(e-s+1)
            .collect(Collectors.toMap(ee->ee,ee->String.valueOf(Character.toChars(ee))));
}
```


- OUT

```
12354	あ
12355	ぃ
12356	い
12357	ぅ
12358	う
12359	ぇ
12360	え
12361	ぉ
12362	お
12363	か
12364	が
12365	き
12366	ぎ
12367	く
12368	ぐ
12369	け
12370	げ
12371	こ
12372	ご
12373	さ
12374	ざ
12375	し
12376	じ
12377	す
12378	ず
12379	せ
12380	ぜ
12381	そ
12382	ぞ
12383	た
12384	だ
12385	ち
12386	ぢ
12387	っ
12388	つ
12389	づ
12390	て
```
