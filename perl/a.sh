cat test3.csv | perl -F, -anlE '
  $,=",";
  @F[1]=~/banana/ and map{s/a/PPP/} @F[1] or @F[3]=map{$_+1} @F[3];
  say @F;
'

