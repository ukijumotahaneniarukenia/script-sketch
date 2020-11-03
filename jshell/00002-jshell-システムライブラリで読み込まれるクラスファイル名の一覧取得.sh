#!/usr/bin/env bash

jshell -s <(cat<<E
String s = System.getProperty("sun.boot.library.path") + "/classlist";
System.out.println(s);
/exit
E
) | xargs cat | sort
