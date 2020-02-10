#include <stdio.h>

int mock1();
int mock2();
int mock3();

int mock1(){
    int dat;
    scanf("%d",&dat);
    printf("%d\n",dat);
    return 0;
}

int mock2(){
    double dat;
    scanf("%lf",&dat);
    printf("%f\n",dat);
    return 0;
}

int mock3(){
    double n1,n2;
    scanf("%lf,%lf",&n1,&n2);
    printf("%f,%f\n",n1,n2);
    return 0;
}

int main(){
    int rt_val=mock3();
    return rt_val;
}