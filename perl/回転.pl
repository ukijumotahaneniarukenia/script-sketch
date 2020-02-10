#!/usr/local/bin/perl

#my @a=(1,2,3,4);
my @a=qw(1 2 3 4);

my($first,@remain)=@a;

print(join(" ",@a),"\n");
for(@remain){
  #print($first,"\n");
  #print(join(",",@remain),"\n");
  print(join(" ",@remain,$first),"\n");
  push(@remain,$first);
  $first=shift(@remain);
}
