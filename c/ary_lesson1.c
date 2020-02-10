#include <stdio.h>

int mock1(void);
int mock2(void);
int mock3(void);

int mock1(void){
    int ary[10]={23,4,55,99};
    printf("%d\n",ary[0]);
    printf("%d\n",ary[1]);
    printf("%d\n",ary[2]);
    printf("%d\n",ary[3]);
    printf("%d\n",ary[-1]);
    printf("%d\n",ary[9]);
    return 0;
}

int mock2(void){
    int ary[]={23,4,55,99};
    printf("%d\n",ary[0]);
    printf("%d\n",ary[1]);
    printf("%d\n",ary[2]);
    printf("%d\n",ary[3]);
    printf("%d\n",ary[-1]);
    printf("%d\n",ary[9]);
    return 0;
}

int mock3(void){
    int ary[]={23,4,55,99};
    // printf("%d\n",sizeof(ary));/* 配列全体のサイズを求め */
    // printf("%d\n",sizeof(ary[0]));/* 要素1つのサイズで */
    // printf("%d\n",sizeof(ary)/sizeof(ary[0]));/* 配列全体のサイズを求め、それを要素1つのサイズで割れば要素の数*/
    for(int i=0;i<sizeof(ary)/sizeof(ary[0]);i++){
        printf("%d\n",ary[i]);
    }
    return 0;
}

int main(void){
    // mock1();
    // mock2();
    mock3();
    return 0;
}