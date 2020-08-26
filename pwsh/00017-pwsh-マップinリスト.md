```
PS /home/aine/script-sketch/pwsh> $h=@{1=@("A","B","C");2=@("D","E","F");3=@("G")}
PS /home/aine/script-sketch/pwsh> $h

Name                           Value
----                           -----
3                              {G}
2                              {D, E, F}
1                              {A, B, C}

```


```
PS /home/aine/script-sketch/pwsh> $h.keys | %{$_}              
3
2
1
PS /home/aine/script-sketch/pwsh> $h.keys | %{$_.GetType()}

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     Int32                                    System.ValueType
True     True     Int32                                    System.ValueType
True     True     Int32                                    System.ValueType

PS /home/aine/script-sketch/pwsh> $h.keys | %{$h[$_]}          
G
D
E
F
A
B
C
PS /home/aine/script-sketch/pwsh> $h.keys | %{$h[$_].GetType()}

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     Object[]                                 System.Array
True     True     Object[]                                 System.Array
True     True     Object[]                                 System.Array

```
