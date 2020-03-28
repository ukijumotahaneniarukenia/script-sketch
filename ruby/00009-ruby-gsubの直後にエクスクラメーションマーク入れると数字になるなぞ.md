- IN

```
$echo ウンコ もりもり 森 鴎外 | xargs -n1
ウンコ
もりもり
森
鴎外
```

- CMD

```
$echo ウンコ もりもり 森 鴎外 | xargs -n1 |ruby -pne'$_.gsub!(/./){|i|i+?\t*$.}'
```

- OUT

```
ウ	ン	コ	
も		り		も		り		
森			
鴎				外				
```

- CMD
  - 指定したパタンのマッチ回数を!で保持できるその回数分後続のmapに渡せる
  - $.は行番号
  - https://docs.ruby-lang.org/ja/latest/method/String/i/gsub=21.html
  - https://twitter.com/minyoruminyon/status/1243789846235066368
```
$echo ウンコ もりもり 森 鴎外 | xargs -n1 |ruby -pne'$_.gsub!(/./){|i|$.}'
111
2222
3
44
```

- CMD

```
$echo ウンコ もりもり 森 鴎外 | xargs -n1 |ruby -pne'$_.gsub!(/(..)/){|i|$.}'
1コ
22
森
4
```
