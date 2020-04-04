#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

volatile sig_atomic_t eflag = 0;

// https://www.jpcert.or.jp/sc-rules/c-sig30-c.html
// https://qiita.com/supaiku2452/items/10772cbd2706dede06b9#comments
void usage(char *cmdname) {
  fputs( "\nUsage:\n",stdout);
  fputs( "IN:\n",stdout);
  printf("%s\n",cmdname);
  fputs( "OUT:\n",stdout);
}

void handler(int signum) {
  eflag = 1;
}

void trap(void){
  //受信したいシグナルの数だけ記載
  if (signal(SIGINT, handler) == SIG_ERR) { //プロセスに対するシグナル受信を待ち構えておく trapping
    perror("Abend");
    exit(1);
  }
  if (signal(SIGTERM, handler) == SIG_ERR) { //プロセスに対するシグナル受信を待ち構えておく trapping
    perror("Abend");
    exit(1);
  }
}

int main(int argc, char **argv) {
  trap();
  while (!eflag) {
    //標準入力待ちとかを想定

  }

  usage(argv[0]);

  return 0;
}
