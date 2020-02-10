#include <stdio.h>

//https://qiita.com/fireflower0/items/dc54f3ec1b3698a98b14
int isDelimiter(char p, char delim){
  return p == delim;
}

int split(char *dst[], char *src, char delim){
  int count = 0;

  for(;;) {
    while (isDelimiter(*src, delim)){
      src++;
    }

    if (*src == '\0') break;

    dst[count++] = src;

    while (*src && !isDelimiter(*src, delim)) {
      src++;
    }

    if (*src == '\0') break;

    *src++ = '\0';
  }
  return count;
}

void split_test(){
  char src[80];
  char *dst[100];
  int count;

  fgets(src, 80, stdin);

  count = split(dst, src, ',');

  for(int i = 0; i < count; i++){
    printf("%s\n", dst[i]);
  }
}

int main(void){
  split_test();
  return 0;
}