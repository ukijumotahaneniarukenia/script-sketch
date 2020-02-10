#include <stdio.h>
#include <string.h>
//https://9cguide.appspot.com/16-02.html#S1
typedef struct {
	int year;	/* 学年 */
	int clas;	/* クラス */
	int number;	/* 出席番号 */
	char name[64];	/* 名前 */
	double stature;	/* 身長 */
	double weight;	/* 体重 */
} student;

int main(void)
{
	student data;
	student *pdata;
	
	pdata = &data;	/* 初期化 */
	(*pdata).year = 10;	/* 通常変数モードへの切り替え */
	strcpy((*pdata).name,"MARIO");	/* 通常変数モードへの切り替え */
	
	printf("data:%p\n",&data);
	printf("pdata:%p\n",pdata);

	printf("year:%d,name:%s\n",(*pdata).year,(*pdata).name);

	printf("year:%d,name:%s\n",data.year,data.name);
	return 0;
}