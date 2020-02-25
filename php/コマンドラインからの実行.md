
警告うるさいので、ミュート

- ミュートするために以下のハンドリングが必要

```
$php -r 'echo "unko"."\n";'
PHP Warning:  PHP Startup: Unable to load dynamic library 'pdo_sqlite' (tried: /usr/lib64/php/modules/pdo_sqlite (/usr/lib64/php/modules/pdo_sqlite: cannot open shared object file: No such file or directory), /usr/lib64/php/modules/pdo_sqlite.so (/usr/lib64/php/modules/pdo_sqlite.so: undefined symbol: sqlite3_column_table_name)) in Unknown on line 0
unko

```

```
$php -r 'echo "unko"."\n";' 2>/dev/null
unko

$echo {1..3} | xargs -I@ php -r 'echo "@"."\n";' 2>/dev/null
[egison💜fa1af7f688b9 (水 11月 20 23:30:20) ~/script_scratch/php]$echo {1..3} | xargs -I@ php -r 'echo "@"."\n";' 2>/dev/null
1 2 3

```
