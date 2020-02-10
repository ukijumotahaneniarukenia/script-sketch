#include <stdio.h>

int mock1(void);

int mock1(void){
	char str[16];
	char str1[12] = "DRAGON";
	char str2[] = "QUEST";
	int i = 3;
	sprintf(str,"%s%s%d\n",str1,str2,i);
	printf(str);
	return 0;
}

int main(void){
  int rt_val=mock1();
  return rt_val;
}