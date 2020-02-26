<?php
require("vendor/autoload.php");

$faker = \Faker\Factory::create('ja_JP');

echo $faker->name; #姓・名
echo $faker->address; #住所
echo $faker->realText; #日本語テキスト

$image = $faker->image(
  __DIR__.'/img' #画像格納ディレクトリ（カレントディレクトリからの相対パスで指定。先頭にスラッシュを入れる。）
  ,$faker->numberBetween(480, 640) #横ランダム範囲
  ,$faker->numberBetween(480, 640) #縦ランダム範囲
  ,'cats' #猫の画像のみ
  , false #ファイル名のみ
);


# json形式にしてファイルとして出力できるようにする。
#
# 標準入力から、データ件数を指定できるようにする。
