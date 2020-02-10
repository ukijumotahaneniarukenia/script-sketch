#!/usr/local/bin/perl5.30.0

@list = ();
%hash = (
  {"aaa" => "aaa_data"}
 , {"bbb" => "bbb_data"}
);

print join(",",@list),"\n";
print join(",",%hash),"\n";

print ref(\@list),"\n";
print ref(\%hash),"\n";

print "="x40,"\n";

foreach my $ele(%hash){
  #print $ele,"\n";
  push(@list, $ele);
}

print join(",",@list),"\n";
#print join(",",%hash),"\n";
#print ref(\@list),"\n";
#print ref(\%hash),"\n";


#push(@list, \%hash);

while(my($ind,$val)=each(@list)){
  print "key[".$ind."]:".$val,"\n";
  while(my($key,$val)=each(%{$val})){
    print "key[".$key."]:".$val,"\n";
  }
}
__END__


@list;
%hash = (
  {"aaa" => "aaa_data"}
  ,{"bbb" => "bbb_data"}
);

#print @list,"\n";
#print \@list,"\n";
#print scalar(@list),"\n";
#
#print "="x40,"\n";

print %hash,"\n";
print \%hash,"\n";

#push(@list, %hash);
#
#print "="x40,"\n";
#
#print @list,"\n";
#print \@list,"\n";
#print scalar(@list),"\n";
#
#while (my($ind,$val)=each(@list)){
#  print $ind.":".$val,"\n";
#  while (my($key,$val)=each(%{$val})){
#    print $key.":".$val,"\n";
#  }
#}
#
#foreach my $row (@list) {
#print $row->{'aaa'},"\n";
#print $row->{'bbb'},"\n";
#}
