#include <stdio.h>
#include <string.h>

int mock1(void);
int mock2(void);
int mock3(void);
int mock4(void);
int mock5(void);

//http://wisdom.sakura.ne.jp/programming/c/c19.html
int mock1(){
	//char 変数名[文字列数][文字列の長さ];
	char name[3][5] = { "Rena" , "Yuki" , "Mimi" };
	printf("%s\n%s\n%s\n" , name[0] , name[1] , name[2]);
	printf("%c\n%c\n%c\n" , name[0][0] , name[1][0] , name[2][0]);
	printf("%c\n%c\n%c\n" , name[0][1] , name[1][1] , name[2][1]);
	printf("%c\n%c\n%c\n" , name[0][2] , name[1][2] , name[2][2]);
	printf("%c\n%c\n%c\n" , name[0][3] , name[1][3] , name[2][3]);
	return 0;
}

int mock2(){
	//http://ratan.dyndns.info/MicrosoftVisualC++/tajigenchar.html
	//char 変数名[要素数][単一要素の最大長+1];
	char name[4][8] = {
	{"aine"}
	, {"kuraine"}
	, {"nahato"}
	, {"mujiku"} };
	// printf("%d\n",sizeof(name));
	// printf("%d\n",sizeof(name[0]));
	// printf("%d\n",(sizeof(name)/sizeof(name[0])));
	for(int i=0;i<(sizeof(name)/sizeof(name[0]));i++){
		printf("%s\n",name[i]);
		printf("%d\n",strlen(name[i]));
		// printf("%d\n",i);
	}
	return 0;
}

int mock3(){
	//http://ratan.dyndns.info/MicrosoftVisualC++/tajigenchar.html
	//char 変数名[要素数][単一要素の最大長+1];
	char name[4][8] = {
	"aine"
	, "kuraine"
	, "nahato"
	, "mujiku" };
	int mx_len=0;
	for(int i=0;i<(sizeof(name)/sizeof(name[0]));i++){
		// printf("%s\n",name[i]);
		if(mx_len<strlen(name[i])){
			mx_len=strlen(name[i]);
		}
		// printf("%d\n",strlen(name[i]));
	}
	for(int i=0;i<(sizeof(name)/sizeof(name[0]));i++){
		for(int j=0;j<mx_len;j++){
			printf("%c",name[i][j]);
		}
		printf("\n");
	}
	return 0;
}

int mock4(){
	int ary[]={21,435,0,-11};
	for(int i=0;i<sizeof(ary)/sizeof(ary[0]);i++){
		printf("%d\n",ary[i]);
	}
	return 0;
}

int main(void){
  int rt_val=mock4();
  return rt_val;
}