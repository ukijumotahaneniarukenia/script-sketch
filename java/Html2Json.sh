#!/bin/bash

declare -a jar_liz=(
  "json-20190722.jar"
  "htmlcleaner-2.23.jar"
)

add_jar_path(){
  for((i=0;i<${#jar_liz[@]};i++));do
    TMP=$TMP":"$(find . -name "${jar_liz[@]:$i:1}" | grep -v out)
  done
}

set_env(){
  add_jar_path;
  JAR_PATH=$(echo ${TMP:1})
  COMPILE_CLASSPATH="$JAR_PATH"
  EXECUTE_CLASSPATH="$(pwd):$JAR_PATH"
}

declare -a tgt_liz=(
  "Html2Xml"
  "Xml2Json"
)

execute(){
  java -classpath $EXECUTE_CLASSPATH ${tgt_liz[1]} <(echo test.html | java -classpath $EXECUTE_CLASSPATH ${tgt_liz[0]}) | jq -c .
}

compile_and_execute(){
  javac -classpath $COMPILE_CLASSPATH ${tgt_liz[0]}.java
  javac -classpath $COMPILE_CLASSPATH ${tgt_liz[1]}.java
  java -classpath $EXECUTE_CLASSPATH ${tgt_liz[1]} <(echo test.html | java -classpath $EXECUTE_CLASSPATH ${tgt_liz[0]}) | jq -c .
}

main(){
  set_env;
  for((i=0;i<${#tgt_liz[@]};i++));do
    if [ $(find . -name "${tgt_liz[@]:$i:1}.class" | grep -v out) == "./${tgt_liz[@]:$i:1}.class" ];then
      execute;
    else
      compile_and_execute;
    fi
  done
}

main