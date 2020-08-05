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


$ youtube-dl -j --flat-playlist "https://www.youtube.com/watch?v=DSGyEsJ17cI" | jq '.' >a.json

```
