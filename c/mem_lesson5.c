#include <stdio.h>
//https://9cguide.appspot.com/15-06.html
int mock1(void);
int mock2(void);

int mock1(void){
    char str[256];
    scanf("%s",&str[0]);
    printf("%s\n",str);
    return 0;
}
int mock2(void){
    char str[256];
    scanf("%s",str[0]);
    printf("%s\n",str);
    return 0;
}

int main(void){
    int rt_val=mock1();
    return rt_val;
}