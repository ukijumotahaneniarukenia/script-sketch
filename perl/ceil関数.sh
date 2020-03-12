#!/bin/bash

printf "%s\n" {a..j} | xargs -n8 | perl -nlE '$,=":";$n=$.;@a=split(/ /,$_);foreach my $i (0..$#a) {print $n,@a[$i]}'
