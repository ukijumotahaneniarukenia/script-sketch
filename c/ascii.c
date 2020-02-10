#include<stdio.h>
 
 //https://webkaru.net/clang/ascii-code-list/
int main(void)
{
 
  /* 変数の宣言 */
  int i;
 
  /* ヘッダー */
  printf( "10進: 8進:16進:文字\n");
 
  /* ASCIIコードを表示するループ */
  for( i=33;i<=126;i++ ){
 
    // 10進のASCIIコードと文字
    printf( "%4d:%4o:%4x:%4c\n", i, i, i, i);
 
  }
 
  return 0;
}
