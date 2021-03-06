- https://qiita.com/tomoyukilabs/items/54bd151aba7d3edf8946
- https://qiita.com/tomoyukilabs/items/c4eb7a829baac880797c
- https://qiita.com/tomoyukilabs/items/57ba8a982ab372611669

```
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
