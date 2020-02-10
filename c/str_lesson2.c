#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//https://teratail.com/questions/78972
int main(void){
  char tmp[100];

  //出力数を入力
  fgets(tmp, sizeof(tmp), stdin);
  int num = atoi(tmp);

  char str[1000];
  //文字列を入力
  fgets(str, sizeof(str), stdin);
  char **words = malloc(sizeof(char*)*num);

  //分割
  words[0]=strtok(str,",");

  for(int i=1;i<num;i++)
    words[i]=strtok(NULL,",");

  for(int i=0;i<num;i++)
    printf("%s\n", words[i]);

  return 0;
}