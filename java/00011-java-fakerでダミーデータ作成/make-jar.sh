#!/usr/bin/env bash


#作業ディレクトリ
cd $HOME/script-sketch/java/00011-java-fakerでダミーデータ作成


#自動生成ディレクトリ削除
rm -rf generate



#自動生成ディレクトリ作成
mkdir -p generate

#正規化リスト作成
cat list.tsv | grep -v toString | awk -v FS="\t" '{print $1,$4}'|ruby -anle 'a=$F[0].split("\.");b=a[a.size-1].split(/(?=[A-Z])/);p a[a.size-1],b[0].downcase+b[1..b.size-1].join(""),$F[$F.size-1]'|xargs -n3|awk '{print $1,$2,$3}' OFS="\t" >list-norm.tsv


#javaファイル自動生成
cat list-norm.tsv | while read upcamel downcamel method;do tobe_replace_app_name=$downcamel"-"$method;sed "s/TOBE_REPLACE_APP_NAME/$tobe_replace_app_name/g;s/TOBE_REPLACE_UPCAMEL/$upcamel/g;s/TOBE_REPLACE_DOWNCAMEL/$downcamel/g;s/TOBE_REPLACE_METHOD/$method/g;s/App/$upcamel"_"$method/g;" template.java > generate/$upcamel"_"$method.java;done



#pomファイル自動生成
cat list-norm.tsv | while read upcamel downcamel method;do tobe_replace_app_name=$downcamel"-"$method;sed "s/TOBE_REPLACE_APP_NAME/$tobe_replace_app_name/g;s/App/$upcamel"_"$method/g;" pom.xml>generate/$upcamel"_"$method.xml;done


cnt=0

cd nnn

#前回ビルド分削除
mvn clean

cd - 1>/dev/null

ls generate/* | xargs -n2 | \
  while read java_file pom_file;do

    echo $cnt

    if [[ 0 -ne $cnt ]] ;then

      cd - 1>/dev/null

    fi

    #前回ファイル削除
    rm -f nnn/src/main/java/app/*

    echo $java_file $pom_file | \
      awk -v DEPLOY_JAVA_FILE_DIR_NAME=nnn/src/main/java/app/ -v DEPLOY_POM_FILE_NAME=nnn/pom.xml '{print "cp ",$1,DEPLOY_JAVA_FILE_DIR_NAME}{print "cp ",$2,DEPLOY_POM_FILE_NAME}' | bash

    cd nnn

    mvn package

    wait $!

    cnt=$[$cnt+1]

  done
