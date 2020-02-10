#include <stdio.h>

//https://9cguide.appspot.com/17-02.html#S1

int mock1(void);
int mock2(void);

int mock1(){
	FILE *file;
	file = fopen("test.txt","wb");
	fclose(file);
	return 0;
}
int mock2(){
	int buf=100;
	FILE *file;
	file = fopen("test.txt","wb");
	fwrite(&buf,sizeof(buf),1,file);
	fclose(file);
	return 0;
}

int main(void){
	int rt_val=mock2();
	return rt_val;
}