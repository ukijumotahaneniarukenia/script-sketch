- IN
  - dev.toはカテゴリごとに月別等分類されている
```
$curl -sSL https://dev.to/t/python >a
```

これも除外

```
https://dev.to/t/python
https://dev.to/t/python/latest
https://dev.to/t/python/top/infinity
https://dev.to/t/python/top/month
https://dev.to/t/python/top/week
https://dev.to/t/python/top/year
```

あとはauth認証系とかは除外

```
https://dev.to/users/auth/github?state=navbar_basic
https://dev.to/users/auth/github?state=signup-modal
https://dev.to/users/auth/twitter?callback_url=https://dev.to/users/auth/twitter/callback
```


- CMD

```
$cat a | perl -pe 's/\s{1,}/ /g' | grep -Po '<a.*?>.*?</a>' | perl -nlE 's/.*(href=".*?").*(>.*?<).*/\1\t\2/g;s/>|<//g;s;href="(?!http);https://dev.to;;s;";;g;s; {1,}; ;g and say' | perl -F'\t' -anlE 'map{s/#.*//g;s;/$;;g}@F[0];say @F[0]'|sort|uniq|grep dev>zzz
```

- IN
  - カテゴリ一覧

```
$curl -sSL https://dev.to/tags>tags
```

- CMD

```
$cat tags  | perl -pe 's/\s{1,}/ /g' | grep -Po '<a.*?>.*?</a>' | perl -nlE 's/.*(href=".*?").*(>.*?<).*/\1\t\2/g;s/>|<//g;s;href="(?!http);https://dev.to;;s;";;g;s; {1,}; ;g and say' | grep -P 'https://dev.to/t' | perl -anlE 'say @F[0]'>>tag
```
