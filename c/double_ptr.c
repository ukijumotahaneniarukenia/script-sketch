#include <stdio.h>
#include <stdlib.h>
//https://daeudaeu.com/programming/c-language/pointerofpointer/
int main(void){

  int **dptr;
  int *ptr;
  int data;

  data = 123;

  ptr = &data;
  dptr = &ptr;

  printf("ptr = 0x%x\n", ptr);
  printf("*ptr = %d\n", *ptr);

  printf("dptr = 0x%x\n", dptr);
  printf("*dptr = 0x%x\n", *dptr);
  printf("**dptr = %d\n", **dptr);

  return 0;
}