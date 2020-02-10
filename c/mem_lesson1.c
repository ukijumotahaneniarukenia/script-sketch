#include <stdio.h>
//https://9cguide.appspot.com/15-01.html
//https://9cguide.appspot.com/15-02.html

int mock0(void);
int mock1(void);
int mock2(void);
int mock3(void);
int mock4(void);
int mock5(void);

int mock0(void){
    int i;
    printf("%p\n",i);
    return 0;
}
int mock1(void){
    int i;
    printf("%p\n",&i);
    return 0;
}
int mock2(void){
    int i1,i2,i3;
    printf("i1:[%p]\n",&i1);
    printf("i2:[%p]\n",&i2);
    printf("i3:[%p]\n",&i3);
    return 0;
}
int mock3(void){
    int ary[10];
    printf("ary[%p]\n",ary);
    printf("ary[0][%p]\n",ary[0]);
    printf("ary[1][%p]\n",ary[1]);
    printf("ary[2][%p]\n",ary[2]);
    return 0;
}
int mock4(void){
    int ary[10];
    printf("ary[%p]\n",ary);
    printf("ary[0][%p]\n",&ary[0]);
    printf("ary[1][%p]\n",&ary[1]);
    printf("ary[2][%p]\n",&ary[2]);
    return 0;
}
int main(void){
    int rt_val=mock4();
    return rt_val;
}