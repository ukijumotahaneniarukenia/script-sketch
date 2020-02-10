#include <stdio.h>
/*
*プロトタイプ宣言さえしておけば、関数をどんな順序で書いても関係ありません。
*/
int sum(int);	/* プロトタイプ宣言 */

int main(void){
    sum(100);
    return 0;
}

int sum(int mx){
    printf("%d\n",(1+mx)*mx/2);
    return 0;
}