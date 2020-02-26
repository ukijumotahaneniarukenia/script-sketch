#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my $stop = 0;

$SIG{INT} = sub {
    $stop = 1;
};

print "start";
for (1..10) {
    sleep(1);
    print "sleep:$_";
    if ($stop) {
        last; #繰り返しから抜ける
    }
}
print "end";
