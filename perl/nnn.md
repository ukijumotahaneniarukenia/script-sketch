- IN

```
$cat test-na-on-head.tsv
更新日	原価	商品コード	売値	商品名
20140724	639	68435	168	ZxdXZInepm
20140116	997	41360	510	JifBbrIXJP
20140220	539	52529	640	cHrlaTAQVs
20140208	692	08503	545	
20140327	727	18132	393	VjOfYukvFU
20141229	943	47231	728	EhqWwkvhCs
20140102	858	78144	799	aNwwNfBzPH
20140319	568	32927	665	nIpREeCeFV
20140928	085	17638	373	vNLLyysPcw
20140729	518	12457	011	FHdjXBvAvN
```


- CMD

```
$head -n1 test-na-on-head.tsv && cat test-na-on-head.tsv | tail -n+2|perl -F'\t' -anlE 'BEGIN{$,="\t";} ;(@F[1]=~/^9..$/||@F[1]=~/^8..$/) and map{s/$/LLL/,$_}@F[1];say @F;'
```

- OUT

```
更新日	原価	商品コード	売値	商品名
20140724	639	68435	168	ZxdXZInepm
20140116	997LLL	41360	510	JifBbrIXJP
20140220	539	52529	640	cHrlaTAQVs
20140208	692	08503	545
20140327	727	18132	393	VjOfYukvFU
20141229	943LLL	47231	728	EhqWwkvhCs
20140102	858LLL	78144	799	aNwwNfBzPH
20140319	568	32927	665	nIpREeCeFV
20140928	085	17638	373	vNLLyysPcw
20140729	518	12457	011	FHdjXBvAvN
```


- CMD

```
$head -n1 test-na-on-head.tsv && cat test-na-on-head.tsv | tail -n+2|perl -F'\t' -anlE 'BEGIN{$,="\t";} ;(@F[1]=~/^9..$/||@F[1]=~/^8..$/) and map{s/$/LLL/,$_}@F[1];(@F[4]=~/[Y-Z]/) and map{s/$/@@@/,$_}@F[4];say @F'
```

- OUT

```
更新日	原価	商品コード	売値	商品名
20140724	639	68435	168	ZxdXZInepm@@@
20140116	997LLL	41360	510	JifBbrIXJP
20140220	539	52529	640	cHrlaTAQVs
20140208	692	08503	545
20140327	727	18132	393	VjOfYukvFU@@@
20141229	943LLL	47231	728	EhqWwkvhCs
20140102	858LLL	78144	799	aNwwNfBzPH
20140319	568	32927	665	nIpREeCeFV
20140928	085	17638	373	vNLLyysPcw
20140729	518	12457	011	FHdjXBvAvN
```
