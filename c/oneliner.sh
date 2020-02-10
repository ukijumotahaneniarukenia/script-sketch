#/bin/bash
cat <<EOS >b.c && cat b.c | sed -r 's;/task.sh;b.c;' | sh
#if 0
gcc -std=c99 -o b.o "$0" && ./b.o
exit
#endif

#include <stdio.h>

int main(void) {
  printf("%f\n",1.12*9);
  return 0;
}
EOS
