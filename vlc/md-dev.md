```
$ apt install -y youtube-dl

$ apt install -y vlc

$ which youtube-dl
/usr/bin/youtube-dl

$ which vlc
/usr/bin/vlc

$ youtube-dl 'https://www.youtube.com/watch?v=DX_gQTQLUZc'
[youtube] DX_gQTQLUZc: Downloading webpage
[download] Destination: How to Make KDE Plasma Look Like Mac OS Big Sur-DX_gQTQLUZc.f248.webm
[download] 100% of 54.99MiB in 00:07
[download] Destination: How to Make KDE Plasma Look Like Mac OS Big Sur-DX_gQTQLUZc.f251.webm
[download] 100% of 19.50MiB in 00:02
[ffmpeg] Merging formats into "How to Make KDE Plasma Look Like Mac OS Big Sur-DX_gQTQLUZc.webm"
Deleting original file How to Make KDE Plasma Look Like Mac OS Big Sur-DX_gQTQLUZc.f248.webm (pass -k to keep)
Deleting original file How to Make KDE Plasma Look Like Mac OS Big Sur-DX_gQTQLUZc.f251.webm (pass -k to keep)

#広告がなくていい
#動画再生
$ vlc 'How to Make KDE Plasma Look Like Mac OS Big Sur-DX_gQTQLUZc.f251.webm'

#raw.jsonには固定ip情報が含まれていた
$ youtube-dl -j --flat-playlist "https://www.youtube.com/watch?v=DSGyEsJ17cI" | jq '.' >raw.json
```


よさげな情報

```
cat raw.json | jq '.tags' >tags.json
cat raw.json | jq -r '.webpage_url' >webpage-url.txt
cat raw.json | jq -r '.upload_date' >upload-date.txt
cat raw.json | jq -r '.id' >id.txt
```


```
$ cat raw.json | jq --stream -cr '.[0]|join("-")' | sort >key-name-all-list.txt

multiとsingle
```


```
$ cat a.json
[
  "thumbnails",
  "0",
  "id"
]


$ cat a.json | jq 'map(if test("\\d") then tonumber else . end)|map(if type=="number" then "["+tostring+"]" else "."+. end)|join("")'
".thumbnails[0].id"
```


これつかえそう

プロセスID単位で、配列にバッググラウンドプロセスIDを持ち回って、シグナル送られたら、プロセス切る

後処理でカスファイルがあれば消す処理も追加
