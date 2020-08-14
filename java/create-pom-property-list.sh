#!/usr/bin/env bash

#real	1m32.875s
#user	1m28.353s
#sys	0m13.236s

IN_SUFFIX=.json
MID_SUFFIX=.xml
OUT_SUFFIX=.tsv

SCRIPT_SKETCH_DIR=$HOME/script-sketch/java

WORKDIR=$SCRIPT_SKETCH_DIR/wrksp

FINALLY_OUTPUT_FILE_NAME=pom-property-list

preprocess(){

  rm -rf $WORKDIR

  mkdir -p $WORKDIR

  #作業ディレクトリにxmlファイルをコピー
  find $SCRIPT_SKETCH_DIR -type f | grep pom.xml$ | \

    while read INPUT_FILE_NAME;do

      OUTPUT_FILE_NAME=$(echo $INPUT_FILE_NAME | ruby -F/ -anle 'puts $F.join("_")')

      cat $INPUT_FILE_NAME | xml c14n --without-comments - | xmllint --format - | \

        teip -Gog '(?<=<project[^\.]).*?(?=>)' -- sed 's/.//g' | xmllint --format - >$WORKDIR/$OUTPUT_FILE_NAME

    done

  #jsonファイルの作成
  ls $WORKDIR/*$MID_SUFFIX | xargs -I@ -n1 echo @ | xml2json-ruby

  #json整形
  ls $WORKDIR/*$IN_SUFFIX | xargs -I@ bash -c "cat @ | jq '.' | sponge @"

}

postprocess(){

  cat $WORKDIR/*tsv | awk -v FS='\t' '$0=$1' | teip -Gog '(?<=\[)\d+(?=\])' -- sed 's/.*/.*/;' | sed 's/\[/\x5c\x5c\x5c\x5c[/g;s/\]/\x5c\x5c\x5c\x5c]/g;' | \
    sort | uniq >$WORKDIR/pattern.txt

  #バージョン管理する
  cp $WORKDIR/pattern.txt $SCRIPT_SKETCH_DIR/pattern.txt


  cat $WORKDIR/pattern.txt | while read ptn;do ls $WORKDIR/*tsv | while read file;do grep -P $ptn $file;done;done | \
    sed 's/うんち/ /g' | sort | uniq >$SCRIPT_SKETCH_DIR/$FINALLY_OUTPUT_FILE_NAME$OUT_SUFFIX

}


execute(){
  file="$@"

  #TSVファイル作成
  cat $WORKDIR/$file$IN_SUFFIX | jq -r --stream -c 'select(.[1]!=null)|.[0]|map(if type=="number" then "["+(.+1|tostring)+"]" else "/"+. end)|join("")' | \
    while read xpath;do
      echo $xpath;
      cat $WORKDIR/$file$MID_SUFFIX | xpup "$xpath"|ruby -anle 'puts $F.join("うんち")'; #ここまでの処理で1分30ぐらいかかる 手動でやるよりははやいのでおけ
    done |xargs -n2 | tr ' ' '\t' >$WORKDIR/$file$OUT_SUFFIX
}

main(){

  preprocess

  export -f execute

  ls $WORKDIR | sed 's/\..*//' | sort | uniq | xargs -n1 | while read f;do execute $f;done

  postprocess

}

main
