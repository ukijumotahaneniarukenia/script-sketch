//https://9cguide.appspot.com/18-02.html#S1
#include <stdio.h>
#define STATE_NORMAL 0 /* 正常 */
#define STATE_POISON 1 /* 毒 */
#define STATE_NUMBLY 2 /* マヒ */
#define STATE_CURSE 3 /* 呪われ */
int main(void)
{
	printf("STATE_NORMAL:%d\n",STATE_NORMAL);
	printf("STATE_POISON:%d\n",STATE_POISON);
	printf("STATE_NUMBLY:%d\n",STATE_NUMBLY);
	printf("STATE_CURSE:%d\n",STATE_CURSE);
	return 0;
}