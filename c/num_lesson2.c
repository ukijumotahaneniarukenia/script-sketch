//https://9cguide.appspot.com/05-03.html#S1

#include <stdio.h>

int mock1();
int mock2();
int mock3();
int mock4();
int mock5();

int mock1(){
    int n=10;
    printf("%3d\n",n);
    return 0;
}
int mock2(){
    int n=10;
    printf("%03d\n",n);
    return 0;
}
int mock3(){
    char c[10]="unko";
    printf("%5s\n",c);
    return 0;
}
int mock4(){
    char c[10]="unko";
    printf("%-5s\n",c);
    return 0;
}

int mock5(){
	double pi = 3.14159;
	printf("%6.2f\n",pi);
	printf("123456\n");
	return 0;
}

int main(){
    int rt_val=mock5();
    return rt_val;
}