CMD

```
$ cat xpath-info-2020-11-29T20-50-33.json | jq -r 'map(select( (.targetElement|test("</span></span></div>$")) and (.targetElement|test("shellgei|shellgei2|ゆるシェル|シェル芸|危険シェル芸|ゆる シェル|除夜のシェル芸|新春シェル芸|年越しシェル芸")) and (.targetElement|test("シェル芸bot")|not))|.targetElement)[]'
```

OUT

この結果をDOMページに貼り付ければ、質素になるなど

```
<div lang="ja" dir="auto" class="css-901oao r-jwli3a r-1tl8opc r-a023e6 r-16dba41 r-ad9z0x r-1g94qm0 r-bcqeeo r-bnwqim r-qvutc0"><span class="css-901oao css-16my406 r-1tl8opc r-ad9z0x r-bcqeeo r-qvutc0">&lt;&lt;&lt; 金鯱賞 nkf -e|kakasi -JH|nkf -w|sed -e "s/\(...\).\(.\).\(.*\)/\1\2\3/g"|kkcw </span><span class="r-18u37iz"><span dir="ltr" class="css-901oao css-16my406 r-1qd0xha r-ad9z0x r-bcqeeo r-qvutc0">#シェル芸</span></span></div>
<div lang="ja" dir="auto" class="css-901oao r-jwli3a r-1tl8opc r-a023e6 r-16dba41 r-ad9z0x r-1g94qm0 r-bcqeeo r-bnwqim r-qvutc0"><span class="css-901oao css-16my406 r-1tl8opc r-ad9z0x r-bcqeeo r-qvutc0">python -uc 'from subprocess import*
def a():
 yield"そんなことを俺達に言われても"
 yield"まずい"
_,p=a(),lambda *a:print(*a,sep="\n")
p("なぜお前たちはyieldがわからない？")
while 1:
 try:p("何だ？言ってみろ",_.__next__())
 except:run("echo-sd run out",shell=True);break' </span><span class="r-18u37iz"><span dir="ltr" class="css-901oao css-16my406 r-1qd0xha r-ad9z0x r-bcqeeo r-qvutc0">#シェル芸</span></span></div>
<div lang="ja" dir="auto" class="css-901oao r-jwli3a r-1tl8opc r-a023e6 r-16dba41 r-ad9z0x r-1g94qm0 r-bcqeeo r-bnwqim r-qvutc0"><span class="css-901oao css-16my406 r-1tl8opc r-ad9z0x r-bcqeeo r-qvutc0">#!/usr/bin/python
def think1(a):
 a[0]="そんなことを俺達に言われても"
def think2(a):
 a[0]="まずい"

oni=[""]
print("なぜお前たちは参照がわからない？")
think1(oni)
print("\""+oni[0]+"\"何だ？言ってみろ")
think2(oni)
print("何が\""+oni[0]+"\"？言ってみろ")

</span><span class="r-18u37iz"><span dir="ltr" class="css-901oao css-16my406 r-1qd0xha r-ad9z0x r-bcqeeo r-qvutc0">#シェル芸</span></span></div>
<div lang="ja" dir="auto" class="css-901oao r-jwli3a r-1tl8opc r-a023e6 r-16dba41 r-ad9z0x r-1g94qm0 r-bcqeeo r-bnwqim r-qvutc0"><span class="css-901oao css-16my406 r-1tl8opc r-ad9z0x r-bcqeeo r-qvutc0">#!/usr/bin/env pwsh
"おわかりいただけただろうか"[0,2,1+3..12] -join "</span><span class="css-901oao css-16my406 r-4qtqp9 r-ip8ujx r-sjv1od r-zw8f10 r-bnwqim r-h9hxbl"><div aria-label="ごはん" class="css-1dbjc4n r-xoduu5 r-1mlwlqe r-1d2f490 r-1udh08x r-u8s1d r-h9hxbl r-417010" title="ごはん" style="height: 1.2em;"><div class="css-1dbjc4n r-1niwhzg r-vvn4in r-u6sd8q r-x3cy2q r-1p0dtai r-xoduu5 r-1pi2tsx r-1d2f490 r-u8s1d r-zchlnj r-ipm5af r-13qz1uu r-1wyyakw" style="background-image: url(&quot;https://abs-0.twimg.com/emoji/v2/svg/1f35a.svg&quot;);"></div><img alt="ごはん" draggable="false" src="https://abs-0.twimg.com/emoji/v2/svg/1f35a.svg" class="css-9pa8cd"></div></span><span class="css-901oao css-16my406 r-1tl8opc r-ad9z0x r-bcqeeo r-qvutc0">" </span><span class="r-18u37iz"><span dir="ltr" class="css-901oao css-16my406 r-1qd0xha r-ad9z0x r-bcqeeo r-qvutc0">#ゆるシェル</span></span></div>
<div lang="ja" dir="auto" class="css-901oao css-cens5h r-jwli3a r-1tl8opc r-a023e6 r-16dba41 r-ad9z0x r-1g94qm0 r-bcqeeo r-bnwqim r-qvutc0" style="-webkit-line-clamp: 5;"><span class="css-901oao css-16my406 r-1tl8opc r-ad9z0x r-bcqeeo r-qvutc0">convert \( -resize 500!x1000! &lt;(echo-sd --tanzaku この味に勝るどら焼きがあればご一報ください | textimg -byellow -gblack -F50) \) /images/a </span><span class="r-18u37iz"><span dir="ltr" class="css-901oao css-16my406 r-1qd0xha r-ad9z0x r-bcqeeo r-qvutc0">#ゆるシェル</span></span></div>
```
