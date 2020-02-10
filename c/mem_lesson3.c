#include <stdio.h>
#include <string.h>
//https://9cguide.appspot.com/15-06.html
void mock0(int *pvalue);

void mock0(int *pvalue){
    printf("pvalue:[%p]\n",pvalue);
    *pvalue=100;
    return;
}

int main(void){
    int n=7;
    printf("pvalue:[%p]\n",&n);
    printf("n:[%d]\n",n);
    mock0(&n);
    printf("n:[%d]\n",n);
    return 0;
}