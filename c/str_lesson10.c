//https://www.grapecity.com/developer/support/powernews/column/clang/049/page03.htm

#include <string.h>

void strchg(char *buf, const char *str1, const char *str2);

void strchg(char *buf, const char *str1, const char *str2)
{
  char tmp[1024 + 1];
  char *p;

  while ((p = strstr(buf, str1)) != NULL) {
      /* 見つからなくなるまで繰り返す
            pは旧文字列の先頭を指している */
    *p = '¥0'; /* 元の文字列を旧文字列の直前で区切って */
    p += strlen(str1);  /* ポインタを旧文字列の次の文字へ */
    strcpy(tmp, p);             /* 旧文字列から後を保存 */
    strcat(buf, str2);  /* 新文字列をその後につなぎ */
    strcat(buf, tmp);   /* さらに残りをつなぐ */
  }
}

int main(){
	return 0;
}