```
$ cat test.mp4 | ffprobe -hide_banner -v error -print_format json -show_streams -loglevel quiet -i - | jq '' > test-metadump.json

動画のビットレート

$ cat test-metadump.json | jq '."streams"[0]."bit_rate"'
"15025623"

フレームレート

$ cat test-metadump.json | jq '."streams"[0]."r_frame_rate"'
"25/1"

キーフレーム間隔

$ cat test-metadump.json | jq '."streams"[0]."avg_frame_rate"'
"25/1"

音声のビットレート

$ cat test-metadump.json | jq '."streams"[1]."bit_rate"'
"2284"
```
