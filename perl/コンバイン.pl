#!/usr/local/bin/perl5.30.0
#https://metacpan.org/pod/distribution/Math-Combinatorics/lib/Math/Combinatorics.pm#next_combination()

use Math::Combinatorics;
my @array=qw(a b c);

#リファレンスを受け取る
my $combinat = Math::Combinatorics->new(count => 2
              ,data => [@array]
              );

while(my @combo = $combinat->next_combination){
  print join(' ', @combo)."\n";
}

print "-"x40,"\n";

while(my @permu = $combinat->next_permutation){
   print join(' ', @permu)."\n";
 }

print "-"x40,"\n";

while(my @multiset = $combinat->next_multiset){
   print join(' ', @multiset)."\n";
 }

print "-"x40,"\n";

#while(my @str = $combinat->next_string){
#   print join(' ', @str)."\n";
# }
