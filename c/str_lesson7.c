#include <stdio.h>
#include <string.h>

int mock1(void);
int mock2(void);

int mock1(void){
	int i;
	
	char str[256];
	scanf("%s",str);
	
	for (i = 0;str[i] != '\0';i++);
	
	printf("length:%d\n",i);
	
	return 0;
}
int mock2(void){
	int i;
	char str[256];
	scanf("%s",str);
	i=strlen(str);
	printf("%d\n",i);
	return 0;
}

int main(void){
//   int rt_val=mock1();
  int rt_val=mock2();
  return rt_val;
}