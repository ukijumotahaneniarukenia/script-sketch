#include <stdio.h>
#include <string.h>
#include <malloc.h>
//http://c-lang.sevendays-study.com/ex-day3_pointer_pointer.html
int createMemory(char**,int);
void freeMemory(char**);
 
void main(){
    char *s = NULL;
    // printf("%p\n",&s);
    createMemory(&s,255);
    strcpy(s,"HelloWorld\n");
    printf("%s",s);
    freeMemory(&s);
}
 
//  メモリの確保
int createMemory(char** mem,int size)
{
    if(*mem == NULL){
        *mem = (char*)malloc(sizeof(char) * size);
        //  メモリが生成できなければエラー
        if(*mem == 0){
            return -1;
        }
        return 0;
    }
    //  与えられたメモリの値が不定ならば、エラー
    return -1;
}
 
//  メモリの開放
void freeMemory(char** mem)
{
    if(mem != 0){
        free(*mem);
    }
}