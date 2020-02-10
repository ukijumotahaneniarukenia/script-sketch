#include <stdio.h>
#include <string.h>

int mock1(void);
int mock2(void);

int mock1(void){
	int len,i;
	char str_self[256],str_other[]="abc";
	scanf("%s",str_self);
	len=strlen(str_other);
	// printf("%d\n",len);
	for(i=0;i<len;i++){
		// printf("%c\n",str_self[i]);
		// printf("%c\n",str_other[i]);
		if(str_self[i]!=str_other[i]) break;
	}
	printf("%d\n",i);
	printf("%d\n",len);
	if(i==len){
		printf("same\n");
	}else{
		printf("diff\n");
	}
	return 0;
}
int mock2(void){
	char str_self[256],str_other[]="abc";
	scanf("%s",str_self);
	printf("%d\n",strcmp(str_self,str_other));
	if(strcmp(str_self,str_other)==0){
		printf("same\n");
	}else{
		printf("diff\n");
	}
	return 0;
}

int main(void){
//   int rt_val=mock1();
  int rt_val=mock2();
  return rt_val;
}