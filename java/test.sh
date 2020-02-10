#!/bin/bash

#echo {1..3} | xargs -I@ bash -c '
#jshell -s <(cat <<EOS
#System.out.println("unko");
#System.out.println("@");
#/exit
#EOS
#)
#'

#echo {1..3} | xargs -I@ bash -c '
#jshell -s <(cat <<EOS
#import java.util.*;
#List<String> liz = new ArrayList<>(Arrays.asList("@".split(" ")));
#for(int ind=0;ind<liz.size();ind++){
#  Collections.rotate(liz,1);
#  System.out.println(liz);
#}
#/exit
#EOS
#)
#'
#

echo -e '\U1f4a'{0..9} | xargs -I@ bash -c '
jshell -s <(cat <<EOS
import java.util.*;
List<String> liz = new ArrayList<>(Arrays.asList("@".split(" ")));
for(int ind=0;ind<liz.size();ind++){
  Collections.rotate(liz,1);
  System.out.println(liz);
}
/exit
EOS
)
'

echo -e '\U1f4a'{0..9} | xargs -I@ bash -c '
jshell -s <(cat <<EOS
import java.util.*;
List<String> liz = new ArrayList<>(Arrays.asList("@".split(" ")));
for(int ind=0;ind<liz.size();ind++){
  Collections.rotate(liz,-1);
  System.out.println(liz);
}
/exit
EOS
)
'
