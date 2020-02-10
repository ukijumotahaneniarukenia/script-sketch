#include <stdio.h>

int mock1(void);
int mock2(void);

int mock1(void){
	char str[32];
	scanf("%s",str);
	printf("%s\n",str);
	return 0;
}
int mock2(void){
	char str[32];
	scanf("%32s",str);
	printf("%s\n",str);
	return 0;
}

int main(void){
//   int rt_val=mock1();
  int rt_val=mock2();
  return rt_val;
}