//https://9cguide.appspot.com/18-02.html#S1
#include <stdio.h>
enum {
	STATE_NORMAL, /* 通常 */
	STATE_POISON, /* 毒 */
	STATE_NUMBLY, /* マヒ */
	STATE_CURSE /* 呪われ */
};
int main(void)
{
	printf("STATE_NORMAL:%d\n",STATE_NORMAL);
	printf("STATE_POISON:%d\n",STATE_POISON);
	printf("STATE_NUMBLY:%d\n",STATE_NUMBLY);
	printf("STATE_CURSE:%d\n",STATE_CURSE);
	return 0;
}