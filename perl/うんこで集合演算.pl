#!/usr/local/bin/perl

#https://gist.github.com/adokoy001/7890136538e3c979e339d0f1b890eab3

my @a = qw/1 2 3 4 5/;
my @b = qw/3 4 5 6 7/;

#print [grep { $_%2==0 } (@a)],"\n";
#print join("\n",grep { $_%2==0 } (@a)),"\n";
#print "="x80,"\n";
#print join("\n",grep { $_%2==0 && $_>3 } (@a)),"\n";
#print "="x80,"\n";
#print join("\n",grep { $_%2==0 || $_>2 } (@a)),"\n";
#print "="x80,"\n";
#print join("\n",grep { ($_%2==0 && $_>3) || $_==5 } (@a)),"\n";



print grep { $_%2==0 } (@a),"\n";
print "="x80,"\n";
print grep { $_%2==0 } (@a,@b),"\n";
