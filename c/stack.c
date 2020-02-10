//https://daeudaeu.com/programming/c-language/stack_queue/
#include <stdio.h>
#include <stdlib.h>

/* スタックに入るデータの上限 */
#define MAX_STACK_NUM 10

/* スタック構造体 */
typedef struct STACK {
  /* スタックされているデータの数 */
  int num;
  /* スタックされているデータ */
  int data[MAX_STACK_NUM];
} STACK_T;

void initSack(STACK_T*);
void printSack(STACK_T*);
void push(STACK_T*, int);
int pop(STACK_T*);

/* スタックを初期化する関数 */
void initStack(STACK_T *stack){
  int i = 0;
  stack->num = 0;
  for(i = 0; i < MAX_STACK_NUM; i++){
    stack->data[i] = 0;
  }
}

/* PUSHする関数 */
void push(STACK_T *stack, int input){

  /* スタックが満杯なら何もせず関数終了 */
  if(stack->num >= MAX_STACK_NUM){
    printf("スタックが満杯でPUSHできません\n");
    return;
  }

  /* データをスタックの最後に追加 */
  stack->data[stack->num] = input;

  /* データの数もカウントアップ */
  stack->num++;
}

/* POPする関数 */
int pop(STACK_T *stack){
  int i = 0;
  int ret = 0;

  /* スタックが空なら何もせずに関数終了 */
  if(stack->num == 0){
    printf("スタックが空です\n");
    return -1;
  }

  /* 一番最後にPUSHした数（配列の最後尾）を取得 */
  ret = stack->data[stack->num-1];

  /* POPしたのでスタックのデータの数を１つ減らす */
  stack->num--;

  return ret;
}

/* スタックの中身を表示 */
void printStack(STACK_T *stack){
  int i = 0;

  printf("左側がスタックの上側を表しています\n");
  for(i = 0; i < stack-&t;num; i++){
    printf("%d,", stack->data[stack->num-1-i]);
  }
  printf("\n");
}

int main(void){

  int m;
  int input;
  int output;
  STACK_T stack;

  /* スタックを初期化 */
  initStack(&stack);

  while(1){
    /* ユーザからメニューを選んでもらう */
    printf("メニュー\n 1:PUSH\n 2:POP\n 3:スタック表示\n それ以外:終了\n");
    scanf("%d", &m);

    /* 選ばれたメニューに応じて処理を分岐 */
    if(m == 1){
      printf("PUSHする数は？（0以上の整数のみ可）");
      scanf("%d", &input);
      if(input < 0){
        printf("負の数は受け付けていません\n");
        continue;
      }
      printf("%dをPUSHします\n", input);
      push(&stack, input);
    }else if(m == 2){
      printf("POPします\n");
      output = pop(&stack);
      if(output != -1){
        printf("%dをPOPしました\n", output);
      }
    } else if(m == 3){
      printf("スタックの中身を表示します\n");
      printStack(&stack);
    } else {
      /* 1, 2, 3以外の場合はwhile文を抜け出すためにbreakを実行 */
      printf("終了します\n");
      break;
    }
  }
  return 0;
}