コードポイント生成
```
private static void mock(){
	List<String> l5 =Stream.iterate(Character.MIN_CODE_POINT,n->n-Character.MIN_CODE_POINT<=Character.MAX_CODE_POINT,n->n + 1)
		.parallel()
		.filter(e->excludeSurrogate(e))
		.limit(97+10)
		.skip(97)
		.map(e->String.valueOf(Character.toChars(e)))
		.collect(Collectors.toList());
	System.out.println(l5.size());
	System.out.println(l5);
}

private static boolean excludeSurrogate(Integer n){
	return n < (int) Character.MIN_HIGH_SURROGATE || (int) Character.MAX_LOW_SURROGATE < n;
}
```

ceil関数

```
private static Integer ceil(Integer n,Integer k){
	if(Math.ceil((double)n/k) == k){
	    return (int)k;
	}else{
	    return (int)Math.ceil((double)n/k);
	}
}
```
