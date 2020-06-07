#include <stdio.h>

int main(int argc,char** argv){
  int n = 5;

  int m = 10;

  int *np; //ポインタ型の宣言

  //アドレス演算子 & を使用した出力

  printf("&n\t%p\n",(void*)&n); //変数のポインタ値を標準出力に出力

  printf("&m\t%p\n",(void*)&m); //変数のポインタ値を標準出力に出力

  printf("&np\t%p\n",(void*)&np); //変数のポインタ値を標準出力に出力


  np = &n; //代入元にアドレス演算子がついている場合は出力時にアドレス演算子を指定しなくていい

  printf("np\t%p\n",(void*)np); //変数のポインタ値を標準出力に出力


  //アスタリスクでポインタ値の実体値に展開
  printf("n\t%d\n",*np); //変数のポインタ値経由で実体値を標準出力に出力


  //実体値を書き換える
  *np = 100;

  printf("n\t%d\n",*np); //変数のポインタ値経由で実体値を標準出力に出力

  return 0;

}
