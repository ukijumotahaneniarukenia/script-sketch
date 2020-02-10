#include <stdio.h>

int max(int,int);
int min(int,int);

//http://c-lang.sevendays-study.com/ex-day3_func_pointer.html 
void main() {
    int (*cmp)(int,int) = max;  //  cmpの初期化と（max）
    int a = 1,b = 2;
    printf("%dと%dのうち、最大のものは、%d\n",a,b,cmp(a,b));
    cmp = min;  //  cmpにminを代入
    printf("%dと%dのうち、最小のものは、%d\n",a,b,cmp(a,b));
}
 
//  最大値を返す関数
int max(int m,int n)
{
    if(m > n){
        return m;
    }
    return n;
}
 
//  最大値を返す関数
int min(int m,int n)
{
    if(m < n){
        return m;
    }
    return n;
}