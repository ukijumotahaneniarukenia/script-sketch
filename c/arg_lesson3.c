#include <stdio.h>
#include <getopt.h>
//https://www.mm2d.net/main/prog/c/getopt-02.html
int main(int argc, char*argv[]) {
  int i;
  int aopt = 0;
  int bopt = 0;
  int copt = 0;
  int dopt = 0;
  int eopt = 0;
  char *cparam = NULL;
  char *dparam = NULL;
  char *eparam = NULL;
  int opt;
  while ((opt = getopt(argc, argv, "abc:d::e:")) != -1) {
    switch (opt) {
      case 'a':
        aopt = 1;
        break;
      case 'b':
        bopt = 1;
        break;
      case 'c':
        copt = 1;
        cparam = optarg;
        break;
      case 'd':
        dopt = 1;
        dparam = optarg;
        break;
      case 'e':
        eopt = 1;
        eparam = optarg;
        break;
      default:
        printf("error! \'%c\' \'%c\'\n", opt, optopt);
        return 1;
    }
  }
  printf("a = %d\n", aopt);
  printf("b = %d\n", bopt);
  printf("c = %d, %s\n", copt, cparam);
  printf("d = %d, %s\n", dopt, dparam);
  printf("e = %d, %s\n", eopt, eparam);
  for (i = optind; i < argc; i++) {
    printf("arg = %s\n", argv[i]);
  }
  return 0;
}