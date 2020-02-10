#include <stdio.h>

//https://9cguide.appspot.com/17-03.html#S1
int main(int argc,char *argv[]){
	printf("%s\n",argv[0]);
	printf("%d\n",argc);
	printf("%p\n",argv);
	for(int i=0;i<argc;i++){
		printf("%p",argv[i]);
		printf(":%s\n",argv[i]);
	}
	// if(argc>1){
	// 	printf("%s\n",argv[1]);
	// }
	// fflush(stdin);
	// getchar();
	return 0;
}