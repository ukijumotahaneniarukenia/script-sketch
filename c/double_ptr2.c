#include <stdio.h>
 
#define SIZE    5
//http://c-lang.sevendays-study.com/ex-day3.html
void main(){
    //  サイズSIZEの配列を用意する。
    int ar1[SIZE];
    char ar2[SIZE];
    int i;
    int* p1 = NULL;
    char* p2 = NULL;
    //  値を代入
    for(i = 0; i < SIZE; i++){
        ar1[i] = i;
        ar2[i] = 'A'+i;
    }
    //  ポインタにアドレスを代入
    p1 = &ar1[0];
    p2 = &ar2[0];
    //  値を出力
    for(i = 0; i < SIZE; i++){
        printf("ar1[%d]=%d *(p1+%d)=%d ",i,ar1[i],i,*(p1+i));
        printf("ar2[%d]=%c *(p2+%d)=%c\n",i,ar2[i],i,*(p2+i));
    }
}