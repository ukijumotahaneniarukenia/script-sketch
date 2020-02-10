#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
//https://daeudaeu.com/programming/c-language/pointer/
int bef(int x,int y);
int aft(void);

int bef(int x,int y){
    int tmp;
    tmp=x;
    x=y;
    y=tmp;
    return 0;
}
int aft(void){
    return 0;
}
int main(int argc,char *argv[]){
    char x[4096];char y[4096];char z[4096];
    for(int i=0;i<argc;i++){
        if(i==0) strcpy(x,argv[0]);//file_name
        if(i==1) strcpy(y,argv[1]);//num
        if(i==2) strcpy(z,argv[2]);//str
    }
    printf("%s\n",x);
    printf("%s\n",y);
    printf("%s\n",z);
    return 0;
}