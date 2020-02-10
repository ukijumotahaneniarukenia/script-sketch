//https://9cguide.appspot.com/18-01.html

#include <stdio.h>
#define JJJ 0.03
#define JJJ 0.03
#define NNN "unkomorimori"

int main(){
    int price;
    // printf("%f\n",JJJ);
    // printf("%d\n",(int)JJJ);
    printf("pre:");
    scanf("%d",&price);
    price=(int)((1+JJJ)*price);
    printf("post:%d\n",price);
    printf("NNN:%s\n",NNN);
    return 0;
}