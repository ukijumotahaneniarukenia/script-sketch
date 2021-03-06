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

ffmpeg -i [入力ファイル名] \
    -vcodec libx264 -vb [動画のビットレート] -r [フレームレート] -x264opts no-scenecut -g [キーフレーム間隔] \
    -acodec aac -strict experimental -ac 2 -ab [音声のビットレート] \
    -frag_duration [フラグメントの時間長] -movflags frag_keyframe+empty_moov \
    [出力ファイル名.mp4]

$ time ffmpeg -i test.mp4 -vcodec libx264 -vb 15025623 -r 25/1 -x264opts no-scenecut -g 1000 -acodec aac -strict experimental -ac 2 -ab 2284 -frag_duration 1000 -movflags frag_keyframe+empty_moov test-fragged.mp4

MP4Box -dash [フラグメントの時間長] -frag-rap \
    -segment-name [メディアセグメントのファイル名の接頭辞] -profile ondemand \
    [MP4ファイル名]

MP4Box -dash 1000 -frag-rap -segment-name segment -profile ondemand test-fragged.mp4
```
