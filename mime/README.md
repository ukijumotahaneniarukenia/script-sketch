- https://www.iana.org/protocols

Multipurpose Internet Mail Extensions (MIME) and Media Types

- https://www.iana.org/assignments/media-types/media-types.xhtml

Registries included below


```
curl -fsSL https://www.iana.org/assignments/media-types/application.csv -o media-types-application.csv
curl -fsSL https://www.iana.org/assignments/media-types/audio.csv -o media-types-audio.csv
curl -fsSL https://www.iana.org/assignments/media-types/font.csv -o media-types-font.csv
curl -fsSL https://www.iana.org/assignments/media-types/image.csv -o media-types-image.csv
curl -fsSL https://www.iana.org/assignments/media-types/message.csv -o media-types-message.csv
curl -fsSL https://www.iana.org/assignments/media-types/model.csv -o media-types-model.csv
curl -fsSL https://www.iana.org/assignments/media-types/multipart.csv -o media-types-multipart.csv
curl -fsSL https://www.iana.org/assignments/media-types/text.csv -o media-types-text.csv
curl -fsSL https://www.iana.org/assignments/media-types/video.csv -o media-types-video.csv
```

おしまい

改行コードの正規化を実施したあと、jsonへ変換

```
$ time cat media-types-list.txt | while read file;do sleep $[RANDOM%10+1]; curl -fsSL https://www.iana.org/assignments/media-types/$file -o media-types-$file;sed -r -i 's/\r//g' media-types-$file;csv2json-jq media-types-$file;done

real	0m54.063s
user	0m1.272s
sys	0m0.192s
```

nginx対応のMIMEタイプ

```
$ sudo apt install -y nginx

$ cat /etc/nginx/mime.types | sed '/^$/d' | awk '/^    /'|sed 's/;$//'|ruby -anle 'p "nginx",$F[0],$F[1..$F.size-1].join(",")'|xargs -n3|tr ' ' '\t' |sed '1iWebServer\tMine\tExtension'>nginx-handle-mime-types.tsv
```
