```
$npx ts-node index.ts
Listening on port 3000
Add: {"id":"7f952f73-6c37-43dd-b684-1d9ede51fe5e","title":"うんこ","done":false}
Add: {"id":"3a5fa4d4-db6b-425b-8c4d-f721749157d6","title":"モリモリ","done":false}
Add: {"id":"13951431-e5cb-4956-876f-b2c3ebdcaede","title":"森子","done":false}
Delete: {"id":"3a5fa4d4-db6b-425b-8c4d-f721749157d6","title":"モリモリ","done":false}
Add: {"id":"5853e445-b447-43e7-89a4-4b6a32996f15","title":"モリモリ","done":false}
^C
```



http://localhost:3000/



```
npx ts-node index.ts 1>/dev/null 2>&1 1</dev/null &

```


3000ポートオープンプロセスれむ

```
lsof -i:3000 | tail -n1 | awk '{print $2}' | xargs sudo kill -9
```
