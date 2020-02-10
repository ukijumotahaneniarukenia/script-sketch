#include <stdio.h>
#include <stdlib.h>

//https://daeudaeu.com/programming/c-language/pointer/
int mock1(void);
int mock2(void);
int mock3(void);

int mock1(void){
    char *ptr;/* ポインタで malloc で確保したメモリを指す*/
    ptr = (char*)malloc(10);/* ポインタで malloc で確保したメモリを指す*/

    for(int i = 0; i < 6; i++){
        *(ptr + i) = i * 10;/* ポインタの値を加算することで確保したメモリの様々な部分にアクセスすることが可能*/
    }

    for(int i = 0; i < 6; i++){
        printf("%d : %d\n", i, ptr[i]);
    }
    free(ptr);
}
int mock2(void){
    int *ptr;/* ポインタで malloc で確保したメモリを指す*/
    ptr = (int*)malloc(10);/* ポインタで malloc で確保したメモリを指す*/

    for(int i = 0; i < 6; i++){
        *(ptr + i) = i * 100000;/* ポインタの値を加算することで確保したメモリの様々な部分にアクセスすることが可能*/
    }

    for(int i = 0; i < 6; i++){
        printf("%d : %d\n", i, ptr[i]);
    }
    free(ptr);
}
int main(void){
    int rt_val=mock3();
    return rt_val;
}