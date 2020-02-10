#include <stdio.h>

//https://9cguide.appspot.com/17-01.html

int main(void)
{
	FILE *file;
	file = fopen("test.txt","w");
	fclose(file);
	return 0;
}