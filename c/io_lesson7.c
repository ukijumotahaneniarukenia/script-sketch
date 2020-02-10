#include <stdio.h>

//https://9cguide.appspot.com/17-02.html#S1

int mock1(void);
int mock2(void);

int mock1(){
	char buf[4096]={};
	FILE *file;
	file = fopen("test.txt","rb");
	fread(buf,sizeof(buf),1,file);
	for(int i=0;i<sizeof(buf);i++){
		printf("%c",buf[i]);
	}
	fclose(file);
	return 0;
}

int main(void){
	int rt_val=mock1();
	return rt_val;
}