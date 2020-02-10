#include <stdio.h>
#include <ctype.h>

int test1(void);
int test2(void);
int test3(void);
int test4(char);
int test5(char);
int test6(void);

int test1(void){
    char strliz[]="aiueo";
    printf("%s\n",strliz);
    return 0;
}
int test2(void){
    char c='A'+9;
    printf("%c\n",c);
    return 0;
}
int test3(void){
    char c='8';/* 数字 */
    int n=c-'0';/* 数値に変換 */
    printf("%d\n",n);
    return 0;
}
int test4(char tgt){
    char c=tgt;
    int n;
    if(c>='0' && c<='9'){
        n=c-'0';
    }else{
        n=0;
    }
    printf("%d\n",n);
    return 0;
}
int test5(char tgt){
    char c=tgt;
    int n;
    if(isdigit(c)){
        n=c-'0';
    }else{
        n=0;
    }
    printf("%d\n",n);
    return 0;
}
int test6(void){
    //配列の要素数は、実際に格納する文字数より1つ多く必要
    //文字列の最後にはEOSが入る
    char strliz[6]={'a','i','u','e','o'};
    printf("%s\n",strliz);
    return 0;
}
int main(void){
    // test1();
    // test2();
    // test3();
    // test4('A');
    // test5('A');
    test6();
    return 0;
}