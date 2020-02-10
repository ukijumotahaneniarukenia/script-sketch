#!/usr/local/bin/perl

上から2つめのfor文内と外でfirstの内容を確認
　
#デバッグしづれーーー

sub perm {
    print "="x80,"\n";
    print "[start]".join(",",@_),"\n";
    #1
    #先頭要素とそれ以外の残りの要素に分類。
    my ($first, @rest) = @_;
    #orを条件分岐として使う
    #https://tutorial.perlzemi.com/blog/20100816136168.html
    #@rest配列に要素が存在している場合は、そのまま処理続行。
    #存在していない場合は、引数のリファりふぁした値を返却
    @rest or return [[@_]];

    print "[first]".$first,"\n";
    print "[rest]".join(",",@rest),"\n";
    my @result;
    #2
    for (@_) {
      print "[ele]".$_,"\n";
      #3
      push @rest, $first;
      #4
      $first = shift @rest;
      print "[next]".$first,"\n";
      print "[end]".join(",",@rest),"\n";
      #5
      for (@{perm(@rest)}){
        print "-"x80,"\n";
        #返却されたリファラをデリファして
        #6
        push @result, [$first,@$_];
        #print "[result]".join(",",@result),"\n";
        $result=@result;
        print "+"x80,"\n";
        print join(",",@{@{$result}}),"\n";
      }
    }   
    #6
    return [@result];
}

for (@{perm(1..3)}){
  print "#"x80,"\n";
  print @{$_},"\n";
}

#最初に渡した引数の1,2,3,4のうち、先頭要素の位置で処理をグルーピングしている。
#今回の場合は1の位置で分類。
#処理グルーピングを網羅できればいいので、左からの位置は順番通りでなくてよい。
#それぞれの処理要素を先頭要素とそれ以外の要素に分類して、
#それ以外の要素を単一の先頭要素になるまで、「先頭要素とそれ以外の要素に」分類していく。
#残りの要素が単一の要素になる際が処理の終了条件で、残りの要素が複数要素になる際は再度繰り返し処理。

#1が左から1番目
#1234

#1が左から4番目
#2341

#1が左から3番目
#3412

#1が左から2番目
#4123

#2431
#2413
#2143
#2134
#2314
#2341

#3142
#3124
#3214
#3241
#3421
#3412

#4213
#4231
#4321
#4312
#4132
#4123

#1324
#1342
#1432
#1423
#1243
#1234
