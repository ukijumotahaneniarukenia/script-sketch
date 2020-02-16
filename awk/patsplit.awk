#!/usr/local/bin/gawk -f

BEGIN {
  pat[1] = "([^,]*)|(\"[^\"]+\")"
  dat[1] = "a,bb,ccc,,dddd,,"

  for (j = 1; j in dat; j++) {
    printf("Splitting: <%s>\n", dat[j])
    n = patsplit(dat[j], cols, pat[j], sep)
    print "n =", n
    for (i = 1; i <= n; i++)
      printf("cols[%d] = <%s>\n", i, cols[i])
  }
}
