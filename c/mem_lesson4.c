#include <stdio.h>
//https://9cguide.appspot.com/15-06.html
int avg(int *data);

int avg(int *data){
    int rt=0;
    for(int i=0;i<sizeof(data)/sizeof(data[0]);i++){
        rt=rt+data[i];
    }
    return rt/(sizeof(data)/sizeof(data[0]));
}

int main(void){
    int tgt[] = {15,78,98,15,98,85,17,35,42,15};
    printf("%d\n",avg(tgt));
    return 0;
}