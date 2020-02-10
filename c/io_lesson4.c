#include <stdio.h>

//https://9cguide.appspot.com/17-01.html

int mock1(void);
int mock2(void);

int mock1(){
	char c[4096];
	FILE *file;
	file = fopen("test.txt","r");
	fscanf(file,"%s",&c);
	fclose(file);
	printf("%s\n",c);
	return 0;
}
int mock2(){
	char c[4096];
	FILE *file;
	file = fopen("test.txt","r");
	fscanf(file,"%s",&c);
	fclose(file);
	printf("%s\n",c);
	return 0;
}

int main(void){
	int rt_val=mock2();
	return rt_val;
}