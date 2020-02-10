#include <stdio.h>
#include <string.h>
//https://9cguide.appspot.com/15-03.html

int mock0(void);
int mock1(void);
int mock2(void);
int mock3(void);
int mock4(void);
int mock5(void);

int mock0(void){
    char str[256];
    scanf("%s",str);
    printf("%s\n",str);
    printf("%d\n",strlen(str));
    for(int i=0;i<strlen(str);i++){
        printf("%c\n",str[i]);
    }
    return 0;
}
int mock1(void){
    char str[256];
//    scanf("%s",&str[0]);/* 0番の要素のアドレス */
    scanf("%s",str);/* 配列名だけでも配列の先頭要素のアドレスと同じになるので、&演算子は不要 */
    printf("%s\n",str);
    return 0;
}
int mock2(void){
    char str[256]="jsk";
    scanf("%s",&str[3]);
    printf("%s\n",str);
    return 0;
}
int mock3(void){
    return 0;
}
int main(void){
    int rt_val=mock2();
    return rt_val;
}