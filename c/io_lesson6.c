#include <stdio.h>

//https://9cguide.appspot.com/17-02.html#S1

int mock1(void);
int mock2(void);

int mock1(){
	//$xxd -ps -c1 test.txt | xargs -n4
	char buf[4][1]={"a","b","c","d"};
	FILE *file;
	file = fopen("test.txt","wb");
	fwrite(buf,sizeof(buf),1,file);
	fclose(file);
	return 0;
}
int mock2(){
	//$xxd -ps -c1 test.txt | xargs -n4
	int buf[]={1,2,3,4};
	FILE *file;
	file = fopen("test.txt","wb");
	fwrite(buf,sizeof(buf),1,file);
	fclose(file);
	return 0;
}

int main(void){
	int rt_val=mock2();
	return rt_val;
}