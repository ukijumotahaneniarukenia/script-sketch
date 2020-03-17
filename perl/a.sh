#!/usr/bin/env bash

cat test-nlp.txt | \
  perl -MText::MeCab -ne '
    $,="\t";
    my $m=Text::MeCab->new();
    my $c=0;
    for(my $n=$m->parse($_);$n;$n=$n->next){
      if($n->surface){
        #からじゃない
        print $.,$c++,$n->surface,"\n";
      }else{
        #からのばあい、初期化
        $c=0;
      }
    }
'
