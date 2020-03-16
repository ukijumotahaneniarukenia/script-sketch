cat test3.csv | perl -F, -anlE '
  $,=",";
  (@F[1]=~/banana/ or @F[2]>7) and map{s/a/PPP/} @F[1] or map{s/$/TTT/} @F[1];
  say @F;
'
