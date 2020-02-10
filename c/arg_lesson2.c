#include <stdio.h>
#include <string.h>

//https://9cguide.appspot.com/17-03.html#S1
int main(int argc,char *argv[]){
	// printf("%s\n",argv[0]);
	// printf("%d\n",argc);
	// printf("%p\n",argv);
	// printf("%s\n",argv[0]);
	// printf("%c\n",argv[0][0]);
	// printf("%c\n",argv[0][1]);
	// printf("%c\n",argv[0][2]);
	// printf("%c\n",argv[0][3]);
	// printf("%s\n",argv[1]);
	// printf("%c\n",argv[1][0]);
	// printf("%c\n",argv[1][1]);
	// printf("%c\n",argv[1][2]);
	// printf("%c\n",argv[1][3]);
	// printf("%s\n",argv[2]);
	// printf("%c\n",argv[2][0]);
	// printf("%c\n",argv[2][1]);
	// printf("%c\n",argv[2][2]);
	// printf("%c\n",argv[2][3]);
	// int mx_len=0;
	// for(int i=0;i<argc;i++){
		// printf("%s\n",argv[i]);
		// printf("%d\n",sizeof(argv[i]));
		// printf("%d\n",strlen(argv[i]));
	// 	if(mx_len<strlen(argv[i])){
	// 		mx_len=strlen(argv[i]);
	// 	}
	// }
	// printf("%d\n",mx_len);
	for(int i=0;i<argc;i++){
		// printf("%s\n",argv[i]);
		printf("%s\n",argv[i]);
		for(int j=0;j<strlen(argv[i]);j++){
			printf("%c\n",argv[i][j]);
		}
		// printf("\n");
	}
	// while(argc>0){
	// 	argc--;
	// 	printf("%d\n",argc);
	// 	printf("%c\n",argv[argc][0]);
	// 	printf("%c\n",argv[argc][1]);
	// }
	return 0;
}