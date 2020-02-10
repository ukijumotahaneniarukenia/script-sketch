#if 0
gcc -std=c99 -o b.o "bash" && ./b.o
exit
#endif

#include <stdio.h>

int main(void) {
  printf("%f\n",1.12*9);
  return 0;
}
