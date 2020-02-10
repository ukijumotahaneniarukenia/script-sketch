//http://iyukki.blog56.fc2.com/blog-entry-149.html

#include <stdio.h>
#include <string.h>

#define ARG_FLAG(s) (strcmp(s,argv[i])==0)
#define ARG_SPARAM(s) ((strcmp(s,argv[i])==0)&&(i+1)<argc&&((r=argv[++i])!=NULL))
#define ARG_LPARAM(s) ((strncmp(s,argv[i],strlen(s))==0)&&((l=strlen(s))<strlen(argv[i]))&&((r=&argv[i][l])!=NULL))

void main(int argc,char *argv[]){
  int i;
  for (i=1;i<argc;i++){
    char *r=NULL;
    int l=0;
    if (argv[i][0]!='-'){
      break;
    }else if(ARG_FLAG("--")){
      i++;
      break;
    }else if(ARG_FLAG("-f")){
      printf("option f\n");
    }else if(ARG_SPARAM("-s")){
      printf("option s with value %s\n",r);
    }else if(ARG_FLAG("--longflag")){
      printf("option longflag\n");
    }else if(ARG_LPARAM("--longparam=")){
      printf("option longparam with value %s\n",r);
    }else{
      printf("error\n");
    }
  }

  if(i<argc){
    printf("last option %s\n",argv[i]);
  }
}