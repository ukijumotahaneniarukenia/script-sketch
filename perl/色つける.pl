#!/usr/local/bin/perl5.30.0

use Term::ANSIColor qw( :constants );
$Term::ANSIColor::AUTORESET = 1;

print BOLD BLUE "test\n";
print BOLD BLUE ON_WHITE "test\n";
print BLINK "test\n";
print UNDERSCORE "test\n";

#https://perldoc.perl.org/Term/ANSIColor.html

