#include <stdio.h>

//https://9cguide.appspot.com/17-01.html

int main(void)
{
	int i = 100;
	FILE *file;
	file = fopen("test.txt","w");
	fprintf(file,"%d",i);
	fclose(file);
	return 0;
}