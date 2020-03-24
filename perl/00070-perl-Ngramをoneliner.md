- IN

```
$printf "%s\n" ウンコもりもり森鴎外 aiueo
ウンコもりもり森鴎外
aiueo
```

- CMD

```
printf "%s\n" ウンコもりもり森鴎外 aiueo | perl -C -anlE 'map{s/\p{Any}/${^MATCH}${^POSTMATCH}${^PREMATCH}\n/gp}@F;@a=map{split(/\n/)}@F;map{say substr($_,0,3)}@a'
```


- OUT

```
ウンコ
ンコも
コもり
もりも
りもり
もり森
り森鴎
森鴎外
鴎外ウ
外ウン
aiu
iue
ueo
eoa
oai
```


- CMD
  - フルグラム
```
$printf "%s\n" ウンコもりもり森鴎外 aiueo | perl -C -anlE 'map{s/\p{Any}/${^MATCH}${^POSTMATCH}${^PREMATCH}\n/gp}@F;@a=map{split(/\n/)}@F;map{say $_}@a'
```


- OUT

```
ウンコもりもり森鴎外
ンコもりもり森鴎外ウ
コもりもり森鴎外ウン
もりもり森鴎外ウンコ
りもり森鴎外ウンコも
もり森鴎外ウンコもり
り森鴎外ウンコもりも
森鴎外ウンコもりもり
鴎外ウンコもりもり森
外ウンコもりもり森鴎
aiueo
iueoa
ueoai
eoaiu
oaiue
```


- CMD
  - これがNgram


```
$printf "%s\n" ウンコもりもり森鴎外 aiueo | perl -C -anlE 'map{s/(\p{Any})/${^N}${^POSTMATCH}\n/gp}@F;@a=map{split(/\n/,$_)}@F;map{say substr($_,0,2)}@a'
```

- OUT

```
ウン
ンコ
コも
もり
りも
もり
り森
森鴎
鴎外
外
ai
iu
ue
eo
o
```
