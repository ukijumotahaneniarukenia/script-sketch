#include <stdio.h>


int main (int argc,char** argv){

  printf("_Bool\t%d\n",(int)sizeof(_Bool));

  printf("char\t%d\n",(int)sizeof(char));

  printf("short\t%d\n",(int)sizeof(short));

  printf("int\t%d\n",(int)sizeof(int));

  printf("long\t%d\n",(int)sizeof(long));

  printf("long long\t%d\n",(int)sizeof(long long));

  printf("float\t%d\n",(int)sizeof(float));

  printf("double\t%d\n",(int)sizeof(double));

  return 0;
}
