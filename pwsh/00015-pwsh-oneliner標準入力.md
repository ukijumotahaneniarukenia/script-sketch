- IN

```
$ echo {A..G} | xargs -n1 | xargs -n3
A B C
D E F
G
```

- CMD


```
$ echo {A..G} | xargs -n1 | xargs -n3 | pwsh -c '$h=@{};$c=0;$a=@($input);$a|%{$b=([string]$_).Split(" ");$c++;$l=New-Object System.Collections.Generic.List[string];$b|%{$l.Add($_)};$h.Add($c,$b);};$h'
```

- OUT

```
Name                           Value
----                           -----
3                              {G}
2                              {D, E, F}
1                              {A, B, C}

```
