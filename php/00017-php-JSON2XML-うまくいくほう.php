<?php

#エラーレベルのログのみ出力するように制御
error_reporting(E_ERROR);

$json_txt = '{"project":{"modelVersion":"4.0.0","groupId":"app","artifactId":"nnn","version":"0.1.0","parent":{"groupId":"org.springframework.boot","artifactId":"spring-boot-starter-parent","version":"2.2.4.RELEASE","relativePath":null},"dependencies":{"dependency":[{"groupId":"org.springframework.boot","artifactId":"spring-boot-starter-webflux"},{"groupId":"org.springframework.boot","artifactId":"spring-boot-starter-test","scope":"test"},{"groupId":"io.projectreactor","artifactId":"reactor-test","scope":"test"}]},"properties":{"java.version":"1.8"},"build":{"plugins":{"plugin":{"groupId":"org.springframework.boot","artifactId":"spring-boot-maven-plugin"}}}}}';

$ary = json_decode($json_txt,true);


$xml = new SimpleXMLElement('<root/>');

#関数の部分適用時、引数に与えた関数が引数を必要としている場合、実行時のパーサがないと判断するので、ワーニングログを出力をはく
array_walk_recursive($ary, array ($xml, 'addChild'));


print_r($xml->asXML());
