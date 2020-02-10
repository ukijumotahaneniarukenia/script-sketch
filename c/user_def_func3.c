#include <stdio.h>
/*
*プロトタイプ宣言さえしておけば、関数をどんな順序で書いても関係ありません。
*/
int sum(int,int);	/* プロトタイプ宣言 */

int main(void){
    sum(1,100);
    return 0;
}

int sum(int mn,int mx){
    printf("%d\n",(mn+mx)*mx/2);
    return 0;
}