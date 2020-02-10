

```
[sqlite🧡ceacf3fb0808 (日 11月 17 14:26:02) ~/script_scratch/sqlite]$echo {0..10} | xargs -t -I@ bash -c 'sqlite3 testdb "select \"@\" as seq;"' && rm testdb
bash -c sqlite3 testdb "select \"0 1 2 3 4 5 6 7 8 9 10\" as seq;" 
seq                   
----------------------
0 1 2 3 4 5 6 7 8 9 10
```
