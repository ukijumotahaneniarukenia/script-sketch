#if 0
gcc -std=c99 -o a.o "$0" && ./a.o
exit
#endif

#include <stdio.h>

int main(void) {
  printf("%f\n",1.12*9);
  return 0;
}
