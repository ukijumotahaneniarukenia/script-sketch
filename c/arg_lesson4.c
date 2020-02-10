//https://programming.pc-note.net/c/file8.html
#include <stdio.h>
#include <sys/stat.h>
 
int main(int argc, char *argv[]){
    const char *file = argv[1];
    printf("%s\n",argv[1]);
    struct stat statBuf;
 
    if (stat(file, &statBuf) == 0){
        printf("ファイル%sは存在します。\n", file);
    }else{
        printf("ファイル%sは存在しません。\n", file);
    }
 
    return 0;
}