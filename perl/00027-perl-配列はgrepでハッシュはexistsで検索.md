- CMD

```
#!/usr/bin/env perl
use feature qw(say);

sub usage{
  my $msg=<<"EOS";
Usage:
  IN: $0 'a' 'zzz' 'P' 'hash'
      or
      $0 'a' 'zzz' 'P' 'array'
      or
      echo 'a' 'zzz' 'P' 'hash' | $0
      or
      echo 'a' 'zzz' 'P' 'array' | $0
  OUT:
EOS
  print $msg,"\n";
  exit 0;
}

sub usegrep {
  my($con,$dat)=@_;
  if(grep { /$con/ } @{$dat}){
    return 1;
  }else{
    return 0;
  }
}

sub useexists {
  my($con,$dat)=@_;
  if(exists $dat->{$con}){
    return 1;
  }else{
    return 0;
  }
}

sub mkarydat{
  my ($start_s,$end_s)=@_;
  %b=map{ $_=>1;} ($start_s..$end_s);
  @a=keys %b;
  return \@a;
}

sub mkhashdat{
  my ($start_s,$end_s)=@_;
  %b=map{ $_=>1;} ($start_s..$end_s);
  return \%b;
}

sub submain{
  my ($start_s,$end_s,$con,$sw)=@_;
  if($sw=="hash"){
    my $rt=mkhashdat($start_s,$end_s);
    say useexists($con,$rt);
  }elsif($sw=="array"){
    my $rt=mkarydat($start_s,$end_s);
    say usegrep($con,$rt);
  }else{
    usage();
  }
}

sub main{
  my $rt=0;
  if ( @ARGV ) {
    submain(@ARGV);
  } elsif ( -p STDIN ) {
    @stdin=map { $_ =~ s/\n$//;$_;} split(/ /,<STDIN>);
    submain(@stdin);
  } else {
    usage;
  }
  exit $rt;
}

main
```
