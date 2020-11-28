CMD

```
$ echo '{"name":"ぽるこ","role":"ぶた"}' | perl -M'Data::Dumper' -M'JSON qw/encode_json decode_json to_json from_json/' -nlE 'say to_json($_)' | jq  -r
```

OUT

```
{"name":"ぽるこ","role":"ぶた"}
```

CMD

```
$ echo '{"name":"ぽるこ","role":"ぶた"}' | perl -M'Data::Dumper' -M'JSON qw/encode_json decode_json to_json from_json/' -nlE 'BEGIN{$,="\t"};$h=from_json($_);while(my($k,$v)=each(%{$h})){say $k,$v}'
```

OUT

```
role	ぶた
name	ぽるこ
```


CMD

```
$ echo '{"name":"ぽるこ","role":"ぶた"}' | perl -M'Data::Dumper' -M'JSON qw/encode_json decode_json to_json from_json/' -nlE 'say encode_json($_)'
```

OUT

```
"{\"name\":\"ã½ãã\",\"role\":\"ã¶ã
```

CMD

```
$ echo '{"name":"ぽるこ","role":"ぶた"}' | perl -M'Data::Dumper' -M'JSON qw/encode_json decode_json to_json from_json/' -C1 -nlE 'say encode_json($_)' | jq -r | jq
```

OUT
```
{
  "name": "ぽるこ",
  "role": "ぶた"
}
```

CMD

```
$ echo '{"name":"ぽるこ","role":"ぶた"}' | perl -M'Data::Dumper' -M'JSON qw/encode_json decode_json to_json from_json/' -C0 -nlE '$h=decode_json($_);say Dumper $h'
```

OUT

```
$VAR1 = {
          'role' => "\x{3076}\x{305f}",
          'name' => "\x{307d}\x{308b}\x{3053}"
        };
```

CMD

```
$ echo '{"name":"ぽるこ","role":"ぶた"}' | perl -M'Data::Dumper' -M'JSON qw/encode_json decode_json to_json from_json/' -C0 -C1 -C2 -nlE 'BEGIN{$,="\t"};$h=decode_json($_);while(my($k,$v)=each(%{$h})){say $k,$v}'
```

OUT

```
role	ぶた
name	ぽるこ
```
