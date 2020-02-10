#include <stdio.h>
#include <memory.h>

int mock1(void);

int mock1(void){
    int src[] = {42,79,13,19,41};
    int dst[] = {1,2,3,4,5};
    for(int i=0;i<sizeof(src)/sizeof(src[0]);i++){
        printf("%d\n",src[i]);
    }
    for(int i=0;i<sizeof(dst)/sizeof(dst[0]);i++){
        printf("%d\n",dst[i]);
    }

    memcpy(dst,src,sizeof(src)); /* srcの全要素をdstにコピー */

    for(int i=0;i<sizeof(dst)/sizeof(dst[0]);i++){
        printf("%d\n",dst[i]);
    }
}

int main(void){
    mock1();
    return 0;
}