#include <stdio.h>
 
// 関数ポインタを引数としてとる関数
// 関数ポインタは、呼び出す関数を動的に変更する時に非常に便利です。
void funcp(int (*)(int),int n);
// 関数ポインタに用いる関数
int dbl(int);
int hlf(int);
 
//http://c-lang.sevendays-study.com/ex-day3_func_pointer.html
void main() {
    funcp(dbl,8);   //  引数として、関数を渡す
    funcp(hlf,8);   //  引数として、関数を渡す
}
 
void funcp(int (*f)(int),int n)
{
    printf("引数：%d 結果%d\n",n,f(n));
}
 
//  最大値を返す関数
int dbl(int n)
{
    return n * 2;
}
int hlf(int n)
{
    return n / 2;
}