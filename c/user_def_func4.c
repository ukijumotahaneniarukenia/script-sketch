#include <stdio.h>
/*
*プロトタイプ宣言さえしておけば、関数をどんな順序で書いても関係ありません。
*/
int sum(int,int);	/* プロトタイプ宣言 */

int main(void){
    int rez;
    rez=sum(1,100);
    printf("%d\n",rez);
    return 0;
}

int sum(int mn,int mx){
    int rt;
    rt=(mn+mx)*mx/2;
    return rt;
}