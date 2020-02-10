#define _GNU_SOURCE
#include <wchar.h>
#include <locale.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>

int mock1(void);
int mock2(void);
int mock3(void);
int mock4(void);
int mock5(void);
int mock6(void);
int mock7(void);
int mock8(void);
int mock9(void);
int mock10(void);
int mock11(void);
int mock12(void);
int mock13(void);
int mock14(void);
int mock15(void);
int mock16(void);

//https://qiita.com/mpyw/items/aff12a6ff2c7726ed1d8#scanf%E3%81%AE%E5%88%A9%E7%94%A8
int mock1(void){
    char buffer[256];

    printf("Input: ");
    if (scanf("%255[^\n]%*[^\n]", buffer) != 1) {
        return 1;
    }
    scanf("%*c");

    printf("Output: %s\n", buffer);
    return 0;
}

int mock2(void){
    char buffer[256] = "";

    printf("Input: ");
    if (scanf("%255[^\n]%*[^\n]", buffer) == EOF) {
        return 1;
    }
    scanf("%*c");

    printf("Output: %s\n", buffer);
    return 0;
}
int mock3(void){
    char buffer[256];
    size_t length;

    printf("Input: ");
    if (scanf("%255[^\n]%zn%*[^\n]", buffer, &length) != 1) {
        return 1;
    }
    scanf("%*c");

    printf("Output: %s\n", buffer);
    printf("Length: %zu\n", length);
    return 0;
}
int mock4(void){
    char buffer[256];
    size_t length;

    printf("Input: ");
    if (fgets(buffer, 256, stdin) == NULL || buffer[0] == '\n') {
        return 1;
    }
    length = strlen(buffer);
    if (buffer[length - 1] == '\n') {
        buffer[--length] = '\0';
    }

    printf("Output: %s\n", buffer);
    printf("Length: %zu\n", length);
    return 0;
}
int mock5(void){
    char buffer[256];
    size_t length;

    printf("Input: ");
    if (fgets(buffer, 256, stdin) == NULL) {
        return 1;
    }
    length = strlen(buffer);
    if (length > 0 && buffer[length - 1] == '\n') {
        buffer[--length] = '\0';
    }

    printf("Output: %s\n", buffer);
    printf("Length: %zu\n", length);
    return 0;
}
int mock6(void){
    char buffer[256];

    printf("Input: ");
    if (fgets(buffer, 256, stdin) == NULL) {
        return 1;
    }

    printf("Output: %s\n", buffer);
    return 0;
}
int mock7(void){
    int num;
    char buffer[256];

    printf("Input: ");
    if (scanf("%d%*[^\n]", &num) != 1) {
        return 1;
    }
    scanf("%*c");

    printf("Output: %d\n", buffer);
    return 0;
}
int mock8(void){
    char buffer[32], *endptr;
    long num;

    printf("Input: ");
    if (scanf("%31[^\n]%*[^\n]", buffer) != 1) {
        return 1;
    }
    scanf("%*c");

    num = strtol(buffer, &endptr, 10);
    if (*endptr != '\0' || errno == ERANGE) {
        return 1;
    }

    printf("Output: %ld\n", num);
    return 0;
}
int mock9(void){
    char buffer[32], *endptr;
    long num;

    printf("Input: ");
    if (scanf("%31[^\n]%*[^\n]", buffer) != 1) {
        fprintf(stderr, "Error: No input specified\n");
        return 1;
    }
    scanf("%*c");

    num = strtol(buffer, &endptr, 10);
    if (*endptr != '\0') {
        fprintf(stderr, "Error: Invalid charcter found: %c\n", *endptr);
        return 1;
    }
    if (errno == ERANGE) {
        fprintf(stderr, "Error: Out of range (%s)\n",
                num == LONG_MAX ? "Overflow" : "Underflow");
        return 1;
    }

    printf("Output: %ld\n", num);
    return 0;
}
int mock10(void){
    char buffer[4096], *p;
    size_t i = 0;

    printf("Input: \n");
    if (scanf("%4095[\x01-\xff]", buffer) != 1) {
        return 1;
    }

    printf("Output: \n");
    for (i = 0, p = strtok(buffer, "\n"); p; ++i, p = strtok(NULL, "\n")) {
        printf("[%zu] %s\n", i, p);
    }

    return 0;
}
int mock11(void){
    char *buffer = NULL;
    ssize_t length;

    printf("Input: ");
    if ((length = getline(&buffer, &(size_t){4096}, stdin)) == EOF) {
        return 1;
    }
    if (buffer[length - 1] == '\n') {
        buffer[--length] = '\0';
    }

    printf("Output: %s\n", buffer);
    printf("Length: %zd\n", length);
    free(buffer);
    return 0;
}
int mock12(void){
    wchar_t buffer[256];
    setlocale(LC_ALL, "");

    printf("入力: ");
    if (scanf("%255l[^\n]%*[^\n]", buffer) != 1) {
        return 1;
    }
    scanf("%*c");

    printf("出力: ");
    for (wchar_t *c = buffer; *c; ++c) {
        printf("「%lc」", *c);
    }
    putchar('\n');

    return 0;
}
int mock13(void){
    return 0;
}
int mock14(void){
    return 0;
}
int mock15(void){
    return 0;
}
int mock16(void){
    return 0;
}

int main(void){
    // int rt_val=mock1();
    // int rt_val=mock2();
    // int rt_val=mock3();
    // int rt_val=mock4();
    // int rt_val=mock5();
    // int rt_val=mock6();
    // int rt_val=mock7();
    // int rt_val=mock8();
    // int rt_val=mock9();
    // int rt_val=mock10();
    // int rt_val=mock11();
    int rt_val=mock12();
    // int rt_val=mock13();
    // int rt_val=mock14();
    // int rt_val=mock15();
    // int rt_val=mock16();
    return rt_val;
}