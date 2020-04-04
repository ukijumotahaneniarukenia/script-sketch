#include <stdio.h>
#include <string.h>
#include <stdlib.h> //free関数用
#include <signal.h>

volatile sig_atomic_t eflag = 0;

// https://www.jpcert.or.jp/sc-rules/c-sig30-c.html
// https://qiita.com/supaiku2452/items/10772cbd2706dede06b9#comments
void usage(char *cmdname) {
  fputs( "\nUsage:\n",stdout);
  fputs( "IN:\n",stdout);
  printf("%s\n",cmdname);
  fputs( "OUT:\n",stdout);
}

void handler(int signum) {
  eflag = 1;
}

void trap(void){
  //受信したいシグナルの数だけ記載
  if (signal(SIGTERM, handler) == SIG_ERR) { //プロセスに対するシグナル受信を待ち構えておく trapping
    perror("Abend");
    exit(1);
  }
  if (signal(SIGINT, handler) == SIG_ERR) { //プロセスに対するシグナル受信を待ち構えておく trapping
    perror("Abend");
    exit(1);
  }
}

static int XXX(char *filename){
  FILE *instream=stdin;//デフォルト値を設定
  FILE *outstream=stdout;//デフォルト値を設定
  if(!strcmp(filename,"-")){
    //strcmp関数は第2引数に指定した文字列と同じ場合0を返すので、逆転させて
    //printf("標準入力\n");
    //printf("%s\n",filename);
  }else{
    //printf("コマンドライン引数\n");
    instream=fopen(filename,"r");//読込専用で開く
    if(instream==NULL){
      //引数で指定したファイルが存在しない場合
      return 0; //異常終了
    }
    //printf("%s\n",filename);
  }

  char *ln=NULL;
  size_t len=0;
  ssize_t read;
  while((read=getline(&ln,&len,instream))!=-1){
    //読み込めんくなったら、-1になりループ終了
    fputs(ln,outstream);//読み込んだ分を標準出力に出力
  }

  free(ln);//変数ln用のメモリ開放
  fclose(instream);//instreamクローズ

  return 1; //正常終了
}

int main(int argc, char **argv){
  trap();//シグナル受信ハンドラ仕込み
  int rt=1; //正常終了
  //printf("%d\n",argc);
  if(argc==1){
    //実行ファイル名のみ存在している場合
    //標準入力から読み込む
    rt=rt&&XXX("-");
  }else{
    //コマンドライン引数が存在している場合
    for (int i = 1; i < argc; i++){
      rt=rt&&XXX(argv[i]);
    }
  }
  if(1==eflag){
    usage(argv[0]); //Ctrl+CしてからCtrl+Dは効く。むずい。
  }
  return rt?0:1; //戻り値を反転 1のとき0にして返す
}
