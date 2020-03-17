#!/usr/bin/env perl

use strict;
use Text::MeCab;

my $mecab = Text::MeCab->new();
my $text = "日本語の形態素解析のテストを行ってみます";

for (my $node = $mecab->parse($text); $node; $node = $node->next) {
   # See perdoc for Text::MeCab::Node for list of methods
   print $node->surface, "\n";
   print $node->feature, "\n";
}
