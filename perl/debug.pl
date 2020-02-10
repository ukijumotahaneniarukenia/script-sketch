#!/usr/local/bin/perl

my $message = 'Hello';
my @nums = (1, 2, 3);
my %scores = (math => 80, english => 77);

my $twice = twice(5);

# ブレークポイント
$DB::single = 1;

for my $num (@nums) {
    
  # 条件付ブレークポイント
  if ($num == 2) { $DB::single = 1 }
  print "$num\n";
}

sub twice {
  my $num = shift;
  
  return $num * 2;
}
