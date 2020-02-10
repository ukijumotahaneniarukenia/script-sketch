#include <stdio.h>
#include <string.h>

//https://9cguide.appspot.com/16-01.html
typedef struct {
	int grp;
	char item[4096];
} def_item;

def_item liz[]={};

int init(void);
int add(def_item rsv_liz[]);
void print(def_item ele);

int init(){
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

int add(def_item rsv_liz[]){
	for(int i=0;i<sizeof(rsv_liz)/sizeof(rsv_liz[0]);i++){
		print(rsv_liz[i]);
	}
	return 0;
}

void print(def_item ele){
	printf("grp:%d,item:%s\n",ele.grp,ele.item);
	return;
}

//https://9cguide.appspot.com/16-01.html
int main(void){
  int rt_val=init();
  add(liz);
  return rt_val;
}