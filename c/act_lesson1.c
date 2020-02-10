#include <stdio.h>
#include <string.h>

//https://9cguide.appspot.com/16-01.html
typedef struct {
	int grp;
	char item[4096];
} def_item;

int mock1(void);
int mock2(void);
int mock3(void);
void print(def_item ele);

int mock1(){
	def_item ele;
	ele.grp=1;
	strcpy(ele.item,"apple");
	ele.grp=2;
	strcpy(ele.item,"banana");
	printf("grp:%d,item:%s\n",ele.grp,ele.item);
	return 0;
}

int mock2(){
	//https://edu.clipper.co.jp/pg-2-31.html
	def_item liz[]={
		{1,"apple"}
		,{2,"banana"}
		,{3,"orange"}
		,{4,"kiwi"}
	};
	for(int i=0;i<sizeof(liz)/sizeof(liz[0]);i++){
		printf("grp:%d,item:%s\n",liz[i].grp,liz[i].item);
	}
	return 0;
}

int mock3(){
	//https://edu.clipper.co.jp/pg-2-31.html
	def_item liz[]={
		{1,"apple"}
		,{2,"banana"}
		,{3,"orange"}
		,{4,"kiwi"}
	};
	for(int i=0;i<sizeof(liz)/sizeof(liz[0]);i++){
		print(liz[i]);
	}
	return 0;
}

void print(def_item ele){
	printf("grp:%d,item:%s\n",ele.grp,ele.item);
	return;
}

//https://9cguide.appspot.com/16-01.html
int main(void){
  int rt_val=mock3();
  return rt_val;
}