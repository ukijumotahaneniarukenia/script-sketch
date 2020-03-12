#!/bin/bash

printf "%s\n" {a..j} | xargs -n8 | perl -nlE '$,=":";$n=$.;@a=split(/ /,$_);foreach my $i (0..$#a) {print $n,@a[$i]}'


printf "%s\n" {a..j} | xargs -n6 | perl -nlE '$,=":";@a=(split(/ /, $_));foreach my $i (0..$#a){print $.,$i,$a[$i]}'


ls | xargs -n6 | perl -nlE '$,=":";@a=(split(/ /, $_));$n=0;foreach my $i (0..$#a){print $.-1,$.,$i,$a[$i]}'
