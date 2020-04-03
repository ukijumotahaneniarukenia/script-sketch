#include <stdio.h>

int main(int argc,char **argv) {

  FILE *rf;
  const int BUF_LEN = 4096;
  char buf[BUF_LEN];

  printf("%s\n",*argv);
  printf("%s\n",argv[0]);
  printf("%s\n",argv[1]);

  rf=fopen(argv[1],"r");//ファイルを読込専用でオープン
  fread(buf, sizeof(int), 10, rf);//ファイルから読み込み,バッファーへ格納
  fclose(rf);//読込専用でオープンしたファイルをクローズ
  fwrite(buf, 10, 1, stdout);//バッファーから読み込み,標準出力へ出力

  return 0;
}
