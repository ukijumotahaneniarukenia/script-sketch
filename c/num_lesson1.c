//https://9cguide.appspot.com/05-03.html#S1

#include <stdio.h>

int mock1();
int mock2();
int mock3();

int mock1(){
    printf("%f\n",1.12*9);
    return 0;
}
int mock2(){
    printf("%f\n",(int)(1.12*9));
    return 0;
}
int mock3(){
    printf("%d\n",(int)(1.12*9));
    return 0;
}

int main(){
    int rt_val=mock2();
    return rt_val;
}