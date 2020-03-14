#!/bin/bash

perl -MParallel::ForkManager -E '
  $sig_chld_handler_backup = $SIG{CHLD};
  $SIG{CHLD} = sub {};
  my $pm=Parallel::ForkManager->new(12);
  %b=();
  foreach my $e (a..zzzzz){
    $pid=$pm->start and next;
    $SIG{CHLD} = $sig_chld_handler_backup; # 子プロセスにのみ SIGCHLD ハンドラを復帰
    %b=(%b,($e,1));
    $pm->finish;
  };
  $pm->wait_all_children;
  @a=keys %b;
  say $#a+1
'
