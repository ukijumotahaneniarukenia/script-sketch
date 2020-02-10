#include <stdio.h>
#include <string.h>

//http://secret-garden.hatenablog.com/entry/2015/09/02/000000
int main(){
    char str[] = "homu,mami,mado";
    char* tp;
    printf("%s\n", str);


    /* print until detect EOS */
    // printf("%s\n", str);
    /* 最初に見つかった区切り文字（","）に "\0" を挿入する */
    // tp = strtok(str, ",");
    /* print until detect EOS */
    // printf("%s\n", str);
    /* strtok() の戻り値は最初のトークンの位置 */
    // printf("%s\n", tp);

    /* 第一引数に NULL を指定すると前回の str 値の続きから始める */
    /* strtok() の戻り値は次のトークンの位置 */
    /* 区切り文字が見つからなかったら NULL が返ってくる */
    // while( tp = strtok(NULL, ",") ){
    //     printf("%s\n", tp);
    // }

    return 0;
}