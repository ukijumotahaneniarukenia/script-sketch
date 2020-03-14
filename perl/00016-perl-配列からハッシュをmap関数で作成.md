- LIB

```
sudo cpanm install Dumper
```

- IN

```
$echo {a..d}
a b c d
```

- CMD

```
$echo {a..d} | perl -MData::Dumper -anlE '%b=();%b=map{$_=>1;}@F;say Dumper \@F'
```

- OUT
```
$VAR1 = [
          'a',
          'b',
          'c',
          'd'
        ];

```

- CMD

```
$echo {a..d} | perl -MData::Dumper -anlE '%b=();%b=map{$_=>1;}@F;say Dumper \%b'
```

- OUT
```
$VAR1 = {
          'a' => 1,
          'c' => 1,
          'd' => 1,
          'b' => 1
        };

```
