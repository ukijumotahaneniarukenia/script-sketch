#!/usr/bin/perl
binmode STDIN, ':encoding(utf8)';
$input=<STDIN>;
#print "$input\n";
#改行消すchomp関数。標準入力からの入力は改行を伴うので、削除。
chomp($input);
print "$input\n";



# echo UNKO | perl input.pl | sed 's/\(.*\)/&MORI&/'
#
# デフォルトは標準出力にはいてくれる。ここの制御はRとはことなるんだ。
