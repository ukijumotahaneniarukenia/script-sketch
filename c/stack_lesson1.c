//http://www.cc.kyoto-su.ac.jp/~yamada/ap/stack.html
//https://blog.it-see.net/it-dokata/tcl-tk/data-structure/
//https://it-ojisan.tokyo/awk-unshift-shift-push-pop/
//http://sevendays-study.com/algorithm/day2_stack_c.html
//http://flute.u-shizuoka-ken.ac.jp/~s-okubo/class/language/t006.htm
#include <stdio.h>
#include <stdlib.h>

#define STK_MX_SIZE 10
#define SUCC 0
#define FAIL 1

typedef struct{
	double *Data;
    int Size;
    int Count;
} Stack;

Stack *initstk(int size){
    Stack *stk=(Stack*)malloc(sizeof(Stack));
    stk->Data=(double*)malloc(sizeof(double)*size);
    stk->Size=size;
    stk->Count=0;
    return stk;
}

void omitstk(Stack *stk){
    free(stk->Data);
    free(stk);
}

void pushstk(Stack *stk,double ele){
    stk->Data[stk->Count]=ele;
    stk->Count++;
}

double popstk(Stack *stk){
    if(stk->Count==0){
        return 0;
    }
    stk->Count--;
    return stk->Data[stk->Count];
}

int main(int argc,char **argv){
    initstk(10);
    return 0;
}